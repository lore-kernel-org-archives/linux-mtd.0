Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vfE5-0004Ql-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 11:25:41 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vfE4-0004Qf-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 11:25:40 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01BF4176.8754EF20.mdeans@algonet.se> 
References: <01BF4176.8754EF20.mdeans@algonet.se> 
To: Bjorn Eriksson <mdeans@algonet.se>
Cc: MTD list <mtd@imladris.mvhi.com>
Subject: Re: noatime mount option (Was: Power Down) 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 08 Dec 1999 11:26:56 +0000
Message-Id: <E11vfFI-0002n7-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


mdeans@algonet.se said:
>  Do you know in what kernel version this was added? I didn't find it
> in 2.0.30.

It's probably in 2.0.latest - the 2.0 series had lots of features added to it. 
If not, maybe it's available as a separate patch. It should also be in 2.2

I believe there's also some way of doing it per-directory.

> P.s Whats with iso-8859-15? D.s 

Err... we got a batch of new keyboards with the ¤ (euro) sign on them, so I 
played about with exmh till it could use it. My tests seemed to show that most 
mailreaders which couldn't handle 8859-15 would revert to 8859-1 when reading 
those mails, so I didn't bother to change it back.

 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
