Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erR7R-00077T-Da
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 16:31:46 +0000
From: Richard Weinberger <richard@nod.at>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Koen Vandeputte <koen.vandeputte@ncentric.com>,
 Scott Bowman <wbowma01@harris.com>
Subject: Re: Does modern UBI/UBIFS still suffer from the 'unstable bits issue'?
Date: Thu, 01 Mar 2018 17:32:57 +0100
Message-ID: <9684795.NoKKx6Kvh2@blindfold>
In-Reply-To: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
References: <CAJ+vNU0O4uBHzd2h0Nbjbm8fp+9e2UEiqHEZ6A5RZHjLsArAPw@mail.gmail.com>
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

Am Donnerstag, 1. M=E4rz 2018, 17:15:44 CET schrieb Tim Harvey:
> Greetings,
>=20
> I have a user with an IMX6 and raw NAND using UBI/UBIFS who has been
> able to reproduce a NAND corruption:

What does your user to reproduce this?

> [   10.611972] UBIFS (ubi0:2): background thread "ubifs_bgt0_2" started, =
PID
> 631 [   10.634365] ubi0 warning: ubi_io_read: error -74 (ECC error) while
> reading 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [ =
=20
> 10.657492] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading
> 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [ =20
> 10.681137] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading
> 253952 bytes from PEB 2807:8192, read only 253952 bytes, retry [ =20
> 10.704267] ubi0 error: ubi_io_read: error -74 (ECC error) while reading
> 253952 bytes from PEB 2807:8192, read 253952 bytes
>=20
> The kernel they are using is a bit out of date but does have
> 'gpmi-nand: Handle ECC Errors in erased pages' [1] patch
>=20
> I'm wondering if the 'unstable bits issue' [2] is still an issue or if
> the UBI/UBFS Documentation is out of date and this has been resolved.
> If it has been resolved, can anyone point me to the patches.

This issue is highly theoretical and I never actually saw it in the wild.=20
Every single time someone claimed to suffer from that, it turned out to be=
=20
something else. Currently UBI/UBIFS has no counter measurement, for the sai=
d=20
reasons.
This reminds me that we have to update the website...

So did you verify (with your NAND vendor) that this really is the named iss=
ue?

Thanks,
//richard
