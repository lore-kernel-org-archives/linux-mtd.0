Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Grt7-0006OR-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 00:43:57 +0100
Received: from cr355197-a.poco1.bc.wave.home.com ([24.112.113.88] helo=whiskey.fireplug.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Grt6-0006OL-00
	for mtd@infradead.org; Tue, 25 Jul 2000 00:43:56 +0100
Received: from sl by whiskey.fireplug.net with local (Exim 3.13 #2)
	id 13Grt3-0003SW-00
	for mtd@infradead.org; Mon, 24 Jul 2000 16:43:53 -0700
To: mtd@infradead.org
From: sl@whiskey.fireplug.net (Stuart Lynne)
Subject: Re: building M-Sys DOC driver as a module
Date: 24 Jul 2000 16:43:53 -0700
Message-ID: <8likbp$cvi$1@whiskey.fireplug.net>
References: <Pine.LNX.4.21.0007211654230.22633-100000@alpha1.cygnus.co.uk>
Reply-To: sl@fireplug.net
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In article <Pine.LNX.4.21.0007211654230.22633-100000@alpha1.cygnus.co.uk>,
David Woodhouse <dwmw2@alpha1.cygnus.co.uk> wrote:
>On Fri, 21 Jul 2000, Trevor Woolven wrote:
>
>> Ok, IMHO using an initrd doesn't actually cost you too much, the bulk
>> of it is used to store the kernel which has to go somewhere, right? I
>> haven't done a comparison on the relative sizes of a kernel with the
>> driver compiled in vs one without to measure what the difference is
>> but that would be quite a simple thing to do - especially if space was
>> getting tight.
>
>initrd requires block deive support. I want to cut that entirely, too.

Hmmm... for what, are you thinking RAM Disk....

I hope to get the initrd support working against ramfs sometime this summer.

-- 
                                            __O 
Fireplug - a Lineo company                _-\<,_ 
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00 (_)/ (_) 88 EC A3 EE 2D 1C 15 68
Stuart Lynne <sl@fireplug.net>       www.fireplug.net        604-461-7532


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
