Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H5ie-0000HZ-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 15:30:04 +0100
Date: Tue, 25 Jul 2000 07:29:59 -0700
From: Philipp Rumpf <prumpf@uzix.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Finn Hakansson <finn@axis.com>,
	"Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
	"mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write
Message-ID: <20000725072959.B15029@fruits.uzix.org>
References: <Pine.LNX.4.21.0007241657220.18380-100000@vvv.axis.se> <31773.964517387@cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <31773.964517387@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Jul 25, 2000 at 10:29:47AM +0100, David Woodhouse wrote:
> I'm been thinking about this, and about the problems with garbage collection
> taking to long. What about shifting all node writes into a kernel thread,
> which also does the GC?
> 
> The jffs_file_write() function then only needs to queue the node(s) to be 
> written, and can return immediately. Obviously we have to implement a way 
> of flushing a particular file, but that shouldn't be too difficult.

I disagree with queueing nodes - just updating a "which byte ranges of the
file have been modified" list should be both simpler and allow more efficient
write merging/compression.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
