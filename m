From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <6A03D4BC2018@baydel.com>
References: <4034E8ED.5757.55A2D9@localhost> <69D8404D0D5E@baydel.com>
	 <1077641461.7826.578.camel@hades.cambridge.redhat.com>
	 <6A03D4BC2018@baydel.com>
Content-Type: text/plain
Message-Id: <1077645958.7826.599.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Feb 2004 18:05:59 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-24 at 17:05 +0000, Simon Haynes wrote:
> Would you recommend changing the printk for the "Empty Flash" messages to a 
> different level and using the ramdisk as a permanent solution ?

Changing the printk level for the 'Empty Flash' messages does seem
appropriate -- or preferably finding a way to eliminate the ones which
we don't want. Are you mounting the fs read-only before rebooting? If
not, the occasional CRC failure is acceptable. You get those with an
unclean restart. It doesn't indicate data loss; it indicates that one
particular log entry which you were writing _while_ you rebooted was
lost. That was not data which userspace thought was already on the
medium.

The problem with mtdblock is interesting. Can you make it BUG() when it
dirties its cache and put it back to how it was, using mtdblock?

-- 
dwmw2
