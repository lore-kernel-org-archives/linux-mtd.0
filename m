Received: from oproxy5.bluehost.com ([2605:dc00:100:2::a5]
 helo=oproxy5-pub.bluehost.com)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RsHio-00026i-TP
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 17:42:24 +0000
Message-ID: <4F28359A.3010200@xenotime.net>
Date: Tue, 31 Jan 2012 10:40:26 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: nand: fix printk() warnings
References: <20120131085405.GD22039@elgon.mountain>
In-Reply-To: <20120131085405.GD22039@elgon.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, Mike Dunn <mikedunn@newsguy.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/31/2012 12:54 AM, Dan Carpenter wrote:
> Gcc complains here:
> drivers/mtd/nand/docg4.c: In function ‘probe_docg4’:
> drivers/mtd/nand/docg4.c:1277:4: warning: format ‘%x’ expects argument of type ‘unsigned int’, but argument 3 has type ‘resource_size_t’ [-Wformat]
> drivers/mtd/nand/docg4.c:1277:4: warning: format ‘%x’ expects argument of type ‘unsigned int’, but argument 4 has type ‘resource_size_t’ [-Wformat]
> 
> We have a standard way of printing these using a format string
> extension.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Yes, this is preferable over my patch yesterday.
Thanks.

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

> 
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index 3ec1d10..8a0d7f6 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -1272,9 +1272,7 @@ static int __init probe_docg4(struct platform_device *pdev)
>  
>  	virtadr = ioremap(r->start, resource_size(r));
>  	if (!virtadr) {
> -		dev_err(dev, "Diskonchip ioremap failed: "
> -			"0x%x bytes at 0x%x\n",
> -			resource_size(r), r->start);
> +		dev_err(dev, "Diskonchip ioremap failed: %pR\n", r);
>  		return -EIO;
>  	}
>  
> --


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
