Received: from samar.sasken.com ([164.164.56.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ZZrE-0008Ik-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2001 16:23:54 +0100
Message-ID: <3B841D7B.2D9FD324@sasken.com>
Date: Wed, 22 Aug 2001 21:00:43 +0000
From: Ashok M Padmanaban <ashokmp@sasken.com>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>,
   JFFS mailing list <jffs-dev@axis.com>
Subject: mkfs.jffs2
Content-Type: multipart/mixed;
 boundary="------------FF83D0DB8F2E04D2D90CA9B6"
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
--------------FF83D0DB8F2E04D2D90CA9B6
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
  The mkfs.jffs2 has some options,  in which  -e option specifies the
erase block size, which  by default is 64KiB.
While making a jffs2 image of a directory (which has some files) of size
3848192 Bytes.

 ./mkfs.jffs2   -d directory   -o jffs2_img  -e  128KiB

With default option for erase block size ( 64KiB), the jffs2 image size
was :   1983612 Bytes. ( 1.89 MB)
 With   -e 128KiB
, the jffs2 image size was :    7687900 Bytes  (7.33 MB)
  With   -e  256KiB
, the jffs2 image size was :    4289164 Bytes   (4.09 MB)

Why is that the jffs2 image size is varying with the erase block size.?
 If i have an erase size of 256KiB(on flash), is it necessary that i
should build a jffs2 image with the -e 256KiB option.


regards
ashok


--------------FF83D0DB8F2E04D2D90CA9B6
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

--------------FF83D0DB8F2E04D2D90CA9B6--
