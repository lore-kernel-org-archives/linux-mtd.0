Received: from mail127.messagelabs.com ([216.82.250.115])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HFBgu-0003Qt-OI
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 11:00:12 -0500
Received: from az33exr04.mot.com (az33exr04.mot.com [10.64.251.234])
	by motgate.mot.com (8.12.11/Motorola) with ESMTP id l18G1XkJ015598
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Feb 2007 09:01:34 -0700 (MST)
Received: from de01exm63.ds.mot.com (de01exm63.am.mot.com [10.176.8.108])
	by az33exr04.mot.com (8.13.1/8.13.0) with ESMTP id l18FrPE2017854
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Feb 2007 09:53:25 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Calculation of JFFS2 free space
Date: Thu, 8 Feb 2007 10:53:24 -0500
Message-ID: <F269680FD7CE404788EFB7B2A4DBC9CA02AFB464@de01exm63.ds.mot.com>
From: "Sohn Chung-MCG31424" <ChungSohn@motorola.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,
I am using JFFS2 (Linux 2.6.10) on the Large Page NAND flash.
The size of JFFS2 partition is 7M. While applications were holding some
files,
I copied over an 8M file to this partition to make the filesystem full.
After I got the out of space message, I issued the 'df' command.

The output of df was:
# df /jffs2
/dev/mtdblock/3    7168   7023   136   98% /jffs2

# cd /jffs2
# touch foo
touch: foo: No space left on device

The jffs2_statfs returned 136K as the available space.
After the filesystem is full, how the application program can figure out
the real available space on JFFS2 before write?

Thanks in advance.
Chung
