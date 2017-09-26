Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwl5Q-0000nd-5y
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 08:19:26 +0000
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id v8Q8IUh0007579
 for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2017 17:18:31 +0900
Received: by mail-yw0-f176.google.com with SMTP id u205so6530875ywa.5
 for <linux-mtd@lists.infradead.org>; Tue, 26 Sep 2017 01:18:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170926084356.553867a1@bbrezillon>
References: <1506397164-3648-1-git-send-email-yamada.masahiro@socionext.com>
 <20170926084356.553867a1@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 26 Sep 2017 17:17:49 +0900
Message-ID: <CAK7LNASpP9qQABLqXPqz8bQNsMjuxb8GKHU4Xxy_dAhgzT2O2A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: wait for tWHR after NAND_CMD_STATUS /
 NAND_CMD_READID
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-09-26 15:43 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Tue, 26 Sep 2017 12:39:24 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Read Status and Read ID require tWHR before reading the first data.
>> Insert a very short wait to make sure to meet the spec.
>>
>> I have not seen any problem report for now, but nand_command() and
>> nand_command_lP() are generic hooks, so it makes sense to implement
>> fail-safe code here.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>


OK, will do.



BTW, I see unconditional wait for tWB a few lines below,
but it gives no performance regression because we will wait
much longer in nand_wait_ready().


     /*
      * Apply this short delay always to ensure that we do wait tWB in
      * any case on any machine.
      */
     ndelay(100);

     nand_wait_ready(mtd);




-- 
Best Regards
Masahiro Yamada
