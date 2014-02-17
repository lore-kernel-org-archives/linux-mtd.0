Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFLiK-00019x-Dy
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 10:46:18 +0000
Message-ID: <1392633946.12215.150.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 1/3] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 17 Feb 2014 12:45:46 +0200
In-Reply-To: <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-02-16 at 17:03 -0300, Ezequiel Garcia wrote:
> This commit introduces block device emulation on top of ubi volumes,
> in the most featureless and skinniest way: read-only, uncached access.
> 
> Given UBI takes care of wear leveling and bad block management it's possible
> to add a thin layer to enable block device access to UBI volumes.
> This allows to use a block-oriented filesystem on a flash device.
> 
> As opposed to mtdblock, which uses a 1-LEB cache, we've chosen not to
> implement any caching policy. The UBI block interface is meant to be
> used in conjunction with regular block-oriented filesystems (primarily,
> squashfs). These filesystems are better prepared to do their own caching,
> rendering a block-level cache useless.

As I explain, I do not think any additional caching is needed for the
R/O FS. Mtdblock supports writing in the most straight-forward way
(read-modify-write entire LEB), and this is why it needs the 1LEB
"cache" - it allows avoiding the read part _sometimes_ - for sequential
writes. And only for sequential writes.

Just forget that cache.

If we were adding a write support, we'd need a smarter cache, which
would probably cache multiple LEBs, and had a shrinker, and you'd need
to support the barrier operation, and so on. But there is not write
support at all now, let's not even talk about the cache.

Let me try to mostly review user-visible parts :=) Some nit-picks below.

> +config MTD_UBI_BLOCK
> +	bool "Block device access to UBI volumes"

bool "Read-only block devices on top of UBI volumes"

> +	default n
> +	help
> +	   Since UBI already takes care of eraseblock wear leveling
> +	   and bad block handling, it's possible to implement a block
> +	   device on top of it and therefore mount regular filesystems
> +	   (i.e. not flash-oriented, as ext4).
> +	   In other words, this is a software flash translation layer.

I'd re-write it differently. "Since .. it is possible to implement"
looks weird. It is already implemented bu this driver.

The customer for this text is the end user, who does not know much about
UBI and what is possible. Just give him/her facts :-) Something more
like this.

This option enables read-only UBI block devices support. UBI block
devices will be layered on top of UBI volumes, which means that the UBI
driver will transparently handle things like bad eraseblocks and
bit-flips. You can put any file-system in on top of UBI volumes in
read-only mode (e.g., ext4), but it is probably most practical for
read-only file systems like squashfs.

Feel free to rewrite it, I just wanted to give an idea what I suggest.

> +
> +	   This can be particularly interesting to allow mounting a read-only
> +	   filesystem, such as squashfs, on a NAND device.

"This can be particularly interesting" - may be just simpler phrase
which just tells that the user can use UBI block devices with squashfs?

> +	   When selected, this feature will be built-in the ubi module

Well, I'd use "UBI driver" instead of "ubi module", since we do not know
whether the users selected the module or compiled UBI into the kernel.

> +	   and block devices will be able to be created and removed using
> +	   the userspace 'ubiblkvol' tool (provided mtd-utils).

> @@ -0,0 +1,660 @@
> +/*
> + * Copyright (c) 2014 Ezequiel Garcia
> + * Copyright (c) 2011 Free Electrons

If you copy-pasted _any_ code from UBI, do not forget to add original
copyrights here too. Otherwise, this is fine.

> +/*
> + * Block interface for UBI volumes
> + *
> + * A simple implementation to allow a block device interface on top
> + * of a UBI volume. The implementation is provided by creating a static
> + * 1-to-1 mapping between the block device and the UBI volume.

.. and the LEBs of the UBI volume, may be?

> + * The addressed byte is obtained from the addressed block sector,
> + * which is mapped linearly into the corresponding LEB:
> + *
> + *   leb number = addressed byte / leb size
> + *
> + * The current implementation support only read operation. Write-support
> + * addition shouldn't be too hard and could be implemented in the future.
> + * It was suggested to implement this using the already existent BLKROSET
> + * block ioctl to turn it on and off, thus avoiding undesirable writes.

I do not think it is not hard. Decent write operation may be hard. By
decent I mean something which would give you sane random write
performance. Your implementation would basically read-erase-write entire
LEB, with CRC calculation for the entire LEB data, right?

So I'd say just "possible", rather "shouldn't be too hard" :-)

> + * Contrary to the MTD block interface implementation, there's no cache
> + * involved. The reasons behind this choice is that the filesystems
> + * that would be mounted on top of UBI blocks already provide caching and
> + * are able to do it more efficiently.

I'd not mention MTD block here at all. And it's cache. It confuses more
than gives a clue. Just tell that you do not implement any caching for
the date in your driver.

> + * We may add a cache here, but it would be desirable to register a memory
> + * shrinker to match the requirements of memory-constrained platforms.

You could provide your vision about a possible write implementation at
the end of this comment, and there you could put your thoughts about the
cache. Because the cache is only relevant for the write support, I
believe.

> + * This feature is compiled in the UBI core, and adds a new 'block'
> + * parameter to allow early block interface creation. Runtime
> + * block attach/detach for UBI volumes is provided through two
> + * UBI ioctls: UBI_IOCVOLATTBLK and UBI_IOCVOLDETBLK.
> + */

I hope more people would help reviewing the code :-)

-- 
Best Regards,
Artem Bityutskiy
