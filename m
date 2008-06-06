Received: from el-out-1112.google.com ([209.85.162.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4fTl-0006TM-Qq
	for linux-mtd@lists.infradead.org; Fri, 06 Jun 2008 17:11:54 +0000
Received: by el-out-1112.google.com with SMTP id o28so309318ele.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Jun 2008 10:11:52 -0700 (PDT)
Message-ID: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
Date: Fri, 6 Jun 2008 14:11:51 -0300
From: "Alaor Koppe" <alakoppe@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: NAND and vfat
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
