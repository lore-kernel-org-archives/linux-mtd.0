Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t6Is-0000k2-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 12:20:50 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t6Ir-0000jw-00
	for mtd@infradead.org; Fri, 27 Apr 2001 12:20:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E3145911F@kolkrabbi.flaga.is> 
References: <EADB10BAC266A14A85ECBF8686A73E3145911F@kolkrabbi.flaga.is> 
To: =?iso-8859-15?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
Cc: mtd@infradead.org
Subject: Re: partitions and erase regions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 27 Apr 2001 12:20:37 +0100
Message-ID: <2043.988370437@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kd@flaga.is said:
> If you call erase at offset 0x0 for 8*8K + 15*64K only the first
> sector i.e. first 8K is erased not all 8 sectors.

Erase requests have a length in them.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
