Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCiwD-0007Tw-B8
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2012 03:20:58 +0000
Received: by lbbgf7 with SMTP id gf7so3129703lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2012 20:20:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1347378650-3522-1-git-send-email-mikedunn@newsguy.com>
References: <1347378650-3522-1-git-send-email-mikedunn@newsguy.com>
Date: Fri, 14 Sep 2012 20:20:55 -0700
Message-ID: <CAN8TOE9--TGMshgGuWvz=5=TuBDe=Qw-bDn0OfAs_OOujzsDjQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: docg4: ecc.read_page() returns 0 on
 uncorrectible errors
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 11, 2012 at 8:50 AM, Mike Dunn <mikedunn@newsguy.com> wrote:
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index 793921e..deb718c 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -776,6 +776,8 @@ static int read_page(struct mtd_info *mtd, struct nand_chip *nand,
>         }
>
>         writew(0, docptr + DOC_DATAEND);
> +       if (bits_corrected == -EBADMSG)   /* uncorrectible errors */

s/uncorrectible/uncorrectable/

> +               return 0;
>         return bits_corrected;
>  }
>

With that change:

Acked-by: Brian Norris <computersforpeace@gmail.com>

Also, not a blocker for this patch, but this made me look elsewhere in docg4.c:

static int __init read_factory_bbt(struct mtd_info *mtd)
{
...
        status = docg4_read_page(mtd, nand, buf, 0, DOCG4_FACTORY_BBT_PAGE);
        if (status)
                goto exit;

This could cause problems if there are ever bitflips on the BBT page.
Can the factory BBT contain bitflips?

Brian
