Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13GjpM-0004Qd-00
	for mtd-list@infradead.org; Mon, 24 Jul 2000 16:07:32 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13GjpK-0004QX-00
	for mtd@infradead.org; Mon, 24 Jul 2000 16:07:30 +0100
Date: Mon, 24 Jul 2000 17:09:42 +0200 (CEST)
From: Finn Hakansson <finn@axis.com>
To: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
cc: "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write
In-Reply-To: <3978DFBA.175899F2@evoserve.com>
Message-ID: <Pine.LNX.4.21.0007241657220.18380-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 22 Jul 2000, Rogelio M. Serrano Jr. wrote:

> How do we handle these:
> 
>   Appending to an existing file. What fields must be updated with what?
> We write a new inode right? What values should I place in the raw inode
> struct?

There must be a raw inode preceeding each new chunk of data. The kind of
stuff that has to be inserted into each raw inode in jffs_file_write is
approximately what is in there today. The thingies that have to be changed
are the raw inode's version, offset and dsize. Of course one have to
compute new checksums. I don't think there are stuff other than that.


>   Rewriting file? Writing a file?

Yeah. One day, write and rewrite should be merged into one single function...

/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
