Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13iuAQ-0004rE-00
	for mtd-list@infradead.org; Tue, 10 Oct 2000 08:49:42 +0100
Received: from dyna252.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13iuAP-0004r8-00
	for mtd@infradead.org; Tue, 10 Oct 2000 08:49:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5328.971163396@redhat.com> 
References: <5328.971163396@redhat.com>  <NGEOJGOCFAFNCNKEIJMLGEBLCAAA.dlwilson@crossmatch.net> 
Cc: "Dave Wilson" <dlwilson@crossmatch.net>, mtd@infradead.org
Subject: Re: compile difficulty, infradead ftp server not responding 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 10 Oct 2000 08:48:59 +0100
Message-ID: <6834.971164139@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  The FTP server is down because of yet another wu-ftpd exploit. I'm
> waiting  for the RH erratum to be released.

I'd actually forgotten about this - upon prodding the distro team it looks 
like I got the wrong end of the stick - it could cause a _client_ crash, 
not a server crash. So ftp is re-enabled.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
