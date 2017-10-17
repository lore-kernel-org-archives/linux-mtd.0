Received: from mail-ve1eur02on0710.outbound.protection.outlook.com
 ([2a01:111:f400:fe06::710]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4RCX-0001B6-ER
 for linux-mtd@lists.infradead.org; Tue, 17 Oct 2017 12:42:31 +0000
Subject: Re: [PATCH] mtd: spi-nor: Enable stateless 4-byte opcodes for
 N25Q256A/N25Q512A/N25Q00
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard
 Weinberger <richard@nod.at>
References: <20171016111712.16783-1-alexander.sverdlin@nokia.com>
 <bdf7c1fa-3c9f-0457-4658-632ad0fcd59c@gmail.com>
 <9a710d91-eca0-7859-7c67-e25782412272@nokia.com>
 <faa85df9-bc05-89db-386e-80a9c08526d4@wedev4u.fr>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <df114cd0-1ff0-4449-537f-5ab82f6ae6f2@nokia.com>
Date: Tue, 17 Oct 2017 14:40:54 +0200
MIME-Version: 1.0
In-Reply-To: <faa85df9-bc05-89db-386e-80a9c08526d4@wedev4u.fr>
Content-Type: text/plain; charset="utf-8"
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

Hello Cyrille,

On 16/10/17 23:27, Cyrille Pitchen wrote:
> Hi Alexander,
> 
> Le 16/10/2017 à 14:25, Alexander Sverdlin a écrit :
>> Hello Marek,
>>
>> On 16/10/17 13:35, Marek Vasut wrote:
>>>> The datasheets explicitly state that the stateless opcodes are supported
>>>> and that they "do not need to be set up in the addressing mode".
>>>>
> 
> I don't totally agree. Micron memories have a little quirk: if you look
> closely at their datasheets (currently reading the N25Q512A datasheet)
> the 12h op code doesn't always work as expected.
> 
> For some memory parts, the 12h op code is used for 4-byte address Page
> Program 1-1-1 (as it should) whereas for other memory parts, this very
> same op code means 3-byte address Page Program x-4-4 (non standard
> usage, should have been 38h/3Eh).
> 
> See note 18:
> """
> The code 38h is valid only for part numbers N25Q512A83GSF40x,
> N25Q512A83G1240x,
> N25Q512A83GSFA0x, N25Q512A83G12A0x and N25Q512A83G12H0x; the code 12h is
> valid for the other part numbers
> """
> 
> Also about the 4-byte address Page Program 1-1-1 and 1-1-4, see note 17:
> """
> Only available for part numbers N25Q512A83GSF40x, N25Q512A83G1240x,
> N25Q512A83GSFA0x, N25Q512A83G12A0x and N25Q512A83G12H0x
> """
> 
> So even with the basic Page Program 1-1-1, this patch would introduce
> regressions with some memory parts.
> 
> This is a known issue of Micron memories and this is why the
> SPI_NOR_4B_OPCODES flag was not set before for those memories!

yes, you are right, while 256/512Mbit variants just potentially have some
non-standard variations, in N25Q00AA series 12h command has non-standard
mapping in all parts. 

Seems, we have to just scrap this patch.

-- 
Best regards,
Alexander Sverdlin.
