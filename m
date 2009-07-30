Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWXEQ-0003iy-SI
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 15:07:51 +0000
Received: by qyk11 with SMTP id 11so960300qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 08:07:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1248965243-861-1-git-send-email-sgayda2@uiuc.edu>
References: <1248965243-861-1-git-send-email-sgayda2@uiuc.edu>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 30 Jul 2009 20:37:26 +0530
Message-ID: <ce9ab5790907300807i955803evdf24c25e9808ac02@mail.gmail.com>
Subject: Re: [PATCH] [mtd] fixed faulty check
To: Stoyan Gaydarov <sgayda2@uiuc.edu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: bigeasy@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 8:17 PM, Stoyan Gaydarov<sgayda2@uiuc.edu> wrote:
> This patch fixes a spelling error that has resulted from copy and pasting=
. The location of the error was found using a semantic patch but the semant=
ic patch was not trying to find these errors. After looking things over it =
seemed logical that this change was needed.
>
> The patch also makes sure mtd_list is not being freed if it has not been =
allocated
>
> Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
> ---
> =A0drivers/mtd/maps/physmap_of.c | =A0 =A05 +++--
> =A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.=
c
> index 39d357b..96a1c50 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -215,8 +215,8 @@ static int __devinit of_flash_probe(struct of_device =
*dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_out;
>
> =A0 =A0 =A0 =A0mtd_list =3D kzalloc(sizeof(struct mtd_info) * count, GFP_=
KERNEL);
> - =A0 =A0 =A0 if (!info)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_out;
> + =A0 =A0 =A0 if (!mtd_list)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_out_no_free;

There are two more errors before this due to which you may jump to 'err_out=
'.

Correct goto labels for those also. And can please change the label
name, its confusing as of now. Perhaps to 'err_flash_remove'.

>
> =A0 =A0 =A0 =A0dev_set_drvdata(&dev->dev, info);
>
> @@ -338,6 +338,7 @@ static int __devinit of_flash_probe(struct of_device =
*dev,
>
> =A0err_out:
> =A0 =A0 =A0 =A0kfree(mtd_list);
> +err_out_no_free:
> =A0 =A0 =A0 =A0of_flash_remove(dev);
>
> =A0 =A0 =A0 =A0return err;
> --
> 1.6.3.3
>
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
