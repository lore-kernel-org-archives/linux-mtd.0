Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0n6r-0002WS-Cc
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 08:03:58 +0000
Message-ID: <548FE72D.5040803@huawei.com>
Date: Tue, 16 Dec 2014 16:02:53 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: add ubi_err() to report the failure of leb read
References: <548FE51D.60707@huawei.com>
In-Reply-To: <548FE51D.60707@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/16 15:54, hujianyang wrote:
> If an error occur while reading from PEBs, for example, an ECC error,
> ubi_io_read() will print some error messages. But it's not enough for
> debugging. These messages don't show the mapping info for a read from
> UBIFS layer.
> 
> Although UBIFS will soon print its error messages after catching the
> return value from UBI layer,  multi-path reading will confuse the
> relationship between LEBs and PEBs showed by these messages.
> 
> This patch adds an ubi_err() to report reading errors in the function
> ubi_eba_read_leb(). The mapping info of LEB and PEB is showed by
> this error message.
> 
> Signed-off-by: hujianyang <hujianyang@huawei.com>
> ---
>  drivers/mtd/ubi/eba.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index b698534..b4e69e1 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -477,6 +477,8 @@ out_free:
>  	ubi_free_vid_hdr(ubi, vid_hdr);
>  out_unlock:
>  	leb_read_unlock(ubi, vol_id, lnum);
> +	ubi_err(ubi, "err %d while reading %d bytes from offset %d of LEB %d:%d, PEB %d",
> +		err, len, offset, vol_id, lnum, pnum);
>  	return err;
>  }
> 

Hi,

I met a problem that I was failed to mount a UBIFS partition.

[   38.442770] UBI error: ubi_io_read: error -74 (ECC error) while reading 26624 bytes from PEB 54:104448, read 26624 bytes
[   38.852461] UBI error: ubi_io_read: error -74 (ECC error) while reading 77824 bytes from PEB 346:53248, read 77824 bytes
[   38.864142] UBIFS error (pid 1444): ubifs_recover_leb: corruption -3
[   38.870487] UBIFS error (pid 1444): ubifs_scanned_corruption: corruption at LEB 928:55280
[   38.878625] UBIFS error (pid 1444): ubifs_scanned_corruption: first 8192 bytes from LEB 928:55280
[   38.892117] UBIFS error (pid 1444): ubifs_recover_leb: LEB 928 scanning failed
mount: mounting ubi1:bak on /HFFS2: failed: Structure needs cleaning

I think it is caused by an ECC error of nand flash. Do we have some methods
to mount this partition? Data losing is acceptable.


Thanks,

Hu
