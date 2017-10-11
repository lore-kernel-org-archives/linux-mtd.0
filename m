Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2O9I-00041n-PH
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 21:02:43 +0000
Received: by mail-wm0-x235.google.com with SMTP id i124so8280512wmf.3
 for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2017 14:02:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171011032621.26979-6-nicolas.pitre@linaro.org>
References: <20171011032621.26979-1-nicolas.pitre@linaro.org>
 <20171011032621.26979-6-nicolas.pitre@linaro.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Oct 2017 23:02:13 +0200
Message-ID: <CAFLxGvyJn69iWUQiDdq=scghtmEKyYQt3JTGcCoDX32_au1dXw@mail.gmail.com>
Subject: Re: [PATCH 5/5] MTD: remove the get_unmapped_area method
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 11, 2017 at 5:26 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> It is now unused.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> ---
>  drivers/mtd/chips/map_ram.c  | 18 ------------------
>  drivers/mtd/chips/map_rom.c  | 16 ----------------
>  drivers/mtd/devices/mtdram.c | 14 --------------
>  drivers/mtd/mtdconcat.c      | 27 ---------------------------
>  drivers/mtd/mtdpart.c        | 14 --------------
>  include/linux/mtd/mtd.h      |  4 ----
>  6 files changed, 93 deletions(-)

Yay, less code. :-)

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
