Subject: Re: [PATCH] mtd: onenand: fix parameter list build warning
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Adrian Bunk <bunk@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Adrian Bunk <bunk@debian.org>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <03e45afe-c4f8-e69b-9cba-6a8863296ad4@infradead.org>
 <20180904233449.32e41787@xps13>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <561f2078-92e8-290f-626c-ff936b7285c1@infradead.org>
Date: Tue, 4 Sep 2018 14:49:00 -0700
MIME-Version: 1.0
In-Reply-To: <20180904233449.32e41787@xps13>
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

On 09/04/2018 02:34 PM, Miquel Raynal wrote:
> Hi Randy,
> 
> Randy Dunlap <rdunlap@infradead.org> wrote on Mon, 3 Sep 2018 12:32:04
> -0700:
> 
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Fix build warning in <linux/mtd/onenand.h> by adding a "stub" struct
>> for mtd_oob_ops:
>>
>> include/linux/mtd/onenand.h: warning: 'struct mtd_oob_ops' declared inside parameter list [enabled by default]
>> include/linux/mtd/onenand.h: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
>>
>> Fixes: 607d1cb10426 ("[MTD] [OneNAND] proper onenand_bbt_read_oob() prototype")
>>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
>> Cc: Marek Vasut <marek.vasut@gmail.com>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Adrian Bunk <bunk@kernel.org>
>> Cc: Adrian Bunk <bunk@debian.org>
>> ---
>>  include/linux/mtd/onenand.h |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- lnx-419-rc2.orig/include/linux/mtd/onenand.h
>> +++ lnx-419-rc2/include/linux/mtd/onenand.h
>> @@ -221,6 +221,7 @@ struct onenand_manufacturers {
>>          char *name;
>>  };
>>  
>> +struct mtd_oob_ops;
>>  int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
>>  			 struct mtd_oob_ops *ops);
>>  unsigned onenand_block(struct onenand_chip *this, loff_t addr);
> 
> That's indeed a working solution, but there are a lot of other
> structures in this file that come (like mtd_oob_ops) from
> linux/mtd/mtd.h so I wonder if it would not make more sense to include
> this header here?
> 
> Thanks,
> Miquèl


Hi,
Have you see this from Linus?

https://lore.kernel.org/lkml/CA+55aFzMBptQt-QHMR0MM9MA3=1rxcf8ca5qHxrf4Mm0ZobE_A@mail.gmail.com/


thanks,
-- 
~Randy
