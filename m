From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.62.0503031146070.15953@localhost.localdomain>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>
	<1109847630.16158.22.camel@hades.cambridge.redhat.com>
	<4226F51A.7070603@imc-berlin.de>
	<Pine.LNX.4.62.0503031146070.15953@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 03 Mar 2005 18:20:08 +0000
Message-Id: <1109874008.29792.92.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: [RFD] Move 2.4 code out from CVS head
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-03 at 11:48 -0500, Nicolas Pitre wrote:
> > Does that mean that there will be _no_ " maintainence only mode" for
> > 2.4?
> 
> Depends if _you_ or someone else decides to volunteer for the task.
> do you?  I don't.

I _am_ maintaining JFFS2 in the 2.4 kernel, even to the extent of
backporting the __wait_on_freeing_inode() stuff from 2.6 to fix the
problems with simultaneous read_inode() and clear_inode(). But I'm not
adding new features, so NAND flash isn't supported in 2.4.

-- 
dwmw2
