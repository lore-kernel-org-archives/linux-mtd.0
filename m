From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <42280EB6.4030007@imc-berlin.de>
References: <1109841282.5398.30.camel@tglx.tec.linutronix.de>
	<1109845739.16158.14.camel@hades.cambridge.redhat.com>
	<1109846656.4370.20.camel@tglx.tec.linutronix.de>
	<1109846792.16158.20.camel@hades.cambridge.redhat.com>
	<1109847189.4370.27.camel@tglx.tec.linutronix.de>
	<1109847630.16158.22.camel@hades.cambridge.redhat.com>
	<4226F51A.7070603@imc-berlin.de>
	<Pine.LNX.4.62.0503031146070.15953@localhost.localdomain>
	<1109874008.29792.92.camel@baythorne.infradead.org>
	<42280EB6.4030007@imc-berlin.de>
Content-Type: text/plain
Date: Fri, 04 Mar 2005 07:53:54 +0000
Message-Id: <1109922835.29792.106.camel@baythorne.infradead.org>
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

On Fri, 2005-03-04 at 08:31 +0100, Steven Scholz wrote:
> How about SUMMARY patch then? ;-)

$DEITY no. The 2.4 branch doesn't even have the mount time improvements
from a couple of years ago. It isn't having summary support.

> And BTW: How do I get the 2.4 branch from CVS?

cvs up -r jffs2-2_4-branch

Or just look at Marcelo's current kernel. Most of what I've done
recently (i.e. in the last year or so) to fix JFFS2 bugs in 2.4 has been
in linux/fs/inode.c, not in linux/fs/jffs2/

-- 
dwmw2
