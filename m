Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QNMm-0001Og-7P
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 09:23:28 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5C8QID19150
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 11:26:18 +0300 (EEST)
Message-ID: <3EE83840.7000807@intracom.gr>
Date: Thu, 12 Jun 2003 11:22:24 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: Russ.Dill@asu.edu
References: <4A3DE310-9BEB-11D7-B76F-000393AD6294@regolith.co.uk>
	<3EE6FC72.10107@intracom.gr> <1055359356.896.38.camel@russ>
In-Reply-To: <1055359356.896.38.camel@russ>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Russ Dill wrote:

>>I'm talking about a read only filesystem, and generating
>>the bad block info at mount time.
>>
>>Perhaps I could also use some kind of lazy bad block scanning technique
>>in which the list would only be generated up to point where
>>someone requested a read.
>>
>>Well, and if a block goes bad what was written as good there
>>is nothing any filesystem can do but die complaining.
>>    
>>
>
>Bad blocks would be generated at FS creation time, but as time goes on,
>some blocks may start going bad. May not be important for 5 or 6
>devices, but when you go into production with 100+ devices, this would
>become important. Once a block goes bad, but the data is recoverable
>with ECC, you'd want to relocate the block at the end of the FS and note
>it somehow..
>  
>
I am aware of the problem when going into production with a large
number of devices.

I'm not really sure however about how widespread the problem will that be.

Has anybody collected any data on the problem?
How often does it happen to write a block to the chip, verify that it was
written correctly without ecc errors, and then happen to read it
back with one bit error.

>or not:
>
>An index is in each oob, for the first n (where n is the size of the FS)
>blocks, the index is just the block number. After that, if a block is
>found bad while writing the FS, or during usage, that block is rewritten
>past the end of the FS in the "reserve area" with the index number of
>that block.
>
>At mount time, the only scanning that would need to be done is in the
>reserve area.
>
>
Hey, that is clever.
I'll see what I can do..

Regards

Pantelis
