Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jd8WH-0008RL-6f
	for linux-mtd@lists.infradead.org; Sat, 22 Mar 2008 18:32:41 +0000
Date: Sat, 22 Mar 2008 19:32:00 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH] 2/3 mtd: add support for flash on the SEGA Dreamcast
	Visual Memory Unit
Message-ID: <20080322183200.GD19347@logfs.org>
References: <1206207805.6324.13.camel@localhost.localdomain>
	<1206209035.6324.29.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1206209035.6324.29.camel@localhost.localdomain>
Cc: Andrew Morton <akpm@osdl.org>, linux-sh <linux-sh@vger.kernel.org>,
	Greg KH <greg@kroah.com>, Paul Mundt <lethal@users.sourceforge.net>,
	LKML <linux-kernel@vger.kernel.org>,
	MTD <linux-mtd@lists.infradead.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 22 March 2008 18:03:55 +0000, Adrian McMenamin wrote:
> 
> The SEGA Visual Memory Unit includes 128k of flash memory
> which can be read in blocks.
> 
> The hardware specification is also capable of supporting
> partitions (though it is doubtful such devices exist).
> 
> This driver supports block reads and writes, as well as
> queries of hardware capabilities, through the maple
> bus susbsystem.
> 
> (It also implements a caching system so that, for instance, a
> read of 60 bytes will take 1/60th - or 1/50th in PAL regions -
> of a second instead of a second or 1.2 seconds.)

Without a doubt, buffering is useful.  However I question how useful it
is to implement this in individual device drivers instead of once in
mtd_core.c.

> Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>

Given that you have ignored most of my previous comments, NAK.  I don't
mind merging code that isn't up to our standards yet.  But I have a bad
feeling about a maintainer that does not understand review comments.
Since you had similar problems understanding Andrew, part of the blame
may sit on your side.

Jörn

-- 
The key to performance is elegance, not battalions of special cases.
-- Jon Bentley and Doug McIlroy
