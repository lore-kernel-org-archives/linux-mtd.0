Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QBAL-00074Z-Hs
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 20:21:50 +0100
Received: from aquaman (foobar@russ.gothicfury.com [65.39.81.227])
	h5BJMLV86107	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 12:22:21 -0700 (MST)
	(envelope-from Russ.Dill@asu.edu)
From: Russ Dill <Russ.Dill@asu.edu>
To: Pantelis Antoniou <panto@intracom.gr>
In-Reply-To: <3EE6FC72.10107@intracom.gr>
References: <4A3DE310-9BEB-11D7-B76F-000393AD6294@regolith.co.uk>
	 <3EE6FC72.10107@intracom.gr>
Message-Id: <1055359356.896.38.camel@russ>
Mime-Version: 1.0
Date: 11 Jun 2003 12:22:36 -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: Cram FS on NAND - How to do this?
Reply-To: Russ.Dill@asu.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> I'm talking about a read only filesystem, and generating
> the bad block info at mount time.
> 
> Perhaps I could also use some kind of lazy bad block scanning technique
> in which the list would only be generated up to point where
> someone requested a read.
> 
> Well, and if a block goes bad what was written as good there
> is nothing any filesystem can do but die complaining.

Bad blocks would be generated at FS creation time, but as time goes on,
some blocks may start going bad. May not be important for 5 or 6
devices, but when you go into production with 100+ devices, this would
become important. Once a block goes bad, but the data is recoverable
with ECC, you'd want to relocate the block at the end of the FS and note
it somehow..

or not:

An index is in each oob, for the first n (where n is the size of the FS)
blocks, the index is just the block number. After that, if a block is
found bad while writing the FS, or during usage, that block is rewritten
past the end of the FS in the "reserve area" with the index number of
that block.

At mount time, the only scanning that would need to be done is in the
reserve area.


-- 
Russ Dill <Russ.Dill@asu.edu>
