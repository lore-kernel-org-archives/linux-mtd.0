Received: from mail-ia0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TeVbp-000590-KK
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 18:46:46 +0000
Received: by mail-ia0-f177.google.com with SMTP id u21so566144ial.36
 for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2012 10:46:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1354267874.30168.73.camel@sauron.fi.intel.com>
References: <CAJA4uhcD+bGAdKMb6Nv-Kvs+o229PaLQL-9Dok-ddCUS5rbGpg@mail.gmail.com>
 <1354267874.30168.73.camel@sauron.fi.intel.com>
Date: Fri, 30 Nov 2012 15:46:41 -0300
Message-ID: <CALF0-+V2eZcEj-t2P-58XS7uStX_Uj4Gbf=ScpuMRBkxf4bnuw@mail.gmail.com>
Subject: Re: UBIFS: Advice request on how to reduce orph_buf size
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 30, 2012 at 6:31 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-11-16 at 12:14 +0100, Josselin Costanzi wrote:
>> In order to reduce UBIFS memory consumption when used in RW I'm trying to
>> reduce orph_buf size from one LEB to max_write_size. I changed avail_orphs and
>> tot_avail_orphs functions to report correct orphan counts but I'm now stuck
>> with the consolidate function. I don't see how I could atomically write all my
>> orphans in a new LEB with a max_write_size sized orph_buf. One potential
>> solution would be to try allocating a LEB sized buffer only when consolidating
>> the orphans but this means commit_orphans may now fail due to memory exhaustion.
>>
>> Have any of you an idea on how to correctly do this? What would be an acceptable
>> solution?
>
> Hi,
>
> well, it does not look like you can easily do this. The difficult
> solution would be to implement scatter-gather lists support in UBI and
> UBIFS, so that it would not require continuous buffers at all. Then may
> of the LEB-sized buffers would not be needed at all.
>
> I mean, why do we allocate a lot of LEB-sized buggers on mount time?
> Simply because later we may have no memory, and we do not want UBIFS to
> fail at random point with an error like "cannot write your files - no
> memeory".
>
> But if we implement SC support, we will be doing small allocations
> instead of 128KiB+ allocations. Small allocations, like allocating one
> page, do not fail. I mean, thy can fail sometimes, but extremely rarely.
> And if they do, your system is dead anyway. Besides, the kernel always
> have some pool of memory for urgent needs. Additionally, we can always
> create our own memory pool with some amount of pages which are always
> guaranteed to be there.
>
> So, this is basically my answer. This is a big work. But it would make
> UBIFS use a lot less RAM. It would also solve another problem people
> scream for years about - UBI/UBIFS use vmalloc() which is not DMA-able
> in many ARM systems. With SC lists we'd allocate smaller amount of
> memory (mostly one page, and sometimes 2 pages), and we could use normal
> kmalloc().
>
> CCing Ezequiel Garcia <elezegarcia@gmail.com> - may be he is
> enthusiastic enough to make a proposal about this in http://elinux.org.
>

Yes, indeed it sounds very interesting. I'll think about it.

Artem: is there any other place in the kernel you can point me at
that implement something similar to this SC list?

Thanks for Ccing me,

    Ezequiel
