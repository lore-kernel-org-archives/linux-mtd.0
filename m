Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaXEB-0006BB-O0
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 17:00:36 +0000
Received: by fxm3 with SMTP id 3so2067663fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 10:00:34 -0700 (PDT)
Subject: Re: [PATCH 1/4] mtd: add new ioctl structures to be used for
	repartitioning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
References: <1276855711-18570-1-git-send-email-roman.tereshonkov@nokia.com>
	<1276855711-18570-2-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 20:00:31 +0300
Message-Id: <1279472431.16247.67.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CCing Arnd to review the ioctl interface.

One thing just struck me, see below.

On Fri, 2010-06-18 at 13:08 +0300, Roman Tereshonkov wrote:
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
>  include/mtd/mtd-abi.h |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index be51ae2..c2c6b41 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -88,6 +88,20 @@ struct otp_info {
>  	__u32 locked;
>  };
>  
> +#define MTD_MAX_PARTITION_NAME_LEN	64
> +struct mtd_partition_user {
> +	__u64 size;
> +	__u64 offset;
> +	__u32 mask_flags;
> +	char name[MTD_MAX_PARTITION_NAME_LEN];
> +	__u8 padding[128];	/* reserved for future, must be zero! */
> +};
> +
> +struct mtd_partitions {
> +	__u32 nparts;
> +	struct mtd_partition_user __user *parts;
> +};

Hmm, I think nowadays pointers should be passed as __u64 and
compat_ioctl() should be avoided.

Also please, document the ioctl a little - add some comments.

> +
>  #define MEMGETINFO		_IOR('M', 1, struct mtd_info_user)
>  #define MEMERASE		_IOW('M', 2, struct erase_info_user)
>  #define MEMWRITEOOB		_IOWR('M', 3, struct mtd_oob_buf)
> @@ -110,6 +124,7 @@ struct otp_info {
>  #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
>  #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
>  #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
> +#define MTDREPARTITION		_IOW('M', 23, struct mtd_partitions)
>  
>  /*
>   * Obsolete legacy interface. Keep it in order not to break userspace
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
