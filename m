Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15IV2n-0006Ge-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2001 13:49:13 +0100
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA0A3B8F@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: 'Vipin Malik' <vipin.malik@daniel.com>, 'David Woodhouse'
	 <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: mtd-JFFS2 HowTo doc
Date: Fri, 6 Jul 2001 07:53:20 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1252"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Given that I've only been on the list a few days, I guess I'd better ask...

OK, so what are the porting issues to make JFFS2 work under a 2.2.x kernel? 
If it gets too involved I may be further ahead attempting to port the 2.4.x 
kernel myself to the MIPS (maybe the existing startup code will do) and then

compile JFFS2 into it.

I'm assuming that conceptually this thing has a platform (OS) isolation
layer 
and a hardware abstraction layer. The HAL must apparently support different
Flash devices. 

-> -----Original Message-----
-> From: Vipin Malik [mailto:vipin.malik@daniel.com]
-> Sent: Thursday, July 05, 2001 3:52 PM
-> To: Siders, Keith
-> Cc: linux-mtd@lists.infradead.org
-> Subject: Re: mtd-JFFS2 HowTo doc
-> 
-> 
-> > We have
-> > a port of the 2.4.x kernel to our target arriving in the fall.
-> > Anything in particular to get JFFS2 working under 2.2.x?
-> 
-> If I remember David's email a few days back, getting JFFS2 
-> to work under
-> 2.2.x needs "some porting".
-> That was news to me, as I assumed that JFFS2 also works under 2.2.x
-> I've been testing it under 2.4.x due to module issues (and 
-> that's what I
-> intend to use anyway).
-> 
-> Vipin
-> 
-> 
