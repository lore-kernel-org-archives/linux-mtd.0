Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eP0Uw-0003fT-2x
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 06:26:34 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171208102148.0a2c0fbe@xps13>
 <e1f47fe9-9b05-fdcd-b7ed-10e8cbced3a4@prevas.dk>
 <20171211105359.7eb1aeb3@xps13>
 <d0dee517-8061-5d40-aa82-6d4c5cda4fb1@prevas.dk>
 <a2502de6-b4c7-befb-6a08-de976be85d17@prevas.dk>
 <f70d94b8-5fc7-d091-9a5c-77597d2b7aa4@prevas.dk>
 <20171211150200.51c7f3b4@xps13> <20171211150929.722a361a@xps13>
 <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
 <20171212095119.475de032@xps13>
 <727489cf-d1f6-8777-c6f4-981127657c9d@prevas.dk>
 <20171212111227.4946cc15@xps13>
 <e9e6bf70-918f-b750-5893-55744dc34882@prevas.dk>
 <20171212120806.7c31463f@xps13>
 <a0267c71-4333-7dd4-dcf4-14aced37f8f9@prevas.dk>
 <20171212123523.48185f21@xps13>
 <75bd6b87-12ed-4003-262a-b1bd03a62cbd@prevas.dk>
 <20171212134706.49f3c57e@xps13>
 <2f16ce90-6e00-c95f-7a81-5603d9acf574@prevas.dk>
 <20171212143512.3b62d3f5@xps13>
 <48EEEC1C-954B-42E5-92BE-A00AD97A5789@prevas.dk>
 <20171212192327.57b1fa80@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <9f578b28-ef3b-8e84-0a8c-b70c494efff0@prevas.dk>
Date: Wed, 13 Dec 2017 07:25:58 +0100
MIME-Version: 1.0
In-Reply-To: <20171212192327.57b1fa80@xps13>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel
>
>>>> Without kernel bbt (nand scrubbed in uboot just before boot):
>>> [...]
>>>   
>>>> Block size 131072, page size 2048, OOB size 64
>>>> Dumping data starting at 0x0fec0000 and ending at 0x0fec0800...
>>> [...]
>>>   
>>>>     OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>>>     OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>>>     OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>>>     OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>> As you can see, your U-Boot version does not recreate the BBT
>>> automatically as I told you it should. Please try rebooting the board
>>> after scrubbing and then check U-Boot creates the BBT from U-Boot
>>> command line.
>> My uboot is recreating the bbt, I have been scrubbing it just before
>> running the bootcmd that's why the OOB is empty :-) I thought that
>> was what you needed but I guess I was wrong.
>>
>>> I insist on the fact that this is something I could have spotted
>>> earlier
>>> if you had blindlessly copy/pasted the *entire* trace, I don't
>>> mind if it is big, it can be really interesting for others to get the
>>> full trace.
>>>
>>> This time I only need the trace without the "on-flash-bbt"
>>> property.
>
I have double checked the result without kernel bbt and the bbt written 
from uboot, the marvell_nand driver is reading 0xFF's...

Tracing:
U-Boot 2017.11-00035-ge9282bb30b-dirty (Dec 12 2017 - 11:22:21 +0100)

SoC:   MV88F6810-A0 at 1066 MHz
DRAM:  1 GiB (533 MHz, 16-bit, ECC not enabled)
WDT:   Enabling Armada 385 watchdog.
NAND:  PXA3xx: strength 4, ecc_stepsize 512, page_size 2048
256 MiB
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
Model: Triax dvb-tc output
Board: Triax dvb-tc output
Net:
Warning: ethernet@30000 (eth0) using random MAC address - d6:4c:37:5e:b6:28
eth0: ethernet@30000
=> nand erase.part ubi0; nand scrub 0xFF80000 0x80000; nand bad

NAND erase.part: device 0 offset 0x100000, size 0xff00000
Skipping bad block at 0x0ff00000
Skipping bad block at 0x0ff20000
Skipping bad block at 0x0ff40000
Skipping bad block at 0x0ff60000
Skipping bad block at 0x0ff80000
Skipping bad block at  0x0ffa0000
Skipping bad block at  0x0ffc0000
Skipping bad block at  0x0ffe0000

OK

NAND scrub: device 0 offset 0xff80000, size 0x80000
Warning: scrub option will erase all factory set bad blocks!
          There is no reliable way to recover them.
          Use this command only for testing purposes if you
          are sure of what you are doing!

Really scrub this NAND flash? <y/N>
y
Erasing at 0xffe0000 -- 100% complete.
OK

Device 0 bad blocks:
Bad block table not found for chip 0
Bad block table not found for chip 0
Scanning device for bad blocks
Bad block table written to 0x00000ffe0000, version 0x01
Bad block table written to 0x00000ffc0000, version 0x01
   0ff00000
   0ff20000
   0ff40000
   0ff60000
   0ff80000
   0ffa0000
   0ffc0000
   0ffe0000
