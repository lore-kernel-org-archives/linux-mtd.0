Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKw89-0006fj-Fw
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2004 05:54:44 -0400
Message-ID: <4178D9C1.1090908@inf.u-szeged.hu>
Date: Fri, 22 Oct 2004 11:58:25 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <41767593.9030004@inf.u-szeged.hu>
	<20041021124926.GA1497@angel.research.nokia.com>
In-Reply-To: <20041021124926.GA1497@angel.research.nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jarkko Lavinen wrote:

> My initial test was only about the mount time. I have now also tried
> to exercise the patched file system and with very little testing I get
> CRC or ECC errors.
> 
>   # mount /dev/mtdblock2 /mnt -t jffs2
>   # mkdir /mnt/testdir
>   # umount /mnt
>   jffs2_flush_wbuf(): Write failed with -5
>   # mount /dev/mtdblock2 /mnt -t jffs2
>   mtd->read(0x1fbec bytes from 0x1fc0414) returned ECC error
>   Empty flash at 0x01fc2f1c ends at 0x01fc3000
>   #
> 
> With plain 2.6.9-rc4-omap1 with fresh CVS MTD code, I don't see anything
> weird occuring.

We are tring to find out what happens here...

Jarkko previously sent me some more detail, the logs starts with:
> sh-2.05b# /rootfstest.sh
> Mounting file system: 			Ok
> Creating a test directory: 						Ok
> Creating a test file: mtd->read(0x44 bytes from 0x1fa344c) returned ECC error
> Data CRC 6d0b1da8 != calculated CRC 9c4f3838 for node at 01fa344c
> mtd->read(0x44 bytes from 0x1fa3e20) returned ECC error
> Data CRC 5127cb7f != calculated CRC 057e127c for node at 01fa3e20
> mtd->read(0x44 bytes from 0x1fa4388) returned ECC error
> mtd->read(0x44 bytes from 0x1fa5cb8) returned ECC error
> mtd->read(0x44 bytes from 0x1fa6748) returned ECC error
> mtd->read(0x44 bytes from 0x1fa7b30) returned ECC error
> Data CRC 72b41a04 != calculated CRC ebc121db for node at 01fa7b30
> mtd->read(0x44 bytes from 0x1fa866c) returned ECC error
> Data CRC 9ff1d419 != calculated CRC cb2cce56 for node at 01fa866c

It means the mounting is done successfully. The first problem is when 
the filesystem try to read jffs2_raw_inode nodes (if I am right the 0x44 
is the size of that). It is not successfull (I don't know why), and it 
cause CRC errors, too. The only one differences should be only the the 
original version already read this 0x44 before (during mount time), the 
summary version did not read yet, just know where it is from the summary.

Jarkko, one more interesing thing can be (if you have that image) to see 
what is at the place 0x1fa344c, 01fa3e20, ... with the tool jffs2dump.

If anyone have any idea that is welcome. Unfortunatelly we don't have 
real NAND device, and it works with our emulator.

Thanks,
Ferenc
