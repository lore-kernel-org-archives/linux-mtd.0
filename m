Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SjPA-0000GD-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 17:38:20 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SjP9-0000G7-00
	for mtd@infradead.org; Tue, 13 Feb 2001 17:38:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A89758C.74FD4C74@danielind.com> 
References: <3A89758C.74FD4C74@danielind.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: mtd <mtd@infradead.org>
Subject: Re: cfi_probe module usage count when insmod physmap.o fails 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 17:38:14 +0000
Message-ID: <9808.982085894@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
>  I solved the problem with an extra line in physmap.c right before it
> exits because do_cfi_probe() failed that decrements the cfi_probe
> module usage count as thus:

>  inter_module_put("cfi_probe");

Probably right. It was all working fine when it was using 
get_module_symbol(). Now, I think I'm going to just give up and switch over 
to hard dependencies on the symbols. 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
