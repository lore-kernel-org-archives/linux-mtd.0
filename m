Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZbtU-0001xg-Dw
 for linux-mtd@lists.infradead.org; Wed, 19 Dec 2018 13:28:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id 101so9481167pld.6
 for <linux-mtd@lists.infradead.org>; Wed, 19 Dec 2018 05:28:01 -0800 (PST)
MIME-Version: 1.0
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Wed, 19 Dec 2018 14:27:51 +0100
Message-ID: <CAO1O6sd-JZBfGnAB7tOnsJeJSLXTguLHGdSEokOYq9n=bY5jPA@mail.gmail.com>
Subject: mtd: spinand: wait on erase success in spinand_markbad?
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I was just reading the spinand driver and found this piece of code:
static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
{
    struct spinand_device *spinand = nand_to_spinand(nand);
    struct nand_page_io_req req = {
        .pos = *pos,
        .ooboffs = 0,
        .ooblen = 2,
        .oobbuf.out = spinand->oobbuf,
    };
    int ret;

    /* Erase block before marking it bad. */
    ret = spinand_select_target(spinand, pos->target);
    if (ret)
        return ret;

    ret = spinand_write_enable_op(spinand);
    if (ret)
        return ret;

    spinand_erase_op(spinand, pos);

    memset(spinand->oobbuf, 0, 2);
    return spinand_write_page(spinand, &req);
}

Shouldn't there be spinand_wait call after spinand_erase_op and before
spinand_write_page?

/Emil
