Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyz13-0008Ob-4u
 for linux-mtd@lists.infradead.org; Mon, 02 Oct 2017 11:36:07 +0000
Received: by mail-wm0-x233.google.com with SMTP id e195so6197580wma.5
 for <linux-mtd@lists.infradead.org>; Mon, 02 Oct 2017 04:35:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <740e523e-2373-0e8c-6480-ecd68fff6ef3@aimvalley.nl>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
 <740e523e-2373-0e8c-6480-ecd68fff6ef3@aimvalley.nl>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 2 Oct 2017 13:35:41 +0200
Message-ID: <CAFLxGvwwjFwn1hyme=jgkUQsBJcyK0gXqSNdoXa9WbCB0U4NBQ@mail.gmail.com>
Subject: Re: ubifs robustness with early power cut warning
To: Kees Trommel <ctrommel@aimvalley.nl>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kees,

On Mon, Oct 2, 2017 at 10:06 AM, Kees Trommel <ctrommel@aimvalley.nl> wrote:
> Doug,
>
> Attached a patch file with an implementation that I developed for our custom
> board that has an early powerdown (is dying) signal (GPIO pin).
>
> The idea is that when an "I am dying" condition is detected no erase or
> program is started by the mtd layer. It is assumed that an erase or program
> started before the board starts to die will be completed successfully.

Out of curiosity, did you also try to freeze or schedule the calling task?

Maybe we should add something like that to MTD as generic interface.
I saw such hacks in all variants in vendor/customer kernels.

-- 
Thanks,
//richard
