Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 149UoY-0002q8-00
	for mtd-list@infradead.org; Fri, 22 Dec 2000 16:13:02 +0000
Received: from dhcp07.ncipher.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 149UoX-0002q2-00
	for mtd@infradead.org; Fri, 22 Dec 2000 16:13:01 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: CFI ident problems with AMD chips.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Dec 2000 16:12:30 +0000
Message-ID: <4883.977501550@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I've now started using AMD chips. I have a chip which I believe to be a 
4MiB part with TOP boot blocks. Should be 63*64KiB erase regions followed by 
8*8KiB erase regions.

However, the CFI "Erase Block Region" information reports them in the wrong 
order - the 8*8KiB blocks _before_ the 63*64KiB.

Is there some way to tell the top-boot parts apart from the bottom-boot 
parts?

--
dwmw2






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
