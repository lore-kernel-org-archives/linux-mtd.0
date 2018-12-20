Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZy3d-0001Fv-2u
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 13:08:14 +0000
Received: by mail-lj1-x22b.google.com with SMTP id t18-v6so1501501ljd.4
 for <linux-mtd@lists.infradead.org>; Thu, 20 Dec 2018 05:07:58 -0800 (PST)
MIME-Version: 1.0
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
 <CAFLxGvzaZythh+u93Tq4Eqrdr7gN4v6sdoy3WP67qpBfpoxOmw@mail.gmail.com>
In-Reply-To: <CAFLxGvzaZythh+u93Tq4Eqrdr7gN4v6sdoy3WP67qpBfpoxOmw@mail.gmail.com>
From: Martin Townsend <mtownsend1973@gmail.com>
Date: Thu, 20 Dec 2018 13:07:45 +0000
Message-ID: <CABatt_yNxPpHMN98Jt1rcjHLHDSyz7XAjY=jdberVT3EiP=_Ag@mail.gmail.com>
Subject: Re: hung task detected in ubifs
To: Richard Weinberger <richard.weinberger@gmail.com>
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

Hi Richard,

On Thu, Dec 20, 2018 at 10:54 AM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Dec 20, 2018 at 10:49 AM Martin Townsend
> <mtownsend1973@gmail.com> wrote:
> > 5 locks held by programmingapp/930:>  #0:  (&mm->mmap_sem){......}, at: [<80113ef0>] do_page_fault+0xb8/0x350
> >  #1:  (&le->mutex){......}, at: [<80568150>] ubi_eba_read_leb+0x34/0x438
> >  #2:  (of_dma_lock){......}, at: [<804ab890>]
> > of_dma_request_slave_channel+0x140/0x228
> >  #3:  (dma_list_mutex){......}, at: [<804a9d3c>] __dma_request_channel+0x24/0x8c
> >  #4:  (cma_mutex){......}, at: [<80246814>] cma_alloc+0xc8/0x29c
>
> The system seems to block in CMA, therefore make_reservation() does not make any
> progress and all write back blocks too.
> Do you have CONFIG_MIGRATION enabled?
>
> If possible, enable LOCKDEP, it can give us more details what is going on.
>
> --
> Thanks,
> //richard

I just checked and CONFIG_MIGRATION=y.
Interesting that it seems to block in the CMA, could it be that the
programmingapp process has used up all the CMA memory?  I'll ask for a
complete log file.
I'll ask them to enable LOCKDEP and hope that the i.MX6 UL can handle it :)

Cheers, Martin.
