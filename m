From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 10:28:58 +0000
Message-Id: <1109845739.16158.14.camel@hades.cambridge.redhat.com>
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

On Thu, 2005-03-03 at 10:14 +0100, Thomas Gleixner wrote:
> I strongly vote to branch of a mtd-2.4-latest-devel in CVS from said
> point and then remove the whole 2.4 crap from CVS head. 

Nah. There's already a 2.4 branch. If someone wants to keep -HEAD
working on 2.4, that's OK, but I don't want a new branch for it. If
nobody keeps it working, just remove the 2.4-specific files.

-- 
dwmw2
