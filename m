Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136wKA-0002ga-00
	for mtd-list@infradead.org; Tue, 27 Jun 2000 15:26:50 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 136wK8-0002gU-00
	for mtd@infradead.org; Tue, 27 Jun 2000 15:26:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E136wFv-0002er-00@infradead.org> 
References: <E136wFv-0002er-00@infradead.org> 
To: rmoya@tsai.es
Cc: mtd@infradead.org
Subject: Re: problems compiling 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Jun 2000 15:29:23 +0100
Message-ID: <5559.962116163@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rmoya@tsai.es said:
> mtdcore.c:77: warning: `DECLARE_MUTEX' declared `static' but never defined 

You are using an old version of the kernel. Update to 2.2.16 for various 
reasons. If you really can't do that then you can at least make MTD compile 
by nabbing include/linux/compatmac.h from 2.2.16 and putting it in place.


rmoya@tsai.es said:
>  Looking at the sources, I've seen that the DECLARE_MUTEX is declared
> in the sysdep-2.2.h file, but into a:

We're not using the sysdep-2.2.h file any more. The compatibility macros 
have been included into the 2.2.16 kernel.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
