Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ityR-0004oM-00
	for mtd-list@infradead.org; Tue, 10 Oct 2000 08:37:19 +0100
Received: from dyna252.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ityP-0004oG-00
	for mtd@infradead.org; Tue, 10 Oct 2000 08:37:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NGEOJGOCFAFNCNKEIJMLGEBLCAAA.dlwilson@crossmatch.net> 
References: <NGEOJGOCFAFNCNKEIJMLGEBLCAAA.dlwilson@crossmatch.net> 
To: "Dave Wilson" <dlwilson@crossmatch.net>
Cc: mtd@infradead.org
Subject: Re: compile difficulty, infradead ftp server not responding 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 10 Oct 2000 08:36:36 +0100
Message-ID: <5328.971163396@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


The source in CVS should compile. You need a kernel newer than 2.2.5 - more 
specifically you need the linux/include/linux/compatmac.h file which was 
introduced circa 2.2.16, IIRC. Just nicking that file and dropping in to 
your 2.2.5 kernel should suffice, but you would do better to upgrade your 
kernel to something that isn't remotely killable. 

The FTP server is down because of yet another wu-ftpd exploit. I'm waiting 
for the RH erratum to be released. Daily snapshots of the CVS tree should 
be available on ftp.uk.linux.org.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
