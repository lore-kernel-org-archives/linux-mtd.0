Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13EzHd-0006Bo-00
	for mtd-list@infradead.org; Wed, 19 Jul 2000 20:13:29 +0100
Date: Wed, 19 Jul 2000 20:13:28 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
cc: mtd@infradead.org
Subject: Re: jffs_file_write and DOC
In-Reply-To: <3975038D.40CF3B90@evoserve.com>
Message-ID: <Pine.LNX.4.10.10007192010540.23491-100000@infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 19 Jul 2000, Rogelio M. Serrano Jr. wrote:

> I observed that the jffs_file_write function misbehaves when given a
> chunk bigger than MAX_CHUNK_SIZE. It is passed a chunk exactly equal to
> MAX_CHUNK_SIZE so when it adds the inode and the name the resulting
> chunk in is more or less 60 bytes bigger than MAX_CHUNK_SIZE which is
> 4096 bytes in my case with the DOC2000.
> 
> Cat just writes a file shorter than it should be on flash. I used a
> modified DOC_loadbios utility to download my JFFS images to the DOC. If
> I dont write anything to it I could mount and unmount cleanly. But when
> I write to it, I get bad checksums on the next mount and totoal mount
> failure after couple more mounts.

There's a separate problem - the DiskOnChip MTD driver doesn't currently
handle writes which aren't 512 bytes long, if I recall correcty - because
I've not actually used it with anything but NFTL yet. It may not be
JFFS' fault.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
