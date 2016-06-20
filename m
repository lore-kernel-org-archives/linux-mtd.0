Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bExhd-0006kD-SQ
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 11:49:18 +0000
Date: Mon, 20 Jun 2016 13:48:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Iwo Mergler <iwo.mergler@netcommwireless.com>
Cc: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nandbiterrs: Support for NAND biterrors test on
 platforms without raw write
Message-ID: <20160620134855.3c431d01@bbrezillon>
In-Reply-To: <5732D741.5090406@netcommwireless.com>
References: <572BDE8C.3020703@netcommwireless.com>
 <20160508184451.3d90176a@bbrezillon>
 <57300D8A.8040607@netcommwireless.com>
 <20160510104851.53dc8211@bbrezillon>
 <5732D741.5090406@netcommwireless.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 May 2016 16:54:57 +1000
Iwo Mergler <iwo.mergler@netcommwireless.com> wrote:

> Support for NAND biterrors test on platforms without raw write
> 
> While the default test mode relies on raw write (mtd_write_oob) to introduce
> bit errors into a page, the rewrite test mode doesn't need it.
> 
> Changed the overwrite test to use normal writes. The default test mode
> is unaffected and still requires raw write as before.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
> ---
>   drivers/mtd/tests/nandbiterrs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/tests/nandbiterrs.c 
> b/drivers/mtd/tests/nandbiterrs.c
> index 09a4cca..f26dec8 100644
> --- a/drivers/mtd/tests/nandbiterrs.c
> +++ b/drivers/mtd/tests/nandbiterrs.c
> @@ -290,7 +290,7 @@ static int overwrite_test(void)
> 
>       while (opno < max_overwrite) {
> 
> -        err = rewrite_page(0);
> +        err = write_page(0);
>           if (err)
>               break;
> 
