Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctnpD-0002o0-OB
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 04:06:13 +0000
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id v2V45KDZ005226
 for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2017 13:05:21 +0900
Received: by mail-yw0-f180.google.com with SMTP id i203so33406296ywc.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 21:05:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170330183805.1c29504f@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <20170330183805.1c29504f@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 31 Mar 2017 13:05:20 +0900
Message-ID: <CAK7LNATUyc821uQTECkkQj2SDKkbrioFfHVsttnsnc8QuT1P-A@mail.gmail.com>
Subject: Re: [PATCH v3 00/37] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
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


2017-03-31 1:38 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:

> The rest looks almost good, except for a few comments I had on patch
> 14, 18, 25, 26 and 32.
>
> I'll probably apply 33 and 34 soon.
>

Thank you!
Please note I left a minor comment on 34.
(Accidental addition of braces.)


-- 
Best Regards
Masahiro Yamada
