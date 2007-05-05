Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkKV1-0003ol-BJ
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 09:40:38 -0400
Subject: Re: UBI: Cannot create static volumes when FTL is enabled
From: Artem Bityutskiy <dedekind@infradead.org>
To: John Smith <john@arrows.demon.co.uk>
In-Reply-To: <1178366098.3659.93.camel@sauron>
References: <Pine.LNX.4.33.0705042249130.30496-100000@arrows.demon.co.uk>
	<1178365169.3659.76.camel@sauron>  <1178366098.3659.93.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 16:40:30 +0300
Message-Id: <1178372430.3659.124.camel@sauron>
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

On Sat, 2007-05-05 at 14:54 +0300, Artem Bityutskiy wrote:
> On Sat, 2007-05-05 at 14:39 +0300, Artem Bityutskiy wrote:
> > So you see that dynamic volumes are mapped to the MTD device model quit=
e
> > nicely: mtd device size =3D volume size.
> >=20
> > Size of static volumes depends on how much data you put there. And sinc=
e
> > MTD infrastructure assumes that MTD device sizes are stable, there is n=
o
> > good and nice way to emulate MTD devices on top of static volumes,
> > unless MTD subsystem is somehow re-designed.
> >=20
> > But anyway, you have found a bug. I am going to disable MTD device
> > emulation for static volumes.
>=20
> Although it still would be nice to have MTD device emulation for static
> volumes. May be we have the same semantics as dynamic volumes if they
> are used via gluebi. It needs more thinking.

Well, after thinking more I have fixed this. Now we set emulated mtd
device size to data size if the volume is static.

I.e., when you create a static volume, its size is zero:

# ubimkvol -d0 -n0 -Nvol1 -s60MiB -t static
# cat /sys/class/ubi/ubi0_0/data_bytes
# 0

# cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 08000000 00004000 "NAND simulator partition 0"
# mtd1: 00000000 00003e00 "vol1"

# ubiupdatevol -d 0 -n 0 small_file_72_bytes
# cat /sys/class/ubi/ubi0_0/data_bytes
# 72

# cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 08000000 00004000 "NAND simulator partition 0"
# mtd1: 00000048 00003e00 "vol1"

I've committed the fix to git://git.infradead.org/~dedekind/ubi-2.6.git.
Or see
http://git.infradead.org/?p=3Dusers/dedekind/ubi-2.6.git;a=3Dcommit;h=3D962=
f24709f91fe0634b3faa3cac915c66357a239

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
