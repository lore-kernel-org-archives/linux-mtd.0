Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNJak-0000Io-GQ
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 12:48:43 +0000
Message-ID: <1468414098.18533.34.camel@gmail.com>
Subject: Re: UBIFS orphans and ro-mounts
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@sigma-star.at>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 13 Jul 2016 15:48:18 +0300
In-Reply-To: <57863442.1000303@sigma-star.at>
References: <57863442.1000303@sigma-star.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-07-13 at 14:29 +0200, Richard Weinberger wrote:
> Artem,
> 
> I wonder why UBIFS processes orphan inodes also when mounting read-
> only.

Well, people expect UBIFS to report correct free/used space even if it
is R/O, right? :-)

> Depending on the workload before a power cut this can take a few
> seconds
> and since we mount read-only the updated TNC will not written back to
> flash,
> so upon next mount the time is again wasted.

I see the problem, but I do not agree with word "wasted", because this
is like doing it for nothing, while UBIFS is doing this for a reason.
So I'd rather used word "spent". :-)

> This hurts boot performance a lot on systems where u-boot loads the
> kernel
> from UBIFS.
> u-boot always mounts UBIFS read-only.
> So even when Linux mounts UBIFS rw and a powercut happens orphan
> processing
> will happen twice.

Sure, because in the R/O case the results of that processing cannot be
"saved" on the media, so they have to be repeated.

> I'd suggest calling ubifs_mount_orphans() only when we mount rw or
> remount to
> rw.
> What do you think?

I understand the problem. I do not think this is the right solution
because it'll introduce a regression (incorrect used/free space). But a
special mount option and/or superblock flag may be considered, if this
helps substantially.
