Received: from mms3.broadcom.com ([216.31.210.19])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2TO6-0005SJ-Q8
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 18:02:04 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Thu, 15 Apr 2010 11:01:45 -0700
Subject: RE: UBI wear leveling / torture testing algorithms having
	trouble with MLC flash
Message-ID: <B125D8217ABC4B43826503DE00A2D44910FDD31E30@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910FDD31773@SJEXCHCCR01.corp.ad.broadcom.com>
	<1271266225.2532.726.camel@localhost.localdomain>
In-Reply-To: <1271266225.2532.726.camel@localhost.localdomain>
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
=20
> >  What's maybe=20
> > needed is a torture test that understands the geometry and the bit corr=
ection=20
> > level 1,4,8,12 etc and is able to toggle geometrically neighboring bits=
 rather=20
> > than view it as a simple memory test, but this may be difficult.
>=20
> May be, but then I think this function should be moved down from UBI to
> the MTD level. Then the driver-level information like geometry may be
> used.

Do you mean having a low level MTD function that does it's own type of tort=
ure=20
test on a block and returns test status to UBI?

> >  Perhaps=20
> > torturing MLC blocks with only 3000 cycles is inappropriate anyways, wh=
y not=20
> > just trust the error correction and only mark uncorrectable blocks as b=
ad?.
>=20
> May be. But on the other hand, ignoring soft-errors completely is not
> very good, as they may develop into hard-errors. Probably, as usually,
> we need a balance.

By MLC hard-errors, do you mean uncorrectable sectors, or do you mean perma=
nently=20
stuck bits that are consistently corrected by ECC every read?=20

The permanently stuck bits I have often seen with MLC are typically stuck a=
t 0 due to=20
neighbouring program disturb effects from other cells. These same stuck bit=
s are the=20
reason for the torture test looping. If you look at the logs of the correct=
ions,=20
it typically involves resetting these back to 1. Perhaps the nand driver ca=
n recognize=20
a stuck bit somehow and not report it as a correction but I think that's no=
t right.

(Side-note: I also sometimes see a bit set to 0 after an erase operation wi=
th MLC.
E.g. you might see 0xfffffdff for example in the erased page.=20
Since the ECC is also erased, and FF data does not imply FF ECC in our case=
, it is=20
necessary to detect the all FF erased ECC and in software, fake these stuck=
 low data=20
bits as high as if the ECC were present...but I digress).

In the case of MLC, I think we might ignore soft errors and let the ECC do =
it's job.=20
If the errors are program disturb effects as above, then they will be persi=
stent and=20
will always be corrected within the ECC capability. If we get too many stuc=
k bits then=20
the sector/page/block becomes bad and we know that without scrubbing or tor=
turing=20
anyways. If they are random errors due to noise margins and read-disturb ef=
fects, then=20
I believe that this is also 'normal' behavior, and shouldn't trigger error =
recovery
operations like scrubbing/torturing, especially a single bit correction.

Also the programming during torturing might create more even more write dis=
turb errors=20
and make the problem even worse. But we have to live with that anyways duri=
ng regular
programming for application data so that's probably a moot point.

> >  If I have a=20
> > 3000 erase MLC part, then only 750 quick loops of the scrub/torture (4 =
erase) cycle=20
> > will wear the block out.
>=20
> This suggests you did not change the default UBI_WL_THRESHOLD =3D 4096.
> You should set it to something smaller. This will make the problem less
> severe, but will not fix it, of course.

So that explains why the loop eventually did stop. I originally had the thr=
eshold at
4096 but later switched to 256. In both cases we saw torture testing loops.

> How about improving UBI a little and just teach it avoid doing any
> scrubbing for eraseblocks with high enough erase-counter? Say, if UBI
> notices a bit-flip in eraseblock A, then:
>=20
> if (EC of eraseblock A < min. EC + WL_FREE_MAX_DIFF / 2)
> 	do_scrubbing();
> else
> 	/* Do not do scrubbing for relatively "fresh" eraseblocks */
>=20
> or something like that. This could be good enough to start with.
>=20
> Also, torturing can be disabled or improved for MLC. This depends on how
> much efforts you want to invest into UBI over MLC.

Initially I think we might consider something like a config flag=20
(e.g. CONFIG_MTD_UBI_SCRUB_AND_TORTURE) to just shut off the sensitivity=20
to corrected errors, which are due to noise or the persistent stuck=20
bits I described above. Rather than decide to do scrubbing=20
based on the EC count as you suggest above, another way to look at it might=
=20
be to simply not start the scrubbing operation based on normal ECC correcti=
ons.=20
That's effectively what I'm doing today by hiding/reporting all ecc correct=
ions=20
as 0 corrections.

Later, we might look into starting the scrubbing when the corrections=20
reaches a threshold based on the nand ECC correction limits. E.g. Set=20
CONFIG_MTD_UBI_SCRUB_AND_TORTURE=3Dy and also add "CONFIG_MTD_UBI_ECC_CAPAB=
ILITY=3D12",=20
and then when we get close to 12 corrections (10,11,12?), we scrub, and per=
haps=20
torture this _much_ more marginal block, maybe take it out of service, etc.=
 This=20
could be combined with your erase-counter suggestion above.
The MLC parts could increase it to 4,8,12, etc. If it was not set, then the=
 legacy=20
behavior of UBI could still be used.

Future work might involve more elegant MTD based torture tests that underst=
and=20
flash geometry but I think that's a much tougher nut to crack. Especially s=
ince
there's no industry standard for MLC page/bit pairing algorithms by manufac=
turers.

These suggestions reduce the block erase frequency dramatically, and with=20
3000 measly MLC erases, I don't see a problem restricting scrub/torture ope=
rations=20
as a trade off for part lifetime.

Thanks.

Best regards,
Darwin

Disclaimer - Any views or opinions presented in this e-mail are solely thos=
e of the author=20
and do not necessarily represent those of the company.=20
