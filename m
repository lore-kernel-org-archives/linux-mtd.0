Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBy5v-0005wq-7F
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 06:10:17 +0000
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
 [209.85.213.182]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id uAU69Urp026941
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 15:09:30 +0900
Received: by mail-yb0-f182.google.com with SMTP id d59so14362109ybi.1
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2016 22:09:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161127172456.5dba79f2@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-29-git-send-email-yamada.masahiro@socionext.com>
 <20161127172456.5dba79f2@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 Nov 2016 15:09:27 +0900
Message-ID: <CAK7LNAR_x0=jOWfkf=0X9f+OHnTSRDBiQZPG_FnFHEJda8fP_g@mail.gmail.com>
Subject: Re: [PATCH 28/39] mtd: nand: denali: move multi NAND fixup code to a
 helper function
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
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


2016-11-28 1:24 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Sun, 27 Nov 2016 03:06:14 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Collect multi NAND fixups into a helper function instead of
>> scattering them in denali_init().
>
> Can you tell me more about this multi-NAND feature?
> The core is already able to detect multi-die NAND chips in a generic
> way,

This is not the case.

> but I fear this is something else, like "put two 8-bits chips on a
> 16bits bus to emulate a single 16bits chip".

Yes, it is.

(I have never used this controller like that.
But, I am pretty sure it is
from the code and the
Denali's User Guide mentions such usage.)


Just in case, I will clearly rephrase the comment block like follows in v2:

        /*
         * Support for multi device:
         * When the IP configuration is x16 capable and two x8 chips are
         * connected in parallel, DEVICES_CONNECTED should be set to 2.
         * In this case, the core framework knows nothing about this fact,
         * so we should tell it the _logical_ pagesize and anything necessary.
         */




> If that's a case, and this feature is actually used, then it's a bad
> idea IMHO.
> For example, how do you handle the case where one block is bad on a
> chip but not on the other? And I fear this is not the only problem
> with this approach :-/.

As you expect, if one block is bad,
the correspond block on the other chip can not be used.



-- 
Best Regards
Masahiro Yamada
