Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2D6q-0002km-2m
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 10:19:58 +0000
Received: from player158.ha.ovh.net (unknown [10.109.160.25])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BCE66134EBB
 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2018 12:19:29 +0200 (CEST)
Subject: Re: Query Regarding NOR flash page size calculation s25fl512s
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Marek Vasut <marex@denx.de>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <CAG6enPzUygjG5taj04g=zrmV-HooPp_kSADFgJkxFs3C2u07Rg@mail.gmail.com>
 <VI1PR04MB10387E1BDEFE07D998EA53BB991E0@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20180917134112.293e13d7@bbrezillon>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <b9d62561-08a5-660a-9f7f-1d5b566eb4c3@wedev4u.fr>
Date: Tue, 18 Sep 2018 12:19:15 +0200
MIME-Version: 1.0
In-Reply-To: <20180917134112.293e13d7@bbrezillon>
Content-Type: text/plain; charset=utf-8
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

Hi all,

Le 17/09/2018 à 13:41, Boris Brezillon a écrit :
> Hi Yogesh,
> 
> On Mon, 17 Sep 2018 10:05:27 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
> 
>> Hi All,
>>
>> Please suggest how can we work for this flash, s25fl512s?
>> Passing flag SPI_NOR_SKIP_SFDP would going to break functionality of 1-2-2/1-4-4 protocol mode, as only through SFDP parameter read we get information for the dummy cycles, mode bits etc for this flash.
>>
>> But, page_size value is getting populated wrongly for case when value of CR3V[4] is 0 for this flash.
>>
>> --
>> Regards
>> Yogesh Gaur
>>
>>> -----Original Message-----
>>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
>>> Yogesh Gaur
>>> Sent: Friday, August 31, 2018 10:28 AM
>>> To: linux-mtd@lists.infradead.org
>>> Subject: Query Regarding NOR flash page size calculation s25fl512s
>>>
>>> Hi All,
>>>
>>> I have query and concern regarding page_size calculation for the underlying
>>> NOR flashes.
>>>
>>> I have spansion, ‘s25fl512s’ flash connected on my target.
>>>
>>> With SFDP param reading, page_size for this flash is assigned as 0x200 using
>>> below routine.
>>>    /* Page size: this field specifies 'N' so the page size = 2^N bytes. */
>>>    params->page_size = bfpt.dwords[BFPT_DWORD(11)];
>>>    params->page_size &= BFPT_DWORD11_PAGE_SIZE_MASK;
>>>    params->page_size >>= BFPT_DWORD11_PAGE_SIZE_SHIFT;
>>>    params->page_size = 1U << params->page_size;
>>>
>>> As per the BG of S25FS512S_512_M flash and SFDP header info table above
>>> calculation are correct.
>>>
>>> But final value of the page_size for this flash is depends on the configuration
>>> register CR3V[4], page buffer wrap, it can be either of
>>> 256 byte (0) or 512 byte (1).
>>>
>>> For my case, this value is 0 and page_size becomes 0x100 bytes but with SFDP
>>> header read, value for this is being assigned as 0x200.
>>> Due to this, I am getting data corruption.
>>>
>>> Please suggest, how can we check and proceed in these case. I guess this is
>>> specific to spansion family of flashes.
> 
> I guess we need some kind of ->fixup() hook that the core would call
> after SFDP has been parsed, so that vendors can adjust SPI NOR params.
> 
> Marek, Cyrille, any opinion on that?
>

just few info that might be useful:

1 - Cypress S25FL512S:

JEDEC ID: 01 02 20 4D 00 80

5th byte: 00 - uniform 256-kB sectors
6th byte: 80 - Family ID - FL-S Family

- no Configuration Register 3
- page size is always 512 bytes
- SFDP compliant

2 - Cypress S25FS512S:

JEDEC ID: 01 02 20 4D 00 81
 
5th byte: 00 - uniform 256-kB sectors
6th byte: 81 - Family ID - S25FS512S

- has both Volatile and Non-Volatile Configuration Register 3 (Volatile CR3 reset
  value is Non-Volatile CR3 value), with bit4 Page Buffer Wrap.
  based on the datasheet the factory setting for CR3NV[4] is 0, hence 256-byte
  page size but SFDP table claims the page size is 512 byte... joy and happiness...
- page size depends on CR3V[4]: 0 -> 256 bytes, 1 -> 512 bytes
- SFDP compliant


Then few suggestions:

First, change the "s25fl512s" entry to use the INFO6() macro instead INFO().
Then create a new entry for "s25fs512s" entry also using INFO6()
Finally either:
A - you add the SPI_NOR_SKIP_SFDP flag on the new "s25fs512s" entry (clearly not my
  preferred solution).
B - set some ->fixup() hook, ass suggested by Boris, to the new "s25fs512s" entry
    only.

Solution A would introduce a regression for those already using the S25FS512S
memory part with the current "s25fl512s" entry in spi_nor_ids[].

Best regards,

Cyrille


> Thanks,
> 
> Boris
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
