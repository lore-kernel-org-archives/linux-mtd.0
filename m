Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJOrz-0007if-5t
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2014 14:56:59 +0000
Date: Fri, 28 Feb 2014 11:56:26 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v7 1/3] ubi: Introduce read-only block devices on top of
 UBI volumes
Message-ID: <20140228145625.GA24805@localhost>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393597747.3412.191.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1393597747.3412.191.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 28, 2014 at 04:29:07PM +0200, Artem Bityutskiy wrote:
> On Mon, 2014-02-24 at 09:39 -0300, Ezequiel Garcia wrote:
> > This commit introduces read-only block device emulation on top of UBI volumes.
> > 
> > Given UBI takes care of wear leveling and bad block management it's possible
> > to add a thin layer to enable block device access to UBI volumes.
> > This allows to use a block-oriented filesystem on a flash device.
> > 
> > The UBI block devices are meant to be used in conjunction with any
> > regular, block-oriented file system (e.g. ext4), although it's primarily
> > targeted at read-only file systems, such as squashfs.
> 
> Massaged a tiny bit and pushed to linux-ubifs.git, thanks!
> 

Thanks for the massage!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
