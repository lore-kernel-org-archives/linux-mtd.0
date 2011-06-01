Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgEf-0001HT-Jm
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 07:53:02 +0000
Received: by fxm14 with SMTP id 14so4775548fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 00:53:00 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 10:48:34 +0300
Message-ID: <1306914514.4405.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-27 at 17:12 -0400, Matthew L. Creech wrote:
> Hi,
> 
> We encountered a device which has the following error:
> 
> UBIFS error (pid 428): ubifs_decompress: cannot decompress 1010 bytes,
> compressor lzo, error -22
> UBIFS error (pid 428): read_block: bad data node (block 388, inode 556196)
> UBIFS error (pid 428): do_readpage: cannot read page 388 of inode
> 556196, error -22
> UBIFS error (pid 428): ubifs_decompress: cannot decompress 1010 bytes,
> compressor lzo, error -22
> UBIFS error (pid 428): read_block: bad data node (block 388, inode 556196)
> UBIFS error (pid 428): do_readpage: cannot read page 388 of inode
> 556196, error -22
> 
> The device is still bootable (though not functional), so I can get
> more debug info if needed.  Any ideas on what could cause this?

Yes, you can enable mount and recovery debugging messages and send me
the log.

> - MPC8313 (using fsl_elbc_nand driver)
> - 1GB NAND flash (partitioned into 5MB for U-Boot, remainder for UBI/UBIFS)
> - 2.6.39 kernel
> 
> Thanks!
> 


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
