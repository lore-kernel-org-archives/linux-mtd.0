From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1109847189.4370.27.camel@tglx.tec.linutronix.de>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 11:00:30 +0000
Message-Id: <1109847630.16158.22.camel@hades.cambridge.redhat.com>
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

On Thu, 2005-03-03 at 11:53 +0100, Thomas Gleixner wrote:
> > If you don't need it alive, you don't need a branch. You don't even need
> > a tag -- 'cvs up -D2005-03-01'.
> 
> I have zero interest to keep it alive.

Then we have no need of a branch. Just remove the files.

-- 
dwmw2
