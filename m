Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1200Ca-0006OB-00
	for mtd-list@infradead.org; Mon, 20 Dec 1999 10:38:04 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 1200CZ-0006O5-00
	for mtd@infradead.org; Mon, 20 Dec 1999 10:38:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.9912190002590.14262-100000@localhost.localdomain> 
References: <Pine.LNX.4.10.9912190002590.14262-100000@localhost.localdomain> 
To: Adi Linden <adi@adis.on.ca>
Cc: mtd@infradead.org
Subject: Re: doc2000 and mtd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 20 Dec 1999 10:41:38 +0000
Message-Id: <E1200G2-0007D5-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


adi@adis.on.ca said:
>  What am I doing wrong? 

Nothing. You don't need to load the mtdblock driver, but that shouldn't be 
making anything go wrong.

It's going to be a bug in the driver. What size is the DiskOnChip? Can you 
send me the entire kernel log (from dmesg not from syslogd)

Can you also try it without rebooting - after unmounting the NFTL, run 'sync' 
a few times, then unload the nftl module and reload it again. See if it's happy then.

There are two possibilities - one is that it's not syncing fast enough and 
that you're rebooting it too quickly. That wouldn't be your fault, but would 
be a symptom of two separate bugs: Firstly a bug in the release() routine 
which is supposed to sync the device before returning. Secondly, and more 
importantly, a bug in the NFTL code which is supposed to leave the device in a 
valid and recoverable state at all time.

Alternatively, it could just be a bug in my NFTL code, which leaves the 
NFTL filesystem in a state which isn't valid whether you interrupt it or not :)

Either way, I'm going to need you to take dumps of the filesystem both before 
and after mounting it - if you work out a way to reproduce this reliably, 
without rebooting, and with as few steps as possible (like mount a clean 
filesystem, untar as small a tar file as you need to cause the problem, 
unmount), that'd be extremely useful.

Thanks for the bug report.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
