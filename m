Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ahkT3-0002Wo-Ft
 for linux-mtd@lists.infradead.org; Sun, 20 Mar 2016 21:00:57 +0000
Received: by mail-oi0-x22e.google.com with SMTP id d205so126181195oia.0
 for <linux-mtd@lists.infradead.org>; Sun, 20 Mar 2016 14:00:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7719f1b6c21ee5ad7a9ab033dcc4f5d1ca33384e.1456229475.git.joe@perches.com>
References: <7719f1b6c21ee5ad7a9ab033dcc4f5d1ca33384e.1456229475.git.joe@perches.com>
Date: Sun, 20 Mar 2016 22:00:36 +0100
Message-ID: <CAFLxGvxBV4PRQ46kvH4Z=WZMcSXem4qg2PXnS4PPNgFKOYJ-8w@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add logging functions for ubifs_msg,
 ubifs_err and ubifs_warn
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 23, 2016 at 1:13 PM, Joe Perches <joe@perches.com> wrote:
> The existing logging macros are fairly large and converting the
> macros to functions make the object code smaller.
>
> Use %pV and __builtin_return_address(0) as appropriate.
>
> $ size fs/ubifs/built-in.o*
>    text    data     bss     dec     hex filename
>  575831  309688  161312 1046831   ff92f fs/ubifs/built-in.o.allyesconfig.new
>  622457  312872  161120 1096449  10bb01 fs/ubifs/built-in.o.allyesconfig.old
>  223785     640     644  225069   36f2d fs/ubifs/built-in.o.defconfig.new
>  251873     640     644  253157   3dce5 fs/ubifs/built-in.o.defconfig.old
>
> Signed-off-by: Joe Perches <joe@perches.com>

Applied.

-- 
Thanks,
//richard
