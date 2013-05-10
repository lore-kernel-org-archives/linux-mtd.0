Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaghV-0000Pa-SH
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 06:21:08 +0000
Message-ID: <518C91AA.8040107@denx.de>
Date: Fri, 10 May 2013 08:20:26 +0200
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com>
In-Reply-To: <518B96FC.6000806@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vikram,

On 05/09/2013 02:30 PM, Vikram Narayanan wrote:
>> I might be seeing something similar on my iMX6 board. Here
>> mtd_subpagetest sometimes fails.
> 
> AFAIR, subpagetest passed for me when I tested.
> 
> BTW, What kind of errors are you getting? Any logs?

Sure. Here 2 logs with v3.9.1:

# insmod mtd_subpagetest.ko dev=3
[  305.991516] 
[  305.993022] =================================================
[  305.998817] mtd_subpagetest: MTD device: 3
[  306.003016] mtd_subpagetest: MTD device size 519045120, eraseblock size 131072, page size 2048, subpage size 2048, count of eraseblocks 3960, pages per eraseblock 64, OOB size 64
[  306.019077] mtd_subpagetest: scanning for bad eraseblocks
[  306.025249] mtd_subpagetest: scanned 3960 eraseblocks, 0 are bad
[  306.031281] mtd_subpagetest: erasing whole device
[  307.998911] mtd_subpagetest: erased 3960 eraseblocks
[  308.003884] mtd_subpagetest: writing whole device
[  308.009438] mtd_subpagetest: written up to eraseblock 0
[  308.208714] mtd_subpagetest: written up to eraseblock 256
[  308.408049] mtd_subpagetest: written up to eraseblock 512
[  308.607147] mtd_subpagetest: written up to eraseblock 768
[  308.806962] mtd_subpagetest: written up to eraseblock 1024
[  309.007791] mtd_subpagetest: written up to eraseblock 1280
[  309.208895] mtd_subpagetest: written up to eraseblock 1536
[  309.409194] mtd_subpagetest: written up to eraseblock 1792
[  309.609379] mtd_subpagetest: written up to eraseblock 2048
[  309.809121] mtd_subpagetest: written up to eraseblock 2304
[  310.008202] mtd_subpagetest: written up to eraseblock 2560
[  310.206817] mtd_subpagetest: written up to eraseblock 2816
[  310.406695] mtd_subpagetest: written up to eraseblock 3072
[  310.607464] mtd_subpagetest: written up to eraseblock 3328
[  310.807963] mtd_subpagetest: written up to eraseblock 3584
[  311.007515] mtd_subpagetest: written up to eraseblock 3840
[  311.102996] mtd_subpagetest: written 3960 eraseblocks
[  311.108079] mtd_subpagetest: verifying all eraseblocks
[  311.113623] mtd_subpagetest: verified up to eraseblock 0
[  311.219368] mtd_subpagetest: verified up to eraseblock 256
[  311.324900] mtd_subpagetest: verified up to eraseblock 512
[  311.430172] mtd_subpagetest: verified up to eraseblock 768
[  311.536136] mtd_subpagetest: verified up to eraseblock 1024
[  311.641565] mtd_subpagetest: verified up to eraseblock 1280
[  311.747521] mtd_subpagetest: verified up to eraseblock 1536
[  311.853136] mtd_subpagetest: verified up to eraseblock 1792
[  311.959090] mtd_subpagetest: verified up to eraseblock 2048
[  312.064725] mtd_subpagetest: verified up to eraseblock 2304
[  312.170469] mtd_subpagetest: verified up to eraseblock 2560
[  312.276184] mtd_subpagetest: verified up to eraseblock 2816
[  312.381647] mtd_subpagetest: verified up to eraseblock 3072
[  312.487339] mtd_subpagetest: verified up to eraseblock 3328
[  312.593213] mtd_subpagetest: verified up to eraseblock 3584
[  312.698887] mtd_subpagetest: verified up to eraseblock 3840
[  312.751091] mtd_subpagetest: verified 3960 eraseblocks
[  312.756265] mtd_subpagetest: erasing whole device
[  315.925559] mtd_subpagetest: erased 3960 eraseblocks
[  315.930553] mtd_subpagetest: verifying all eraseblocks for 0xff
[  315.947734] mtd_subpagetest: verified up to eraseblock 0
[  317.140658] mtd_subpagetest: error: read failed at 0xd60800
[  317.146278] mtd_subpagetest: error -74 occurred
[  317.150818] =================================================

