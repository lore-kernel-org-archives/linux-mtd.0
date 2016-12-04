Received: from mail-wj0-x241.google.com ([2a00:1450:400c:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDYrW-0006Oa-DE
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2016 15:37:59 +0000
Received: by mail-wj0-x241.google.com with SMTP id j10so8597214wjb.3
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2016 07:37:37 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: ubi: fix improper return value
To: Pan Bian <bianpan201604@163.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
Cc: linux-kernel@vger.kernel.org, Pan Bian <bianpan2016@163.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c56efbcf-9398-0299-35d7-929f9a8c3dd6@gmail.com>
Date: Sun, 4 Dec 2016 13:48:59 +0100
MIME-Version: 1.0
In-Reply-To: <1480831930-5449-1-git-send-email-bianpan201604@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/04/2016 07:12 AM, Pan Bian wrote:
> From: Pan Bian <bianpan2016@163.com>
> 
> When __vmalloc() returns a NULL pointer, the region is not checked, and
> we cannot make sure that only 0xFF bytes are present at offset. Thus,
> returning 0 seems improper.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=189081
> 
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---
>  drivers/mtd/ubi/io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index b6fb8f9..b54fe05 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -1413,7 +1413,7 @@ int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
>  	buf = __vmalloc(len, GFP_NOFS, PAGE_KERNEL);
>  	if (!buf) {
>  		ubi_err(ubi, "cannot allocate memory to check for 0xFFs");
> -		return 0;
> +		return -ENOMEM;

I wonder if you shouldn't also nuke the ubi_err() , because when you run
out of memory, printk() will likely also fail.

>  	}
>  
>  	err = mtd_read(ubi->mtd, addr, len, &read, buf);
> 


-- 
Best regards,
Marek Vasut
