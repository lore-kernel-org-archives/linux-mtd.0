Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfcCV-0008BU-8o
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 20:01:12 +0000
Date: Mon, 3 Dec 2012 21:01:08 +0100
From: Richard Weinberger <richard@nod.at>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: Kernel with MTD_UBI_FASTMAP=y, fm_autoconvert=0 fails to attach
 and resize UBI image
Message-ID: <20121203210108.48a5b769@spider.haslach.nod.at>
In-Reply-To: <1354543614.2437.59.camel@pizza.hi.pengutronix.de>
References: <1354543614.2437.59.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Philipp,

Am Mon, 03 Dec 2012 15:06:54 +0100
schrieb Philipp Zabel <p.zabel@pengutronix.de>:

> Hi,
> 
> on v3.7-rc7 with CONFIG_MTD_UBI_FASTMAP=y, I see the following error
> when trying to attach an UBI image without fastmap information that
> has to be resized because it is smaller than the mtd partition size:
> 
>     $ cat /sys/module/ubi/parameters/fm_autoconvert
>     N
> 
>     $ ubiattach -p /dev/mtd3
>     ubiattach: error!: cannot attach "/dev/mtd3"
>                error 28 (No space left on device)
> 
> If I either disable MTD_UBI_FASTMAP in the kernel config or enable the
> fm_autoconvert module parameter, attaching works just fine.
> 
> Without fm_autoconvert, ubi_resize_volume fails with -ENOSPC, caused
> by ubi_wl_get_peb due to pool->size == 0.
> It gets to this point on an otherwise empty flash because ubi_scan_all
> puts all PEBs into the erase list. erase_work doesn't seem to be
> scheduled before ubi_wl_init returns with ubi->free.rb_node == NULL
> and ubi->free_count == 0. Because of this, refill_wl_user_pool breaks
> out of its loop immediately and never increases the pool->size
> counter.
> 
> If I force synchronous erase in ubi_wl_init, the ubiattach succeeds
> the next time I try it as now all PEBs go in the free list:
> 
> @@ -1899,7 +1907,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct
> ubi_attach_info *ai) e->ec = aeb->ec;
>                 ubi_assert(!ubi_is_fm_block(ubi, e->pnum));
>                 ubi->lookuptbl[e->pnum] = e;
> -               if (schedule_erase(ubi, e, aeb->vol_id, aeb->lnum,
> 0)) {
> +               if (do_sync_erase(ubi, e, aeb->vol_id, aeb->lnum, 0))
> { kmem_cache_free(ubi_wl_entry_slab, e);
>                         goto out_free;
>                 }
> 

Thanks a lot for identifying this issue!
But I'm not sure whether do_sync_erase() is the perfect solution
for the issue. Tomorrow I'll try to reproduce it.

Thanks,
//richard
