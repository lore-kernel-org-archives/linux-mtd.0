Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSmO3-0004lP-Nd
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2010 08:07:01 +0000
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 6741919D20
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 09:06:57 +0100 (CET)
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tpUi+AInxULS for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 09:06:56 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by anubis.se.axis.com (Postfix) with ESMTP id 3F94C19D1D
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 09:06:56 +0100 (CET)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 323F8340D0
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Dec 2010 09:06:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	oBF86uwt006555
	for <linux-mtd@lists.infradead.org>; Wed, 15 Dec 2010 09:06:56 +0100
Date: Wed, 15 Dec 2010 09:06:56 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Static UBI volumes and ubiupdatevol ?
Message-ID: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I've looked through the documentation on=20
http://www.linux-mtd.infradead.org but I can't find the answer to the=20
following question(s):

Using 'static' UBI volumes seems to be the preferred way of creating read=
=20
only file systems.

While it seems possible to use ubinize to make a complete ubi image=20
containing static volumes and then write it to the flash using ubiformat,=
=20
is it possible to update just a single volume using ubiupdatevol?

I've tried using ubimkvol to create a static volume, then using=20
ubiupdatevol to write an ubifs image to it. That works, but when I try to=
=20
mount it subsequently I get things like

[ 6656.114000] UBIFS: static UBI volume - read-only mode
[ 6656.129000] UBIFS error (pid 866): mount_ubifs: can't format empty UBI=
=20
volume: read-only UBI volume
mount: mounting ubi1_0 on /volume1/ failed: Read-only file system

which in a way makes sense to me; if the volume is static =3D read only the=
n=20
it shouldn't be possible to write to it.

The only thing I haven't tried is matching the size of the image I'm=20
writing to the size of the partition. With dynamic volumes that doesn't=20
seem to be an issue; as long as there is space for the data in the target=
=20
volume. The free space just seems to get truncated to the available free=20
space in the flash volume. (On the other hand, writing an image that is=20
smaller than the flash volume doesn't seem to 'grow' to fit the available=
=20
space according to df; it remains the same no matter how large the target=
=20
volume is). So I've been rather careless with the size of the image vs.=20
the size of the target volume.

A related question: With static volumes, I assume you still get the=20
benefit of scrubbing, which in turn means that UBI can move the data=20
around if it deems necessary?

Which begs a final question: is it possible to verify the integrity of a=20
static UBI volume? Even with JFFS2, if mounted readonly the flash in that=
=20
particular partition is never written to, so it is possible to use a=20
simple checksum to verify data integrity. With JFFS2 this can be=20
important, as missing JFFS2 nodes don't necessarily result in mount time=20
or run time failures, it just results in missing files or parts of files.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
