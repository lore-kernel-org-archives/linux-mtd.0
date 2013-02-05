Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2gZJ-0000WZ-QD
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 11:20:08 +0000
Received: by mail-ie0-f176.google.com with SMTP id k13so19827iea.7
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2013 03:20:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1360013390-30179-1-git-send-email-alcooperx@gmail.com>
References: <1360013390-30179-1-git-send-email-alcooperx@gmail.com>
Date: Tue, 5 Feb 2013 08:20:03 -0300
Message-ID: <CALF0-+U3VbgxdS1-mtZ3e4pQM3dNabq_AS5WWZFEqr_0Eye5Tg@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd_torturetest can cause stack overflows
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Al Cooper <alcooperx@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 4, 2013 at 6:29 PM, Al Cooper <alcooperx@gmail.com> wrote:
> mtd_torturetest uses the module parm "ebcnt" to control the size of a
> stack based array of int's. When "ebcnt" is large, Ex: 1000, it
> causes stack overflows on systems with small kernel stacks. The fix
> is to move the array from the stack to kmalloc memory.
>
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  drivers/mtd/tests/mtd_torturetest.c |   10 +++++++++-
>  1 files changed, 9 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mtd_torturetest.c
> index c4cde1e..a777cc8 100644
> --- a/drivers/mtd/tests/mtd_torturetest.c
> +++ b/drivers/mtd/tests/mtd_torturetest.c
> @@ -208,7 +208,7 @@ static inline int write_pattern(int ebnum, void *buf)
>  static int __init tort_init(void)
>  {
>         int err = 0, i, infinite = !cycles_count;
> -       int bad_ebs[ebcnt];
> +       int *bad_ebs;
>
>         printk(KERN_INFO "\n");
>         printk(KERN_INFO "=================================================\n");
> @@ -273,6 +273,12 @@ static int __init tort_init(void)
>                 goto out_patt_FF;
>         }
>
> +       bad_ebs = kmalloc(sizeof(*bad_ebs) * ebcnt, GFP_KERNEL);
> +       if (!bad_ebs) {
> +               pr_err("error: cannot allocate memory\n");

You don't want to print this error. See:

http://www.spinics.net/lists/newbies/msg48792.html
http://archive.linuxvirtualserver.org/html/lvs-devel/2011-08/msg00001.html


-- 
    Ezequiel
