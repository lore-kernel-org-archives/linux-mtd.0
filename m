Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OdX8-0006hE-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 10:33:38 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14OdX6-0006h8-00
	for mtd@infradead.org; Fri, 02 Feb 2001 10:33:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000b01c08cad$4ee427e0$4f11f2c3@drakanworkst> 
References: <000b01c08cad$4ee427e0$4f11f2c3@drakanworkst>  <001701c08be1$0c1be0f0$8412f2c3@drakanworkst> <1464.981027321@redhat.com> 
To: "Andrey Glazunov" <lhfrjgtn@peterlink.ru>
Cc: mtd@infradead.org
Subject: Re: lrp booting from M-Systems ISA flash card 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Feb 2001 10:33:22 +0000
Message-ID: <18230.981110002@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


lhfrjgtn@peterlink.ru said:
> i told about my experiment - i  boot from 1.44floppy with this ISA
> card inserted to check if any conflicts with BIOS extensions and any
> linux code - system boots OK ... is it good experiment ? 

Er... yes, that's a good experiment. Sorry, I'd missed that. The low-memory 
explanation doesn't really hold then. Can you boot from a floppy and load 
the kernel from the flash card?


lhfrjgtn@peterlink.ru said:
>  what is 'bitrot' ? 

The process whereby old code which hasn't been touched for a long time just 
seems to stop working. 

> and where can i found doc1000.c ? 

In the Linux 2.4 kernel: linux/drivers/mtd/doc1000.c. Or from my CVS tree 
if you want to patch it into 2.2.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
