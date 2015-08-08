Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOBbp-0006Wo-3R
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 21:24:53 +0000
Subject: Re: [PATCH v2 24/35] ubifs: suspend & resume quota properly in
 ubifs_remount
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-25-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C6738E.4090206@nod.at>
Date: Sat, 8 Aug 2015 23:24:30 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-25-git-send-email-yangds.fnst@cn.fujitsu.com>
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
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 6ed35e2..06dd7af 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2128,11 +2128,13 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
>  		err = ubifs_remount_rw(c);
>  		if (err)
>  			return err;
> +		dquot_resume(sb, -1);
>  	} else if (!c->ro_mount && (*flags & MS_RDONLY)) {
>  		if (c->ro_error) {
>  			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
>  			return -EROFS;
>  		}
> +		dquot_suspend(sb, -1);

Is it really safe to ignore the return values of both function?

Beside of that,
Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
