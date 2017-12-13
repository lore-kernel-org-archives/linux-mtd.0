Received: from mail01.prevas.se ([62.95.78.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eP3Oh-0006fV-8v
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 09:32:18 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
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
 <9f578b28-ef3b-8e84-0a8c-b70c494efff0@prevas.dk>
 <20171213094105.73646658@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <b1ab1a42-026b-d9fd-c137-0e57317020b5@prevas.dk>
Date: Wed, 13 Dec 2017 10:31:44 +0100
MIME-Version: 1.0
In-Reply-To: <20171213094105.73646658@xps13>
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
> Hi Sean,
>
>>>>> I insist on the fact that this is something I could have spotted
>>>>> earlier
>>>>> if you had blindlessly copy/pasted the *entire* trace, I don't
>>>>> mind if it is big, it can be really interesting for others to get
>>>>> the full trace.
>>>>>
>>>>> This time I only need the trace without the "on-flash-bbt"
>>>>> property.
>>>   
>> I have double checked the result without kernel bbt and the bbt
>> written from uboot, the marvell_nand driver is reading 0xFF's...
> That is weird. I am gonna check with my setup if the sequence I ask you
> actually works.
>
>> Tracing:
>> U-Boot 2017.11-00035-ge9282bb30b-dirty (Dec 12 2017 - 11:22:21 +0100)
> "-dirty"? Is the 17.11 U-Boot clean around the NAND area? What did you
> change from mainline code?
Clean nand code, just added debug print so we are able to see if the bbt 
is read correctly etc.
>
>
>> SoC:   MV88F6810-A0 at 1066 MHz
>> DRAM:  1 GiB (533 MHz, 16-bit, ECC not enabled)
>> WDT:   Enabling Armada 385 watchdog.
>> NAND:  PXA3xx: strength 4, ecc_stepsize 512, page_size 2048
>> 256 MiB
>> Bad block table found at page 131008, version 0x01
>> Bad block table found at page 130944, version 0x01
>> Model: Triax dvb-tc output
>> Board: Triax dvb-tc output
>> Net:
>> Warning: ethernet@30000 (eth0) using random MAC address -
>> d6:4c:37:5e:b6:28 eth0: ethernet@30000
>> => nand erase.part ubi0; nand scrub 0xFF80000 0x80000; nand bad
>>
>> NAND erase.part: device 0 offset 0x100000, size 0xff00000
>> Skipping bad block at 0x0ff00000
>> Skipping bad block at 0x0ff20000
>> Skipping bad block at 0x0ff40000
>> Skipping bad block at 0x0ff60000
>> Skipping bad block at 0x0ff80000
>> Skipping bad block at  0x0ffa0000
>> Skipping bad block at  0x0ffc0000
>> Skipping bad block at  0x0ffe0000
>>
>> OK
>>
>> NAND scrub: device 0 offset 0xff80000, size 0x80000
>> Warning: scrub option will erase all factory set bad blocks!
>>            There is no reliable way to recover them.
>>            Use this command only for testing purposes if you
>>            are sure of what you are doing!
>>
>> Really scrub this NAND flash? <y/N>
>> y
>> Erasing at 0xffe0000 -- 100% complete.
>> OK
>>
>> Device 0 bad blocks:
>> Bad block table not found for chip 0
>> Bad block table not found for chip 0
>> Scanning device for bad blocks
>> Bad block table written to 0x00000ffe0000, version 0x01
>> Bad block table written to 0x00000ffc0000, version 0x01
>>     0ff00000
>>     0ff20000
>>     0ff40000
>>     0ff60000
>>     0ff80000
>>     0ffa0000
>>     0ffc0000
>>     0ffe0000
>> => boot
>> [ ... ]
> Please, stop doing this, we _really_ _really_ _really_ want the *full*
> log, no matter if you think this part is irrelevant.
>
> If for you the trace is too big, please use
> http://code.bulix.org/ or https://pastebin.com/
Nothing magic happens, just tftpboot.  I will dump to gist next time ;-)
See link below
>> [    2.699996] nand: device found, Manufacturer ID: 0x2c, Chip ID:
>> 0xda [    2.706413] nand: Micron MT29F2G08ABAEAH4
>> [    2.710461] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
>> 2048, OOB size: 64
>> [    2.718122] nand: NAND_ECC_NONE selected by board driver. This is
>> not recommended!
>> [    2.725750] nand: WARNING: pxa3xx_nand-0: the ECC used on your
>> system is too weak compared to the one required by the NAND chip
>> [    2.737295] Scanning device for bad blocks
>> [    2.886451] 2 cmdlinepart partitions found on MTD device
>> pxa3xx_nand-0 [    2.893008] Creating 2 MTD partitions on
>> "pxa3xx_nand-0": [    2.898429] 0x000000000000-0x000000100000 :
>> "uboot" [    2.903806] 0x000000100000-0x000010000000 : "ubi0"
>> [ ... ]
>> root@output-module:~# nanddump -nop -l 0x800 --bb=dumpbad -s
>> 0xFE80000 /dev/mtd1
> While I am investigating on my side, could you please:
> - dump the same pages as before from U-Boot, with the OOB area of
>    course (do not substract the 0x100000 offset from U-Boot), I want
>    to see if there is actually something in these pages.
=> nand dump 0xFFC0000
Page 0ffc0000 dump:
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
OOB:
     ff ff ff ff ff ff ff ff
     31 74 62 42 56 4d 01 ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
=> nand dump 0xFFE0000
Page 0ffe0000 dump:
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
OOB:
     ff ff ff ff ff ff ff ff
     4d 56 42 62 74 30 01 ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
     ff ff ff ff ff ff ff ff
=>
> - dump the entire MTD1 device from Linux (same configuration as before)
>    and grep for the string "MVBbt".
https://gist.github.com/anonymous/2264abdc94e5d12e3efa8fc085fa1dd5

/Sean
