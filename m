Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QelIG-0000Vq-GE
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 09:54:49 +0000
Received: by pzk28 with SMTP id 28so793362pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 02:54:44 -0700 (PDT)
Subject: Re: [PATCH v2] UBIFS: fix master node recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Date: Thu, 07 Jul 2011 12:55:48 +0300
In-Reply-To: <1310032278-5102-1-git-send-email-agust@denx.de>
References: <1309944626-30195-1-git-send-email-agust@denx.de>
	<1310032278-5102-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310032552.3149.145.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-07 at 11:51 +0200, Anatolij Gustschin wrote:
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> index 783d8e0..9d7e387 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -274,7 +274,8 @@ int ubifs_recover_master_node(struct ubifs_info *c)
>  				if (cor1)
>  					goto out_err;
>  				mst = mst1;
> -			} else if (offs1 == 0 && offs2 + sz >= c->leb_size) {
> +			} else if (offs1 == 0 &&
> +				   (c->leb_size - offs2 - sz) < sz) {

Sorry for netpick, but I think you do not have to embrace the expression
into the brackets, and then may be it fits into one line? Anyway, I can
amend it myself, you do not have to send another patch, but you can if
you want.

-- 
Best Regards,
Artem Bityutskiy
