Received: from [1.203.163.81] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2nKP-00077k-6T
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 01:00:24 +0000
Message-ID: <1537405196.10234.22.camel@mhfsdcap03>
Subject: Re: [PATCH] libmtd: don't print an error message for devices
 without ecc support
From: xiaolei li <xiaolei.li@mediatek.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, <Chris.Packham@alliedtelesis.co.nz>
Date: Thu, 20 Sep 2018 08:59:56 +0800
In-Reply-To: <20180919082936.4011-1-david.oberhollenzer@sigma-star.at>
References: <20180919082936.4011-1-david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Thanks.

Reviewed-by: Xiaolei Li <xiaolei.li@mediatek.com>

On Wed, 2018-09-19 at 10:29 +0200, David Oberhollenzer wrote:
> The libmtd library tries to obtain the available OOB size via the sysfs
> with a fallback to the ECCGETLAYOUT ioctl. For some devices (e.g. plat-ram),
> the fallback path is always taken and prints an error message to stderr
> since the ioctl fails.
> 
> This patch fixes the fallback path by suppressing the error message if
> errno is set to EOPNOTSUPP (i.e. the device simply doesn't support that).
> 
> Fixes: a10353584f93 ("libmtd: Add support to access OOB available size")
> Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> ---
>  lib/libmtd_legacy.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
> index 97fef04..2b7f65f 100644
> --- a/lib/libmtd_legacy.c
> +++ b/lib/libmtd_legacy.c
> @@ -235,6 +235,8 @@ int legacy_get_mtd_oobavail(const char *node)
>  
>  	ret = ioctl(fd, ECCGETLAYOUT, &usrlay);
>  	if (ret < 0) {
> +		if (errno == EOPNOTSUPP)
> +			goto out_close;
>  		sys_errmsg("ECCGETLAYOUT ioctl request failed");
>  		goto out_close;
>  	}
