Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H12Q-0007cF-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 10:30:10 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H12J-0007by-00
	for mtd@infradead.org; Tue, 25 Jul 2000 10:30:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0007241657220.18380-100000@vvv.axis.se> 
References: <Pine.LNX.4.21.0007241657220.18380-100000@vvv.axis.se> 
To: Finn Hakansson <finn@axis.com>
Cc: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
  "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 10:29:47 +0100
Message-ID: <31773.964517387@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


finn@axis.com said:
>  Yeah. One day, write and rewrite should be merged into one single
> function... 

I'm been thinking about this, and about the problems with garbage collection
taking to long. What about shifting all node writes into a kernel thread,
which also does the GC?

The jffs_file_write() function then only needs to queue the node(s) to be 
written, and can return immediately. Obviously we have to implement a way 
of flushing a particular file, but that shouldn't be too difficult.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
