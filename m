Received: from mail-bn1on0112.outbound.protection.outlook.com
 ([157.56.110.112] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyGZt-0000I2-E4
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 10:00:02 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: partitions: kill unused ecclayout struct
Date: Mon, 16 Nov 2015 10:59:29 +0100
Message-ID: <5936561.ym9EsYrDYb@laclwks004>
In-Reply-To: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
References: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 11-November-2015 17:05:56 Brian Norris wrote:
> This field is not used.
> 
> Reported here:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2015-October/062417.html
> 
> Reported-by: Brian Foster <brian.foster@maximintegrated.com>
> Cc: Brian Foster <brian.foster@maximintegrated.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Depends on this for killing its last use:
> 
>   http://patchwork.ozlabs.org/patch/543159/

  Looks Ok to me.

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
