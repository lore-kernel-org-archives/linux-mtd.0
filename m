Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga41I-0001JQ-5U
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 19:30:10 +0000
From: Richard Weinberger <richard@nod.at>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: hung task detected in ubifs
Date: Thu, 20 Dec 2018 20:29:53 +0100
Message-ID: <2900296.1h8GnzAD1c@blindfold>
In-Reply-To: <CABatt_ygjLLSUWkt5X5W2P3dL2E8zm-71OHaTyKya2Vgj9iwNg@mail.gmail.com>
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
 <1722601.NPUxFaVKW8@blindfold>
 <CABatt_ygjLLSUWkt5X5W2P3dL2E8zm-71OHaTyKya2Vgj9iwNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 20. Dezember 2018, 18:03:46 CET schrieb Martin Townsend:
> I'm starting to think that MTD/UBI is a victim here.  I tried to
> reproduce what the client was seeing with no luck then on one boot I
> triggered a lockup really early in the boot:

Yes, this can be.
Maybe your CMA setup is odd or some other bug triggers.
Are other parts heavily using CMA? (hint: GPU stuff).
Maybe a different cma= setting helps.
See:
Documentation/admin-guide/kernel-parameters.txt

> Showing all locks held in the system:
> 5 locks held by systemd/1:
>  #0:  (&mm->mmap_sem){......}, at: [<80113ef0>] do_page_fault+0xb8/0x350
>  #1:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438
>  #2:  (of_dma_lock){......}, at: [<804ab890>]
> of_dma_request_slave_channel+0x140/0x228
>  #3:  (dma_list_mutex){......}, at: [<804a9d3c>] __dma_request_channel+0x24/0x8c
>  #4:  (cma_mutex){......}, at: [<80246814>] cma_alloc+0xc8/0x29c
> 2 locks held by khungtaskd/14:
>  #0:  (rcu_read_lock){......}, at: [<801b7920>] watchdog+0xdc/0x4b0
>  #1:  (tasklist_lock){......}, at: [<80162208>] debug_show_all_locks+0x38/0x1ac
> 
> This does point to some lockup in the CMA allocator when migrating
> pages for a contiguous allocation.  Out of interest do you know why
> do_DataAbort ends up calling filemap_fault and hence ending up in the
> ubifs layer?

Well, if you open and mmap a file, access to the memory will trigger a page
fault. This page fault is resolved by reading the pages from disk into memory.

Thanks,
//richard
