Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QOvAX-0001eG-E5
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 17:13:22 +0000
Date: Tue, 24 May 2011 19:12:36 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: David Wagner <david.wagner@free-electrons.com>
Subject: Re: usefullness of a read-only block UBI interface ?
Message-ID: <20110524171236.GA10795@parrot.com>
References: <4DDBC64F.5070409@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4DDBC64F.5070409@free-electrons.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Linux Embedded <linux-embedded@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 24, 2011 at 03:53:03PM +0100, David Wagner wrote:
> 	Hello linux-mtd, -embedded and -fsdevel,
> 
> There are a lot of actively developed block filesystems out there, more
> than flash filesystems. Read-only block FS can run with great perfs on
> flash supports with the mtdblock interface (eg. SquashFS) but since it
> doesn't handle bad blocks, read will fail when you hit one.
> 
> That's why we are considering the pros and cons of having a block
> interface on top of UBI: UBI takes care of bad blocks and filesystems
> above it don't have to worry about them.
> 
> An option could be to implement bad block handling in mtdblock but
> then, there wouldn't be any wear-leveling.

Hello David,

Handling bad blocks is one thing, but it would not be enough. I assume you want
to use a nand device (bad blocks ?). Reading nand pages over and over will
result in bitflips (so-called "read disturbs"). Those bitflips are corrected by
ecc in mtd, but they must also be taken care of at a higher level, by
(atomically) moving faulty data to another block and erasing the original
block (which is enough to clear read disturbs). UBI does that in its block
scrubbing operation.

> In case of read-only filesystems, wear-leveling is not so important but
> when read-only and read-write filesystems coexist, static wear-leveling
> is important. And I understand that UBI implements static
> wear-leveling. So it would make sense to have a block read-only
> filesystem on top of UBI along with a ubifs read-write filesystem.

Yes, especially if your read-only filesystem is very large; you need to spread
wear-levelling across the entire device in order to maximize its lifetime.

Regards,

Ivan
