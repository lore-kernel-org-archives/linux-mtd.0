Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbQMQ-0001RX-O7
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 11:24:34 +0000
Subject: Re: [PATCH 22/24] ubifs: Convert to separately allocated bdi
To: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
References: <20170202173422.3240-1-jack@suse.cz>
 <20170202173422.3240-23-jack@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <d0d1d396-a340-866b-c931-974fa8ea53a1@nod.at>
Date: Wed, 8 Feb 2017 12:24:00 +0100
MIME-Version: 1.0
In-Reply-To: <20170202173422.3240-23-jack@suse.cz>
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

Am 02.02.2017 um 18:34 schrieb Jan Kara:
> Allocate struct backing_dev_info separately instead of embedding it
> inside the superblock. This unifies handling of bdi among users.
> 
> CC: Richard Weinberger <richard@nod.at>
> CC: Artem Bityutskiy <dedekind1@gmail.com>
> CC: Adrian Hunter <adrian.hunter@intel.com>
> CC: linux-mtd@lists.infradead.org
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/ubifs/super.c | 23 +++++++----------------
>  fs/ubifs/ubifs.h |  3 ---
>  2 files changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index e08aa04fc835..34810eb52b22 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1827,7 +1827,6 @@ static void ubifs_put_super(struct super_block *sb)
>  	}
>  
>  	ubifs_umount(c);
> -	bdi_destroy(&c->bdi);
>  	ubi_close_volume(c->ubi);
>  	mutex_unlock(&c->umount_mutex);
>  }
> @@ -2019,29 +2018,23 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto out;
>  	}
>  
> +	err = ubifs_parse_options(c, data, 0);
> +	if (err)
> +		goto out_close;
> +
>  	/*
>  	 * UBIFS provides 'backing_dev_info' in order to disable read-ahead. For
>  	 * UBIFS, I/O is not deferred, it is done immediately in readpage,
>  	 * which means the user would have to wait not just for their own I/O
>  	 * but the read-ahead I/O as well i.e. completely pointless.
>  	 *
> -	 * Read-ahead will be disabled because @c->bdi.ra_pages is 0.
> +	 * Read-ahead will be disabled because @sb->s_bdi->ra_pages is 0.
>  	 */
> -	c->bdi.name = "ubifs",
> -	c->bdi.capabilities = 0;

So ->capabilities is now zero by default since you use __GFP_ZERO in
bdi_alloc().
At least for UBIFS I'll add a comment on this, otherwise it is not so
clear that UBIFS wants a BDI with no capabilities and how it achieves that.

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
