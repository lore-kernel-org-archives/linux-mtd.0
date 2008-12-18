Received: from an-out-0708.google.com ([209.85.132.241])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDPRG-0008Sj-UG
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 20:25:43 +0000
Received: by an-out-0708.google.com with SMTP id d40so206958and.27
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 12:25:42 -0800 (PST)
Message-ID: <8bd0f97a0812181225y56b8c0d9n8b5493e33287e5c6@mail.gmail.com>
Date: Thu, 18 Dec 2008 15:25:41 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Sidney Amani" <amani_s@epitech.net>
Subject: Re: [PATCH 2/2] Makefile export libraries headers
In-Reply-To: <52e42efe0812180616u59242b0eucccaccdd5e276f22@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0812180616u59242b0eucccaccdd5e276f22@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2008 at 09:16, Sidney Amani wrote:
> >From 9d61143fdeb85b0239bd8e755114c50a45a151ef Mon Sep 17 00:00:00 2001
> From: Sidney Amani <amani_s@epitech.net>
> Date: Wed, 17 Dec 2008 12:50:54 +0100
> Subject: [PATCH] Makefile export libraries headers
>
> Export headers, if we want to use the previoulsy exported
> shared libraries we will need them.
>
> Signed-off-by: Sidney Amani <amani_s@epitech.net>
> Signed-off-by: Corentin Chary <chary_c@epitech.net>
> ---
>  ubi-utils/new-utils/Makefile |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/ubi-utils/new-utils/Makefile b/ubi-utils/new-utils/Makefile
> index a975a99..560e391 100644
> --- a/ubi-utils/new-utils/Makefile
> +++ b/ubi-utils/new-utils/Makefile
> @@ -6,7 +6,7 @@ KERNELHDR := ../../include
>  DESTDIR := /usr/local
>  SBINDIR=/usr/sbin
>  MANDIR=/usr/man
> -INCLUDEDIR=/usr/include
> +INCLUDEDIR=/include
>  LIBDIR=/lib
>
>  CC := $(CROSS)gcc
> @@ -74,6 +74,9 @@ clean:
>  install: ${UTILS}
>        mkdir -p ${DESTDIR}/${SBINDIR}
>        install -m 0755 ${UTILS} ${DESTDIR}/${SBINDIR}/
> +       for i in $(addsuffix .h, $(LIBS)); do \
> +               [ -f include/$$i ] &&  install -m 0755 include/$$i  ${DESTDIR}/${LIBDIR}/; \
> +       done

you're installing headers into /usr/lib/ ?  that doesnt make any sense ...
-mike
