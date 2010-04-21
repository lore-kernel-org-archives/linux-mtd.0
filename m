Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4dAW-00081X-EL
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 16:52:57 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Wed, 21 Apr 2010 09:51:42 -0700
Subject: RE: UBI wear leveling / torture testing algorithms having
	trouble with MLC flash
Message-ID: <B125D8217ABC4B43826503DE00A2D44910FDDFB900@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910FDD31773@SJEXCHCCR01.corp.ad.broadcom.com>
	<1271266225.2532.726.camel@localhost.localdomain>
	<B125D8217ABC4B43826503DE00A2D44910FDD31E30@SJEXCHCCR01.corp.ad.broadcom.com>
	<1271855613.11751.1395.camel@localhost.localdomain>
In-Reply-To: <1271855613.11751.1395.camel@localhost.localdomain>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> > The permanently stuck bits I have often seen with MLC are typically stu=
ck at 0 due to
> > neighbouring program disturb effects from other cells. These same stuck=
 bits are the
> > reason for the torture test looping. If you look at the logs of the cor=
rections,
> > it typically involves resetting these back to 1. Perhaps the nand drive=
r can recognize
> > a stuck bit somehow and not report it as a correction but I think that'=
s not right.
>
> Hm, for me this sounds as an idea which may work. What if we just change
> the semantics of the -EBADMSG error code of the MTD subsystem. Change it
> from "bit flips occured and were corrected" to "_dangerous_ bit flips
> occurred, were corrected, but it is risky, so the data should be
> refreshed".
>
> Then for SLC, every bit-flip can cause -EBADMSG, just like now, and for
> MLC - the driver will be able to decide.
>
> The idea is that MLCs are so different that only the driver can know
> whether a bit-flip is dangerous or not.

When bit flips are corrected we return -EUCLEAN and when uncorrectable erro=
rs occur we
return -EBADMSG. So you probably mean -EUCLEAN above? I think -EBADMSG shou=
ld continue
to mean "uncorrectable".

But a permanently stuck bit is corrected each read and isn't really dangero=
us.
It's most likely just a write-disturb effect. I have seen that blocks that =
get heavily
erased & programmed start showing lots of correctable ECC errors. So I don'=
t think we
should consider stuck bits or random bit flips as dangerous. But we should =
consider
high numbers of errors of both types together as a dangerous condition, lik=
ely indicating
block wearout.

>
> > Also the programming during torturing might create more even more write=
 disturb errors
> > and make the problem even worse. But we have to live with that anyways =
during regular
> > programming for application data so that's probably a moot point.
>
> This is another problem. We can disabling torturing for MLC, or change
> it.

Torturing MLC flash just wears the MLC flash out more and creates more bit =
flips. But
scrubbing and torturing are different things, so we are scrubbing so that w=
e increase
the probability of precious user data not being lost, disabling scrubbing i=
s not a good
option, but disabling/changing torturing may be fine. Perhaps we should hav=
e MTD/MLC return
-EUCLEAN when say, 80-100% of the max possible corrections are done and the=
n scrub the
data to a good block, and then either torture the marginal block or mark it=
 bad and remove
the block from service?

Another idea might be to remember with a torture histogram how many times a=
 each block
was sent out for torturing, and after N (3?) tortures, something is definit=
ely bad, and
then the block could be marked bad permanently.

For MLC, you might consider just erasing the block and not torturing at all=
. Eventually the
marginal block will hit the N threshold above and be taken out of service a=
nyways. Then you
don't need a mtd specific torture test at all...

>
>
>
> In general, I think all the MLC-specific things like "ECC 12" should be
> hidden in the MTD level. Just because this information is too
> MLC-specific for UBI to know about it.
>
> UBI should distinguish MLC and behave a bit different in that case, but
> this should be about "torture MLC eraseblocks this special way", and the
> like. IOW, on higher level than knowing about ECC levels.

I agree the mtd driver should hide this information if possible, and we sug=
gested that
above for error reporting. But for torturing, that might mean we need to ch=
ange the mtd
interface to be able to request a flash specific torture test and return a =
status.
Changing mtd seems to be harder than the suggestions above, and since tortu=
ring may make
things worse, I think we should try to keep our solution in the ubi layer f=
or now.

Thanks.

Best regards,
Darwin

Disclaimer - Any views or opinions presented in this e-mail are solely thos=
e of the author
and do not necessarily represent those of the company.
