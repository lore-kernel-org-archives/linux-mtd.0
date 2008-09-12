Received: from smtp.argonst.com ([72.165.80.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeCEC-0002k1-QH
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 17:14:41 +0000
In-Reply-To: <15184.25981.qm@web63403.mail.re1.yahoo.com>
References: <15184.25981.qm@web63403.mail.re1.yahoo.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <1C07D857-28EB-4268-80D9-F5D628297623@argonst.com>
Content-Transfer-Encoding: 7bit
From: Allon Stern <allon.stern@argonst.com>
Subject: Re: Flash Mapping and gpio
Date: Fri, 12 Sep 2008 13:14:37 -0400
To: linux-mtd@lists.infradead.org
Cc: fundu_1999@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sep 12, 2008, at 12:54 PM, Fundu wrote:

> First off thanks Allon, I really appreciate your input.
>> static map_word __xipram custom_map_read(struct map_info
>> *map,
>> unsigned long ofs)
>> {
>>       CUSTOM_BANKSWITCH(ofs);
>>       return inline_map_read(map, ofs & BANK_MASK); //
>> mask out the bank
>> }
>>
> that makes sense. but one question don't you need to adjust the  
> offset before calling inline_map_read ? or does the macro do that  
> for you ?

That's what the BANK_MASK does. It contains the high address field  
which points to the chip, and the low address bits for the bank, but  
masks off the bits of offset that change. In this case, my chip is at  
0xA0000000, and the banks are 16MB, so my mask is 0xA0FFFFFF.

-
allon
