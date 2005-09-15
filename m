Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFy9v-0000Ry-Rv
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 14:08:38 -0400
Date: Thu, 15 Sep 2005 20:08:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Todd Poynor <tpoynor@mvista.com>
Message-ID: <20050915180816.GB9974@wohnheim.fh-wedel.de>
References: <87ek7qpgfm.wl%kletschke@synertronixx.de>
	<4329A39B.3090503@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4329A39B.3090503@mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to cope with locked flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 15 September 2005 09:38:51 -0700, Todd Poynor wrote:
> 
> Some people hack the kernel to unlock writeable partitions during the 
> boot sequence.  One of these days should look at adding flags to jffs2 
> to unlock the flash at mount time.

We created a patch for our bootloader to do the work.  If the
bootloader needs flash write support anyway, it is the natural place
for the code.

Next best thing, imo, would be the mtd mapping driver.  JFFS2 should
stay clear of this, if possible.  We should aim to isolate hardware
stuff to drivers/mtd/ and keep fs/* unaware.  Some things like wbuf
require fs knowledge, but unlock doesn't.

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
