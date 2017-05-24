Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDRaj-0004kE-Vy
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 08:24:27 +0000
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
 [209.85.161.174]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v4O8NcYe017828
 for <linux-mtd@lists.infradead.org>; Wed, 24 May 2017 17:23:39 +0900
Received: by mail-yw0-f174.google.com with SMTP id l14so85833091ywk.1
 for <linux-mtd@lists.infradead.org>; Wed, 24 May 2017 01:23:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170518090957.227954c1@bbrezillon>
References: <1492585618-13655-1-git-send-email-yamada.masahiro@socionext.com>
 <1492585618-13655-2-git-send-email-yamada.masahiro@socionext.com>
 <20170428183250.4c43e107@bbrezillon>
 <CAK7LNAQZyMoKJjzPjr12TE9s=G8GJbHGgfequtLE4h+meJT03w@mail.gmail.com>
 <20170515135433.2edda630@bbrezillon>
 <CAK7LNAQzPcM6T+3yG8=ezd0vRetW-vcibHWYSw5yJC5TorPKVQ@mail.gmail.com>
 <20170518090957.227954c1@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 24 May 2017 17:23:37 +0900
Message-ID: <CAK7LNAT=b+QyK8xBafd8DvHLtwTovzuj44hz=CThqDmO-Gb4aA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add generic helpers to check, match,
 maximize ECC settings
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

2017-05-18 16:09 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:

>>
>> One question about this part.
>>
>>
>>        /* If chip->ecc.size is already set, respect it. */
>>        if (chip->ecc.size && step_size != chip->ecc.size)
>>                continue;
>>
>> Does this make sense for nand_try_to_maximize_ecc()?
>>
>> (In other words, can nand-ecc-maximize stand together with nand-ecc-step-size?)
>
> It could make sense if one wants to maximize the strength for a
> specific step-size, but most of the time the user will let the driver
> choose the best step-size+strength pair.


OK.  I am keeping it here, but I do not have a strong opinion about this.
I will follow your decision.

Thanks.

-- 
Best Regards
Masahiro Yamada
