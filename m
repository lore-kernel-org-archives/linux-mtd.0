Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H6ZC-0000eU-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 16:24:22 +0100
Date: Tue, 25 Jul 2000 08:24:17 -0700
From: Philipp Rumpf <prumpf@uzix.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Finn Hakansson <finn@axis.com>,
	"Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
	"mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write
Message-ID: <20000725082417.C15029@fruits.uzix.org>
References: <20000725072959.B15029@fruits.uzix.org> <Pine.LNX.4.21.0007241657220.18380-100000@vvv.axis.se> <31773.964517387@cygnus.co.uk> <20000725072959.B15029@fruits.uzix.org> <6960.964537931@cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6960.964537931@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Jul 25, 2000 at 04:12:11PM +0100, David Woodhouse wrote:
> OK. As long as we're aware of the possibility that a certain byte range 
> could be changed _again_ in a different transaction. 
> 
> i.e.	pwrite(fd, "aaaaaaaaa", 10, 0);
> 	pwrite(fd, "bbbbbbbbb", 10, 5);
> 
> If you're not going to take a copy of data in the first write, but just 
> keep it in the page cache and remember where it is, then you cannot write 
> that transaction unless you combine it with the second one. 
> 
> That is - you _must_ combine the two into a single node write. It's not 
> just an optimisation. If you were to write "aaaaabbbbb" to the beginning of 
> the file and lose power before writing the rest of the 'bbbbb', I believe 
> you're violating POSIX by having non-atomic write().

prepare_write can look like this:

	if(try_to_abort_pending_conflicting_writes_fails()) {
		sleep until the writes happened;
	} else {
		reschedule merged writes;
	}

I'm not actually sure there's a POSIX requirement to do this - as long as
the fs doesn't crash the page cache will keep our view of it consistent.

BTW, the simplistic implementation would simply add

	__u32 first_modified_byte;
	__u32 last_modified_byte;

to jffs_file and keep track of only one range that has been modified - it
should work well enough for the common case (non-conflicting consecutive
writes) and we can easily detect the cases in which it doesn't work and
fall back to sleeping until the write are finished.

> So if you're going to write data to the flash directly from the page cache, 
> you have to have some lock in place which prevents anything else from 
> dirtying it during the mtd_write() call.

If all writes are done by one thread that shouldn't be necessary.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
