Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143JUl-0000Bt-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 14:55:03 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143JUj-0000Bn-00
	for mtd@infradead.org; Tue, 05 Dec 2000 14:55:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0012050749450.20717-100000@mini.acl.lanl.gov> 
References: <Pine.LNX.4.21.0012050749450.20717-100000@mini.acl.lanl.gov> 
To: Ronald G Minnich <rminnich@lanl.gov>
Cc: Ian <Relativity@HumanHeuristic.com>, ollie@sis.com.tw,
    mtd@infradead.org, linuxbios@lanl.gov
Subject: Re: Problems with r/w on mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Dec 2000 14:54:23 +0000
Message-ID: <32011.976028063@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rminnich@lanl.gov said:
>  I've had this happen. Don't worry about it.  

If you writing stuff to the mtdblock device and then reboot immediately, 
you may be rebooting before the kernel thread actually completes the write.
I'm not sure if it makes you wait on close() or not. P'raps it should.

Using doc_loadbios on the chardevice should be reliable.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
