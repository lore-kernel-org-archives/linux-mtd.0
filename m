Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4eRk-0005ya-BI
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 18:14:49 +0000
Received: by fg-out-1718.google.com with SMTP id 19so100309fgg.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Apr 2010 11:14:46 -0700 (PDT)
Subject: RE: UBI wear leveling / torture testing algorithms having trouble
	with MLC flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910FDDFB900@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910FDD31773@SJEXCHCCR01.corp.ad.broadcom.com>
	<1271266225.2532.726.camel@localhost.localdomain>
	<B125D8217ABC4B43826503DE00A2D44910FDD31E30@SJEXCHCCR01.corp.ad.broadcom.com>
	<1271855613.11751.1395.camel@localhost.localdomain>
	<B125D8217ABC4B43826503DE00A2D44910FDDFB900@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Apr 2010 21:13:09 +0300
Message-Id: <1271873589.11751.1410.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2010-04-21 at 09:51 -0700, Darwin Rambo wrote:
> Hi Artem,
> 
> > > The permanently stuck bits I have often seen with MLC are typically stuck at 0 due to
> > > neighbouring program disturb effects from other cells. These same stuck bits are the
> > > reason for the torture test looping. If you look at the logs of the corrections,
> > > it typically involves resetting these back to 1. Perhaps the nand driver can recognize
> > > a stuck bit somehow and not report it as a correction but I think that's not right.
> >
> > Hm, for me this sounds as an idea which may work. What if we just change
> > the semantics of the -EBADMSG error code of the MTD subsystem. Change it
> > from "bit flips occured and were corrected" to "_dangerous_ bit flips
> > occurred, were corrected, but it is risky, so the data should be
> > refreshed".
> >
> > Then for SLC, every bit-flip can cause -EBADMSG, just like now, and for
> > MLC - the driver will be able to decide.
> >
> > The idea is that MLCs are so different that only the driver can know
> > whether a bit-flip is dangerous or not.
> 
> When bit flips are corrected we return -EUCLEAN and when uncorrectable errors occur we
> return -EBADMSG. So you probably mean -EUCLEAN above? I think -EBADMSG should continue
> to mean "uncorrectable".

Yes, sorry, you are right. Sorry for confusion.

> But a permanently stuck bit is corrected each read and isn't really dangerous.

Then just do not return -EUCLEAN, that is my idea.

> It's most likely just a write-disturb effect. I have seen that blocks that get heavily
> erased & programmed start showing lots of correctable ECC errors. So I don't think we
> should consider stuck bits or random bit flips as dangerous.

Right, and you again do not return -EUCLEAN. The idea is that the driver
has the intimate HW knowlege and can decide when -EUCLEAN is returned.

>  But we should consider
> high numbers of errors of both types together as a dangerous condition, likely indicating
> block wearout.

Ok.

> > > Also the programming during torturing might create more even more write disturb errors
> > > and make the problem even worse. But we have to live with that anyways during regular
> > > programming for application data so that's probably a moot point.
> >
> > This is another problem. We can disabling torturing for MLC, or change
> > it.
> 
> Torturing MLC flash just wears the MLC flash out more and creates more bit flips. But
> scrubbing and torturing are different things, so we are scrubbing so that we increase
> the probability of precious user data not being lost, disabling scrubbing is not a good
> option, but disabling/changing torturing may be fine.

Ok, fine. As I said, you have the HW, you find out what works better for
you and submit patches :-)

>  Perhaps we should have MTD/MLC return
> -EUCLEAN when say, 80-100% of the max possible corrections are done and then scrub the
> data to a good block, and then either torture the marginal block or mark it bad and remove
> the block from service?

Something like this.

> Another idea might be to remember with a torture histogram how many times a each block
> was sent out for torturing, and after N (3?) tortures, something is definitely bad, and
> then the block could be marked bad permanently.

Sounds reasonable and can be easily done. We have room in the EC header
to store this information.

> For MLC, you might consider just erasing the block and not torturing at all. Eventually the
> marginal block will hit the N threshold above and be taken out of service anyways. Then you
> don't need a mtd specific torture test at all...

I cannot comment on this because I do not know. If you see that this is
better for your HW, we can go this way. Send patches :-)

> > In general, I think all the MLC-specific things like "ECC 12" should be
> > hidden in the MTD level. Just because this information is too
> > MLC-specific for UBI to know about it.
> >
> > UBI should distinguish MLC and behave a bit different in that case, but
> > this should be about "torture MLC eraseblocks this special way", and the
> > like. IOW, on higher level than knowing about ECC levels.
> 
> I agree the mtd driver should hide this information if possible, and we suggested that
> above for error reporting. But for torturing, that might mean we need to change the mtd
> interface to be able to request a flash specific torture test and return a status.
> Changing mtd seems to be harder than the suggestions above, and since torturing may make
> things worse, I think we should try to keep our solution in the ubi layer for now.

Then teach MTD to inform NAND type: SLC/MLC and UBI will avoid torturing
for MLC. Just send patches.

Really, just submit patches which work for your MLC. I can validate them
on the general level, but many decisions are up to you. Then if others
find your solution not good enough for their MLC - they will have to
improve it. 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
