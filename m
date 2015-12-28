Received: from conssluserg001.nifty.com ([202.248.44.39]
 helo=conssluserg001-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUzY-0007ZR-GH
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:25:29 +0000
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
 [209.85.160.179]) (authenticated)
 by conssluserg001-v.nifty.com with ESMTP id tBSAOuNE011423
 for <linux-mtd@lists.infradead.org>; Mon, 28 Dec 2015 19:24:57 +0900
Received: by mail-yk0-f179.google.com with SMTP id k129so77633297yke.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Dec 2015 02:24:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
Date: Mon, 28 Dec 2015 19:24:56 +0900
Message-ID: <CAK7LNATqLUZwzPSnPoh5m6Tkor+kV_Fo0G8a-Qafbucj4X0_tg@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] clk: a collection of various clean-ups and
 improvements
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I sent this series to linux-mtd by mistake.

This should have been sent to linux-clk, of course.

Sorry for noise.


2015-12-28 19:10 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Many refactoring, with detection of circular parent looping.
>
>
> Changes in v2:
>   - Fix a bug.  Return -EINVAL when parent _is_ NULL.
>
> Masahiro Yamada (16):
>   clk: remove unused first argument of __clk_init()
>   clk: change the argument of __clk_init() into pointer to clk_core
>   clk: rename __clk_init() into __clk_core_init()
>   clk: remove unnecessary !core->parents conditional
>   clk: change sizeof(struct clk *) to sizeof(*core->parents)
>   clk: move core->parents allocation to clk_register()
>   clk: simplify clk_core_get_parent_by_index()
>   clk: drop the initial core->parents look-ups from __clk_core_init()
>   clk: replace pr_warn() with pr_err() for fatal cases
>   clk: move checking .git_parent to __clk_core_init()
>   clk: simplify __clk_init_parent()
>   clk: avoid circular clock topology
>   clk: walk the orphan clock list more simply
>   clk: make sure parent is not NULL in clk_fetch_parent_index()
>   clk: simplify clk_fetch_parent_index() function
>   clk: slightly optimize clk_core_set_parent()





-- 
Best Regards
Masahiro Yamada
