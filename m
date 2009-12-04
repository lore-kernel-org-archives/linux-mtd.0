Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NGTjp-0001np-3y
	for linux-mtd@lists.infradead.org; Fri, 04 Dec 2009 08:42:09 +0000
Subject: Re: [RFC] [PATCH] [MTD-UTILS]: flash_lock: fix length being passed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
References: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Dec 2009 10:41:45 +0200
Message-Id: <1259916105.8673.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-02 at 19:58 +0530, Vimal Singh wrote:
> This patch fixes the 'length' calculation.
> Making it:
> +       mtdLockInfo.length = (num_sectors - 1) * mtdInfo.erasesize;
> Rather:
> -       mtdLockInfo.length = num_sectors * mtdInfo.erasesize;
> 
> Say there are 240 blocks present in the device. Then:
> offset starts from: 0x0
> and full size of device: 0x1E00000
> 
> doing: 240 * 0x20000 gives -> 0x1E00000
> But last block address should be 0x1DE0000 (which spans for 0x20000
> bytes, adding upto size of 0x1E00000)
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
> 
> --- flash_lock.c.org	2009-11-24 19:33:18.000000000 +0530
> +++ flash_lock.c	2009-11-24 19:33:13.000000000 +0530
> @@ -71,7 +71,7 @@ int main(int argc, char *argv[])
>  	}
> 
>  	mtdLockInfo.start = ofs;
> -	mtdLockInfo.length = num_sectors * mtdInfo.erasesize;
> +	mtdLockInfo.length = (num_sectors - 1) * mtdInfo.erasesize;
>  	if(ioctl(fd, MEMLOCK, &mtdLockInfo))
>  	{
>  		fprintf(stderr, "Could not lock MTD device: %s\n", argv[1]);
> @@ -81,4 +81,3 @@ int main(int argc, char *argv[])

So if num_sectors is 1, mtdLockInfo.length is 0 - is it expected?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
