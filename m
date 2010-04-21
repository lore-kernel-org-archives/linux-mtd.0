Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4Zki-0000vX-R4
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 13:14:07 +0000
Received: by fg-out-1718.google.com with SMTP id 19so1943472fgg.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Apr 2010 06:14:02 -0700 (PDT)
Subject: RE: UBI wear leveling / torture testing algorithms having trouble
	with MLC flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910FDD31E30@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910FDD31773@SJEXCHCCR01.corp.ad.broadcom.com>
	<1271266225.2532.726.camel@localhost.localdomain>
	<B125D8217ABC4B43826503DE00A2D44910FDD31E30@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Apr 2010 16:13:33 +0300
Message-Id: <1271855613.11751.1395.camel@localhost.localdomain>
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

On Thu, 2010-04-15 at 11:01 -0700, Darwin Rambo wrote:
> Hi Artem,
>  
> > >  What's maybe 
> > > needed is a torture test that understands the geometry and the bit correction 
> > > level 1,4,8,12 etc and is able to toggle geometrically neighboring bits rather 
> > > than view it as a simple memory test, but this may be difficult.
> > 
> > May be, but then I think this function should be moved down from UBI to
> > the MTD level. Then the driver-level information like geometry may be
> > used.
> 
> Do you mean having a low level MTD function that does it's own type of torture 
> test on a block and returns test status to UBI?

Something like that.

> > >  Perhaps 
> > > torturing MLC blocks with only 3000 cycles is inappropriate anyways, why not 
> > > just trust the error correction and only mark uncorrectable blocks as bad?.
> > 
> > May be. But on the other hand, ignoring soft-errors completely is not
> > very good, as they may develop into hard-errors. Probably, as usually,
> > we need a balance.
> 
> By MLC hard-errors, do you mean uncorrectable sectors, or do you mean permanently 
> stuck bits that are consistently corrected by ECC every read? 

I actually meant uncorrectable ECC errors.

> The permanently stuck bits I have often seen with MLC are typically stuck at 0 due to 
> neighbouring program disturb effects from other cells. These same stuck bits are the 
> reason for the torture test looping. If you look at the logs of the corrections, 
> it typically involves resetting these back to 1. Perhaps the nand driver can recognize 
> a stuck bit somehow and not report it as a correction but I think that's not right.

Hm, for me this sounds as an idea which may work. What if we just change
the semantics of the -EBADMSG error code of the MTD subsystem. Change it
from "bit flips occured and were corrected" to "_dangerous_ bit flips
occurred, were corrected, but it is risky, so the data should be
refreshed".

Then for SLC, every bit-flip can cause -EBADMSG, just like now, and for
MLC - the driver will be able to decide.

The idea is that MLCs are so different that only the driver can know
whether a bit-flip is dangerous or not.

> Also the programming during torturing might create more even more write disturb errors 
> and make the problem even worse. But we have to live with that anyways during regular
> programming for application data so that's probably a moot point.

This is another problem. We can disabling torturing for MLC, or change
it.

> > >  If I have a 
> > > 3000 erase MLC part, then only 750 quick loops of the scrub/torture (4 erase) cycle 
> > > will wear the block out.
> > 
> > This suggests you did not change the default UBI_WL_THRESHOLD = 4096.
> > You should set it to something smaller. This will make the problem less
> > severe, but will not fix it, of course.
> 
> So that explains why the loop eventually did stop. I originally had the threshold at
> 4096 but later switched to 256. In both cases we saw torture testing loops.
> 
> > How about improving UBI a little and just teach it avoid doing any
> > scrubbing for eraseblocks with high enough erase-counter? Say, if UBI
> > notices a bit-flip in eraseblock A, then:
> > 
> > if (EC of eraseblock A < min. EC + WL_FREE_MAX_DIFF / 2)
> > 	do_scrubbing();
> > else
> > 	/* Do not do scrubbing for relatively "fresh" eraseblocks */
> > 
> > or something like that. This could be good enough to start with.
> > 
> > Also, torturing can be disabled or improved for MLC. This depends on how
> > much efforts you want to invest into UBI over MLC.
> 
> Initially I think we might consider something like a config flag 
> (e.g. CONFIG_MTD_UBI_SCRUB_AND_TORTURE) to just shut off the sensitivity 
> to corrected errors, which are due to noise or the persistent stuck 
> bits I described above. Rather than decide to do scrubbing 
> based on the EC count as you suggest above, another way to look at it might 
> be to simply not start the scrubbing operation based on normal ECC corrections. 
> That's effectively what I'm doing today by hiding/reporting all ecc corrections 
> as 0 corrections.
> 
> Later, we might look into starting the scrubbing when the corrections 
> reaches a threshold based on the nand ECC correction limits. E.g. Set 
> CONFIG_MTD_UBI_SCRUB_AND_TORTURE=y and also add "CONFIG_MTD_UBI_ECC_CAPABILITY=12", 
> and then when we get close to 12 corrections (10,11,12?), we scrub, and perhaps 
> torture this _much_ more marginal block, maybe take it out of service, etc. This 
> could be combined with your erase-counter suggestion above.
> The MLC parts could increase it to 4,8,12, etc. If it was not set, then the legacy 
> behavior of UBI could still be used.
> 
> Future work might involve more elegant MTD based torture tests that understand 
> flash geometry but I think that's a much tougher nut to crack. Especially since
> there's no industry standard for MLC page/bit pairing algorithms by manufacturers.
> 
> These suggestions reduce the block erase frequency dramatically, and with 
> 3000 measly MLC erases, I don't see a problem restricting scrub/torture operations 
> as a trade off for part lifetime.

In general, I think all the MLC-specific things like "ECC 12" should be
hidden in the MTD level. Just because this information is too
MLC-specific for UBI to know about it.

UBI should distinguish MLC and behave a bit different in that case, but
this should be about "torture MLC eraseblocks this special way", and the
like. IOW, on higher level than knowing about ECC levels.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
