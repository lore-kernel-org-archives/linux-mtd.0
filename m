Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148NdF-0001S5-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 14:20:45 +0000
From: dr john halewood <john@frumious.unidec.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: MTD module compilation (was: [PATCH] link time error in drivers/mtd (240t13p2))
Date: Tue, 19 Dec 2000 14:20:12 +0000
Content-Type: text/plain;
  charset="US-ASCII"
References: <Pine.LNX.4.30.0012171158140.14423-100000@imladris.demon.co.uk>
In-Reply-To: <Pine.LNX.4.30.0012171158140.14423-100000@imladris.demon.co.uk>
Cc: mtd@infradead.org
MIME-Version: 1.0
Message-Id: <00121914201204.01244@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sunday 17 December 2000 12:04, David Woodhouse wrote to linux-kernel:
> On Sun, 17 Dec 2000, Keith Owens wrote:
> > Your choice.  Just bear in mind that if CONFIG_MODULES=y but mtd
> > objects are built into the kernel then mtd _must_ have a correct link
> > order.  Consider a config with CONFIG_MODULES=y but every mtd option is
> > set to 'y', link order is critical.
>
> Yep, I'd just noticed that one. The patch was actually put in by someone
> to fix 2.0 compilation - and I noticed that it made the link order
> problem go away for certain configs.
>
[cc'ed to mtd list as it might help a few people there]
heh. 
  I'm glad this has come up as I think I got bitten by this a couple of weeks 
ago, but didn't realise it at the time. For various reasons to do with 
avoiding using initrd's I'd built a kernel that was modular, but had doc2000 
and nftl loaded statically - other mtd stuff was loaded as modules. My 
Millenium chip behaved like the proverbial stick - data wouldn't stick to it, 
certainly not across reboots. Then I came in one morning to find the screen 
slowly scolling the following message:
NFTL - writeblock(): Cannot find block to write to
end_request: I/O error, dev 5d:01 (unknown), sector 256
Tell Dave he fucked up. LastFreeEUN = 1023, FirstEUN=10765
No Virtual Unit Chains available for folding. Failing request.
[This will teach me not to run mke2fs from 5 miles away!]

I guess this must have been caused by incorrect ordering of the modules, as a 
recompilation of the kernel and linking everything as modular has left it 
working fine [This was using 2.2.17 + the merged doc2000 w/Millenium support 
from the 30/11 snapshot and from cvs since, although I've now jumped to 
2.4.0-test12 without any problems]

If anyone else has had this problem I would suggest this as a solution

cheers
john


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
