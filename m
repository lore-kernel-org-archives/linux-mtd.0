Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FHvM-0000Nf-00
	for mtd-list@infradead.org; Thu, 20 Jul 2000 16:07:44 +0100
Date: Thu, 20 Jul 2000 16:07:43 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Adi Linden <adi@adis.on.ca>
cc: Trevor Woolven <trevw@zentropix.com>, Matt Hortman <mbhortman@ieee.org>,
    mtd@infradead.org
Subject: Re: building M-Sys DOC driver as a module
In-Reply-To: <Pine.LNX.4.10.10007200952440.8782-100000@develop.knet.on.ca>
Message-ID: <Pine.LNX.4.10.10007201601430.1064-100000@infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 20 Jul 2000, Adi Linden wrote:

> I'd be quite interested in the modular DOC driver as well. So far I've
> seen it talked about quite a bit but never seen it.
> 
> I produces a 2.2.14 kernel patch for the M-Systems DOC driver but that's
> in violation of GPL for a production environment...

Modular drivers and initrd are a horrible waste of space in an embedded
system, IMO. Far better to cut out module support completely, and even
also block device support, putting JFFS on the DiskOnChip instead of NFTL.

The free driver isn't far off being usable in production - there's not a
lot to do, it's just that I haven't had time to do it. Patrick is close to
having ECC support, now we just need to properly thread the NFTL code and
make it deal correctly with bad blocks, and for better efficiency, stick
in the state handling for the individual flash chips, like I did for the
CFI chips.

Trevor - Did I miss something of the TODO list that we drew up?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
