Received: from gatekeeper.airfiber.com ([204.216.169.82] helo=freedom.airfiber.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rMHh-0002Th-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 17:32:41 +0100
Message-ID: <3BC47ADD.504E81C3@airfiber.com>
Date: Wed, 10 Oct 2001 09:44:13 -0700
From: Tom McMillan <tsm@airfiber.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Eraseblock size in jffs2 ?
References: <Pine.LNX.4.21.0110101821350.18912-100000@lxserver.deltes.cz> <22822.1002731498@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:
> 
> Unfortunately, JFFS2 doesn't yet work on the DiskOnChip, because it uses
> NAND flash. JFFS v1 should probably work, or you can fix up JFFS2 to work
> too.
> 

Where, exactly?  Or at least, a starting point.  I've just started
looking into using JFFS2 with my DOC2000s.

_____________________________________________________________________
Tom McMillan                                                 AirFiber
tsm@airfiber.com                                   16510 Via Esprillo
PH: (858) 676-7301                                San Diego, CA 92127
