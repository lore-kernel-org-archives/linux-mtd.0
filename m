Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cid89-00021l-Cc
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 08:27:35 +0000
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
 [209.85.161.172]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v1S8QsTc007005
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 17:26:54 +0900
Received: by mail-yw0-f172.google.com with SMTP id v200so3305766ywc.3
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 00:26:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170228090216.79554017@bbrezillon>
References: <CAK7LNARAURP5-vbFZUUo1Wm9hudHw5DTuaQHz-TJGjdsXij38g@mail.gmail.com>
 <20170228090216.79554017@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 28 Feb 2017 17:26:53 +0900
Message-ID: <CAK7LNARBbFZgas8UTPbMzGZ3zd-tFCiPtPdRo3x6nXDmnkOyRQ@mail.gmail.com>
Subject: Re: [NAND Question] When oob_required is used?
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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


2017-02-28 17:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Tue, 28 Feb 2017 16:21:50 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi.
>>
>>
>> I am seeing the reference implementations for the callback
>> in drivers/mtd/nand/nand_base.c
>>
>>
>> I see only some of them use the argument "oob_required".
>>
>>
>> - oob_required is used
>> nand_read_page_raw()
>> nand_write_page_raw()
>> nand_write_subpage_hwecc()
>>
>>
>> - oob_required is ignored
>> nand_read_page_raw_syndrome()
>> nand_read_page_swecc()
>> nand_read_page_hwecc()
>> nand_read_page_hwecc_oob_first()
>> nand_read_page_syndrome()
>> nand_write_page_raw_syndrome()
>> nand_write_page_swecc()
>> nand_write_page_hwecc()
>> nand_write_page_syndrome()
>>
>>
>>
>> I could not get the logic
>> when "oob_required" is used.
>>
>>
>>
>> When implementing drivers, the "oob_required"
>> should be respected (i.e. oob_poi should be transferred as well),
>> or is it OK to ignore it?
>>
>>
>
> oob_required = true => you must retrieve OOB bytes
> oob_required = false => you can optimize the process and ignore OOB
> bytes, but you can also retrieve them if you don't care about
> optimization. That's usually what's done when you have to retrieve ECC
> bytes (retrieving a few extra OOB bytes is not expensive and usually
> simplifies the logic, especially when free and ECC bytes are
> interleaved in the OOB region).

Ah, I see.

The functions that ignore "oob_required"
always transfer the oob_poi.


Thanks!


-- 
Best Regards
Masahiro Yamada
