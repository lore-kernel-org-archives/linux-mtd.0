Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12U8Mc-00013U-00
	for mtd-list@infradead.org; Sun, 12 Mar 2000 13:24:58 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12U8Mb-00013O-00
	for mtd@infradead.org; Sun, 12 Mar 2000 13:24:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38C93233.A1AC0566@zentropix.com> 
References: <38C93233.A1AC0566@zentropix.com> 
To: Trevor Woolven <trevw@zentropix.com>
Cc: MTD <mtd@infradead.org>
Subject: Re: Reviving DiskOnChip 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 12 Mar 2000 13:24:56 +0000
Message-ID: <20509.952867496@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


trevw@zentropix.com said:
> Err, anybody know the spells and incantations required to bring a
> DiskOnChip back to life? 

ISTR I found that dformat /win:e400 /s:doc110.exb did it for me on at least 
one occasion.

If you're stuck, grab a good one, and take a complete image of it using the 
/dev/mtd0 device (see nanddump.c for inspiration). Copy that onto your broken 
one.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
