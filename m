Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1BHG-0000lC-JO
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 05:01:55 +0000
Received: by bwz19 with SMTP id 19so1514423bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 22:01:51 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd-utils: new memory wrappers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Sep 2010 07:59:45 +0300
Message-ID: <1285822785.11684.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-29 at 19:30 -0400, Mike Frysinger wrote:
> The mkfs.jffs2 program has local wrappers for memory related functions
> that are useful beyond mkfs.jffs2, so break them out into a common header.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  include/common.h |    8 +++++
>  include/xalloc.h |   80 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  mkfs.jffs2.c     |   41 ---------------------------
>  3 files changed, 88 insertions(+), 41 deletions(-)
>  create mode 100644 include/xalloc.h
> 
> diff --git a/include/common.h b/include/common.h
> index 472315e..6e27d62 100644
> --- a/include/common.h
> +++ b/include/common.h
> @@ -58,6 +58,9 @@ extern "C" {
>  	fprintf(stderr, "%s: error!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
>  	-1;                                                                 \
>  })
> +#define errmsg_and_die(fmt, ...) do {                                       \
> +	exit(errmsg(fmt, ##__VA_ARGS__));                                   \
> +} while(0)
>  
>  /* System error messages */
>  #define sys_errmsg(fmt, ...)  ({                                            \
> @@ -69,6 +72,9 @@ extern "C" {
>  	fprintf(stderr, "error %d (%s)\n", _err, strerror(_err));           \
>  	-1;                                                                 \
>  })
> +#define sys_errmsg_and_die(fmt, ...) do {                                   \
> +	exit(sys_errmsg(fmt, ##__VA_ARGS__));                               \
> +} while(0)

Often these funcs are used with longish strings, so it is better to try
keeping the function names short. Thus, I suggest you to use
'err_msg_die()' etc. IOW, without the '_and' part.

If you are OK with this, I can just tweak your patch. But you can also
re-send it - whatever you prefer.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
