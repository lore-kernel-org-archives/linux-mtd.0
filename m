Received: from mh1.kwic.com ([205.150.58.4])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VXOh-00083X-64
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 15:06:47 +0100
Received: from mars.rdsdata.com (orb.kwic.com [205.150.58.194])
	by mh1.kwic.com (8.11.6/8.11.6) with ESMTP id h5QE78G41848
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jun 2003 10:07:08 -0400 (EDT)
To: linux-mtd@lists.infradead.org
From: Alan Daly <adaly@kwic.com>
Date: Thu, 26 Jun 2003 10:06:19 -0400
Message-ID: <jUsT.aNoTheR.mEsSaGe.iD.10566364287676@webmail.kwic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso8859-1
Content-Transfer-Encoding: 8bit
Subject: 2 mtd devices with DiskOnChip or
Reply-To: adaly@kwic.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My question is how do I either:
a) create 2 mtd devices with DiskOnChip
(I found an old patch http://pficheux.free.fr/eyrolles/linux_embarque/docs_externes/jffs2_on_doc.
html)
b) boot the DiskOnChip using just JFFS2


I'm setting an embedded linux build using 16 MB DiskOnChip on X86.
I'm using GRUB as the bootloader.

My original build was:

/dev/mtd0 -> /dev/nftla -> /dev/nftla1  / (root) ext2 16 MB

This build had some issues being hard powered on and off. 
As a result, I want to use JFFS2.  

My proposed build is:

/dev/mtd0 -> /dev/nftla -> /dev/nftla1 /boot ext2 1.5 MB (read-only)
/dev/mtd1 (/dev/mtdblock1)  / (root) jffs2 14.5 MB.

I thought that this way:
1) I can still use the grub_firmware
2) not worry about the ext2 partition as it is mounted read-only
3) still get the benifits of jffs2 on the volatile data.



*****
dalya
