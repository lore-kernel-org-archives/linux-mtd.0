Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143w6c-0000jM-00
	for mtd-list@infradead.org; Thu, 07 Dec 2000 08:08:42 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143w6a-0000jG-00
	for mtd@infradead.org; Thu, 07 Dec 2000 08:08:40 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A2ED2CA.14522213@echostar.com> 
References: <3A2ED2CA.14522213@echostar.com> 
To: ian.nelson@echostar.com
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: CFI Physical Mapped working? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Dec 2000 08:02:18 +0000
Message-ID: <2963.976176138@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ian.nelson@echostar.com said:
> I've been trying to get either the CFI AMD or CFI Physical Mapping to
> work with no luck.  Are there any tricks to making it work?  It
> doesn't look like any of that code is ever called.  I can load the
> modules but nothing ever happens.  I've put some printks in the
> init_module function and nothing ever prints. 

There's no known reason why it shouldn't work. 

init_physmap() ought to autoload the cfi_probe module, which in turn will 
autoload the cfi_cmdset_0002 module if it finds an appropriate chip. 

You may find it's best to write a custom map driver instead of the physmap 
driver, which handles the chip select line for you.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
