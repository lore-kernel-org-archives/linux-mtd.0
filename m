Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13EuZB-0005WB-00
	for mtd-list@infradead.org; Wed, 19 Jul 2000 15:11:17 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13EuZA-0005W4-00
	for mtd@infradead.org; Wed, 19 Jul 2000 15:11:16 +0100
Date: Wed, 19 Jul 2000 16:12:42 +0200 (CEST)
From: Finn Hakansson <finn.hakansson@axis.com>
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
cc: mtd@infradead.org, jffs-dev@axis.com, Per Knudsen <per.knudsen@axis.com>
Subject: Re: multiple jffs_file_write calls
In-Reply-To: <39758691.74272A26@evoserve.com>
Message-ID: <Pine.LNX.4.21.0007191603500.5085-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 19 Jul 2000, Rogelio M. Serrano Jr. wrote:

> Does the VFS layer do the subdivision of large file writes such that it
> calls jffs_file_write multiple times with count exactly equal to
> MAX_CHUNK_SIZE?

That was what I thought from the beginning as well. (Or instead of
MAX_CHUNK_SIZE perhaps a page size of two.) But no. Right now there
is no check whether the chunk of data is too large or not. The code
just assumes that the data chunk is not big. As I stated in the last
mail, this is something that's about to be changed.


> When jffs_file_write writes the chunk it appends the
> name and header to it and we end up with a chunk bigger than
> MAX_CHUNK_SIZE.

Correct. This is a thing I will look into.


> Should we make VFS aware of mtd like what I think should
> be done or handle it in another way? What do you think?

I think this is something JFFS should handle.


/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
