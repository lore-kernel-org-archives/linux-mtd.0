Received: from [63.144.37.162] (helo=mh02.bioace.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rRSg-0002IG-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 00:08:54 +0100
Received: from bioace.net (unknown [192.168.10.179])
	by mh02.bioace.net (Postfix) with ESMTP id A46E540230
	for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2002 19:08:13 -0400 (EDT)
Message-ID: <3D87B5DD.59E37F94@bioace.net>
Date: Tue, 17 Sep 2002 19:08:13 -0400
From: Carl Przybylek <carlp@bioace.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip & JFFS1/2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Im trying to setup a JFFS1/2 filesytem on the 48MB DiskOnChip.  Seems
Ive run into a few problems that I cant find  answers to.

1).  If I download the the latest cvs source of the mtd and patch it in
with the 2.4.19 kernel the jffs2 support will not compile.  background.c
tells me that recalc_sigpending passed 1 argument but takes 0.  JFFS2
support compiles fine from the unpatched source.

2).  Using the support from the 2.4.19 kernel I got the kernel to
reconize the diskonchip but I get the following error when trying to
create a JFFS2 filesystem:
ECC needs a full sector write ( addr 400 size 4c ).
What the heck does that mean?  I cant find much expect a message post
saying disk on chip does not support jffs filesystems.

Any help would be greatly appreciated.
Carl Przybylek
