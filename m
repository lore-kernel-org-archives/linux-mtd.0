Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erhZf-0002Zs-PM
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 10:06:02 +0000
From: Richard Weinberger <richard@nod.at>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Scott Bowman <wbowma01@harris.com>
Subject: Re: Does modern UBI/UBIFS still suffer from the 'unstable bits issue'?
Date: Fri, 02 Mar 2018 11:07:10 +0100
Message-ID: <4813843.hImRYGMsqb@blindfold>
In-Reply-To: <CAJ+vNU3hx8rGh-Kx-UpBU-eYvkT-zspggndChg16Hzu7v_8mBA@mail.gmail.com>
References: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
 <9684795.NoKKx6Kvh2@blindfold>
 <CAJ+vNU3hx8rGh-Kx-UpBU-eYvkT-zspggndChg16Hzu7v_8mBA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tim,

Am Freitag, 2. M=E4rz 2018, 02:19:54 CET schrieb Tim Harvey:
> On Thu, Mar 1, 2018 at 8:32 AM, Richard Weinberger <richard@nod.at> wrote:
> > Tim,
> >=20
> > Am Donnerstag, 1. M=E4rz 2018, 17:15:44 CET schrieb Tim Harvey:
> >> Greetings,
> >>=20
> >> I have a user with an IMX6 and raw NAND using UBI/UBIFS who has been
> >=20
> >> able to reproduce a NAND corruption:
> > What does your user to reproduce this?
>=20
> Richard,
>=20
> It's unclear at the moment. It's one of those 'this happened twice on
> two different boards' reports without a lot of detail. However I do
> know they do write to the filesystem on every boot and do encounter
> random power-cuts.
>=20
> >> [   10.611972] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" starte=
d,
> >> PID 631 [   10.634365] ubi0 warning: ubi_io_read: error -74 (ECC error)
> >> while reading 253952 bytes from PEB 2807:8192, read only 253952 bytes,
> >> retry [ 10.657492] ubi0 warning: ubi_io_read: error -74 (ECC error)
> >> while reading 253952 bytes from PEB 2807:8192, read only 253952 bytes,
> >> retry [
> >> 10.681137] ubi0 warning: ubi_io_read: error -74 (ECC error) while read=
ing
> >> 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [
> >> 10.704267] ubi0 error: ubi_io_read: error -74 (ECC error) while reading
> >> 253952 bytes from PEB 2807:8192, read 253952 bytes

BTW: I miss a back trace here. How did you obtain that messages?
=20
> >> The kernel they are using is a bit out of date but does have
> >> 'gpmi-nand: Handle ECC Errors in erased pages' [1] patch
> >>=20
> >> I'm wondering if the 'unstable bits issue' [2] is still an issue or if
> >> the UBI/UBFS Documentation is out of date and this has been resolved.
> >> If it has been resolved, can anyone point me to the patches.
> >=20
> > This issue is highly theoretical and I never actually saw it in the wil=
d.
> > Every single time someone claimed to suffer from that, it turned out to=
 be
> > something else. Currently UBI/UBIFS has no counter measurement, for the
> > said reasons.
> > This reminds me that we have to update the website...
> >=20
> > So did you verify (with your NAND vendor) that this really is the named
> > issue?
> I have no idea if what the user reported is the unstable bits issue
> but the fact you've never seen it occur in the wild tells me probably
> not.

I'd be surprised, but you never know. :-)

Just to be sure, this is SLC NAND, right?

> They are using a rather old kernel (4.4 but with a patch to gpmi-nand
> backported from 4.7). I will setup a controlled test with random
> power-cuts in a test fixture I have to see if I can get it to re-occur
> on a) the old kernel and then b) the current kernel.

Thanks,
//richard
