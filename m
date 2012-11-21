Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb7lB-0005wB-Hp
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 10:42:27 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so9740591iej.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2012 02:42:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20121121110022.35db364f@skate>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <20121121110022.35db364f@skate>
Date: Wed, 21 Nov 2012 07:42:24 -0300
Message-ID: <CALF0-+XBqaWFxHbnbOyaYW01XAjm78CrdxkyyjMKSexyvVDV-w@mail.gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

On Wed, Nov 21, 2012 at 7:00 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ezequiel Garcia,
>
> On Tue, 20 Nov 2012 19:39:38 -0300, Ezequiel Garcia wrote:
>
>> * Read/write support
>>
>> Yes, this implementation supports read/write access.
>
> While I think the original ubiblk that was read-only made sense to
> allow the usage of read-only filesystems like squashfs, I am not sure a
> read/write ubiblock is useful.
>
> Using a standard block read/write filesystem on top of ubiblock is going
> to cause damage to your flash. Even though UBI does wear-leveling, your
> standard block read/write filesystem will think it has 512 bytes block
> below him, and will do a crazy number of writes to small blocks. Even
> though you have a one LEB cache, it is going to be defeated quite
> strongly by the small random I/O of the read/write filesystem.
>

Well, I was hoping for the opposite to happen;
and hoping for the 1-LEB cache to be able to absorb
the multiple write from filesystems.

My line of reasoning is as follows.
As we all know, LEBs are much much bigger than regular disk blocks;
typically 128KiB.

Now, filesystems won't care at all about wear levelling
and thus will carelessly perform lots of reads/writes at any disk sector.

Because block elevator will try to minimize seek time, it will try to order
block requests to be contiguous. Since LEBs are much bigger than sector
blocks, this ordering will result mostly in the same LEB being addressed.

Only when a read or write arrives at a different LEB than the one in cache,
will ubiblock flush it to disk.

My **very limited** testing scenario with ext2, showed this was more
or less like this.
Next time, I'll post some benchmarks and some numbers.

Of course, there's a possibility you are right and ubiblock write support
is completely useless.

Thanks for the review,

    Ezequiel
