Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cq057-00023b-90
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 16:22:55 +0000
Subject: Re: [PATCH] ubi: fastmap: fix slab corruption
To: Rabin Vincent <rabin.vincent@axis.com>, dedekind1@gmail.com
References: <1490023026-6327-1-git-send-email-rabin.vincent@axis.com>
Cc: linux-mtd@lists.infradead.org, Rabin Vincent <rabinv@axis.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <3aa6a9f4-97a2-9fc9-9080-6a86ff51bcd8@nod.at>
Date: Mon, 20 Mar 2017 17:22:24 +0100
MIME-Version: 1.0
In-Reply-To: <1490023026-6327-1-git-send-email-rabin.vincent@axis.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rabin,

Am 20.03.2017 um 16:17 schrieb Rabin Vincent:
> From: Rabin Vincent <rabinv@axis.com>
> 
> Booting with UBI fastmap and SLUB debugging enabled results in the
> following splats.  The problem is that ubi_scan_fastmap() moves the
> fastmap blocks from the scan_ai (allocated in scan_fast()) to the ai
> allocated in ubi_attach().  This results in two problems:
> 
>  - When the scan_ai is freed, aebs which were allocated from its slab
>    cache are still in use.
> 
>  - When the other ai is being destroyed in destroy_ai(), the
>    arguments to kmem_cache_free() call are incorrect since aebs on its
>    ->fastmap list were allocated with a slab cache from a differnt ai.
> 
> Fix this by making a copy of the aebs in ubi_scan_fastmap() instead of
> moving them.

Is this new in 4.9? I'm a bit confused because I fixed such SLUB related
issues some time ago already in Fastmap.

Thanks,
//richard
