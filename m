Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cy2do-0003qK-4C
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 20:43:58 +0000
Subject: Re: [PATCH v2 3/3] fs: ubifs: set s_uuid in super block
To: Oleksij Rempel <o.rempel@pengutronix.de>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
 <20170411095055.26328-4-o.rempel@pengutronix.de>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5d7d0f21-d87f-0835-c2f6-b6c9e07f73a8@nod.at>
Date: Tue, 11 Apr 2017 22:43:26 +0200
MIME-Version: 1.0
In-Reply-To: <20170411095055.26328-4-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oleksij,

Am 11.04.2017 um 11:50 schrieb Oleksij Rempel:
> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> This is need to provide uuid based integrity functionlity for:
> imy_policy (fsuuid option) and  evmctl (--uuid option).
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  fs/ubifs/super.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index bff1e8d6f7bd..a584b2f2b11d 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2077,6 +2077,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  		err = -ENOMEM;
>  		goto out_umount;
>  	}
> +	memcpy(&sb->s_uuid, &c->uuid, sizeof(c->uuid));

Makes sense.

Artem, do you remember why UBIFS didn't set s_uuid in first place?

Thanks,
//richard
