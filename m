Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12AUju-0002WB-00
	for mtd-list@infradead.org; Tue, 18 Jan 2000 09:15:50 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12AUjt-0002W5-00
	for mtd@infradead.org; Tue, 18 Jan 2000 09:15:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
References: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com> 
To: Pavel Roskin <pavel_roskin@geocities.com>
Cc: mtd@infradead.org
Subject: Re: Patch for PowerPC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Jan 2000 09:24:56 +0000
Message-Id: <E12AUsi-0008B9-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


pavel_roskin@geocities.com said:
> That all for today. Don't hesitate to put a new diff on the website.
> This will save time and labor of people interested in getting your
> stuff working on PowerPC.

Excellent work - thanks. I'll try to get an updated release out by the end of 
the week, or early next week at the latest.

I'll also upgrade CVS on our server - all the workstations have been upgraded 
to Red Hat 6.1, but the server is still on 5.2 because we haven't had the 
courage to upgrade it yet - hence it still has an old version of CVS.

As it takes a little more thought than just rpm --rebuild of the RH6.1 SRPM, 
that failed too - hopefully I'll get some time to sort it out this week too.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
