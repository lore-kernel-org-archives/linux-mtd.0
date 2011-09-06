Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R0ni7-000295-TV
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2011 04:56:36 +0000
Received: by iacb35 with SMTP id b35so8517796iac.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Sep 2011 21:56:35 -0700 (PDT)
Subject: Re: [PATCH] document ubiblk's usage of the same ioctl magic as a
	part of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Tue, 06 Sep 2011 07:58:50 +0300
In-Reply-To: <1314202916-6982-1-git-send-email-david.wagner@free-electrons.com>
References: <1314202540-5562-1-git-send-email-david.wagner@free-electrons.com>
	<1314202916-6982-1-git-send-email-david.wagner@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315285135.19067.59.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-embedded <linux-embedded@vger.kernel.org>,
	Tim Bird <tim.bird@am.sony.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-24 at 18:21 +0200, David Wagner wrote:
> ---
>  include/mtd/ubi-user.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
> index 3c41097..7c8bfe3 100644
> --- a/include/mtd/ubi-user.h
> +++ b/include/mtd/ubi-user.h
> @@ -188,6 +188,7 @@
>  /* Set an UBI volume property */
>  #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
>  			       struct ubi_set_vol_prop_req)
> +/* If you add ioctls here, please note that ubiblk uses 'O'/0x10-0x11 */
>  
>  /* Maximum MTD device name length supported by UBI */
>  #define MAX_UBI_MTD_NAME_LEN 127

Let's postpone this patch and the user-space tool until ubiblk is ready
for inclusion. I sent you some comments - the main one is the block
device reference counting and making sure that the underlying UBI volume
does not disappear when you use it.

-- 
Best Regards,
Artem Bityutskiy
