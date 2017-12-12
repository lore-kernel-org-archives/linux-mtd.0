Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOgBc-0001TN-7g
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 08:45:14 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
CC: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
 <20171129090305.0174246d@xps13>
 <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
 <20171130181847.0bbc58b5@xps13>
 <5bc5d326-af1f-44d2-468a-d211212c4612@prevas.dk>
 <20171201091539.5d6b7572@xps13>
 <744e99ee-91cf-28bc-21eb-c3fa01fb0a01@prevas.dk>
 <20171207213814.4c57098f@xps13>
 <26441ab5-8c70-4d7f-5e0d-bec3d59e2ef2@prevas.dk>
 <20171208102148.0a2c0fbe@xps13>
 <e1f47fe9-9b05-fdcd-b7ed-10e8cbced3a4@prevas.dk>
 <20171211105359.7eb1aeb3@xps13>
 <d0dee517-8061-5d40-aa82-6d4c5cda4fb1@prevas.dk>
 <a2502de6-b4c7-befb-6a08-de976be85d17@prevas.dk>
 <f70d94b8-5fc7-d091-9a5c-77597d2b7aa4@prevas.dk>
 <20171211150200.51c7f3b4@xps13> <20171211150929.722a361a@xps13>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
Date: Tue, 12 Dec 2017 09:44:43 +0100
MIME-Version: 1.0
In-Reply-To: <20171211150929.722a361a@xps13>
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

Hi Miquel,

>> This behavior is "normal", it is because the number of failure has
>> been incremented (probably by marvell_nfc_hw_ecc_correct()).
>>
>>
>> Can you hack the code right before this line [1] and add:
>> 1/ A dump of both the data buffer and the oob buffer (entirely)
>> 2/ Add a memset(mtd->oob_poi, 0xff, mtd->oobsize) conditionally until
>> the probe is finished (you may want to add a global boolean value that
>> changes its state after the nand_scan_tail() call).
> Instead of hacking this way, to boot until you get a prompt, you may
> add this property to the nand controller node:
>
> nand-ecc-mode = "none";
>
> Then please use nanddump over a programmed page, including the OOB area.
>
>
Boot log:
[    2.692856] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    2.699231] nand: Micron MT29F2G08ABAEAH4
[    2.703286] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, 
OOB size: 64
[    2.711135] nand: NAND_ECC_NONE selected by board driver. This is not 
recommended!
[    2.718730] nand: WARNING: pxa3xx_nand-0: the ECC used on your system 
is too weak compared to the one required by the NAND chip
[    2.732632] Bad block table not found for chip 0
[    2.739609] Bad block table not found for chip 0
[    2.744250] Scanning device for bad blocks
[    2.985502] Bad block table written to 0x00000ffe0000, version 0x01
[    2.992760] Bad block table written to 0x00000ffc0000, version 0x01

Nanddump:
root@output-module:~# nanddump -oa /dev/mtd1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x0ff00000...
UBIXS...

I guess it's safe to say something is not right with ECC enabled.
>> Then please do a raw dump with nanddump from Linux.
>>
>>
/Sean
