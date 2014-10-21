Received: from mail-qa0-x234.google.com ([2607:f8b0:400d:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgMxw-0002Uz-6n
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 00:06:20 +0000
Received: by mail-qa0-f52.google.com with SMTP id dc16so90269qab.11
 for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2014 17:05:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20141009161707.GA18921@fifo99.com>
References: <20141009161707.GA18921@fifo99.com>
Date: Mon, 20 Oct 2014 17:05:56 -0700
Message-ID: <CAN8TOE8scDnP74KJHmQcq2sznPmxkfDru7sFE+ByrJ8tKHt9mg@mail.gmail.com>
Subject: Re: slram on mapped ram areas
From: Brian Norris <computersforpeace@gmail.com>
To: dwalker@fifo99.com
Content-Type: text/plain; charset=UTF-8
Cc: Joern Engel <joern@wh.fh-wedel.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jochen Schaeuble <psionic@psionic.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 9, 2014 at 9:17 AM,  <dwalker@fifo99.com> wrote:
> Hi,
>
> It seems that slram was made for access parts of memory not used by the system,
> or not mapped (right terminology?). I wanted to use it on memory which is mapped
> or memory that can be used by the system. The problem I have is that the system I
> work on places a filesystem image in memory someplace, and send the physical address
> and size of the area as boot parameters. The memory where the images ends up is not
> special memory.

I honestly don't know much about the slram.c driver. I doubt it has
many serious users these days.

It also seems like you're really trying to use this driver in a way it
was not designed. Do you really need to access specific kernel memory?
Or do you just want a RAM-backed MTD? There are other drivers for this
already (mtdram?).

> I made the following changes to your driver (somewhat condensed),
>
> 1) Added memblock_reserve() on the memory region
> 2) Added an insert_resource() call to the memory
> 3) Altered the driver to not use ioremap, instead use __va() conditionally.

I see this comment next to the __va() definition for ARM:

/*
 * Drivers should NOT use these either.
 */

> This worked. I was able to access the memory via the typical mtd
> userspace interface.
>
> So is this something acceptable to add to the slram driver?
>
> Should it go someplace else?
>
> Does the functionality to do this exists someplace already ?
>
> I just wanted to send out feelers before I send any patches..

Brian
