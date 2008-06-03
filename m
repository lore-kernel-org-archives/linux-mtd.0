Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K3Keb-0004aw-Q8
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 00:45:34 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1125006wfc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 02 Jun 2008 17:45:31 -0700 (PDT)
Message-ID: <a791a2dc0806021745o629da671ib011567cb2aa519a@mail.gmail.com>
Date: Mon, 2 Jun 2008 21:45:31 -0300
From: "Alaor Koppe" <alakoppe@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: vfat loopback mount problem
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have mounted my jfss2 on NAND Flash and created my file.img (with
fat12 filesystem) and when I try to mount I get:

# mount -t msdos file.img fat -o loop,ro
FAT: bogus number of reserved sectors
VFS: Can't find a valid FAT filesystem on dev loop0.
mount: Mounting /mnt/file.img on /mnt/fat failed: Invalid argument

I don't know what is happening, anybody can help me?
(I am using a kit from Embedded Artists with LPC2468 and
uClinux-dist-20051014 with kernel 2.6.11)

Best Regards

-- 
Alaor Abel Koppe
