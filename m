Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 146z9e-0001li-00
	for mtd-list@infradead.org; Fri, 15 Dec 2000 18:00:26 +0000
Received: from [195.224.55.237] (helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 146z9d-0001lZ-00
	for mtd@infradead.org; Fri, 15 Dec 2000 18:00:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A3A5B80.1B8A2C06@mvista.com> 
References: <3A3A5B80.1B8A2C06@mvista.com>  <Pine.LNX.4.30.0012141454510.3311-100000@xanadu.gn.com> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: Nicolas Pitre <nico@cam.org>, mtd@infradead.org
Subject: Re: 2.4 stuff. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Dec 2000 17:59:41 +0000
Message-ID: <21490.976903181@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ahennessy@mvista.com said:
>  I've made some  minor local changes so that both cfi_cmdset_0002.c
> and cfi_probe.c work for my big endian, 4 byte AMD flash board.   I
> can carry it further by making it more like cfi_cmdset_0001.c  if you
> need a volunteer and don't need it by tomorrow  :-) 

Thanks, that'll be useful. I'll be looking at it soon, but I haven't 
managed to get this board to respond to the CFI probe yet, so I'm not sure 
when I'll get to do it. Hopefully soon.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
