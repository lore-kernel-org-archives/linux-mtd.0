Received: from condef010-v.nifty.com ([210.131.4.247])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1amDzW-0008JG-Sc
 for linux-mtd@lists.infradead.org; Sat, 02 Apr 2016 05:20:59 +0000
Received: from conssluserg-02.nifty.com ([10.26.8.81])by condef010-v.nifty.com
 with ESMTP id u325I4JM007624
 for <linux-mtd@lists.infradead.org>; Sat, 2 Apr 2016 14:18:04 +0900
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
 [209.85.161.174]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id u325GAh9006791
 for <linux-mtd@lists.infradead.org>; Sat, 2 Apr 2016 14:16:11 +0900
Received: by mail-yw0-f174.google.com with SMTP id t10so9416505ywa.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 22:16:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1459218787-15197-1-git-send-email-yamada.masahiro@socionext.com>
References: <1459218787-15197-1-git-send-email-yamada.masahiro@socionext.com>
Date: Sat, 2 Apr 2016 14:16:10 +0900
Message-ID: <CAK7LNASWa-8Ag5azvQS+TT3nkXoeHFxmvJF0XDm4nTULb1vE+A@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: nand: denali: allow to override max_banks from DT
 property
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Graham Moore <grmoore@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2016-03-29 11:33 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
> changed in revision 5.1") supported the new encoding of the "n_banks"
> bits of the "features" register, but there is an unfortunate case
> not covered by that commit.
>
> Panasonic (its System LSI Business Division is now Socionext) bought
> a couple of versions of this IP.  The IP released for Panasonic
> around Feb. 2012 is revision 5 and uses the old encoding for n_banks
> (2 << n_banks).  While the one released around Nov. 2012 is also
> revision 5, but it uses the new encoding (1 << n_banks).
>
> The revision register cannot distinguish these two incompatible
> hardware.  I guess this IP series is not well-organized.  I could not
> find any solution but giving max_banks from DT property.
>
> This commit works around the problem by allowing DT to set the
> max_banks forcibly.  Of course, this DT property can be optional if
> the auto detection based on the hardware registers works well.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Rob Herring <robh@kernel.org>


Looks like we should take our time for discussion
to find out which is better, a new compatible string or a new DT property.

The discussion is happening in v1 thread.
http://patchwork.ozlabs.org/patch/601562/

Please hold back applying this patch.



-- 
Best Regards
Masahiro Yamada
