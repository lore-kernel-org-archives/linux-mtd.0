Received: from mail-he1eur01on0126.outbound.protection.outlook.com
 ([104.47.0.126] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e44UA-0005m4-Fy
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 12:27:12 +0000
Subject: Re: [PATCH] mtd: spi-nor: Enable stateless 4-byte opcodes for
 N25Q256A/N25Q512A/N25Q00
To: Marek Vasut <marek.vasut@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
References: <20171016111712.16783-1-alexander.sverdlin@nokia.com>
 <bdf7c1fa-3c9f-0457-4658-632ad0fcd59c@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <9a710d91-eca0-7859-7c67-e25782412272@nokia.com>
Date: Mon, 16 Oct 2017 14:25:47 +0200
MIME-Version: 1.0
In-Reply-To: <bdf7c1fa-3c9f-0457-4658-632ad0fcd59c@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Marek,

On 16/10/17 13:35, Marek Vasut wrote:
>> The datasheets explicitly state that the stateless opcodes are supported
>> and that they "do not need to be set up in the addressing mode".
>>
>> The stateless mode is clearly more beneficial, because there are boot
>> ROM code versions not able to cope with the chip left in 4-byte state.
>>
>> Tested with Micron N25Q512A.
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> Can SFDP help here ?

it would be nice, but I've just checked
- JESD216
- "TN-25-06: Serial Flash Discovery Parameters for MT25Q Family"
- N25Q512A "Serial Flash Discovery Parameter Data Structure"

seems, such flag is not provided in the standard. There is a way
to figure out if the chip supports entering 4-bytes mode and what
is the command to enter such a mode, but nothing for the stateless commands.

I would be glad to be wrong in this particular case.

-- 
Best regards,
Alexander Sverdlin.
