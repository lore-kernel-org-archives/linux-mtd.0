Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Rp0A-0006An-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2001 06:57:03 +0100
Message-ID: <3B67E999.2C20E0D5@sasken.com>
Date: Wed, 01 Aug 2001 11:35:53 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>,
   JFFS mailing list <jffs-dev@axis.com>
Subject: Kernel doesnt uncompress
Content-Type: multipart/mixed;
 boundary="------------7F4F93B730C1859075079A65"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.
--------------7F4F93B730C1859075079A65
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

hi
 Iam trying to make JFFS2 as the root file system ( on assabet board)
First I compiled the kernel removing the initrd support.
Then using rdev i have changed the root device to /dev/mtdblock2,
where in i have the root directory.( in flash)
Iam using angelboot to download the kernel to the ram, but after the
kernel download
the kernel is getting uncompressed...........even iam not getting the
message
kernel uncompressing.................................
on the minicom.
thanks in advance
ashok



--------------7F4F93B730C1859075079A65
Content-Type: text/x-vcard; charset=us-ascii;
 name="ashokmp.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Ashok M Padmanaban
Content-Disposition: attachment;
 filename="ashokmp.vcf"

begin:vcard 
n:.m.padmanabhan;ashok
tel;work:5281461/5281229 ext 3096
x-mozilla-html:FALSE
org:sasken communication technologies ltd;internt access solutions
version:2.1
email;internet:ashokmp@sasken.com
title:software engineer
adr;quoted-printable:;;3008,12 th B cross,=0D=0Aindranagar	;banglore;;;india
x-mozilla-cpt:;0
fn:ashok .m.padmanabhan
end:vcard

--------------7F4F93B730C1859075079A65--
