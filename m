Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14s6q4-0001a7-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 18:43:00 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14s6pz-0001Ys-00
	for mtd@infradead.org; Tue, 24 Apr 2001 18:42:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A9148@kolkrabbi.flaga.is> 
References: <EADB10BAC266A14A85ECBF8686A73E310A9148@kolkrabbi.flaga.is> 
To: =?iso-8859-15?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
Cc: mtd@infradead.org, nico@cam.org
Subject: Re: partitions and erase regions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 24 Apr 2001 18:41:10 +0100
Message-ID: <28157.988134070@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kd@flaga.is said:
> It sounds reasonable to me. Although I have a problem with the "major"
> erazesize in general. The erase regions are in the flash for a reason,
> i.e. the chip is not of one "major" erase size but of many erase
> sizes, although most of it (untill now, who knows what AMD, Intel and
> others might do in the future 8-)) is of one erase size.

I have a strong suspicion that we'll never see chips without a 'major' 
erasesize. Making all clients (such as JFFS2) deal with variable erase 
sizes is possible, but IMHO suboptimal. If we can avoid that complexity, it 
would be nice. 

Perhaps, however, we should provide a way for clients which _do_ know about 
variable erase regions to write to partitions which don't have a 'major' 
erasesize.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
