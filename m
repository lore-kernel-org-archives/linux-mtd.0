Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b0du-0000Fx-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 13:39:46 +0000
Received: from [207.206.34.25] (helo=penguin.theopalgroup.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14b0ds-0000EV-00
	for mtd@infradead.org; Thu, 08 Mar 2001 13:39:44 +0000
Received: from localhost (jacobs@localhost)
	by penguin.theopalgroup.com (8.11.0/8.11.0) with ESMTP id f28DcAv07846
	for <mtd@infradead.org>; Thu, 8 Mar 2001 08:38:10 -0500
Date: Thu, 8 Mar 2001 08:38:10 -0500 (EST)
From: Kevin Jacobs <jacobs@penguin.theopalgroup.com>
To: mtd@infradead.org
Subject: Oh, the many joys of MTD...
Message-ID: <Pine.LNX.4.21.0103080809310.7682-100000@penguin.theopalgroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello everyone!

  I'm new to working on MTD and would like to start by thanking everyone who
has contributed to it.  Its a fine addition to Linux and has made my life
much easier.  However, I am having a few problems and was hoping for some
kinds souls to enlighten me a little.

Let me also say that I am somewhat new to hardware driver development and
have some rather odd gaps in my knowledge.

My first questions is likely something fairly basic.  I've read over much of
the MTD source and it seems that many of the erase and write functions do
not deal with concurrent access and CPU cache issues.  What happens when a
{read,write,erase} request comes in for a sector that is being
{written,erased}?

Also, is it assumed that the memory mapped for MTD devices will not be
cached by the CPU?  If so, is it feasible to add support.  If not, where is
code to flush/update the cache after a write or erase operation?

Thanks,
-Kevin

--
Kevin Jacobs
The OPAL Group - Enterprise Systems Architect
Voice: (216) 986-0710 x 19         E-mail: jacobs@theopalgroup.com
Fax:   (216) 986-0714              WWW:    http://www.theopalgroup.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
