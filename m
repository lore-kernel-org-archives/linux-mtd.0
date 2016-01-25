Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNknl-0006tk-LU
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 17:20:06 +0000
Received: by mail-ob0-x235.google.com with SMTP id ba1so122817174obb.3
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2016 09:19:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56A64B94.7000808@novero.com>
References: <56A64B94.7000808@novero.com>
Date: Mon, 25 Jan 2016 18:19:19 +0100
Message-ID: <CAFLxGvx+OJyD+iHCq9qV-YhA-MKGvn=sGUOA_-JN09woir36Wg@mail.gmail.com>
Subject: Re: Migrating to UBI Volumes, keeping some data
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Sven Eisenberg <sven.eisenberg@novero.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 25, 2016 at 5:21 PM, Sven Eisenberg
<sven.eisenberg@novero.com> wrote:
> Hello all
>
> I'm facing a common mistake with UBI, we have a system that has nand
> partitioning on the MTD layer.
>
> Partitions:
> mtd1: root
> mtd2: dynamic_data
> mtd3: other_data
> mtd4: static_data
>
> We have learned the lesson with reduced wear leveling and degraded bad
> block pools. Now i plan to migrate also systems in the field to a UBI
> volume partitioning concept.
>
> The challenge for me is the data migration of the "static_data"
> partition, it is quite big and re-writing the data in the field is not
> an option.
> Erasing and re-writing the other partitions is not a problem in my
> situation. We run the kernel from NOR and have initial data to start from.
>
> After thinking about it i have the following theory of how a migration
> could work and I'd like to ask if you also think this is a possible way
> or if it is a stupid idea maybe:
>
> Target: migrate, but keep the volume in mtd4.
> The system is launched with the old mtd partitioning scheme, and does a
> flash_eraseall on mtd1, mtd2, mtd3 but not on mtd4.
> Then we reboot with only a single full size MTD configured in the kernel.
> Will the kernel UBI scan code be able to merge the erased blocks and the
> existing blocks from mtd4 into a consistent UBI device?
> The erased blocks should be initialized with the UBI headers, so we can
> define the remaining UBI volumes in the next step and initialize the
> system with data.
>
> I'm aware that by flash_eraseall the erase counters will be lost in mtd1-3.

Yes, that approach should work.
But I'd test it first. ;-)
Also think of power cuts...

Maybe it would make sense to add interface to UBI such that userspace
can set the erase counter
of PEBs. This would allow us to build a nice UBI migration framework.
*pushes to never ending TODO list*

-- 
Thanks,
//richard
