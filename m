Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ndJE-0003Sj-00
	for mtd-list@infradead.org; Fri, 05 May 2000 09:18:04 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ndJC-0003Sd-00
	for mtd@infradead.org; Fri, 05 May 2000 09:18:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200005041741.NAA23266@home.welcomehome.org> 
References: <200005041741.NAA23266@home.welcomehome.org> 
To: Paonia Ezrine <paonia@home.welcomehome.org>
Cc: mtd@infradead.org
Subject: Re: read only 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 May 2000 09:22:26 +0100
Message-ID: <32036.957514946@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


paonia@home.welcomehome.org said:
> I am not sure how I would update the image then. And also garentee
> that noone else can. 

Presumably, when you wanted to update the image, you'd boot a different 
kernel - one which has full read/write support. You can't _guarantee_ that 
your attacker won't reboot the system onto the same kernel, but it's 
certainly far less likely, and far more detectable.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
