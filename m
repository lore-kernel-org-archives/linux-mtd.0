Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvQHC-0001bp-SH
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 08:54:35 +0000
Received: by gyh20 with SMTP id 20so4199903gyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 01:54:31 -0700 (PDT)
Subject: Re: [RFC 5/5] mtd: add MEMWRITEDATAOOB ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 22 Aug 2011 11:56:18 +0300
In-Reply-To: <1313625029-19546-6-git-send-email-computersforpeace@gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-6-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314003384.2644.85.camel@sauron>
Mime-Version: 1.0
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	b35362@freescale.com, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
> Implement a new ioctl for writing both page data and OOB to flash at the
> same time.  This is especially useful for MLC NAND, which cannot be
> written twice (i.e., we cannot successfully write the page data and OOB
> in two separate operations).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Looks good except few nit-picks.

> +			ops.mode = buf.mode;
> +			ops.len = (size_t)buf.len;
> +			ops.ooblen = (size_t)buf.ooblen;
> +			ops.ooboffs = 0;
> +
> +			ops.datbuf = memdup_user(
> +					(void __user *)(uintptr_t)buf.usr_ptr,
> +					ops.len + ops.ooblen);

I'd introduced a local variable for buf.usr_ptr and made the formatting
nicer.

> +			if (IS_ERR(ops.datbuf))
> +				return PTR_ERR(ops.datbuf);
> +
> +			ops.oobbuf = ops.datbuf + ops.len;
> +
> +			ret = mtd->write_oob(mtd, (loff_t)buf.start, &ops);
> +			kfree(ops.datbuf);
> +		}
> +		break;
> +	}
> +
>  	case MEMLOCK:
>  	{
>  		struct erase_info_user einfo;
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index f850d9a..20df299 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -59,6 +59,14 @@ typedef enum {
>  	MTD_OOB_RAW,
>  } mtd_oob_mode_t;
>  
> +struct mtd_data_oob_buf {
> +	__u64 start;
> +	__u32 len;
> +	__u32 ooblen;
> +	__u64 usr_ptr;
> +	mtd_oob_mode_t __user mode;
> +};

Let's add some reserved space for future improvements - I think it is
always a good idea to do for ioctls:

+ __u8 padding[8]

> +
>  #define MTD_ABSENT		0
>  #define MTD_RAM			1
>  #define MTD_ROM			2
> @@ -141,6 +149,7 @@ struct otp_info {
>  #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
>  #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
>  #define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
> +#define MEMWRITEDATAOOB		_IOWR('M', 24, struct mtd_data_oob_buf)

Would be greate to add a short comment about what this ioctl does. Of
course you can optionally do this for all of them, but at least for the
new one it does not hurt to have.

-- 
Best Regards,
Artem Bityutskiy
