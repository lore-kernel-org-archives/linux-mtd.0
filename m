From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1109847822.4370.40.camel@tglx.tec.linutronix.de>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>
	<1109847630.16158.22.camel@hades.cambridge.redhat.com>
	<1109847822.4370.40.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 11:05:53 +0000
Message-Id: <1109847954.16158.24.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: [RFD] Move 2.4 code out from CVS head
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-03 at 12:03 +0100, Thomas Gleixner wrote:
> Can we at least preserve the history in same way? AFAIK is CVS remove
> a non reversible operation.

CVS remove is reversible. Just check out a version before the dead one,
by date or by revision number.

-- 
dwmw2
