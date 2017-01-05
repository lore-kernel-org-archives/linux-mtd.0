Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cP8Fj-0003Uy-5D
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2017 13:38:49 +0000
Subject: Re: [PATCH 0/2] Support skipping bad blocks when seeking to start
 address
To: Mike Crowe <mac@mcrowe.com>, linux-mtd@lists.infradead.org
References: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
From: goliath <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Message-ID: <82d2fa84-c1ec-8791-9b50-c57314ad7a5e@sigma-star.at>
Date: Thu, 5 Jan 2017 14:38:23 +0100
MIME-Version: 1.0
In-Reply-To: <1483539486-16165-1-git-send-email-mac@mcrowe.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

not being between two releases this time, I had some more time to
think about your patch and had a brief discussion with Richard and
subsequently with Boris on the MTD IRC channel.

Some concerns have been raised regarding how your specific boot
loader clutch works and whether we should really add tool support
for it.

If your boot loader seeks to a specific erase block by counting
only good blocks (to load the kernel or some second stage?), what
happens if another block in between goes bad? Does that just brick
your board or do you have to move the data around all the time to
account for that?

What kind of boot loader is this? Is it widely used or is that
algorithm used by a number of other boot loaders? In that case
it would make sense to add support for this. However, if it is
just a one-time fix for a vendor specific boot loader, it might
not be reasonable to merge it into upstream mtd-utils. Or is
there some other use case for this?


Regards,

David
