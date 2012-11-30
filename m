Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TeIzS-0001LG-Sp
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 05:18:19 +0000
Received: by mail-da0-f49.google.com with SMTP id v40so54310dad.36
 for <linux-mtd@lists.infradead.org>; Thu, 29 Nov 2012 21:18:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4716786.20121129231231@o2.pl>
References: <4716786.20121129231231@o2.pl>
Date: Fri, 30 Nov 2012 10:48:14 +0530
Message-ID: <CAEhpT-Xnist1C0cUi2z8QQeUL0xjBMMrv43rof24xguH6Yx9fg@mail.gmail.com>
Subject: Re: Problem with NAND on MIPS32 board (mtd 20050122)
From: Calvin Johnson <linux.cj@gmail.com>
To: Dawid Prus - praca <dawid.prus@o2.pl>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dawid

On Fri, Nov 30, 2012 at 3:42 AM, Dawid Prus - praca <dawid.prus@o2.pl> wrote:
> Hello.
>
> I'm trying to use a MIPS32-24KE (from Vitesse 7429) with NAND flash SAMSUNG K9F1G08U0B / Micron 29F2G08AAD,
> and I have problem with reading it. Software I'm using is KAMIKAZE 8.09.2 (mtd 20050122)
>
> Problem is when i try to read also the ID or any data from chip.
> When I read ID for SAMSUNG I getting:
> NAND device: Manufacturer ID: 0xFF, Chip ID: 0xEC (next readed byte is 0xF1) - 0xFF in mfc field makes
> that my NAND is not recognized
> Same situation with Micron (first byte 0xFF)
> I changed nand_base.c and put one extra read command before reading first ID byte:
>
> chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
> read_byte(mtd);  // added command
> *maf_id = chip->read_byte(mtd);

I don't think this may be the right thing to do. Did you add any other
function to the linux NAND driver or are you using the standard driver
without any other change other than the one you mentioned above?

> NAND is now recognized and I have log (dmesg) like this:
> .....
> RedBoot partition parsing not available
> Using physmap partition information
> Creating 4 MTD partitions on "physmap-flash.0":
> 0x00000000-0x00040000 : "redboot"
> 0x00040000-0x00080000 : "config"
> 0x007c0000-0x008c0000 : "linux"
> 0x008c0000-0x00bc0000 : "rootfs"
> mtd: partition "rootfs" set to be root filesystem
> block2mtd: version $Revision: 1.30 $
> NAND device: ec,f1,80,15,40 // this is my exta function
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB 3,3V 8-b)

By refering to the table in the below link, it looks like your NAND is
detected properly. The manufacturer ID and Chip ID read back are
correct.
http://www.linux-mtd.infradead.org/nand-data/nanddata.html

> Scanning device for bad blocks
> Creating 1 MTD partitions on "gen_nand":
> 0x00000000-0x08000000 : "rootfs_data"
> TCP cubic registered
> NET: Registered protocol family 17
> VFS: Mounted root (squashfs filesystem) readonly.
> Freeing unused kernel memory: 108k freed
> ......
>
>
> After this, when NAND is recognized I have still problem with reading
> (first byte is FF and other are shifted to right)
> You can see it when I do nandtest (from mtd-utils)
>
> root@OpenWrt:/# nandtest /dev/mtd4
> ECC corrections: 0
> ECC failures   : 0
> Bad blocks     : 0
> BBT blocks     : 0
> 00000000: reading...
> ECC failed at 00000000
> 00000000: checking...
> compare failed. seed 1797617246
> Byte 0x0 is ff should be 0a
> Byte 0x1 is 0a should be 6e
> Byte 0x2 is 6e should be 7e
> Byte 0x3 is 7e should be 8e
> Byte 0x4 is 8e should be aa
> Byte 0x5 is aa should be 23
> Byte 0x6 is 23 should be 91
>
> From myself I can add that NAND i permanently selected - CS pin goes to GND (through 10k)
>
> Please help me to find some solution to fix this issue.
> Sorry about my english
>
> Best Regards
> Dawid
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
