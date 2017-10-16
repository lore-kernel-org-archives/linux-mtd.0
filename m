Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4CvS-0003E3-AB
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 21:27:56 +0000
Subject: Re: [PATCH] mtd: spi-nor: Enable stateless 4-byte opcodes for
 N25Q256A/N25Q512A/N25Q00
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
References: <20171016111712.16783-1-alexander.sverdlin@nokia.com>
 <bdf7c1fa-3c9f-0457-4658-632ad0fcd59c@gmail.com>
 <9a710d91-eca0-7859-7c67-e25782412272@nokia.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <faa85df9-bc05-89db-386e-80a9c08526d4@wedev4u.fr>
Date: Mon, 16 Oct 2017 23:27:19 +0200
MIME-Version: 1.0
In-Reply-To: <9a710d91-eca0-7859-7c67-e25782412272@nokia.com>
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

Hi Alexander,

Le 16/10/2017 à 14:25, Alexander Sverdlin a écrit :
> Hello Marek,
> 
> On 16/10/17 13:35, Marek Vasut wrote:
>>> The datasheets explicitly state that the stateless opcodes are supported
>>> and that they "do not need to be set up in the addressing mode".
>>>

I don't totally agree. Micron memories have a little quirk: if you look
closely at their datasheets (currently reading the N25Q512A datasheet)
the 12h op code doesn't always work as expected.

For some memory parts, the 12h op code is used for 4-byte address Page
Program 1-1-1 (as it should) whereas for other memory parts, this very
same op code means 3-byte address Page Program x-4-4 (non standard
usage, should have been 38h/3Eh).

See note 18:
"""
The code 38h is valid only for part numbers N25Q512A83GSF40x,
N25Q512A83G1240x,
N25Q512A83GSFA0x, N25Q512A83G12A0x and N25Q512A83G12H0x; the code 12h is
valid for the other part numbers
"""

Also about the 4-byte address Page Program 1-1-1 and 1-1-4, see note 17:
"""
Only available for part numbers N25Q512A83GSF40x, N25Q512A83G1240x,
N25Q512A83GSFA0x, N25Q512A83G12A0x and N25Q512A83G12H0x
"""

So even with the basic Page Program 1-1-1, this patch would introduce
regressions with some memory parts.

This is a known issue of Micron memories and this is why the
SPI_NOR_4B_OPCODES flag was not set before for those memories!

>>> The stateless mode is clearly more beneficial, because there are boot
>>> ROM code versions not able to cope with the chip left in 4-byte state.
>>>

I agree with you on that: it was the purpose of patch adding support to
the 4-byte address instruction set ;)


>>> Tested with Micron N25Q512A.
>>>
>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> Can SFDP help here ?
> 
> it would be nice, but I've just checked
> - JESD216
> - "TN-25-06: Serial Flash Discovery Parameters for MT25Q Family"
> - N25Q512A "Serial Flash Discovery Parameter Data Structure"
> 
> seems, such flag is not provided in the standard. There is a way
> to figure out if the chip supports entering 4-bytes mode and what
> is the command to enter such a mode, but nothing for the stateless commands.
> 
> I would be glad to be wrong in this particular case.
> 

The "4-byte address instruction set" is an optional SFDP table. It is
supported by latest Macronix memories but not by the Micron N25Q* memories.

Best regards,

Cyrille
