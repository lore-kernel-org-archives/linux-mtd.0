Received: from sysam.it ([5.39.81.93])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2leQ-0001Xa-8T
 for linux-mtd@lists.infradead.org; Thu, 12 Oct 2017 22:08:24 +0000
Subject: Re: support for ISSI is25lp128
From: Angelo Dureghello <angelo@sysam.it>
To: linux-mtd@lists.infradead.org
Cc: nnazarenko@radiofid.com
References: <972ea98a-cc59-4fea-1358-ce096bc937c5@sysam.it>
Message-ID: <0708ec5b-130d-0a53-da89-2dae502d056e@sysam.it>
Date: Fri, 13 Oct 2017 00:07:56 +0200
MIME-Version: 1.0
In-Reply-To: <972ea98a-cc59-4fea-1358-ce096bc937c5@sysam.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

again, please let me know if there is a wat to contribute for
is25lp128.

I tested the Nikita patch, it works, i can read and write partitions
properly.

I am interested to have this chip available into mainline, and can
contribute for any test you need on this chip.

Regards,
Angelo

On 06/10/2017 23:04, Angelo Dureghello wrote:
> Hi all,
> 
> i have a coldfire mcf54415-based board with a is25lp128 SPI flash and
> i was trolling into:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2016-March/066042.html
> 
> I applied the same patch into spi-nor.c and tested, the patch seems
> to work great.
> 
> 
>       /* ISSI */
>       { "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> +    { "is25lp128", INFO(0x9d6018, 0, 32 * 1024,   512, SECT_4K) },
> 
> 
> At boot into dmesg i get
> 
> [    0.000000] Linux version 4.13.0-rc7stmark2-001-00035-g815951bfbc2e-dirty (angelo@jerusalem) (gcc version 5.2.0 (crosstools-sysam-2016.04.16)) #158 Fri Oct 6 22:52:28 CEST 2017
> [    0.000000] uClinux with CPU COLDFIRE(m5441x)
> [    0.000000] COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
> .....
> [    8.260000] m25p80 spi0.1: is25lp128 (16384 Kbytes)
> [    8.270000] Creating 3 MTD partitions on "is25lp128":
> [    8.270000] 0x000000000000-0x000000100000 : "U-Boot (1024K)"
> [    8.350000] 0x000000100000-0x000000800000 : "Kernel+initramfs (7168K)"
> [    8.410000] 0x000000800000-0x000001000000 : "Flash Free Space (8192K)"
> [    8.520000] Freeing unused kernel memory: 264K
> 
> / # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00100000 00001000 "U-Boot (1024K)"
> mtd1: 00700000 00001000 "Kernel+initramfs (7168K)"
> mtd2: 00800000 00001000 "Flash Free Space (8192K)"
> 
> / # hexdump /dev/mtd0 -C -n256
> 00000000  00 00 20 61 00 0f 01 00  00 00 00 80 00 00 8c 47  |.. a...........G|
> 00000010  e0 04 b6 47 e0 04 b6 47  e0 04 b6 47 e0 04 b6 47  |...G...G...G...G|
> *
> 00000080  e0 04 b6 47 e0 04 b6 00  00 00 00 00 04 00 00 47  |...G...........G|
> 00000090  e0 00 00 46 fc 27 00 20  3c 80 00 00 00 4e 7b 08  |...F.'. <....N{.|
> 000000a0  01 20 3c 80 00 02 21 4e  7b 0c 05 70 00 22 7c 80  |. <...!N{..p."|.|
> 000000b0  00 ff f8 24 7c 80 00 ff  fc 22 80 24 80 20 3c 01  |...$|....".$. <.|
> 000000c0  04 01 00 4e 7b 00 02 70  00 4e 7b 00 04 4e 7b 00  |...N{..p.N{..N{.|
> 000000d0  05 4e 7b 00 06 4e 7b 00  07 2e 7c 80 00 ff 50 42  |.N{..N{...|...PB|
> 000000e0  a7 22 7c fc 04 00 2d 12  bc 00 17 61 00 04 62 22  |."|...-....a..b"|
> 000000f0  7c ec 09 40 4e 24 7c ec  09 40 4f 12 bc 00 ff 14  ||..@N$|..@O.....|
> 00000100
> / #
> 
> It is proper code of the primary partition
> 
> / # hexdump /dev/mtd1 -C -n256
> 00000000  27 05 19 56 fe 2e de 03  59 d7 ed 0d 00 1c 50 00  |'..V....Y.....P.|
> 00000010  40 00 10 00 40 00 10 00  ab e3 60 35 05 0c 02 00  |@...@.....`5....|
> 00000020  6d 61 69 6e 6c 69 6e 65  20 6b 65 72 6e 65 6c 00  |mainline kernel.|
> 00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000040  4e 71 46 fc 27 00 20 3c  01 04 01 00 4e 7b 00 02  |NqF.'. <....N{..|
> 00000050  4e 71 2e 7c 40 00 00 00  4e 7b f8 01 23 cf 40 16  |Nq.|@...N{..#.@.|
> 00000060  b0 04 2e 7c 40 00 00 00  23 cf 40 16 b0 00 20 3c  |...|@...#.@... <|
> 
> It is proper code of the second partition
> 
> 
> Let me know in case what kind of test you would need.
> Would help to have that patch accepted into mainline.
> 
> Best regards,
> Angelo Dureghello
> 
> 
