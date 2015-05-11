Received: from mail-wi0-f170.google.com ([209.85.212.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yrvy3-0002ya-ED
 for linux-mtd@lists.infradead.org; Mon, 11 May 2015 22:14:33 +0000
Received: by wiun10 with SMTP id n10so114956763wiu.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2015 15:14:07 -0700 (PDT)
Message-ID: <555128F0.30702@vanguardiasur.com.ar>
Date: Mon, 11 May 2015 19:10:56 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Antoine Tenart <antoine.tenart@free-electrons.com>,
 sebastian.hesselbarth@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v5 05/12] mtd: pxa3xx_nand: rework flash detection and
 timing setup
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
 <1431356341-31640-6-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1431356341-31640-6-git-send-email-antoine.tenart@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 05/11/2015 11:58 AM, Antoine Tenart wrote:
[..]
> -
> -	/* calculate flash information */
> -	host->read_id_bytes = (f->page_size == 2048) ? 4 : 2;
> -

[..]
> @@ -1732,6 +1669,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
>  		host->mtd = mtd;
>  		host->cs = cs;
>  		host->info_data = info;
> +		host->read_id_bytes = 4;

Are you sure this is correct? The value is set according to the page
size before this patch.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
