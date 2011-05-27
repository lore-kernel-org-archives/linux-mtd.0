Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QQ4Kt-0007b2-6W
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 21:12:47 +0000
Received: by vws8 with SMTP id 8so2038299vws.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 May 2011 14:12:45 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 27 May 2011 17:12:44 -0400
Message-ID: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
Subject: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We encountered a device which has the following error:

UBIFS error (pid 428): ubifs_decompress: cannot decompress 1010 bytes,
compressor lzo, error -22
UBIFS error (pid 428): read_block: bad data node (block 388, inode 556196)
UBIFS error (pid 428): do_readpage: cannot read page 388 of inode
556196, error -22
UBIFS error (pid 428): ubifs_decompress: cannot decompress 1010 bytes,
compressor lzo, error -22
UBIFS error (pid 428): read_block: bad data node (block 388, inode 556196)
UBIFS error (pid 428): do_readpage: cannot read page 388 of inode
556196, error -22

The device is still bootable (though not functional), so I can get
more debug info if needed.  Any ideas on what could cause this?

- MPC8313 (using fsl_elbc_nand driver)
- 1GB NAND flash (partitioned into 5MB for U-Boot, remainder for UBI/UBIFS)
- 2.6.39 kernel

Thanks!

-- 
Matthew L. Creech
