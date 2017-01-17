Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTV7H-0004EU-F3
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 14:52:09 +0000
Subject: Re: [PATCH 2/2] mtd: spi-nor: fix mr25h* definitions
To: Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
 <20170116151214.11195-2-bst@pengutronix.de>
 <371bf936-b854-68a1-2c65-69e426ad3aa3@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
From: Bastian Stender <bst@pengutronix.de>
Message-ID: <91baef8b-7831-9d16-d2ad-708ed297ad50@pengutronix.de>
Date: Tue, 17 Jan 2017 15:51:43 +0100
MIME-Version: 1.0
In-Reply-To: <371bf936-b854-68a1-2c65-69e426ad3aa3@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On 01/16/2017 05:07 PM, Marek Vasut wrote:
> On 01/16/2017 04:12 PM, Bastian Stender wrote:
>> The previous definitions for mr25h* chips lead to unnecessary limits
>> regarding writesize and eraseblocksize for MRAM. MRAM is random access
>> memory rather than page, sector, or block organized memory.
>>
>> Instead of 1 sector with 512KB the mr25h40 MRAM chip should be defined
>> as 512K sectors with 1 byte each. This makes it writesize and
>> eraseblocksize aligned and reflects MRAM functionality properly.
>
> Wouldn't this degrade the performance ? ie. if you write the flash, it
> will send PP opcode + 1 byte in a loop, right ?

I don't think so, info->sector_size and info->n_sectors are used for 
calculating mtd->size and setting mtd->erasesize only. mtd->erasesize 
should be never used when SPI_NOR_NO_ERASE is set in info->flags as 
Cyrille pointed out.

Regards,
Bastian

-- 
Pengutronix e.K.
Industrial Linux Solutions
http://www.pengutronix.de/
Peiner Str. 6-8, 31137 Hildesheim, Germany
Amtsgericht Hildesheim, HRA 2686
