Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 156t1Z-00032b-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2001 12:59:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010604134136.A2644@crystal.2d3d.co.za> 
References: <20010604134136.A2644@crystal.2d3d.co.za> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd->erasesize 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 04 Jun 2001 13:04:01 +0100
Message-ID: <18826.991656241@redhat.com>
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
>  I'm busy writing a driver for the 28Fxxxxx 3V Intel Fast Boot Block
> flash devices (for now only a LART driver since I have no other boards
> to play with).

You should be able to use the same actual chip driver as the CFI code -
cfi_cmdset_0001.c. You just need a piece of code to do the Intel-specific
probe and set up the appropriate structure for the chip driver to use, much
like the existing code for AMD/JEDEC probes which has been merged into
cfi_probe.c, except that it should actually be a separate probe function (as
should the AMD/JEDEC one).

> The problem is that these chips have 8 4k blocks in the beginning and
> the rest is 32k blocks, so effectively there is two erasesize's.

> For now, I'm just skipping the first 8 4k blocks so you can't access
> that with the MTD driver, but I believe this is a design flaw with the
> MTD drivers. It should be able to handle multiple erasesize's for each
> device. 

The driver for AMD chips (cfi_cmdset_0002.c) already supports this. 
Nobody's yet put similar support into the Intel driver. Feel free to do so 
:)

--
dwmw2
