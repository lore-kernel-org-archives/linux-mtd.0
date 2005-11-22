Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EegbO-0007Ri-S5
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 17:27:08 -0500
Received: from [192.168.1.143] (w238.z208176144.sjc-ca.dsl.cnc.net
	[208.176.144.238])
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id jAMM047v007502
	for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2005 14:00:04 -0800
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Nov 2005 14:26:47 -0800
MIME-Version: 1.0
Message-ID: <43832AA7.12861.123243F@dupre.avab.com>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: Quoted-printable
Content-description: Mail message body
Subject: DOC interferes with linux boot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a system with one of the 32 pin Disk-on-Chip devices.  The DOC 
has the "default" formatting using TrueFFS and a single DOS 
partition.  On a hard drive I've got Red Hat Linux 7.3.

When I try to load Linux, grub reports:

root (hd0,0)
 Filesystem type is ext2fs, partition type 0x83
kernel /boot/vmlinuz-2.4.18-3 ro root=3D/dev/hda1
   [Linux-bzimage, setup=3D0x1400, size=3D0xfcdc3]

Error 28: Selected item cannot fit into memory


If I remove the DOC, Linux boots correctly.
If I erase the binary (BDK) partition on the DOC (and thus removing 
TrueFFS), Linux also boots correctly.

Can someone tell me why this is happening and if there is a remedy to 
load the Linux kernel while keeping the DOC with it's default TrueFFS 
configuration?

Thanks-- 
Joseph M. Dupr=E9
Design Engineer
SAND Network Systems
+1 707 778 8990 x207
