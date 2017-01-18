Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTscX-0003Qv-1G
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 15:57:58 +0000
Received: by mail-lf0-x241.google.com with SMTP id q89so2338279lfi.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 07:57:36 -0800 (PST)
Subject: Re: [PATCH 2/2] mtd: spi-nor: fix mr25h* definitions
To: Bastian Stender <bst@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
 <20170116151214.11195-2-bst@pengutronix.de>
 <371bf936-b854-68a1-2c65-69e426ad3aa3@gmail.com>
 <91baef8b-7831-9d16-d2ad-708ed297ad50@pengutronix.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b224aef1-e24a-9ccf-9c20-aea701d30606@gmail.com>
Date: Wed, 18 Jan 2017 16:57:33 +0100
MIME-Version: 1.0
In-Reply-To: <91baef8b-7831-9d16-d2ad-708ed297ad50@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/17/2017 03:51 PM, Bastian Stender wrote:
> Hi Marek,

Hi!

> On 01/16/2017 05:07 PM, Marek Vasut wrote:
>> On 01/16/2017 04:12 PM, Bastian Stender wrote:
>>> The previous definitions for mr25h* chips lead to unnecessary limits
>>> regarding writesize and eraseblocksize for MRAM. MRAM is random access
>>> memory rather than page, sector, or block organized memory.
>>>
>>> Instead of 1 sector with 512KB the mr25h40 MRAM chip should be defined
>>> as 512K sectors with 1 byte each. This makes it writesize and
>>> eraseblocksize aligned and reflects MRAM functionality properly.
>>
>> Wouldn't this degrade the performance ? ie. if you write the flash, it
>> will send PP opcode + 1 byte in a loop, right ?
> 
> I don't think so, info->sector_size and info->n_sectors are used for
> calculating mtd->size and setting mtd->erasesize only. mtd->erasesize
> should be never used when SPI_NOR_NO_ERASE is set in info->flags as
> Cyrille pointed out.

Hmmm, does that answer my second question ?

-- 
Best regards,
Marek Vasut
