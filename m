Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12rhvM-0002gc-00
	for mtd-list@infradead.org; Tue, 16 May 2000 15:02:16 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12rhvL-0002gW-00
	for mtd@infradead.org; Tue, 16 May 2000 15:02:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0005160842540.11092-100000@sunapee.transcept.com> 
References: <Pine.LNX.4.21.0005160842540.11092-100000@sunapee.transcept.com> 
To: Pavel Roskin <pavel_roskin@geocities.com>
Cc: mtd@infradead.org
Subject: Re: List change notification. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 May 2000 15:02:14 +0100
Message-ID: <1608.958485734@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


pavel_roskin@geocities.com said:
> In fact, "Sender:" is not quite reliable. I'm using two rules, the
> above one and "Return-Path: <owner-mtd@imladris.demon.co.uk>"

It should be reliable - nothing should get out of here with a Sender yet to 
something other than owner-mtd (actually I think it doesn't set it at all, 
and removes it if it's present). The only one which isn't caught by the 
Sender rule would be....

> And yet there has been one message not recognized as coming from the
> list.

Yes - someone sent to the outgoing address; the one to which majordomo sends 
the mail after munging it, rather than to mtd@infradead.org

I should filter that off so it only accepts mail from majordomo, or just 
make it a long random string of digits and stop it from appearing in the 
Received headers.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
