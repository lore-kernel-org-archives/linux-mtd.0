Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzXKR-0001yO-EE
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 13:29:05 +0000
Date: Fri, 23 May 2008 15:28:53 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080523132853.GC22384@logfs.org>
References: <20080523095914.GA21487@logfs.org>
	<115582.37719.qm@web36706.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <115582.37719.qm@web36706.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 May 2008 05:49:48 -0700, Alex Dubov wrote:
> 
> We are talking about somewhat different things here. Userspace visible devices
> (highest layer in mtd stack) must support something complex. Lower levers in
> the mtd stack - not necessarily so.
> 
> Highest level "raw mtd" devices can be normal block devices with support for
> custom commands. Intermediate and low level modules can do with simple
> interface.

Either I misunderstand you or you are forgetting that filesystems deal
with raw mtd devices, which are the lowest levels in your stack afaics.
JFFS2 and LogFS will deal directly with the chip driver and bypass any
intermediate layers.  UBIFS will talk to UBI as a middle layer, which
again talks directly to the chip driver.

> Then, there should be a layer akin to "md" that will allow creation of flash
> raids. After all, we are not limited in number of intermediate devices present
> in the kernel. We don't have to create userspace visible nodes for them.

True.  For me pure concatenation would be enough.  All I need is some
extra geometry information so I can decide which block belongs to which
chip.  In the simplest case something like "13 chips of 123MiB each,
linearly concatenated".  Different chips sizes are fine, different
erasesize and writesize may still work within reason.

So mtdconcat.c plus extended geometry information would be good enough.

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca
