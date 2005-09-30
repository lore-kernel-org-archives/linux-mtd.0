Received: from caramon.arm.linux.org.uk ([212.18.232.186])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELLYT-0002rg-QM
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 10:08:44 -0400
Date: Fri, 30 Sep 2005 15:02:48 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20050930140247.GA28856@flint.arm.linux.org.uk>
References: <20050930121741.GA5506@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050930121741.GA5506@elf.ucw.cz>
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [patch] switch mtd to new driver model & cleanups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 30, 2005 at 02:17:41PM +0200, Pavel Machek wrote:
> Switch mtd to new power management.

You don't need to do it this way - and this will probably mess up the
SA1100 suspend code.  MTD map drivers should probably be converted to
the driver model rather than the core so that the PM ordering can be
correctly handled.

(Consider the case where there's flash on a daughter board accessed
over some kind of bridge.)

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
