Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CGlA-00072x-00
	for mtd-list@infradead.org; Wed, 12 Jul 2000 08:16:44 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13CGl9-00072r-00
	for mtd@infradead.org; Wed, 12 Jul 2000 08:16:43 +0100
Date: Wed, 12 Jul 2000 09:16:16 +0200 (CEST)
From: Finn Hakansson <finn.hakansson@axis.com>
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: inode alignment in flash
In-Reply-To: <396A1716.DD54E9C4@evoserve.com>
Message-ID: <Pine.LNX.4.21.0007120844330.30364-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 11 Jul 2000, Rogelio M. Serrano Jr. wrote:

> How should the inodes magic number be aligned in flash? On page
> boundaries? I have been using mkfs.jffs to create a jffs images. But
> after mounting it successfully after thrashing some chunks, it wont
> mount the second time i try. I notice that some chunks are discarded as
> having invalid checksums and that results in severely reduced file
> sizes. When I went over the sources, I keep on seeing blocks being
> referred to in the switch construct inside jffs_scan_flash. Magic
> numbers are then aligned on block boundaries?

No, raw inodes in JFFS is not aligned on page boundaries. There
is a definition in jffs_fm.h called JFFS_ALIGN_SIZE which is the
alignment of all kinds of data on-flash. Currently JFFS_ALIGN_SIZE
is set to 4 bytes. (The comments in the switch in jffs_scan_flash
about blocks are a little obsolete. Sorry about that.)

Did I get this right? You first create a jffs image with mkfs.jffs
which you are able to mount the first time. Then you write some more
data to the flash device, while mounted, and everything is fine. When
you then mount after doing these writes, it fails. Exactly where does
the mount fail? Hmmm... Can you turn on the debug printouts and try
to see what is going wrong?

Best regards,
Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
