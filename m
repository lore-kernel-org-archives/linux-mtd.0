Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTbmv-0007ue-Si
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 15:32:25 +0000
Received: by eyh6 with SMTP id 6so1683848eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 08:32:18 -0700 (PDT)
Subject: Re: [PATCH 1/1] MTD mtdchar: add missing initializer on raw write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Wippich <pewi@gw-instruments.de>, Ricard Wanderlof
	<ricard.wanderlof@axis.com>
In-Reply-To: <alpine.LSU.2.00.1106061541210.26001@redbean.intranet.gw-instruments.de>
References: <alpine.LSU.2.00.1106061541210.26001@redbean.intranet.gw-instruments.de>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 18:28:02 +0300
Message-ID: <1307374082.3112.78.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 15:50 +0200, Peter Wippich wrote:
> On writes in MODE_RAW the mtd_oob_ops struct is not sufficiently 
> initialized which may cause nandwrite to fail. With this patch
> it is possible to write raw nand/oob data without additional ECC
> (either for testing or when some sectors need different oob layout
> e.g. bootloader) like
> nandwrite  -n -r -o  /dev/mtd0 <myfile>
> 
> Signed-off-by: Peter Wippich <pewi@gw-instruments.de>

Looks good, thanks. We also need to add this patch to the stable tree.

Ricard, does it solve the issue you reported here

http://lists.infradead.org/pipermail/linux-mtd/2011-March/034516.html

?

> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 3f92731..797a34a 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -321,6 +321,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
>                          ops.datbuf = kbuf;
>                          ops.oobbuf = NULL;
>                          ops.len = len;
> +                       ops.ooboffs = 0;
> 
>                          ret = mtd->write_oob(mtd, *ppos, &ops);
>                          retlen = ops.retlen;
> 

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
