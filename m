Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195meS-0004xp-IM
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 14:08:36 +0100
Date: Wed, 16 Apr 2003 15:08:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20030416130842.GG25858@wohnheim.fh-wedel.de>
References: <20030415171123.GH7721@wohnheim.fh-wedel.de>
	<200304161335.50367.tglx@linutronix.de>
	<20030416111353.GE25858@wohnheim.fh-wedel.de>
	<200304161605.33119.tglx@linutronix.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200304161605.33119.tglx@linutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: esn@cotas.dk
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 April 2003 16:05:33 +0200, Thomas Gleixner wrote:
> write - sync -poweroff works on NAND. flush_wbuf is also triggered on umount.

Good. Then either my memory was wrong, or the problem got fixed in the
meantime. Either way, good work!

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
