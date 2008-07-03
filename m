Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KEI4z-00045A-PX
	for linux-mtd@lists.infradead.org; Thu, 03 Jul 2008 06:14:06 +0000
Subject: Re: Problem mounting a UBIFS volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF565C42CF.2A35DC45-ON8825747B.001B2100-8825747B.001D1F69@selinc.com>
References: <OF565C42CF.2A35DC45-ON8825747B.001B2100-8825747B.001D1F69@selinc.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2008 09:11:35 +0300
Message-Id: <1215065495.6573.106.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bruce,

On Wed, 2008-07-02 at 22:18 -0700, Bruce_Leonard@selinc.com wrote:
> Artem,
>=20
> I'm trying to wrap up my changes to support >8GiB MTD devices so it can b=
e=20
> tested while I'm on vacation.  For the most part things run okay (I think=
=20
> :-\  ).  I can load UBI and UBIFS.  ubimkvol/ubirmvol seem to work okay=20
> and I can mount/read/write/umount volumes created with ubimkvol.  But I=20
> have a problem when using mkfs.ubifs and I'm not sure if the problme is i=
n=20
> mkfs.ubifs or in the kernel.  mkfs.ubifs runs fine and finishes without=20
> complaining.  ubiupdatevol seems to have no problems writing the image to=
=20
> the device.  When I try to mount the volume, though, it fails to mount an=
d=20
> gives the following error:

Did you use your MTD 64-bit patch? Did you create a large FS image with
mkfs.ubifs? How large is the ubifs image?

> UBIFS error (pid 824): ubifs_read_nnode: error -22 reading nnode at 8:615=
0
> UBIFS DBG (pid 825): ubifs_bg_thread: background thread "ubifs_bgt0_0"=20
> stops
>=20
>=20
> Now obviously there's a CRC mismatch between what was written to the flas=
h=20
> and what UBIFS calculated.  At first I thought it might be an endian issu=
e=20
> (my system is an MPC8347E running the tip of the UBIFS tree and the lates=
t=20
> UBI tools and mkfs.ubifs), but I don't think so since the stored CRC is=20
> clearly different from the calculated.  I'm digging trying to find the=20
> problem but I'm into things I've never seen before and don't yet=20
> understand.  I now suspect that it's probably another one of those 64-bit=
=20
> promotions I've been fighting, but I'm not sure.  Any guidence you can=20
> give would be appreciated.

We'll look at this, thanks for the report.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
