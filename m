From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200403181411.25596.tglx@linutronix.de>
References: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
	 <200403181411.25596.tglx@linutronix.de>
Content-Type: text/plain
Message-Id: <1079619390.16952.142.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 18 Mar 2004 14:16:31 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Large block NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-18 at 14:11 +0100, Thomas Gleixner wrote:
> Be aware, that the available NAND aware filesystems must be changed too, as 
> they are not aware of pagesizes > 512 byte, but if IIRC  the datasheet 
> details it is possible to write 4  512 byte sub-pages to the device without 
> violating the specs. Anyway changes will be neccecary.

JFFS2 shouldn't actually have any problem with arbitrary page sizes as
long as they're a power of two.

-- 
dwmw2
