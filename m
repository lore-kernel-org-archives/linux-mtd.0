Received: from mail.analogue-micro.com ([217.144.149.242])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWJr8-0004qr-87
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2016 08:22:35 +0000
From: Gary Thomas <gary@mlbassoc.com>
Subject: NAND dump questions
To: linux-mtd@lists.infradead.org
Message-ID: <56C57F32.8080301@mlbassoc.com>
Date: Thu, 18 Feb 2016 09:22:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to use 'nanddump' to help me duplicate a NAND device.
The idea is to provide a production lab with raw dumps, including
OOB data for every page.  They have a programming machine which can
take these dumps and program the device.  This process is interesting
because we need to make thousands of identical devices and programming
the NAND manually takes a lot of time & manpower.

My target hardware is a Freescale/NXP i.MX6 which uses the gpmi-nand
driver in the Linux kernel.  I have a device layout like this:
   0x000000000000-0x000000780000 : "U-Boot"
   0x000000780000-0x000000800000 : "U-Boot env"
   0x000000800000-0x000004800000 : "Linux kernel"
   0x000004800000-0x000080000000 : "File system"

I generated a hex dump for each partition using
   $ nanddump -c -o -f out.mtdX /dev/mtdX
These files were then sent to the programming lab for duplication.

The results are mixed.  The board boots fine from NAND, so the
first partition was copied as expected.  None of the other
partitions are working, neither in U-Boot nor Linux.  However,
when I look at them using nand dump tools, they contain the
data I provided, i.e. what was in my master device.  I'm truly
baffled as bits should be bits I would think.

Here are more details from mtd1.  My original dump contained
   0x00000000: 55 a8 dd 0f 62 61 75 64 72 61 74 65 3d 31 31 35  |U...baudrate=115|
   0x00000010: 32 30 30 00 62 6f 6f 74 63 6d 64 3d 72 75 6e 20  |200.bootcmd=run |
   0x00000020: 6e 61 6e 64 62 6f 6f 74 3b 00 62 6f 6f 74 64 65  |nandboot;.bootde|
       ...
   0x00000ff0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
     OOB Data: 9b af dc 75 5f 24 d8 95 ba 51 16 e5 f3 5d 8d a8  |...u_$...Q...]..|
     OOB Data: 37 66 08 44 f1 63 ac 5d e8 49 00 00 00 00 00 00  |7f.D.c.].I......|
This all looks good and matches what I get from U-Boot nand dump
    > nand dump 0x780000
    Page 00780000 dump:
	55 a8 dd 0f 62 61 75 64  72 61 74 65 3d 31 31 35
	32 30 30 00 62 6f 6f 74  63 6d 64 3d 72 75 6e 20
	6e 61 6e 64 62 6f 6f 74  3b 00 62 6f 6f 74 64 65
	6c 61 79 3d 35 00 62 6f  6f 74 6d 6d 63 3d 73 65
             ...
	00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
   OOB:
	ff 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00
	9b af dc 75 5f 24 d8 95
	ba 51 16 e5 f3 5d 8d a8
	37 66 08 44 f1 63 ac 5d
	e8 49 00 00 00 00 00 00
I also get the same dump running nanddump on Linux reading the duplicated
device - 100% identical.  But I get errors when reading the device :-(
Note that none of these issues are related to bad block handling (as there
were none in the blocks I'm talking about here), but I think I know how to
handle that if we can just get the basic duplication process working.

Any ideas what's going on here?  What else can I look at to diagnose the issue?

Note: I've actually done this process on another system which is
TI/OMAP Davinci based.  On that device (a different NAND chip and
a different production lab), the duplication worked perfectly.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------
