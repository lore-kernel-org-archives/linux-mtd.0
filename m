Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12AsoK-0003Oz-00
	for mtd-list@infradead.org; Wed, 19 Jan 2000 10:58:00 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12AsoJ-0003Ot-00
	for mtd@infradead.org; Wed, 19 Jan 2000 10:57:59 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
References: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
To: Pavel Roskin <pavel_roskin@geocities.com>
Cc: mtd@infradead.org
Subject: mtd-20000119 release
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Jan 2000 11:07:18 +0000
Message-Id: <E12AsxK-0001dS-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


pavel_roskin@geocities.com said:
>  That all for today. Don't hesitate to put a new diff on the website.
> This will save time and labor of people interested in getting your
> stuff working on PowerPC. 

I've included your patches, with the exception of the change from switch() to 
if-else chains, along with the other stuff I've changed or been sent.

I think that I've also applied any other patches which I've been send - if 
anyone else has sent me stuff which I've omitted - I'm sorry, let me know 
and I'll apply them.

I'm waiting for a response on l-k and from Paul before I make a final 
judgement on the switch() stuff, but I'm inclined to believe that we were 
doing the right thing, and that it's the PPC swab macros which are buggy 
because they don't handle constant expressions properly.

If it's not fixable any other way, I'd rather fix it by changing to:

 switch(le16_to_cpu(status)) {
	case BLOCK_FREE:

than by changing to if-else chains. I had it like that in the first place, in 
fact - but swapped it round as an optimisation - because I believed that the 
swap would then be done at compile-time rather than at run time.

I still believe that's what _should_ happen.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
