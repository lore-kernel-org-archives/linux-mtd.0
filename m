Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elwRP-0002aT-FQ
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 12:45:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ubifs: Fix synced_i_size calculation for xattr inodes
Date: Wed, 14 Feb 2018 13:46:42 +0100
Message-ID: <3040988.j6LFxaOeXC@blindfold>
In-Reply-To: <20180214110248.26325-1-richard@nod.at>
References: <20180214110248.26325-1-richard@nod.at>
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

Am Mittwoch, 14. Februar 2018, 12:02:48 CET schrieb Richard Weinberger:
> In ubifs_jnl_update() we sync parent and child inodes to the flash,
> in case of xattrs, the parent inode (AKA host inode) has a non-zero
> data_len. Therefore we need to adjust synced_i_size too.
> 
> This issue was reported by ubifs self tests unter a xattr related work
> load.
> UBIFS error (ubi0:0 pid 1896): dbg_check_synced_i_size: ui_size is 4,
> synced_i_size is 0, but inode is clean UBIFS error (ubi0:0 pid 1896):
> dbg_check_synced_i_size: i_ino 65, i_mode 0x81a4, i_size 4
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/journal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 04c4ec6483e5..e3e1e093db81 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -664,6 +664,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct
> inode *dir, finish_reservation(c);
>  	spin_lock(&ui->ui_lock);
>  	ui->synced_i_size = ui->ui_size;
> +	if (xent)
> +		host_ui->synced_i_size = host_ui->ui_size;
>  	spin_unlock(&ui->ui_lock);

Reviewing my own patch on LKML helps a lot.
We need to take host_ui->ui_lock too...

Thanks,
//richard
