Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KIAb-0005y2-F1
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 14:37:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030526123500.GA12485@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	 <20030522195708.GB11240@wohnheim.fh-wedel.de>
	 <004101c3214d$223c9560$740486da@w0a3t0>
	 <20030526094050.GA30361@wohnheim.fh-wedel.de>
	 <1053942836.17182.83.camel@imladris.demon.co.uk>
	 <20030526101918.GA11734@wohnheim.fh-wedel.de>
	 <20030526123500.GA12485@wohnheim.fh-wedel.de>
Message-Id: <1053956308.17182.88.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 26 May 2003 14:38:28 +0100
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: linux-mtd@lists.infradead.org
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-26 at 13:35, Jörn Engel wrote:
> A workmate of mine had another good point.  The mutex and workspace
> could be two arrays instead, with one member per CPU.  That way, we
> don't need a CONFIG_TINY option and the code scales automatically from
> small embedded to multi-gigabyte SMP.

Assuming you add a preempt_disable()... in one of the pieces of code
which was one of the main culprits for non-voluntary scheduling anyway.

-- 
dwmw2
