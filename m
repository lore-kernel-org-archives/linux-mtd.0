Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOBVA-000476-0N
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 21:18:01 +0000
Subject: Re: [PATCH v2 22/35] ubifs: write quota back in ubifs_sync
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-23-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C671F5.9040400@nod.at>
Date: Sat, 8 Aug 2015 23:17:41 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-23-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> Call dquot_writeback_dquots to write quota back in ubifs_sync
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 7031c16..9fdfd69 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -490,6 +490,8 @@ static int ubifs_sync_fs(struct super_block *sb, int wait)
>  	if (!wait)
>  		return 0;
>  
> +	dquot_writeback_dquots(sb, -1);
> +

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
