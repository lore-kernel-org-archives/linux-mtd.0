Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13rHJk-0002UK-00
	for mtd-list@infradead.org; Thu, 02 Nov 2000 10:09:56 +0000
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13rHJj-0002UE-00
	for mtd@infradead.org; Thu, 02 Nov 2000 10:09:55 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A005A52.E95F536@dawning.com> 
References: <3A005A52.E95F536@dawning.com> 
To: Gregory Schallert <gschallert@dawning.com>
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: mtdblock module & I'm Back again 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 02 Nov 2000 10:09:52 +0000
Message-ID: <3593.973159792@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


gschallert@dawning.com said:
>  2)  What does mtdblock.c actually do? If I load mtd.o, mapped.o, and
> mtdblock.o  what additional functionality do I need to program to get
> a minix file system on the flash chips?

You don't need 'mapped.o' which is going to go away fairly shortly.

You need to ensure that 'jedec.c' both works and supports the interleaved 
arrangement of your flash chips. 

Then you need to provide a 'map' driver through which it can access the 
chips. If the flash chips are linearly mapped into your physical address 
space, then physmem.c is a good place to start.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
