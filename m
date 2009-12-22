Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NN5LC-000652-Oz
	for linux-mtd@lists.infradead.org; Tue, 22 Dec 2009 14:04:02 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Lauren Del Giudice" <lauren@wyplay.com>
Date: Tue, 22 Dec 2009 06:03:42 -0800
Subject: RE: UBI - exclude bootloader blocks from wear levelling
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFC176A0@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
	<B125D8217ABC4B43826503DE00A2D44910DFC17584@SJEXCHCCR01.corp.ad.broadcom.com>
	<4B307E68.90901@wyplay.com>
In-Reply-To: <4B307E68.90901@wyplay.com>
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

Artem is on holidays, I'm sure he'll get around to it when he returns. Good=
 suggestion.

Darwin=20

-----Original Message-----
From: Lauren Del Giudice [mailto:lauren@wyplay.com]=20
Sent: Tuesday, December 22, 2009 12:08 AM
To: Darwin Rambo
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI - exclude bootloader blocks from wear levelling

Good news, thank you Darwin. May I suggest then to change the
sentence in the (excellent) documentation from:

"you may continuously write/erase only one logical eraseblock of an
UBI volume, but UBI will spread this to all physical eraseblocks of
the flash chip"
<http://www.linux-mtd.infradead.org/doc/ubi.html#L_overview>

to something more explicit/accurate?

Lauren.

Darwin Rambo wrote:
> Wear levelling is done across a "ubi device" (not the whole nand device) =
which is associated with a mtd partition. Your bootloader and kernel mtd pa=
rtitions will not be wear levelled, only your ubi file system partitions. i=
.e. ubi doesn't know about non-ubi mtd partitions.
>=20
> I think that's the gist of it.
>=20
> Darwin
>=20
>=20
>=20
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lis=
ts.infradead.org] On Behalf Of Lauren Del Giudice
> Sent: Monday, December 21, 2009 8:46 AM
> To: linux-mtd@lists.infradead.org
> Subject: UBI - exclude bootloader blocks from wear levelling
>=20
> I'm new to UBI... I understood that static wear levelling is applied
> accross the whole device (a NAND device in my case); If so, how can
> I exclude blocks reserved for the bootloader from wear levelling?
>=20
> Thanks for your help,
> Lauren.
> ----
> This message contains confidential information and may contain informatio=
n that is legally privileged.  If you have received this message by mistake=
, please immediately notify us and delete the original message. Thank you. =
=20
>=20
> Ce message contient des informations confidentielles.  S'il vous est parv=
enu par erreur, merci de bien vouloir nous en aviser par retour, de n'en fa=
ire aucun usage et de n'en garder aucune copie.
> ----
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20
----
This message contains confidential information and may contain information =
that is legally privileged.  If you have received this message by mistake, =
please immediately notify us and delete the original message. Thank you. =20

Ce message contient des informations confidentielles.  S'il vous est parven=
u par erreur, merci de bien vouloir nous en aviser par retour, de n'en fair=
e aucun usage et de n'en garder aucune copie.
----
