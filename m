Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZvys-0003nv-9h
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 10:55:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id v13so1237485wrw.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2018 02:54:55 -0800 (PST)
MIME-Version: 1.0
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
In-Reply-To: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 20 Dec 2018 11:54:42 +0100
Message-ID: <CAFLxGvzaZythh+u93Tq4Eqrdr7gN4v6sdoy3WP67qpBfpoxOmw@mail.gmail.com>
Subject: Re: hung task detected in ubifs
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 20, 2018 at 10:49 AM Martin Townsend
<mtownsend1973@gmail.com> wrote:
> 5 locks held by programmingapp/930:>  #0:  (&mm->mmap_sem){......}, at: [<80113ef0>] do_page_fault+0xb8/0x350
>  #1:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438
>  #2:  (of_dma_lock){......}, at: [<804ab890>]
> of_dma_request_slave_channel+0x140/0x228
>  #3:  (dma_list_mutex){......}, at: [<804a9d3c>] __dma_request_channel+0x24/0x8c
>  #4:  (cma_mutex){......}, at: [<80246814>] cma_alloc+0xc8/0x29c

The system seems to block in CMA, therefore make_reservation() does not make any
progress and all write back blocks too.
Do you have CONFIG_MIGRATION enabled?

If possible, enable LOCKDEP, it can give us more details what is going on.

-- 
Thanks,
//richard
