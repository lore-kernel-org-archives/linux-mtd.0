Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LesQV-0004Qp-Dr
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 14:50:30 +0000
Message-ID: <49AE950C.60907@nokia.com>
Date: Wed, 04 Mar 2009 16:49:48 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Roel Kluin <roel.kluin@gmail.com>
Subject: Re: [PATCH] onenand: test before subtraction on unsigned
References: <49AE8BA0.7060903@gmail.com>
In-Reply-To: <49AE8BA0.7060903@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Roel Kluin wrote:
> len is unsigned so will wrap around when sizeof(struct otp_info) is greater than
> len.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index 529af27..7c2ebe9 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -2296,11 +2296,12 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
>  		if (!action) {	/* OTP Info functions */
>  			struct otp_info *otpinfo;
>  
> -			len -= sizeof(struct otp_info);
> -			if (len <= 0) {
> +			if (len <= sizeof(struct otp_info)) {
> +				len = 0;

len is not used anymore, so no need to set it to zero.

>  				ret = -ENOSPC;
>  				break;
>  			}
> +			len -= sizeof(struct otp_info);
>  
>  			otpinfo = (struct otp_info *) buf;
>  			otpinfo->start = from;

So is there somewhere that is passing a buffer too small for all the opt_info?
