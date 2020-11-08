Return-Path: <SRS0=+6Wf=EO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90920C388F9
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:44:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0904D206F4
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 14:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2Rkoqay";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjP5+Oiw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0904D206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0jPGYbUBTcVbRAq/bhQt+XfOibLusbmImAK01KNXKCk=; b=L2Rkoqay4UtSQZ9Pyt1xO7lg2
	q2iXY0PAKwPDq64rk9Qo4Wo7rkRq+gdDD2khwj2/8wBNVVVI5ef4dT6x+yS6Sf0nQR0lTmp4KAi6j
	HMO2CnoACfhA/SNgeToPifolZ9e4r633ddwwxV+UvO5tJmXA4Gd8rZhfqa+kv07DllK4OS5X5wZh4
	tVbCRDaK8PNIAsCUSoAHnQeQX/3HRNSPpYtEFKe/b5qt+Ul8S82Z8FK5xc90sLtauu6Ebb18H7F9y
	qtZx7zwEU5rlCk3UdJ5hLrpobgMccA2NAU2xRH1X0Wpahty/eBToaiJfGmRJIfllGa8ZfC5zkiVn3
	XHDa/hD0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbluz-0003Nf-0x; Sun, 08 Nov 2020 14:43:45 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbluv-0003NB-UB
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2020 14:43:43 +0000
Received: by mail-io1-xd42.google.com with SMTP id r12so7247139iot.4
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2020 06:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3uGYEJTOMgsF56siUNUkcpHFw8WkbPGQzGEhpBEWLE=;
 b=JjP5+OiwN25x2yNVrLyx0siBwn9ZOMs8uZWrXBubKAn0/bMakN8+6ERKuGz3zVsLus
 Jt+W5mUHupHGJU46YwSJjSdWRCDrVYrOKlG4yYdATbmYZxAtq1eNDhLt02wZgfzG6mWR
 uu/2d9fQcYNpAJXIaJkU1P3kyt84dQxdegetTFFpdtWIfham4lA5aF1dCvyi6dlZCaTp
 Bslab7sni7oi413OnvE/sSJI3xDmNl/cGl1DPqiUT5vGF9zyuN8z3gZQCAGrYlCdYoI1
 y3hF5PxJo80HDStV8B152EQfx8yyeLXibzqqpKT6Y6qFZmJSLjmzA2qmFINje6MlwJaM
 +8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3uGYEJTOMgsF56siUNUkcpHFw8WkbPGQzGEhpBEWLE=;
 b=bN1A1CwsGKQz/gVl8e8EKt+Xqd/Dbc21aMS5MtdWnjmThZD4iIWWVZiHjE8mvn7KLF
 vDemj3UBWXEmMmL2edBWsmYqO+zPeGqG3ojwy/GziNoIzIE8zntQ/L3EPQFdIPkRVeKZ
 VdYueuTURpPCkcNBbRKGicDEcwEwJTDkKqIyKQhBAALHFrf9y71PVT6xnaNB9OPYBLUl
 lFMFSnH5DTUpO3l4sJ9MH4N2tfpA0fDA46Dd6fh5FLtIqdAtno9++gmluKIEE/YRvZFu
 nANM1XEA/nJfSzNrCJGbpOed6fasGoMGAcAzoKiWH2llZZkSvFBzZz1Fik6D6iMaZCyL
 0iPg==
X-Gm-Message-State: AOAM532+z4LZolVCXG+AZcvpADcSChIrhk008mkfnf8wdqWQGEMhrmHi
 0Bl3fwCwECq0UPtKUSbh8p7WHpopazG23JfeBcc=
X-Google-Smtp-Source: ABdhPJwtv6KRSQrCgztmacXKwxoCTS1cjRUkWLgE+srVIf6/2C7j7oc1bRMyYg+WCt7lQnut8i+x0NASY12CgGTipS4=
X-Received: by 2002:a6b:4401:: with SMTP id r1mr7051505ioa.78.1604846620256;
 Sun, 08 Nov 2020 06:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-9-hch@lst.de>
