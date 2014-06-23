Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz2tl-00052F-LB
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 11:58:58 +0000
Message-ID: <53A81663.9080305@nod.at>
Date: Mon, 23 Jun 2014 13:58:27 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hs@denx.de
Subject: Re: UBI: fix rb_tree node comparison in add_map commit buggy?
References: <53A7EF04.7040805@denx.de> <53A809A3.30703@denx.de>
In-Reply-To: <53A809A3.30703@denx.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 23.06.2014 13:04, schrieb Heiko Schocher:
> Hello all,
> 
> I just ported the linux v3.14 MTD/UBI/UBIFS sources to U-Boot to
> get in U-Boot also UBI fastmap support. This works now nice in
> U-Boot with linux v3.14 kernels :-)
> 
> Now just booted a linux v3.16-rc1 kernel and I could not mount the
> ubifs based rootfs anymore (using UBI Fastmap support active and
> burned the ubi rootfs image in U-Boot) ...
> 
> I found this patch in the linux tree:
> 
> commit 604b592e6fd3c98f21435e1181ba7723ffc24715
> Author: Mike Snitzer <snitzer@redhat.com>
> Date:   Fri Mar 21 15:54:03 2014 -0400
> 
>         UBI: fix rb_tree node comparison in add_map
> 
>         The comparisons used in add_vol() shouldn't be identical.  Pretty sure
>         the following is correct but it is completely untested.
> 
>         Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>         Acked-by: Richard Weinberger <richard@nod.at>
>         Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Reverted it in the linux tree, and my rootfs boots again ...
> (This patch is not yet in the u-boot sources, as they based on v3.14)
> 
> So, this change seems at least to break backwardcompatibility... (I
> must admit, I am not a ubi nor ubi fastmap expert ...)
> 
> I tried this patch also in the U-Boot code, without getting a ubifs
> rootfs (burned with u-boot into the ubi volume) bootable in linux ...
> which worked before... maybe v3.14 and v3.16-rc1 are not compatible?
> Do anybody know from such problems?

No. If there is a problem it needs fixing. :)

> If I revert commit 604b592e6fd3c98f21435e1181ba7723ffc24715 in
> Linux v3.16-rc1 only (so I have the same code in U-Boot at this
> place), I can boot Linux with the ubifs based rootfs, and after
> a reboot the U-Boot ubi attach time is short ... all works fine,
> as I can see it ...

So, Linux can no longer attach UBI Fastmap images which are older than 3.16-rc1?
How odd. :(

Attaching newer ones works?

> If I make in U-Boot and Linux in following patch [1]:
> $ git diff
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index b04e7d0..72f39da 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -125,7 +125,7 @@ static struct ubi_ainf_volume *add_vol(struct ubi_attach_info *ai, int vol_id,
>                 parent = *p;
>                 av = rb_entry(parent, struct ubi_ainf_volume, rb);
> 
> -               if (vol_id < av->vol_id)
> +               if (vol_id > av->vol_id)
>                         p = &(*p)->rb_left;
>                 else
>                         p = &(*p)->rb_right;
> $
> 
> I can boot the ubifs based rootfs (burned with U-Boot), and after reboot
> to U-Boot U-Boot ubi attach works again fine.
> 
> As in process_pool_aeb() looks:
> [...]
>                if (be32_to_cpu(new_vh->vol_id) > tmp_av->vol_id)
>                         p = &(*p)->rb_left;
>                 else if (be32_to_cpu(new_vh->vol_id) < tmp_av->vol_id)
>                         p = &(*p)->rb_right;
> 
> so, I think the old code:
> 
>                 if (vol_id > av->vol_id)
>                         p = &(*p)->rb_left;
>                 else if (vol_id > av->vol_id)
>                         p = &(*p)->rb_right;
> 
> is an copy&paste error ... and I think the right fix should
> be[1] ...

Forgot to attach it?

Thanks,
//richard
