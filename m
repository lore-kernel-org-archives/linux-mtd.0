Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ceb1T-0003wK-2o
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 10:25:04 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: MQuicquaro@necii.com
In-Reply-To: <OFF0986582.CD5BFAE1-ON85256F6B.0050207B-85256F6B.00544174@necii.com>
References: <OFF0986582.CD5BFAE1-ON85256F6B.0050207B-85256F6B.00544174@necii.com>
Content-Type: text/plain
Date: Wed, 15 Dec 2004 16:24:50 +0100
Message-Id: <1103124291.3406.183.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 - mtd - nand flash works....except....
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-15 at 10:19 -0500, MQuicquaro@necii.com wrote:
> Ok. Thanks.  My problem must be elsewhere then.
> >From what you say, jffs2 will never do subsector writes.
> Is that correct?  

Yes

> Is there a configuration option maybe that
> controls this?

No

> My problem is that, in my 2 MB kernel MTD partition, I place
> my 750K kernel.  There is like a 50-50% chance that when I
> write this kernel, when I boot the system, it reports a CRC error.
> If I diff the file with a known good one it shows no differences.
> Hmm, maybe I have a problem with my U-boot reading NAND.

Seems so.

tglx
