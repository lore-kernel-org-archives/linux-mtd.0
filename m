Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5dSx-0007TV-GP
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 11:24:08 +0000
Received: by fg-out-1718.google.com with SMTP id 19so677710fgg.0
	for <linux-mtd@lists.infradead.org>;
	Sat, 24 Apr 2010 04:24:06 -0700 (PDT)
Subject: Re: [PATCH] mtd/ubi: recognize empty flash with errors as empty
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20100423172819.GA29224@Chamillionaire.breakpoint.cc>
References: <20100423172819.GA29224@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 24 Apr 2010 14:24:01 +0300
Message-Id: <1272108241.11751.1635.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-04-23 at 19:28 +0200, Sebastian Andrzej Siewior wrote:
> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Attaching empty nand with a block which contains a RS-Error which can't
> be fixed resulted in:
> 
> | UBI: attaching mtd9 to ubi0
> | UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
> | Call Trace:
> | [cfbd5c60] [c0008558] show_stack+0x48/0x19c (unreliable)
> | [cfbd5ca0] [c01a71e8] ubi_io_read+0x188/0x288
> | [cfbd5cf0] [c01a76e8] ubi_io_read_ec_hdr+0x74/0x2a4
> | [cfbd5d20] [c01abe9c] ubi_scan+0x178/0x10b4
> | [cfbd5d80] [c01a1464] ubi_attach_mtd_dev+0x67c/0xe44
> | [cfbd5e80] [c01a1fc8] ctrl_cdev_ioctl+0x178/0x210
> | [cfbd5ec0] [c008711c] do_ioctl+0x3c/0xc4
> | [cfbd5ee0] [c0087224] vfs_ioctl+0x80/0x448
> | [cfbd5f10] [c008762c] sys_ioctl+0x40/0x88
> | [cfbd5f40] [c000f960] ret_from_syscall+0x0/0x38
> | UBI error: ubi_read_volume_table: the layout volume was not found
> | UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
> 
> Assuming that blocks which can only be read with errors are empty will let
> the volume attach. Another access to the block in question resulted here
> in:
> 
> | UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
> | nand_erase: Failed erase, page 0x000751c0
> | nand_erase: Failed erase, page 0x000751c0
> | nand_erase: Failed erase, page 0x000751c0
> | nand_erase: Failed erase, page 0x000751c0
> | UBI error: do_sync_erase: cannot erase PEB 3399, error -5
> | UBI error: erase_worker: failed to erase PEB 3399, error -5
> | UBI: mark PEB 3399 as bad
> | UBI: 39 PEBs left in the reserve
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/mtd/ubi/scan.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
> index dc5f688..7529d46 100644
> --- a/drivers/mtd/ubi/scan.c
> +++ b/drivers/mtd/ubi/scan.c
> @@ -756,7 +756,8 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
>  		bitflips = 1;
>  	}
>  
> -	si->is_empty = 0;
> +	if (err != UBI_IO_BAD_EC_HDR)
> +		si->is_empty = 0;
>  
>  	if (!ec_corr) {
>  		int image_seq;
> @@ -827,6 +828,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
>  			return err;
>  		goto adjust_mean_ec;
>  	}
> +	si->is_empty = 0;
>  
>  	vol_id = be32_to_cpu(vidh->vol_id);
>  	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {

Thanks, pushed to ubi-2.6.git / master with the following minor tweak,
please check:

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 7529d46..48e570c 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -756,12 +756,12 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
                bitflips = 1;
        }
 
-       if (err != UBI_IO_BAD_EC_HDR)
-               si->is_empty = 0;
-
        if (!ec_corr) {
                int image_seq;
 
+               /* There is an EC header, so the flash is not empty */
+               si->is_empty = 0;
+
                /* Make sure UBI version is OK */
                if (ech->version != UBI_VERSION) {
                        ubi_err("this UBI version is %d, image version is %d",

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
