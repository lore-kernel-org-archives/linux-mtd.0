Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTiNK-0003OC-7p
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 01:15:42 +0000
Received: by mail-ob0-f177.google.com with SMTP id wm4so142739obc.22
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 18:15:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1381276748-5426-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1381276748-5426-1-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Tue, 8 Oct 2013 18:15:21 -0700
Message-ID: <CAN8TOE-9XRW9QJ7+sSis+Omo0eVAGVHOXD70P4L8FNbLut=9Dg@mail.gmail.com>
Subject: Re: [PATCH/TRIVIAL] mtd: Use MTD_BLOCK_MAJOR instead of the magic
 number
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: trivial@kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 8, 2013 at 4:59 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/mtdblock.c    | 2 +-
>  drivers/mtd/mtdblock_ro.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> index 2aef5dd..53884cc 100644
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -373,7 +373,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
>
>  static struct mtd_blktrans_ops mtdblock_tr = {
>         .name           = "mtdblock",
> -       .major          = 31,
> +       .major          = MTD_BLOCK_MAJOR,
>         .part_bits      = 0,
>         .blksize        = 512,
>         .open           = mtdblock_open,
> diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
> index 92759a9..70d27b4 100644
> --- a/drivers/mtd/mtdblock_ro.c
> +++ b/drivers/mtd/mtdblock_ro.c
> @@ -70,7 +70,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
>
>  static struct mtd_blktrans_ops mtdblock_tr = {
>         .name           = "mtdblock",
> -       .major          = 31,
> +       .major          = MTD_BLOCK_MAJOR,
>         .part_bits      = 0,
>         .blksize        = 512,
>         .readsect       = mtdblock_readsect,

Patch looks good. I'll probably apply soon. Although I might like to
see the following fixed along with it:

Why does MTD_BLOCK_MAJOR (and MTD_CHAR_MAJOR) live in
include/linux/mtd/mtd.h and not include/uapi/linux/major.h?

Brian