=> boot
[ ... ]
[    2.699996] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    2.706413] nand: Micron MT29F2G08ABAEAH4
[    2.710461] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, 
OOB size: 64
[    2.718122] nand: NAND_ECC_NONE selected by board driver. This is not 
recommended!
[    2.725750] nand: WARNING: pxa3xx_nand-0: the ECC used on your system 
is too weak compared to the one required by the NAND chip
[    2.737295] Scanning device for bad blocks
[    2.886451] 2 cmdlinepart partitions found on MTD device pxa3xx_nand-0
[    2.893008] Creating 2 MTD partitions on "pxa3xx_nand-0":
[    2.898429] 0x000000000000-0x000000100000 : "uboot"
[    2.903806] 0x000000100000-0x000010000000 : "ubi0"
[ ... ]
root@output-module:~# nanddump -nop -l 0x800 --bb=dumpbad -s 0xFE80000 
/dev/mtd1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x0fe80000 and ending at 0x0fe80800...
0x0fe80000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe800a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe800b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe800c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe800d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe800e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe800f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe801a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe801b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe801c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe801d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe801e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe801f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe802a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe802b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe802c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe802d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe802e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe802f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe803a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe803b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe803c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe803d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe803e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe803f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80410: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80420: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80430: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80440: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80450: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80460: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80470: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80490: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe804a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe804b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe804c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe804d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe804e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe804f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80510: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80520: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80530: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80540: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80550: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80570: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80590: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe805a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe805b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe805c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe805d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe805e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe805f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80610: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80620: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80630: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80640: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80650: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80660: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80670: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80690: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe806a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe806b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe806c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe806d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe806e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe806f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80710: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80720: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80730: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80740: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80750: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80760: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80770: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe80790: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe807a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe807b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe807c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe807d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe807e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fe807f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
root@output-module:~# nanddump -nop -l 0x800 --bb=dumpbad -s 0xFEA0000 
/dev/mtd1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x0fea0000 and ending at 0x0fea0800...
0x0fea0000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea00a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea00b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea00c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea00d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea00e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea00f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea01a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea01b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea01c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea01d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea01e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea01f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea02a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea02b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea02c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea02d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea02e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea02f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea03a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea03b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea03c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea03d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea03e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea03f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0410: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0420: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0430: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0440: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0450: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0460: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0470: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0490: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea04a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea04b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea04c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea04d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea04e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea04f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0510: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0520: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0530: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0540: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0550: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0570: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0590: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea05a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea05b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea05c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea05d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea05e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea05f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0610: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0620: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0630: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0640: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0650: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0660: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0670: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0690: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea06a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea06b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea06c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea06d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea06e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea06f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0710: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0720: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0730: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0740: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0750: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0760: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0770: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea0790: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea07a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea07b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea07c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea07d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea07e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fea07f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
root@output-module:~# nanddump -nop -l 0x800 --bb=dumpbad -s 0xFEC0000 
/dev/mtd1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x0fec0000 and ending at 0x0fec0800...
0x0fec0000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec00a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec00b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec00c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec00d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec00e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec00f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec01a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec01b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec01c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec01d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec01e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec01f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec02a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec02b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec02c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec02d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec02e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec02f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec03a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec03b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec03c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec03d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec03e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec03f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0410: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0420: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0430: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0440: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0450: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0460: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0470: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0490: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec04a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec04b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec04c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec04d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec04e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec04f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0510: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0520: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0530: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0540: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0550: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0570: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0590: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec05a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec05b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec05c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec05d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec05e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec05f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0610: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0620: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0630: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0640: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0650: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0660: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0670: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0690: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec06a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec06b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec06c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec06d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec06e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec06f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0710: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0720: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0730: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0740: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0750: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0760: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0770: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec0790: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec07a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec07b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec07c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec07d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec07e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fec07f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
root@output-module:~# nanddump -nop -l 0x800 --bb=dumpbad -s 0xFEE0000 
/dev/mtd1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x0fee0000 and ending at 0x0fee0800...
0x0fee0000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee00a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee00b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee00c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee00d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee00e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee00f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee01a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee01b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee01c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee01d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee01e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee01f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee02a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee02b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee02c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee02d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee02e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee02f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee03a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee03b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee03c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee03d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee03e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee03f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0410: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0420: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0430: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0440: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0450: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0460: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0470: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0490: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee04a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee04b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee04c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee04d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee04e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee04f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0510: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0520: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0530: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0540: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0550: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0570: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0590: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee05a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee05b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee05c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee05d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee05e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee05f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0610: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0620: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0630: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0640: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0650: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0660: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0670: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0690: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee06a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee06b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee06c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee06d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee06e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee06f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0710: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0720: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0730: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0740: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0750: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0760: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0770: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee0790: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee07a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee07b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee07c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee07d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee07e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0fee07f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
root@output-module:~# reboot
[ ... ]
U-Boot 2017.11-00035-ge9282bb30b-dirty (Dec 12 2017 - 11:22:21 +0100)

SoC:   MV88F6810-A0 at 1066 MHz
DRAM:  1 GiB (533 MHz, 16-bit, ECC not enabled)
WDT:   Enabling Armada 385 watchdog.
NAND:  PXA3xx: strength 4, ecc_stepsize 512, page_size 2048
256 MiB
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
