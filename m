Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIhv-0000jI-Ev
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:58:12 +0000
Received: by mail-lb0-x241.google.com with SMTP id vk4so17562427lbb.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:57:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
Date: Mon, 14 Mar 2016 10:57:49 +0800
Message-ID: <CAAyFOR+=xRiL+uJXmsLxGuhayn15-gP1HGZ24SEMqQjTqZdAKA@mail.gmail.com>
Subject: Re: [PATCH 00/11] mtd: nand_bbt: introduce independent nand BBT
From: Peter Pan <peterpansjtu@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry I forgot to add subject prefix. Should I re-send it ?

On Mon, Mar 14, 2016 at 10:47 AM, Peter Pan <peterpansjtu@gmail.com> wrote:
> Sorry for send the v3 out late. I went through a busy time in the past
> two month.
>
> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
> onenand has own bbt(onenand_bbt.c).
>
> Separate struct nand_chip from BBT code can make current BBT shareable.
> We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
> Struct nand_bbt contains all the information BBT needed from outside and
> it should be embedded into NAND family chip struct (such as struct nand_chip).
>
> Below is mtd folder structure we want:
>         drivers/mtd/nand/<all-nand-core-code>
>         drivers/mtd/nand/raw/<raw-nand-controller-drivers>
>         drivers/mtd/nand/spi/<spi-nand-code>
>         drivers/mtd/nand/onenand/<onenand-code>
>         drivers/mtd/nand/chips/<manufacturer-spcific-code>
>
> Most of the patch is borrowed from Brian Norris <computersforpeace@gmail.com>.
> http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/nand-bbt
> I decided the authorship of each patch by contribution. Please let me know if
> there is something unproper.
> Based on Brian's suggestion and Boris's comments, I make 11 independent
> patches. Previous patch is http://patchwork.ozlabs.org/patch/492066/
> After discussion with Boris and Ezequiel, I realized above structure is better,
> so I drop the patch to move nand_bbt.c to mtd folder.
>
> The patch is tested on Zed board.
>
> v3 changes:
>         introduce struct nand_bbt_ops
>         introduce struct nand_chip_layout_info
>         add nand_bbt_create/destroy() API
>         use mtd_to_nand instead mtd->priv directly
>         remove mark_bad_bbm() due to no user yet
>         keep nand_bbt.c in mtd/nand folder
>         add nand_get_bbt() helper function
>         rebase patch series on 4.5.0-rc1
> v2 changes:
>         rebase patch series on master branch of l2-mtd.git
>
>
> Brian Norris (7):
>   mtd: nand_bbt: new header for nand family BBT
>   mtd: nand_bbt: introduce BBT related data structure
>   mtd: nand_bbt: use struct nand_bbt_ops in BBT
>   mtd: nand: make nand_erase_nand() static
>   mtd: nand_bbt: remove struct nand_chip from nand_bbt.c
>   mtd: nand_bbt: remove NAND_BBT_DYNAMICSTRUCT macro
>   mtd: nand: remove nand_chip.bbt
>
> Peter Pan (4):
>   mtd: nand_bbt: add new API definitions
>   mtd: nand_bbt: add nand_bbt_markbad_factory() interface
>   mtd: nand: use new BBT API instead of old ones
>   mtd: nand_bbt: remove old API definitions
>
>  drivers/mtd/nand/docg4.c     |   7 +-
>  drivers/mtd/nand/nand_base.c | 156 ++++++++++-
>  drivers/mtd/nand/nand_bbt.c  | 604 +++++++++++++++++++++----------------------
>  include/linux/mtd/bbm.h      |  96 +------
>  include/linux/mtd/nand.h     |  22 +-
>  include/linux/mtd/nand_bbt.h | 190 ++++++++++++++
>  6 files changed, 644 insertions(+), 431 deletions(-)
>  create mode 100644 include/linux/mtd/nand_bbt.h
>
> --
> 1.9.1
>
