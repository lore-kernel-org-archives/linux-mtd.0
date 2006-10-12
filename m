Received: from mail.emacinc.com ([63.245.244.68])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GY1nG-00064N-0I
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 10:44:25 -0400
Received: from [63.245.244.67] (helo=eng011.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50) id 1GY1mx-0008BW-EL
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 09:44:05 -0500
From: NZG <ngustavson@emacinc.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 12 Oct 2006 09:43:13 -0500
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200610120943.13429.ngustavson@emacinc.com>
Subject: inftl broken?
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been going throught the mailing lists and haven't been able to come to=
 a=20
clear conclusion as to the functionality of inftl. I see a lot of questions=
,=20
but I have yet to find a conclusive answer.

When I attempt to use it, it appears to be broken.

I have build a vanilla 2.6.14.7 kernel, installed it on a debian system, an=
d=20
installed mtd-tools.

=46rom the target I:
modprobe inftl
modprobe diskonchip

This correctly detects the diskon chip and creates a partition inftla

I create a secondary partition inftla1 with fdisk.
then:
mke2fs /dev/inftla1
mount /dev/inftla1 /mnt
cd /mnt
touch test
cd /
umount /mnt

I then reboot the system

modprobe inftl
modprobe diskonchip
mount /dev/inftla1 /mnt

and my test file is gone.

I have also attempted to use 2.6.18. It also fails, but differently.
It completely replaces the bad block chain every time the diskonchip driver=
=20
mounts.

Now, I'm flexible in how this is to be used, but I need a working system.

My question is:
***********Is anyone using inftl successfully in any way?*************

Please include details, i.e. filesystem, kernel, utils, etc...
If it' s proprietary and you can't share, then at least say "yes".

If this doesn't work under any circumstances, please consider removing it f=
rom=20
the kernel, or at least officially calling it broken.

I asked this same question on the IRC last night and no-one seemed to know.

NZG
