Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13iYul-00077s-00
	for mtd-list@infradead.org; Mon, 09 Oct 2000 10:08:07 +0100
Received: from dyna252.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13iYuj-00077m-00
	for mtd@infradead.org; Mon, 09 Oct 2000 10:08:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13b8d0-00005Y-00@mrvdom01.kundenserver.de> 
References: <E13b8d0-00005Y-00@mrvdom01.kundenserver.de> 
To: Volker Sonn <mlist@sonn-online.de>
Cc: mtd@infradead.org
Subject: Re: Grub support in DiskOnChip. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Oct 2000 10:07:42 +0100
Message-ID: <31530.971082462@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mlist@sonn-online.de said:
>  After rebooting, the grub shell comes up, but i can't access the DOC
> with something like  root (dc0,0) etc. (Booting from (hd0) is
> possible)

> Where I'm wrong ? 

Doesn't look like you did anything wrong. What did Grub say when you told 
it root=(dc0,0) ?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
