Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157w8D-0007Iw-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 10:31:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010607110359.A22278@crystal.2d3d.co.za> 
References: <20010607110359.A22278@crystal.2d3d.co.za> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: HELP 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Jun 2001 10:35:14 +0100
Message-ID: <19468.991906514@redhat.com>
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

abraham@2d3d.co.za said:
> mtd_debug: Unaligned memory access at pc=0xca005644, lr=0xc001dc08
> (bad address=0xc0135d82, cod) Internal error: alignment exception: 0

Enable CONFIG_ALIGNMENT_TRAP.

2.4.4-rmk1 or later will force you to do this before you can enable
CONFIG_MTD.

--
dwmw2
