Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12lL86-0005u8-00
	for mtd-list@infradead.org; Sat, 29 Apr 2000 01:29:06 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12lL85-0005u2-00
	for mtd@infradead.org; Sat, 29 Apr 2000 01:29:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39098F75.5D8BCF7D@go2fax.com> 
References: <39098F75.5D8BCF7D@go2fax.com> 
To: Bob Canup <rcanup@go2fax.com>
Cc: MTD <mtd@infradead.org>
Subject: Re: mtd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 29 Apr 2000 01:32:16 +0100
Message-ID: <26243.956968336@server.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rcanup@go2fax.com said:
>  Make sure the code works with older kernels. Much development work on
> embedded systems is done on the proven stable 2.0 and 2.2 kernels.
> Embedded systems tend not to have bleeding edge software in them for
> reliability reasons. That is part of the reason that Alan Cox still
> turns out 2.0.x kernels.

Agreed. Making it work with 2.2 is sort of implicit - I know Trevor's 
developing on 2.2, and I try to test with 2.2 periodically. Back-porting to 
2.0 could possibly be considered a separate task.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
