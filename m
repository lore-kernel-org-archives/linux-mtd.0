Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13M46h-0003wk-00
	for mtd-list@infradead.org; Tue, 08 Aug 2000 08:47:27 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13M46g-0003we-00
	for mtd@infradead.org; Tue, 08 Aug 2000 08:47:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <398F1287.E29C8ECE@matrox.com> 
References: <398F1287.E29C8ECE@matrox.com> 
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
Cc: mtd@infradead.org
Subject: Re: get_module_symbol / put_module_symbol 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 08 Aug 2000 08:47:23 +0100
Message-ID: <31647.965720843@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


scote1@Matrox.COM said:
>  I want to compile MTD builtin in the kernel but the usage of
> get_module_symbol and put_module_symbol makes it impossible at the
> moment.  I grepped -r 'put_module_symbol' in linux/drivers/* for linux
> 2.2.16 and MTD was the only driver using it.  I'm not sure how this
> should be replaced but I'd really like to get rid of it. 

There's a fairly small patch to add put_module_symbol() to the 2.2 kernel, 
and to change the behaviour of get_module_symbol() accordingly - to make it 
match the 2.4 versions.

If you can come up with a better way to handle use counts, feel free.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
