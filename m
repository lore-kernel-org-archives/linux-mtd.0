Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOBLu-0008E8-1s
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 21:08:26 +0000
Subject: Re: [PATCH v2 21/35] ubifs: disable quota in ubifs_put_super
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-22-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C66FB1.2050302@nod.at>
Date: Sat, 8 Aug 2015 23:08:01 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-22-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> We need to disable quota in umounting ubifs. So we have to
> disable quota in ubifs_put_super(). But quota disable will
> write quota file, and we have to budget for it.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 3609d7b..7031c16 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2027,6 +2027,8 @@ static void ubifs_put_super(struct super_block *sb)
>  
>  	ubifs_msg(c, "un-mount UBI device %d", c->vi.ubi_num);
>  
> +	if (!c->ro_mount)
> +		dquot_disable(sb, -1, DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED);

I fear this will explode in your face.
dquot_disable disables all inodes needed for quota support, once enabled
you have to shut down quota support.
IOW if someone remounts UBIFS read only or UBIFS does itself due to an error
you'll leak inodes.

Thanks,
//richard
