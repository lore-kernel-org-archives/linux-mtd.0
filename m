Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOEKI-0000Zl-Sr
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2016 00:51:15 +0000
Message-ID: <56A8127E.1060808@cn.fujitsu.com>
Date: Wed, 27 Jan 2016 08:42:38 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [mtd-utils PATCH] Makefile: install: don't look for scripts in
 BUILDDIR
References: <1453844216-133634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1453844216-133634-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/27/2016 05:36 AM, Brian Norris wrote:
> Our ${SCRIPTS} (e.g., flash_eraseall) are not found in the build
> directory; they should be found in their original location.
>
> This fixes a typo in the Makefile refactoring, which caused 'make
> install' to fail with messages like:

Ooooops, yes, it's my typo. Sorry for that.

Reviewed-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Thanx
Yang
>
>    make: *** No rule to make target '[...my source-build directory...]/armv7a-cros-linux-gnueabi/misc-utils/flash_eraseall'. Stop.
>
> because the install target is looking in the wrong place for
> flash_eraseall.
>
> Fixes: 7d81790ced34 ("mtd-utils: Restructure the mtd-utils source.")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index bd9504ae72f0..977c9c5056ed 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -67,7 +67,7 @@ endif
>   	rm -f $(BUILDDIR)/include/version.h
>   	$(MAKE) -C $(TESTS) clean
>
> -install:: $(addprefix $(BUILDDIR)/,${BINS} ${SCRIPTS})
> +install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
>   	mkdir -p ${DESTDIR}/${SBINDIR}
>   	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
>   	mkdir -p ${DESTDIR}/${MANDIR}/man1
>
