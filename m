Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ADY8-0006gS-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 16:26:48 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13ADY7-0006gM-00
	for mtd@infradead.org; Thu, 06 Jul 2000 16:26:47 +0100
Date: Thu, 6 Jul 2000 17:26:45 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
cc: mtd@infradead.org
Subject: Re: jffs super block
In-Reply-To: <3962EBC0.F16A20AF@evoserve.com>
Message-ID: <Pine.LNX.3.96.1000706172502.21544A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 5 Jul 2000, Rogelio M. Serrano Jr. wrote:

> Does the jffs also have a super block on disk?
> 
> I have been trying to use jffs on DOC but i just cant get it to mount.
> The jffs code could not find a single valid jffs inode on the DOC and
> then dumps the disk data and then hang when I mount it after i dd a jffs
> image to the it. The second time I boot I dont get any kind of output
> anymore and my machine hangs. For starters, How should I write the jffs
> file system on the DOC then? Should  I add a superblock on the chip?

No, jffs doesn't have a superblock. I usually just cat
my_filesystem_image > /dev/mtd0, but an empty mtd device should work as
well.

The hang seems strange though.

/ Alex






To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
