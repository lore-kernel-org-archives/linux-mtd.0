Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSh9a-00012N-JC
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 11:08:00 +0000
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
 [209.85.213.50]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id w5CB7QC8021290
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2018 20:07:27 +0900
Received: by mail-vk0-f50.google.com with SMTP id b77-v6so14110008vkb.5
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2018 04:07:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180612130329.1c17311f@bbrezillon>
References: <1528799515-1356-1-git-send-email-yamada.masahiro@socionext.com>
 <1528799515-1356-2-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNASM53scdd-OZOj_7404Eru3a98uNLagip_GdkrSSaG3-Q@mail.gmail.com>
 <20180612130329.1c17311f@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Jun 2018 20:06:45 +0900
Message-ID: <CAK7LNATr54Eo-0PcTSLZvgmdTTngpTYXte=__17X4xRtywAgEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: denali: add more clocks
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Richard Weinberger <richard@sigma-star.at>,
 DTML <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
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

2018-06-12 20:03 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> On Tue, 12 Jun 2018 19:36:06 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Maybe, the commit title should be:
>>
>> mtd: rawnand: denali: add more clocks and improve setup_data_interface
>
> Or you split that in 2 commits, one retrieving the new clks, and the
> other one fixing/improving ->setup_data_interface().


Good idea.

I will try that in v2.




-- 
Best Regards
Masahiro Yamada
