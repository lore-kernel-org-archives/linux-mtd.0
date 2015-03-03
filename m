Received: from mail-qc0-x22d.google.com ([2607:f8b0:400d:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSdsY-0003cO-8t
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 03:52:18 +0000
Received: by qcxm20 with SMTP id m20so28423884qcx.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2015 19:51:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
References: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
Date: Mon, 2 Mar 2015 19:51:55 -0800
Message-ID: <CAAK6Zt0hgGseAKDeo8KKZ-LFhdBRz-mLoqCgL4v897NmCY=nvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtdpart: Allow adding a partition of a partition
From: Daniel Ehrenberg <dehrenberg@google.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 richard.weinberger@gmail.com, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Cc: Nam Nguyen <namnguyen@chromium.org>, Grant Grundler <grundler@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>,
 Dan Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Would you recommend any further changes to this patchset?

Thanks,
Dan

On Tue, Feb 10, 2015 at 2:58 PM, Dan Ehrenberg <dehrenberg@chromium.org> wrote:
> MTD allows dynamic partitioning by the BLKPG ioctl.
> The current code restricts partition dynamic addition to work only on
> the master MTD device. This doesn't make a lot of sense, and is
> impossible to meet if the device is already partitioned (since the
> master MTD device is not visible). This commit removes the restriction.
>
> Signed-off-by: Dan Ehrenberg <dehrenberg@chromium.org>
> ---
>  drivers/mtd/mtdchar.c | 4 ----
>  drivers/mtd/mtdpart.c | 6 ++++++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 5356395..30215c7 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -545,10 +545,6 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
>         switch (a.op) {
>         case BLKPG_ADD_PARTITION:
>
> -               /* Only master mtd device must be used to add partitions */
> -               if (mtd_is_partition(mtd))
> -                       return -EINVAL;
> -
>                 /* Sanitize user input */
>                 p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
>
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index a3e3a7d..7c6f526 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -566,6 +566,12 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
>         if (length <= 0)
>                 return -EINVAL;
>
> +       if (mtd_is_partition(master)) {
> +               struct mtd_part *master_partition = PART(master);
> +               offset += master_partition->offset;
> +               master = master_partition->master;
> +       }
> +
>         part.name = name;
>         part.size = length;
>         part.offset = offset;
> --
> 2.2.0.rc0.207.ga3a616c
>
