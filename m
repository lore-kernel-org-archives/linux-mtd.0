Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13WO6G-000233-00
	for mtd-list@infradead.org; Tue, 05 Sep 2000 20:09:40 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13WO6D-00022w-00
	for mtd@infradead.org; Tue, 05 Sep 2000 20:09:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F0AC@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F0AC@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: offsetting fmc->flash_start to accommodate the BIOS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Sep 2000 20:09:25 +0100
Message-ID: <2667.968180965@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
> in jffs_fm.c, line 53, flash_start is set to 0.  Will the flash code
> still work if flash_start is set to some other value?  I realize that
> flash_size would also need to be modified.

I haven't tried it. 

> Or is there some better way to set up MTD/JFFS for a CFI flash chip
> that has both BIOS and the root filesystem on it?

Partition them into two separate MTD devices. See pnc2000.c


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
