Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13hCqo-0006Lr-00
	for mtd-list@infradead.org; Thu, 05 Oct 2000 16:22:26 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13hCqn-0006Ll-00
	for mtd@infradead.org; Thu, 05 Oct 2000 16:22:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13hCjo-0006JB-00@infradead.org> 
References: <E13hCjo-0006JB-00@infradead.org> 
To: bjorn@pobox.com
Cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel pmc551.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Oct 2000 16:22:30 +0100
Message-ID: <6948.970759350@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



bjorn@pobox.com said:
> The egcs-2.91.66 optimiser gets confused in pmc551.c:init_pmc551() if
> PCI support is disabled in the kernel config. 

It shouldn't be built if !CONFIG_PCI. Config.in doesn't let you enable it. 
P'raps we should do something similar for the standalone Makefile.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
