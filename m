Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14MI2z-0004O7-00
	for mtd-list@infradead.org; Fri, 26 Jan 2001 23:12:49 +0000
Received: from ftp.tpi.com ([198.107.51.136] helo=mailgate.tpi.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14MI2y-0004O1-00
	for mtd@infradead.org; Fri, 26 Jan 2001 23:12:48 +0000
From: Tim Gardner <timg@tpi.com>
Reply-To: timg@tpi.com
To: mtd@infradead.org
Subject: What flash file system on uCLinux 2.0.38?
Date: Fri, 26 Jan 2001 15:59:14 -0700
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <01012616124100.01883@tim.tpi.com>
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I'm stuck using uCLinux (based on 2.0.38) on an ARM7 platform. I have 2 C=
FI
compliant flash parts (AM29DL323D), and will soon have to support equival=
ent
sized Intel Strataflash.

The JFFS that comes with uCLinux 2.0.38 is hopelessly based on flash.c wh=
ich
only support a few parts. I've backported the latest MTD from CVS, and al=
l
seems to work using CFI and cstm_cfi_jedec.c. However, the new JFFS is
based on 2.2.0 VFS inode and dentry cache stuff. Way too much work to bac=
kport.

Does anyone have a suggestion for a flash filesystem that I might use? Us=
ing a
regular file system on the flash translation layer is not an option since=
 this
is not a PCMCIA platform (patent issues I guess).

rtg
  --  Tim Gardner - timg@tpi.com
TriplePoint, Inc. - http://www.tpi.com
PGP: http://www.tpi.com/PGP/Tim.txt


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
