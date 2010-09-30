Subject: Re: pwrite() to nand in raw mode fails with EINVAL
From: David Woodhouse <dwmw2@infradead.org>
To: mbizon@freebox.fr
In-Reply-To: <1285699650.32420.70.camel@sakura.staff.proxad.net>
References: <1285699650.32420.70.camel@sakura.staff.proxad.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Sep 2010 11:48:25 +0900
Message-ID: <1285814905.31224.4.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-28 at 20:47 +0200, Maxime Bizon wrote:
> Since commit 782ce79a45b3b850b108896fcf7da26754061c8f ("cleanup the
> nand_do_write_ops"), a pwrite() to a NAND device fails with EINVAL.
> 
> The EINVAL comes from here:
> 
>         /* Don't allow multipage oob writes with offset */
>         if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
>                 return -EINVAL;
> 
> 
> ops->ooboffs seems uninitialized.
> 
> 
> I think the following memset() are missing: 

Alternatively, perhaps the sanity check should treat the ->oob{offs,len}
fields as undefined if ->oobbuf is NULL (which is set explicitly in the
two functions you patched). Otherwise, we've effectively changed the API
and we need to make more of an effort to audit *all* users.

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d551ddd..5d0dc74 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2200,7 +2200,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		memset(chip->oob_poi, 0xff, mtd->oobsize);
 
 	/* Don't allow multipage oob writes with offset */
-	if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
+	if (ops->oobbuf && ops->ooboffs &&
+	    (ops->ooboffs + ops->ooblen > oobmaxlen))
 		return -EINVAL;
 
 	while(1) {


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
