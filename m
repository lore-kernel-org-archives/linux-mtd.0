Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEyMk-0006fK-Lc
 for linux-mtd@lists.infradead.org; Tue, 14 Jul 2015 11:27:15 +0000
Received: by obnw1 with SMTP id w1so3969336obn.3
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2015 04:26:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <899311436867317@web30h.yandex.ru>
References: <899311436867317@web30h.yandex.ru>
Date: Tue, 14 Jul 2015 13:26:52 +0200
Message-ID: <CAFLxGvxedXbf4+HdWrJk0LCpgR=cEbK_JWeesgQc9kzGe+4P9w@mail.gmail.com>
Subject: Re: Why UBIFS min I/O unit size must be power of 2?
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 14, 2015 at 11:48 AM, Konstantin Tokarev <annulen@yandex.ru> wrote:
> Hi all,
>
> I'd like to increase compression ratio of UBIFS image (at the cost of possibly
> slower writes). However, my LEB size is 129024, so the largest block size that
> I could use is 2048 (otherwise LEB won't be multiple of I/O unit size).
>
> So I wonder why UBIFS cannot use 129024 as I/O unit size and requires it to be
> power of 2? Is it possible to eleminate this limitation?

To my knowledge the property is defined by hardware limitations (i.e.
flash properties).

-- 
Thanks,
//richard
