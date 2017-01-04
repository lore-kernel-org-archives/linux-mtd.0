Received: from mail-he1eur01on070a.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::70a]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOhF3-000503-2n
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 08:48:18 +0000
Subject: Re: [PATCH, REGRESSION] ubifs: fix unencrypted journal write
To: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
References: <1483519109-26279-1-git-send-email-peda@axentia.se>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Gstir <david@sigma-star.at>,
 linux-mtd@lists.infradead.org
From: Peter Rosin <peda@axentia.se>
Message-ID: <3e773f3f-e0e8-a71d-0a73-7fa5f76beab3@axentia.se>
Date: Wed, 4 Jan 2017 09:47:43 +0100
MIME-Version: 1.0
In-Reply-To: <1483519109-26279-1-git-send-email-peda@axentia.se>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-01-04 09:38, Peter Rosin wrote:
> Without this, I get the following on reboot:
> 
> UBIFS error (ubi1:0 pid 703): ubifs_load_znode: bad target node (type 1) length (8240)
> UBIFS error (ubi1:0 pid 703): ubifs_load_znode: have to be in range of 48-4144
> UBIFS error (ubi1:0 pid 703): ubifs_load_znode: bad indexing node at LEB 13:11080, error 5
>  magic          0x6101831
>  crc            0xb1cb246f
>  node_type      9 (indexing node)
>  group_type     0 (no node group)
>  sqnum          546
>  len            128
>  child_cnt      5
>  level          0
>  Branches:
>  0: LEB 14:72088 len 161 key (133, inode)
>  1: LEB 14:81120 len 160 key (134, inode)
>  2: LEB 20:26624 len 8240 key (134, data, 0)
>  3: LEB 14:81280 len 160 key (135, inode)
>  4: LEB 20:34864 len 8240 key (135, data, 0)
> UBIFS warning (ubi1:0 pid 703): ubifs_ro_mode.part.0: switched to read-only mode, error -22
> CPU: 0 PID: 703 Comm: mount Not tainted 4.9.0-next-20161213+ #1197

To be clear, this log is from next-20161213 plus the ubifs patches that
appeared in next-20161214. The problem remains on v4.10-rc2

Cheers,
peda

> Hardware name: Atmel SAMA5
> [<c010d2ac>] (unwind_backtrace) from [<c010b250>] (show_stack+0x10/0x14)
> [<c010b250>] (show_stack) from [<c024df94>] (ubifs_jnl_update+0x2e8/0x614)
> [<c024df94>] (ubifs_jnl_update) from [<c0254bf8>] (ubifs_mkdir+0x160/0x204)
> [<c0254bf8>] (ubifs_mkdir) from [<c01a6030>] (vfs_mkdir+0xb0/0x104)
> [<c01a6030>] (vfs_mkdir) from [<c0286070>] (ovl_create_real+0x118/0x248)
> [<c0286070>] (ovl_create_real) from [<c0283ed4>] (ovl_fill_super+0x994/0xaf4)
> [<c0283ed4>] (ovl_fill_super) from [<c019c394>] (mount_nodev+0x44/0x9c)
> [<c019c394>] (mount_nodev) from [<c019c4ac>] (mount_fs+0x14/0xa4)
> [<c019c4ac>] (mount_fs) from [<c01b5338>] (vfs_kern_mount+0x4c/0xd4)
> [<c01b5338>] (vfs_kern_mount) from [<c01b6b80>] (do_mount+0x154/0xac8)
> [<c01b6b80>] (do_mount) from [<c01b782c>] (SyS_mount+0x74/0x9c)
> [<c01b782c>] (SyS_mount) from [<c0107f80>] (ret_fast_syscall+0x0/0x3c)
> UBIFS error (ubi1:0 pid 703): ubifs_mkdir: cannot create directory, error -22
> overlayfs: failed to create directory /mnt/ovl/work/work (errno: 22); mounting read-only
> 
> Fixes: 7799953b34d1 ("ubifs: Implement encrypt/decrypt for all IO")
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  fs/ubifs/journal.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index a459211a1c21..a7932dcb2fc7 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -744,6 +744,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
>  
>  	} else {
>  		data->compr_size = 0;
> +		out_len = compr_len;
>  	}
>  
>  	dlen = UBIFS_DATA_NODE_SZ + out_len;
> 
