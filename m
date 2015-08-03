Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMMoS-0000u8-PL
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:58:25 +0000
Subject: Re: [PATCH v2 15/35] ubifs: fill sb->s_cdev in ubifs_fill_super()
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-16-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFD5D9.30001@nod.at>
Date: Mon, 3 Aug 2015 22:58:01 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-16-git-send-email-yangds.fnst@cn.fujitsu.com>
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
> We need to fill the sb->s_cdev to tell others, this sb
> is for which ubi_volume. quotactl will use this connection
> to find the super_block by the device.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/super.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index eb04e42..27e1739 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2032,6 +2032,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto out_bdi;
>  
>  	sb->s_bdi = &c->bdi;
> +	sb->s_cdev = ubi_get_volume_cdev(c->ubi);
>  	sb->s_fs_info = c;
>  	sb->s_magic = UBIFS_SUPER_MAGIC;
>  	sb->s_blocksize = UBIFS_BLOCK_SIZE;
> 

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
