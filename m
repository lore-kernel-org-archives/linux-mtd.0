Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMYrd-0005DL-Ao
	for <linux-mtd@lists.infradead.org>; Wed, 19 Nov 2003 20:23:49 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Luca Contini" <luca.contini@mediaenabling.com>
Date: Thu, 20 Nov 2003 09:28:33 +1300
References: <001701c3ae86$6a506450$170714ac@lukkino>
In-Reply-To: <001701c3ae86$6a506450$170714ac@lukkino>
MIME-Version: 1.0
Message-Id: <20031119202214.B211314D5E@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: smartmedia block driver
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 19 November 2003 23:18, you wrote:
> Hi all,
> I've successfully completed the "read" part of a smartmedia driver for the
> Samsung board smdk2410.
> The Linux kernel is 2.4.18 (mandatory for this board)
> The driver is composed by 3 modules:
> s3c2410nand.o
> smdk2410.o
> mtdblock.o
>
> I've modified these sources in order to read the smartmedia and build up
> the logical to physical block address map.
> Now I am able to mount a vfat filesystem on the smartmedia:
> mount -t vfat /dev/mtdblock0 /mnt/smartmedia


Great progress!

> My problem is that I have no idea about how to write sectors to smartmedia.
> I have already the low level function nand_write_ecc, but I need help from
> the logical side.
> When the mtdblock needs a logical sector (req->sector), I just use my table
> to translate the logical block address to physical block address (the low
> level driver module s3c2410nand.o reads only physical sectors) and pass
> this physical address to the nand_read_ecc function.
> I suppose that when I write, a new logical or physical address must be
> written in the OOB area of the requested block, but which is the logic?

The idea is that you have some spare, unmapped physical blocks in the 'spare 
pool'. This pool is typically around 2% of the blocks. ie. if your device has 
2048 blocks, then 2000 are logically mapped (ie. formatted and in use) and 48 
are in the pool. 

When you rewrite a logical block you pick a physical block from the pool and 
write to that. If the write fails, mark the block bad and pick another.

Then erase the old block and toss it back in the pool. Oh, if the erase fails 
then mark it bad too.

This policy effects a degree of wear levelling as well as providing the 
mechanism for handling back-ups for bad blocks.

This is explained a bit in the docs on the Samsung www. THe SDDR09 driver 
should be doing stuff like this too. 


>
> is anybody able to help me?
>
> regards
>
> Luca
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
