Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13yGdM-0002XD-00
	for mtd-list@infradead.org; Tue, 21 Nov 2000 16:51:04 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13yGdK-0002X7-00
	for mtd@infradead.org; Tue, 21 Nov 2000 16:51:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F1D6@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F1D6@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: Debugging an oops 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Nov 2000 16:50:46 +0000
Message-ID: <628.974825446@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



mark.langsdorf@amd.com said:
>  The EIP  shows that the oops is occurring in my version of write32,
> called from vsprintf(?) and cfi_amdext_write_bytes_32,

> Aiee, killing interrupt handler
> Scheduling in interrupt

Does your map write32 function schedule? Try to obtain a semaphore?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
