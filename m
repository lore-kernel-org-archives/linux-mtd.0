Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Moln-0002ud-00
	for mtd-list@infradead.org; Thu, 10 Aug 2000 10:36:59 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Moll-0002uX-00
	for mtd@infradead.org; Thu, 10 Aug 2000 10:36:57 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <20000809204516.24763.qmail@web5304.mail.yahoo.com> 
References: <20000809204516.24763.qmail@web5304.mail.yahoo.com> 
To: Juan Gonzo <kayemmess@yahoo.ca>
Cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: compile errors - missing .h? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Aug 2000 10:36:49 +0100
Message-ID: <14125.965900209@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kayemmess@yahoo.ca said:
>  I am not sure if I followed you instructions correctly, but I can't
> get the latest CVS code for JFFS to compile. 

The compiler is finding an old version of jffs.h. Did you 'cvs update' in 
or above the ~/armbuild/mtd/mtd/include/linux/ directory, or only in the 
~/armbuild/mtd/mtd/fs/jffs/ directory?

Make sure that it can find this version:
	$Id: jffs.h,v 1.11 2000/08/04 12:46:34 dwmw2 Exp $

The old version could be in ~/armbuild/linux/include/linux/jffs.h if you 
ever tried to build JFFS into the kernel.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
