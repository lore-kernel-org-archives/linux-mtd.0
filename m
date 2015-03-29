Received: from mail-yk0-x235.google.com ([2607:f8b0:4002:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcAk4-0007wO-8g
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 10:46:56 +0000
Received: by ykeg184 with SMTP id g184so2031356yke.2
 for <linux-mtd@lists.infradead.org>; Sun, 29 Mar 2015 03:46:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1416835236-25185-1-git-send-email-richard@nod.at>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
Date: Sun, 29 Mar 2015 12:46:34 +0200
Message-ID: <CAFLxGvwCPM7MNhAsVW+D29Kbs9MFkpPmpTsuv+9zhfCXvx7Uwg@mail.gmail.com>
Subject: Re: Fastmap update v2 (pile 1)
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 24, 2014 at 2:20 PM, Richard Weinberger <richard@nod.at> wrote:
> Artem,
>
> as requested I'm resending my fastmap work in smaller pieces.
> This is pile 1 of 7.
> Rebasing my patches to ubifs.git was a massive PITA because the
> logging style changes touched a lot of code and almost every patch
> failed to apply and needed inspection by hand.
> The first patches are bug fixes, the latter introduce cleanups
> and new features.
> After all bugfixes are mainline I'll make sure that all needed
> fixes go into -stable.
>
> [PATCH 1/6] UBI: Fastmap: Care about the protection queue
> [PATCH 2/6] UBI: Fastmap: Ensure that only one fastmap work is
> [PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done upon
> [PATCH 4/6] UBI: Fastmap: Fix races in ubi_wl_get_peb()
> [PATCH 5/6] UBI: Split __wl_get_peb()
> [PATCH 6/6] UBI: Fastmap: Make ubi_refill_pools() fair
>
> The whole series can be found at
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git fastmap_upgrade2

Pushed pile 1 to 7 into linux-ubifs.git/master.
Thanks everyone for the reviews and comments!

-- 
Thanks,
//richard
