Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uypV-0007Rn-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 16:46:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AEEAE8F.4C2BB285@cs.ccu.edu.tw> 
References: <3AEEAE8F.4C2BB285@cs.ccu.edu.tw> 
To: lmc83 <lmc83@cs.ccu.edu.tw>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD driver module for SmartMedia 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 02 May 2001 16:45:46 +0100
Message-ID: <8870.988818346@redhat.com>
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

lmc83@cs.ccu.edu.tw said:
>     Is there MTD driver module for SmartMedia? 

No, not yet. Nobody's yet shown much interest in creating one.


>     Can I use nand.c to drive SmartMedia ?

If SmartMedia contains NAND flash chips, then probably, yes. With the right 
glue layer this ought to be possible.


>     In the source code tree structure, "mtd/devices" means MTD driver
> module
>     what does "mtd/maps" means for? 

mtd/devices are complete standalone device drivers for MTD devices.

mtd/maps contains 'mapping' drivers which provide just access to the bus on 
which memory chips reside. The actual chip drivers are in mtd/chips. Those 
are only for memory-mapped chips though, not NAND chips.


--
dwmw2
