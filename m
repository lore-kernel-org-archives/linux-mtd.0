Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCNNi-0002et-LO
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 09:10:20 +0000
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
 [209.85.213.169]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id uB199c2d013143
 for <linux-mtd@lists.infradead.org>; Thu, 1 Dec 2016 18:09:39 +0900
Received: by mail-yb0-f169.google.com with SMTP id v132so24780768yba.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 01:09:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATS-Vd0BEWZEdp7skHrpngvyyLm6OFXJsRQ=87VMbUOAQ@mail.gmail.com>
References: <CAK7LNATS-Vd0BEWZEdp7skHrpngvyyLm6OFXJsRQ=87VMbUOAQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 1 Dec 2016 18:09:37 +0900
Message-ID: <CAK7LNAS7n3k=+MzQk-oQOP3VzE4Koj=PsreV=bf8EznNSFRUBA@mail.gmail.com>
Subject: Re: How read_oob() should work for HW_SYNDROME NAND controller?
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, masahiroy@kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


>>
>> And let's say the controller's ecc.size = 1024 and ecc.bytes == 14.
>> I am omitting BBM to make the situation simpler.
>
> Hm, actually the placement of the BBM is important. Do you know where
> it's placed in the page layout used by Denali.


BBM is placed at the beginning of the OOB area.
(so, factory BBMs are protected from the ECC correction engine.)


The more precise layout is as follows:

   |-----------|    |-----------|
   |           |    |           |
   | Payload0  |    |           |
   |           |    |           |
   | (ecc.size |    |           |
   |  1024B)   |    | Main Page |
   |           |    |   area    |
   |-----------|    |           |
   |  ECC0     |    |   2048B   |
   | (ecc.bytes|    |           |
   |   14B)    |    |           |
   |-----------|    |           |
   |           |    |           |
   | Payload1  |    |           |
   |           |    |           |
   | (ecc.size |    |           |
   |  1010B)   |    |           |
   |-----------|    |-----------|
   | BBM (8B)  |    |           |
   |-----------|    |           |
   | Payload1  |    |           |
   |   14B     |    |           |
   |-----------|    |           |
   |  ECC1     |    | OOB area  |
   | (ecc.bytes|    |           |
   |   14B)    |    |   64B     |
   |-----------|    |           |
   | OOB free  |    |           |
   |    28B    |    |           |
   |-----------|    |-----------|


The Playload1 is split by the BBM area.




>> The Denali IP also supports lowlevel
>> command-base interface to issue NAND_CMD_RNDOUT
>> and cherry-pick ECC sections.
>>
>> But, more simply, I can transfer the whole page + oob
>> into a temporary buffer, then only copy
>> ECC sections into oob_poi.
>
> It should be faster if you only retrieve ECC sections (less I/Os), but
> that's just optimization. Note that read_oob() is heavily used when
> scanning bad blocks, so it might make a huge boot-time difference in the
> end.


I think this comes down to

"PIO register access only for ECC sectors"
    vs
"DMA transfer for the whole page"

I will test which is better.


BTW, surprisingly enough, the Denali still sets
NAND_SKIP_BBTSCAN flag.



-- 
Best Regards
Masahiro Yamada