# insmod mtd_subpagetest.ko dev=3
[ 2531.551029] 
[ 2531.552534] =================================================
[ 2531.558325] mtd_subpagetest: MTD device: 3
[ 2531.562529] mtd_subpagetest: MTD device size 519045120, eraseblock size 131072, page size 2048, subpage size 2048, count of eraseblocks 3960, pages per eraseblock 64, OOB size 64
[ 2531.578478] mtd_subpagetest: scanning for bad eraseblocks
[ 2531.584647] mtd_subpagetest: scanned 3960 eraseblocks, 0 are bad
[ 2531.590678] mtd_subpagetest: erasing whole device
[ 2533.558127] mtd_subpagetest: erased 3960 eraseblocks
[ 2533.563099] mtd_subpagetest: writing whole device
[ 2533.568626] mtd_subpagetest: written up to eraseblock 0
[ 2533.767485] mtd_subpagetest: written up to eraseblock 256
[ 2533.966877] mtd_subpagetest: written up to eraseblock 512
[ 2534.165419] mtd_subpagetest: written up to eraseblock 768
[ 2534.364624] mtd_subpagetest: written up to eraseblock 1024
[ 2534.564741] mtd_subpagetest: written up to eraseblock 1280
[ 2534.765559] mtd_subpagetest: written up to eraseblock 1536
[ 2534.965797] mtd_subpagetest: written up to eraseblock 1792
[ 2535.165736] mtd_subpagetest: written up to eraseblock 2048
[ 2535.365025] mtd_subpagetest: written up to eraseblock 2304
[ 2535.564295] mtd_subpagetest: written up to eraseblock 2560
[ 2535.763114] mtd_subpagetest: written up to eraseblock 2816
[ 2535.963109] mtd_subpagetest: written up to eraseblock 3072
[ 2536.163287] mtd_subpagetest: written up to eraseblock 3328
[ 2536.363245] mtd_subpagetest: written up to eraseblock 3584
[ 2536.562388] mtd_subpagetest: written up to eraseblock 3840
[ 2536.657760] mtd_subpagetest: written 3960 eraseblocks
[ 2536.662818] mtd_subpagetest: verifying all eraseblocks
[ 2536.668410] mtd_subpagetest: verified up to eraseblock 0
[ 2536.774134] mtd_subpagetest: verified up to eraseblock 256
[ 2536.879704] mtd_subpagetest: verified up to eraseblock 512
[ 2536.985855] mtd_subpagetest: verified up to eraseblock 768
[ 2537.091823] mtd_subpagetest: verified up to eraseblock 1024
[ 2537.197130] mtd_subpagetest: verified up to eraseblock 1280
[ 2537.302641] mtd_subpagetest: verified up to eraseblock 1536
[ 2537.408158] mtd_subpagetest: verified up to eraseblock 1792
[ 2537.514150] mtd_subpagetest: verified up to eraseblock 2048
[ 2537.619806] mtd_subpagetest: verified up to eraseblock 2304
[ 2537.725757] mtd_subpagetest: verified up to eraseblock 2560
[ 2537.831831] mtd_subpagetest: verified up to eraseblock 2816
[ 2537.937520] mtd_subpagetest: verified up to eraseblock 3072
[ 2538.043640] mtd_subpagetest: verified up to eraseblock 3328
[ 2538.149644] mtd_subpagetest: verified up to eraseblock 3584
[ 2538.255815] mtd_subpagetest: verified up to eraseblock 3840
[ 2538.307873] mtd_subpagetest: verified 3960 eraseblocks
[ 2538.313018] mtd_subpagetest: erasing whole device
[ 2541.541123] mtd_subpagetest: erased 3960 eraseblocks
[ 2541.546119] mtd_subpagetest: verifying all eraseblocks for 0xff
[ 2541.563155] mtd_subpagetest: verified up to eraseblock 0
[ 2544.439123] mtd_subpagetest: verified up to eraseblock 256
[ 2547.314905] mtd_subpagetest: verified up to eraseblock 512
[ 2550.189340] mtd_subpagetest: verified up to eraseblock 768
[ 2553.065276] mtd_subpagetest: verified up to eraseblock 1024
[ 2555.941052] mtd_subpagetest: verified up to eraseblock 1280
[ 2558.814191] mtd_subpagetest: verified up to eraseblock 1536
[ 2561.687721] mtd_subpagetest: verified up to eraseblock 1792
[ 2561.996470] mtd_subpagetest: error: read failed at 0xe380800
[ 2562.002147] mtd_subpagetest: error -74 occurred
[ 2562.006726] =================================================

>>
>> What is the current status on your platform? Did you resolve this
>> problem? If yes, what did you have to change/fix?
> 
> Unfortunately no. I haven't got enough time to look into this.

Too bad. Could you please explain again, how you first noticed
that the you might have a problem with NAND on your imx6 board?

We noticed a problem first in U-Boot by using the following
commands:

=> nand erase.part ubi; ubi part ubi

This works the first time without any problem. But the 2nd time
it leads to "uncorrectable errors" (0xfe) while reading from some
blocks. And those failing blocks tend to be the same (more or less).

Perhaps you might want to test this in U-Boot (if you use it)
as well.

> Also, I don't have enough spare boards to sacrifice it for mtd_torture test.

Yes, I can understand this.

Huang, do you have any idea on how to proceed here? What else
could/should we test? Any ideas/hints?

Here the infos for our NAND device:

[    0.917552] ONFI param page 0 valid
[    0.921053] ONFI flash detected
[    0.924206] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron MT29F4G08ABADAH4), 512MiB, page size: 2048, OOB size: 64
[    0.935871] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
[    0.942772] Scanning device for bad blocks
[    1.287358] 4 cmdlinepart partitions found on MTD device gpmi-nand
[    1.293546] Creating 4 MTD partitions on "gpmi-nand":
[    1.298624] 0x000000000000-0x000001000000 : "uboot"
[    1.304349] 0x000001000000-0x000001080000 : "env1"
[    1.309910] 0x000001080000-0x000001100000 : "env2"
[    1.315426] 0x000001100000-0x000020000000 : "ubi"
[    1.321276] gpmi-nand 112000.gpmi-nand: driver registered.

...

# mtdinfo /dev/mtd0
mtd0
Name:                           uboot
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          128 (16777216 bytes, 16.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  2048 bytes
OOB size:                       64 bytes
Character device major/minor:   90:0
Bad blocks are allowed:         true
Device is writable:             true

Thanks,
Stefan
