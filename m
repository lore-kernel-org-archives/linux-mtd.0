Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhJSE-0005rV-1M
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 09:10:54 +0000
Subject: Re: [PATCH] mtd: misplaced parenthesis in find_boot_record()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4B79C444.8090402@gmail.com>
References: <4B79C344.60908@gmail.com>  <4B79C444.8090402@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 11:09:29 +0200
Message-ID: <1266311369.11659.201.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-15 at 23:01 +0100, Roel Kluin wrote:
> The parenthesis was misplaced
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> Not sure if you care about this one, it is between #if 0 ... #endif 
> 
> diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
> index 8b22b18..1ae6a02 100644
> --- a/drivers/mtd/nftlmount.c
> +++ b/drivers/mtd/nftlmount.c
> @@ -109,7 +109,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
>  
>  		/* Finally reread to check ECC */
>  		if ((ret = mtd->read(mtd, block * nftl->EraseSize, SECTORSIZE,
> -				     &retlen, buf) < 0)) {
> +				     &retlen, buf)) < 0) {
>  			printk(KERN_NOTICE "ANAND header found at 0x%x in mtd%d, but ECC read failed (err %d)\n",
>  			       block * nftl->EraseSize, nftl->mbd.mtd->index, ret);
>  			continue;

Pushed both patches to my l2-mtd-2.6.git / master.
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
