Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1580eT-0007bH-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 15:20:46 +0100
Date: Thu, 7 Jun 2001 10:23:32 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Abraham vd Merwe <abraham@2d3d.co.za>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: HELP 
In-Reply-To: <19468.991906514@redhat.com>
Message-ID: <Pine.LNX.4.33.0106071021560.24927-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Thu, 7 Jun 2001, David Woodhouse wrote:

>
> abraham@2d3d.co.za said:
> > mtd_debug: Unaligned memory access at pc=0xca005644, lr=0xc001dc08
> > (bad address=0xc0135d82, cod) Internal error: alignment exception: 0
>
> Enable CONFIG_ALIGNMENT_TRAP.
>
> 2.4.4-rmk1 or later will force you to do this before you can enable
> CONFIG_MTD.

2.4.5-rmk*-np* and later kernels unconditionally enable
CONFIG_ALIGNMENT_TRAP for SA1100 architectures without asking you.


Nicolas
