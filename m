Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13EuQ5-0005U4-00
	for mtd-list@infradead.org; Wed, 19 Jul 2000 15:01:53 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13EuQ4-0005Ty-00
	for mtd@infradead.org; Wed, 19 Jul 2000 15:01:52 +0100
Date: Wed, 19 Jul 2000 16:03:30 +0200 (CEST)
From: Finn Hakansson <finn.hakansson@axis.com>
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
cc: mtd@infradead.org, jffs-dev@axis.com, Per Knudsen <per.knudsen@axis.com>
Subject: Re: jffs_file_write and DOC
In-Reply-To: <3975038D.40CF3B90@evoserve.com>
Message-ID: <Pine.LNX.4.21.0007191544380.5085-100000@vvv.axis.se>
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

This is a problem that I gave some thought yesterday.

Yes, I guess you're right. The total size of a chunk of data on the
flash should be 32768 bytes (2^15 bytes). In a data chunk we always
have a raw inode, possibly a name and possibly some data. The size of
the raw inode is always 60 bytes. The maximum size of a name field is
256 bytes. This gives us a total size of between (32768 - 60 - 256)
and (32768 - 60) bytes of data possible to add in each data chunk.


> Cat just writes a file shorter than it should be on flash. I used a
> modified DOC_loadbios utility to download my JFFS images to the DOC. If
> I dont write anything to it I could mount and unmount cleanly. But when
> I write to it, I get bad checksums on the next mount and totoal mount
> failure after couple more mounts.

Could you explain this in more detail, please?


> How is jffs_write_file called when we write a large file to flash? I
> dont see any loops in jffs_file_write. Does the VFS layer handle the
> subdivisions and calls jffs_file_write with chunks equal to max chunk
> size? How do we handle this ?

Right now the jffs_file_write function does not loop as it should if
it is writing something larger than MAX_CHUNK_SIZE. This should be
fixed soon I hope. It is not a difficult thing to fix I guess.

Thanks!

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
