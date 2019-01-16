Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gja0C-0004I0-Mk
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2019 01:28:22 +0000
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x0G1Rlop004127
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2019 10:27:48 +0900
Received: by mail-vs1-f42.google.com with SMTP id h78so2913850vsi.6
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jan 2019 17:27:48 -0800 (PST)
MIME-Version: 1.0
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
 <20190115092229.59e09c2d@xps13>
In-Reply-To: <20190115092229.59e09c2d@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 16 Jan 2019 10:27:11 +0900
Message-ID: <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(+CC Dinh Nguyen)

On Tue, Jan 15, 2019 at 5:22 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Masahiro,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue, 15 Jan
> 2019 17:11:34 +0900:
>
> > Commit 6f1fe97bec34 ("mtd: rawnand: denali_dt: add more clocks based
> > on IP datasheet") introduced a more correct binding that requires
> > three named clocks.
> >
> > Now that all upstream DT files migrated over to it, remove the single
> > anonymous clock support.
>
> I would love to do that but I think this is against the "DT backward
> compatibility rule".

Yeah, I know this rule, but we break DT binding from time to time.



> Anyway, IIRC it is accepted that this kind of
> rule might be broken if decided per the arch-maintainer (in this
> case, you I suppose). So if this is really what you want, I'll queue
> it.

My platform is fine, but this driver is used by SOCFPGA boards as well.

I CCed the SOCFPGA maintainer, Dinh Nguyen.



-- 
Best Regards
Masahiro Yamada
