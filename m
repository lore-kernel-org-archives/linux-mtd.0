Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OiAE-0004PY-00
	for mtd-list@infradead.org; Tue, 15 Aug 2000 15:58:02 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13OiAC-0004PS-00
	for mtd@infradead.org; Tue, 15 Aug 2000 15:58:01 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <001a01c006c6$0fc47b40$2cc809c0@zheng.redflag-linux.com> 
References: <001a01c006c6$0fc47b40$2cc809c0@zheng.redflag-linux.com> 
To: "zhengliangchen" <liangchenzheng@redflag-linux.com>
Cc: mtd@infradead.org
Subject: Re: Help me: How to support two Msys Diskonchip devices? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Aug 2000 15:57:57 +0100
Message-ID: <22451.966351477@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


liangchenzheng@redflag-linux.com said:
>    I have downloaded the latest mtd,but the error is still the same,
> After "insmod mtdcore.o" and "insmod doc2001.o" ,when I "insmod
> docprobe.o", It tell me can't find the driver.

Please run these two commands in the 'mtd/kernel' directory and send me the 
output:

grep '/* $Id:' doc*.c
grep -i docmil_init *.c

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