In-Reply-To: <20201016132047.3068029-9-hch@lst.de>
From: =?UTF-8?B?5buW5aiB6ZuE?= <gmpy.liaowx@gmail.com>
Date: Sun, 8 Nov 2020 22:43:29 +0800
Message-ID: <CAL3PxMpk_HV40EozhWMDZgc85vvLvosJ-e9CKWyZ+tRBB27hDA@mail.gmail.com>
Subject: Re: [PATCH 8/9] pstore/blk: use the normal block device I/O path
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_094342_728317_DC97CF6A 
X-CRM114-Status: GOOD (  34.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>, linux-mtd@lists.infradead.org,
 Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 11:33 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Stop poking into block layer internals and just open the block device
> file an use kernel_read and kernel_write on it.  Note that this means
> the transformation from name_to_dev_t can't be used anymore, and proper
> block device file names must be used.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/pstore/blk.c            | 152 +++++++++++++------------------------
>  include/linux/pstore_blk.h |   2 +
>  init/main.c                |   4 +
>  3 files changed, 57 insertions(+), 101 deletions(-)
>
> diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
> index 0430b190a1df2a..bd4eadfc9bd795 100644
> --- a/fs/pstore/blk.c
> +++ b/fs/pstore/blk.c
> @@ -8,15 +8,13 @@
>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include "../../block/blk.h"
>  #include <linux/blkdev.h>
>  #include <linux/string.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/platform_device.h>
>  #include <linux/pstore_blk.h>
> +#include <linux/fs.h>
> +#include <linux/file.h>
> +#include <linux/init_syscalls.h>
>  #include <linux/mount.h>
> -#include <linux/uio.h>
>
>  static long kmsg_size = CONFIG_PSTORE_BLK_KMSG_SIZE;
>  module_param(kmsg_size, long, 0400);
> @@ -88,7 +86,6 @@ MODULE_PARM_DESC(blkdev, "block device for pstore storage");
>   * during the register/unregister functions.
>   */
>  static DEFINE_MUTEX(pstore_blk_lock);
> -static struct block_device *psblk_bdev;
>  static struct pstore_zone_info *pstore_zone_info;
>
>  #define check_size(name, alignsize) ({                         \
> @@ -185,70 +182,20 @@ void unregister_pstore_device(const struct pstore_zone_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(unregister_pstore_device);
>
> +static struct file *psblk_file;
> +
>  static ssize_t psblk_generic_blk_read(char *buf, size_t bytes, loff_t pos)
>  {
> -       struct block_device *bdev = psblk_bdev;
> -       struct file file;
> -       struct kiocb kiocb;
> -       struct iov_iter iter;
> -       struct kvec iov = {.iov_base = buf, .iov_len = bytes};
> -
> -       if (!bdev)
> -               return -ENODEV;
> -
> -       memset(&file, 0, sizeof(struct file));
> -       file.f_mapping = bdev->bd_inode->i_mapping;
> -       file.f_flags = O_DSYNC | __O_SYNC | O_NOATIME;
> -       file.f_inode = bdev->bd_inode;
> -       file_ra_state_init(&file.f_ra, file.f_mapping);
> -
> -       init_sync_kiocb(&kiocb, &file);
> -       kiocb.ki_pos = pos;
> -       iov_iter_kvec(&iter, READ, &iov, 1, bytes);
> -
> -       return generic_file_read_iter(&kiocb, &iter);
> +       return kernel_read(psblk_file, buf, bytes, &pos);
>  }
>
>  static ssize_t psblk_generic_blk_write(const char *buf, size_t bytes,
>                 loff_t pos)
>  {
> -       struct block_device *bdev = psblk_bdev;
> -       struct iov_iter iter;
> -       struct kiocb kiocb;
> -       struct file file;
> -       ssize_t ret;
> -       struct kvec iov = {.iov_base = (void *)buf, .iov_len = bytes};
> -
> -       if (!bdev)
> -               return -ENODEV;
> -
>         /* Console/Ftrace backend may handle buffer until flush dirty zones */
>         if (in_interrupt() || irqs_disabled())
>                 return -EBUSY;
> -
> -       memset(&file, 0, sizeof(struct file));
> -       file.f_mapping = bdev->bd_inode->i_mapping;
> -       file.f_flags = O_DSYNC | __O_SYNC | O_NOATIME;
> -       file.f_inode = bdev->bd_inode;
> -
> -       init_sync_kiocb(&kiocb, &file);
> -       kiocb.ki_pos = pos;
> -       iov_iter_kvec(&iter, WRITE, &iov, 1, bytes);
> -
> -       inode_lock(bdev->bd_inode);
> -       ret = generic_write_checks(&kiocb, &iter);
> -       if (ret > 0)
> -               ret = generic_perform_write(&file, &iter, pos);
> -       inode_unlock(bdev->bd_inode);
> -
> -       if (likely(ret > 0)) {
> -               const struct file_operations f_op = {.fsync = blkdev_fsync};
> -
> -               file.f_op = &f_op;
> -               kiocb.ki_pos += ret;
> -               ret = generic_write_sync(&kiocb, ret);
> -       }
> -       return ret;
> +       return kernel_write(psblk_file, buf, bytes, &pos);
>  }
>
>  static const struct pstore_zone_ops pstore_blk_zone_ops = {
> @@ -257,68 +204,71 @@ static const struct pstore_zone_ops pstore_blk_zone_ops = {
>         .write          = psblk_generic_blk_write,
>  };
>
> -static int __init pstore_blk_init(void)
> +static int __init __pstore_blk_init(const char *name)
>  {
> -       char bdev_name[BDEVNAME_SIZE];
> -       struct block_device *bdev;
> -       int ret = -ENODEV;
> -       fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
> -       sector_t nr_sects;
> -
> +       int ret = -EINVAL;
> +
>         if (!best_effort || !blkdev[0])
>                 return 0;
>
> -       /* hold bdev exclusively */
> -       bdev = blkdev_get_by_path(blkdev, mode, blkdev);
> -       if (IS_ERR(bdev)) {
> -               dev_t devt;
> -
> -               devt = name_to_dev_t(blkdev);
> -               if (devt == 0) {
> -                       pr_err("failed to open '%s'!\n", blkdev);
> -                       return -ENODEV;
> -               }
> -               bdev = blkdev_get_by_dev(devt, mode, blkdev);
> -               if (IS_ERR(bdev)) {
> -                       pr_err("failed to open '%s'!\n", blkdev);
> -                       return PTR_ERR(bdev);
> -               }
> +       psblk_file = filp_open(name, O_RDWR | O_DSYNC | O_NOATIME | O_EXCL, 0);
> +       if (IS_ERR(psblk_file)) {
> +               ret = PTR_ERR(psblk_file);
> +               pr_err("failed to open '%s': %d!\n", name, ret);
> +               goto out;
>         }
> -
> -       nr_sects = part_nr_sects_read(bdev->bd_part);
> -       if (!nr_sects) {
> -               pr_err("not enough space for '%s'\n", blkdev);
> -               ret = -ENOSPC;
> -               goto err_put_bdev;
> +       if (!S_ISBLK(file_inode(psblk_file)->i_mode)) {
> +               pr_err("'%s' is not block device!\n", blkdev);
> +               goto out_fput;
>         }
>
> -       /* psblk_bdev must be assigned before register to pstore/blk */
> -       psblk_bdev = bdev;
> -
>         ret = register_pstore_device(&pstore_blk_zone_ops,
> -                       nr_sects << SECTOR_SHIFT, 0);
> +                       file_inode(psblk_file)->i_bdev->bd_inode->i_size, 0);
>         if (ret)
> -               goto err_put_bdev;
> +               goto out_fput;
>
> -       bdevname(bdev, bdev_name);
> -       pr_info("attached %s (no dedicated panic_write!)\n", bdev_name);
> +       pr_info("using device '%s'\n", blkdev);
>         return 0;
> -
> -err_put_bdev:
> -       blkdev_put(bdev, FMODE_READ | FMODE_WRITE | FMODE_EXCL);
> -       psblk_bdev = NULL;
> +out_fput:
> +       fput(psblk_file);
> +out:
> +       psblk_file = NULL;
>         return ret;
>  }
> +
> +#ifdef MODULE
> +static int __init pstore_blk_init(void)
> +{
> +       return __pstore_blk_init(blkdev);
> +}
>  late_initcall(pstore_blk_init);
>
>  static void __exit pstore_blk_exit(void)
>  {
> -       if (!psblk_bdev)
> +       if (!psblk_file)
>                 return;
>         unregister_pstore_device(&pstore_blk_zone_ops);
> -       blkdev_put(psblk_bdev, FMODE_READ | FMODE_WRITE | FMODE_EXCL);
> +       fput(psblk_file);
>  }
>  module_exit(pstore_blk_exit);
> +#else /* MODULE */
> +/*
> + * During early boot the real root file system hasn't been mounted yet,
> + * and not device nodes are present yet.  Use the same scheme to find
> + * the device that we use for mounting the root file system.
> + */
> +void __init pstore_blk_early_init(void)
> +{
> +       const char devname[] = "/dev/pstore-blk";
> +       dev_t dev = name_to_dev_t(blkdev);
> +
> +       if (!dev)
> +               return;
> +       init_unlink(devname);
> +       init_mknod(devname, S_IFBLK | 0600, new_encode_dev(dev));
> +       __pstore_blk_init(devname);

How about pstore/blk making /dev/pstore-blk node no matter build-in
or module. Then pstore/blk always opens /dev/pstore-blk. By this way,
blkdev can also be a device number if pstore/blk built as a module.

> +}
> +#endif /* MODULE */
>
>  /* get information of pstore/blk */
>  int pstore_blk_get_config(struct pstore_blk_config *info)
> diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
> index 0abd412a6cb3e3..7c06b9d6740e2a 100644
> --- a/include/linux/pstore_blk.h
> +++ b/include/linux/pstore_blk.h
> @@ -39,4 +39,6 @@ struct pstore_blk_config {
>   */
>  int pstore_blk_get_config(struct pstore_blk_config *info);
>
> +void __init pstore_blk_early_init(void);
> +
>  #endif
> diff --git a/init/main.c b/init/main.c
> index 1af84337cb18d5..058cce64f70390 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -98,6 +98,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/kcsan.h>
>  #include <linux/init_syscalls.h>
> +#include <linux/pstore_blk.h>
>
>  #include <asm/io.h>
>  #include <asm/bugs.h>
> @@ -1524,6 +1525,9 @@ static noinline void __init kernel_init_freeable(void)
>                 prepare_namespace();
>         }
>
> +       if (IS_BUILTIN(CONFIG_PSTORE_BLK))
> +               pstore_blk_early_init();
> +
>         /*
>          * Ok, we have completed the initial bootup, and
>          * we're essentially up and running. Get rid of the
> --
> 2.28.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
