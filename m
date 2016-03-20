Received: from mail-ob0-x241.google.com ([2607:f8b0:4003:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ahkTp-0004WQ-M1
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2016 21:01:46 +0000
Received: by mail-ob0-x241.google.com with SMTP id wz1so13249829obc.1
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2016 14:01:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ec7627e3d80e0ad99557d308b39744886b4b0f40.1456421022.git.joe@perches.com>
References: <56CF115C.6010001@nod.at>
 <ec7627e3d80e0ad99557d308b39744886b4b0f40.1456421022.git.joe@perches.com>
Date: Sun, 20 Mar 2016 22:01:24 +0100
Message-ID: <CAFLxGvyWj4aZ82C=9aVUUqpYwatdC35VH_nCqC2OwhsROfHw8Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: ubi: Add logging functions ubi_msg,
 ubi_warn and ubi_err
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 25, 2016 at 6:25 PM, Joe Perches <joe@perches.com> wrote:
> Using logging functions instead of macros can reduce overall object size.
>
> $ size drivers/mtd/ubi/built-in.o*
>    text    data     bss     dec     hex filename
>  271620  163364   73696  508680   7c308 drivers/mtd/ubi/built-in.o.allyesconfig.new
>  287638  165380   73504  526522   808ba drivers/mtd/ubi/built-in.o.allyesconfig.old
>   87728    3780     504   92012   1676c drivers/mtd/ubi/built-in.o.defconfig.new
>   97084    3780     504  101368   18bf8 drivers/mtd/ubi/built-in.o.defconfig.old
>
> Signed-off-by: Joe Perches <joe@perches.com>

Applied.

-- 
Thanks,
//richard
