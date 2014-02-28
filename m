Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJORQ-0006ho-W1
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2014 14:29:33 +0000
Message-ID: <1393597747.3412.191.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 1/3] ubi: Introduce read-only block devices on top of
 UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Fri, 28 Feb 2014 16:29:07 +0200
In-Reply-To: <1393245564-23947-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-2-git-send-email-ezequiel.garcia@free-electrons.com>
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

On Mon, 2014-02-24 at 09:39 -0300, Ezequiel Garcia wrote:
> This commit introduces read-only block device emulation on top of UBI volumes.
> 
> Given UBI takes care of wear leveling and bad block management it's possible
> to add a thin layer to enable block device access to UBI volumes.
> This allows to use a block-oriented filesystem on a flash device.
> 
> The UBI block devices are meant to be used in conjunction with any
> regular, block-oriented file system (e.g. ext4), although it's primarily
> targeted at read-only file systems, such as squashfs.

Massaged a tiny bit and pushed to linux-ubifs.git, thanks!


-- 
Best Regards,
Artem Bityutskiy
