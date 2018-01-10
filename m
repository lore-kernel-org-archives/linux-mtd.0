Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZHWg-0003bW-CP
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 14:38:47 +0000
From: Richard Weinberger <richard@nod.at>
To: rockdotlee@gmail.com
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com, adrian.hunter@intel.com
Subject: Re: [PATCH] ubifs: Change log level in ubifs_xattr_get
Date: Wed, 10 Jan 2018 15:39:21 +0100
Message-ID: <3873582.N8pb6r5EOO@blindfold>
In-Reply-To: <1515578741-6612-1-git-send-email-rockdotlee@gmail.com>
References: <1515578741-6612-1-git-send-email-rockdotlee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rock Lee,

Am Mittwoch, 10. Januar 2018, 11:05:41 CET schrieb rockdotlee@gmail.com:
> From: Rock Lee <rockdotlee@gmail.com>
> 
> Just print warning message when xattr value size is bigger than the
> buffer size. There is a situation that other modules, like overlayfs,
> try to get xattr value with a small buffer, if they get -ERANGE, they
> will try again with the proper buffer size. No need to report a error
> message, warning message is enough.
> 
> Signed-off-by: Rock Lee <rockdotlee@gmail.com>
> ---
>  fs/ubifs/xattr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 5ddc89d..bc20530 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -381,7 +381,7 @@ ssize_t ubifs_xattr_get(struct inode *host, const char
> *name, void *buf, if (buf) {
>  		/* If @buf is %NULL we are supposed to return the length */
>  		if (ui->data_len > size) {
> -			ubifs_err(c, "buffer size %zd, xattr len %d",
> +			ubifs_warn(c, "buffer size %zd, xattr len %d",
>  				  size, ui->data_len);

Hmm, if this can be triggered that easy I suggest getting completely rid of 
this message.

Thanks,
//richard
