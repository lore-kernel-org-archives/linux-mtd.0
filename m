Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFsBz-000663-VC
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 19:18:00 +0000
Received: by yhjj52 with SMTP id j52so1058556yhj.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2012 12:17:57 -0700 (PDT)
Message-ID: <4F7DEF7A.1090100@gmail.com>
Date: Thu, 05 Apr 2012 15:16:10 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: nanddump shows all bad blocks
References: <5D308BD40154E4439D82454FE483A50206619995@EVS4.nam.ci.root>
In-Reply-To: <5D308BD40154E4439D82454FE483A50206619995@EVS4.nam.ci.root>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> When I do this:
> root:/> nanddump  -l 0x20000 -s 0x60000   --bb=padbad -f testfile
> /dev/mtd0
>
> It shows that the ECC has failed, but I know there is good data in there
> as that I can read the data in uboot.
> 0x60000-0x7ffff holds my uboot environment.
>
> ECC failed: 429
> ECC corrected: 0
> Number of bad blocks: 4
> Number of bbt blocks: 0
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00060000 and ending at 0x00080000...
>
> My 'testfile' is full of 0xFFs as the option specifies (padbad:  dump
> flash data, substituting 0xFF for any bad blocks).
>
> I know mtd0 is mapped to that partition:
> ...
> Creating 4 MTD partitions on "MT29F2G08ABAEAWP":
> 0x000000000000-0x000000080000 : "bootloader(nand)"
> 0x000000080000-0x000000880000 : "linux kernel(nand)"
> 0x000000880000-0x000006c80000 : "file system(nand)"
> 0x000006c80000-0x000010000000 : "file system(ubifs)"
> ...
>
> Any idea how I can make this work?
>
Sounds as if the kernel is using a different ECC method to read the data
than what u-boot used to write it...

-- 
Peter Barada
peter.barada@gmail.com
