Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DpRA2-0001vn-7t
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2005 09:38:59 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: dedekind@infradead.org
In-Reply-To: <1120483812.16978.38.camel@sauron.oktetlabs.ru>
References: <0IJ200CBRX00K2@mmp2.samsung.com>
	<1120483812.16978.38.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Mon, 04 Jul 2005 15:41:44 +0200
Message-Id: <1120484505.18862.96.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "'Woodruff, Richard'" <r-woodruff2@ti.com>, "'Johnson,
	Steve-OMAP'" <stevej@ti.com>, 'Dongjun Shin' <d.j.shin@samsung.com>,
	linux-omap-open-source@linux.omap.com, "'Zhang,
	Jian'" <jzhang@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] OneNAND MTD support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-07-04 at 17:30 +0400, Artem B. Bityuckiy wrote:
> 
> Why general MTD  CONFIG_MTD_NAND_VERIFY_WRITE config option and -
> >verify_buf driver method (see nand_base.c) is not enough and you need
> your own verify option?

Because its a seperate driver in a seperate directory. It's ok.

tglx
