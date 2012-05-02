Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPfHr-00038D-Ob
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 19:32:32 +0000
Received: by ghbf11 with SMTP id f11so1221178ghb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 12:32:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335959619.10293.41.camel@sauron.fi.intel.com>
References: <037801cd2330$0cd747d0$2685d770$@com>
 <1335959619.10293.41.camel@sauron.fi.intel.com>
Date: Wed, 2 May 2012 12:32:29 -0700
Message-ID: <CAN8TOE9+WpSrYufSpKXy6RW_V8M_1dZg+uBB6ChmcAWnxmVCnA@mail.gmail.com>
Subject: Re: atmel_nand, DMA, and "Fall back to CPU I/O"
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: George Pontis <GPontis@z9.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 2, 2012 at 4:53 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-04-25 at 15:09 -0700, George Pontis wrote:
>> Working with 3.0.13 kernel and the at91sam9g45, 8b NAND flash with rootfs in
>> NAND
>>
>> At boot, the kernel shows 22 DMA warnings, then another 260 as UBIFS mounts
>> the root FS:
>>
>> atmel_nand atmel_nand: Fall back to CPU I/O
>>
>
> Unfortunately UBI and UBIFS use vmalloced memory for I/O and many people
> yelled but no one cared to fix this. I think we should make UBI/UBIFS to
> use kmalloc()'ed memory instead.

I've noticed this problem before. It sometimes give problems for my
DMA controller, but my driver falls back to PIO if it can't pass a
check for '!is_vmalloc_addr(addr)'. Would this solution work for you,
George?

And how might you recommend we use kmalloc()'ed memory, Artem? We
can't really kmalloc() whole eraseblock-sized chunks. Or is there an
inexpensive way of providing an intermediary kmalloc'ed buffer? I'm
not too familiar at hacking at UBI(FS), but it might be worth a shot
sometime, if you think it's reasonable.

Brian
