Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H6PA-0000aR-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 16:14:00 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H6P6-0000aL-00
	for mtd@infradead.org; Tue, 25 Jul 2000 16:13:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000725072959.B15029@fruits.uzix.org> 
References: <20000725072959.B15029@fruits.uzix.org>  <Pine.LNX.4.21.0007241657220.18380-100000@vvv.axis.se> <31773.964517387@cygnus.co.uk> 
To: Philipp Rumpf <prumpf@uzix.org>
Cc: Finn Hakansson <finn@axis.com>,
  "Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
  "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 16:12:11 +0100
Message-ID: <6960.964537931@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


prumpf@uzix.org said:
>  I disagree with queueing nodes - just updating a "which byte ranges
> of the file have been modified" list should be both simpler and allow
> more efficient write merging/compression. 

OK. As long as we're aware of the possibility that a certain byte range 
could be changed _again_ in a different transaction. 

i.e.	pwrite(fd, "aaaaaaaaa", 10, 0);
	pwrite(fd, "bbbbbbbbb", 10, 5);

If you're not going to take a copy of data in the first write, but just 
keep it in the page cache and remember where it is, then you cannot write 
that transaction unless you combine it with the second one. 

That is - you _must_ combine the two into a single node write. It's not 
just an optimisation. If you were to write "aaaaabbbbb" to the beginning of 
the file and lose power before writing the rest of the 'bbbbb', I believe 
you're violating POSIX by having non-atomic write().

So if you're going to write data to the flash directly from the page cache, 
you have to have some lock in place which prevents anything else from 
dirtying it during the mtd_write() call.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
