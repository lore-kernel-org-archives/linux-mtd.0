Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JwT1-0001vw-00
	for mtd-list@infradead.org; Wed, 02 Aug 2000 12:13:43 +0100
Date: Wed, 2 Aug 2000 13:13:34 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: Markus Thiesmeyer <mthi@gmx.de>
cc: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Re: Is JFFS a full featured filesystem?
In-Reply-To: <002a01bffbd5$6e5da560$fd8907d4@gallien>
Message-ID: <Pine.LNX.3.96.1000802130539.27452A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 1 Aug 2000, Markus Thiesmeyer wrote:

> Hello,
> 
> I've integrated the JFFS into a 2.2.16 kernel and it works almost fine.
> But I cannot use an editor like pico to create a file on a JFFS-filesystem. It leads to an serious error. Other operations like copying or moving files are no problem.
> So I've written a small program which uses file-mapping to change given files. And the results were very strange: When I run this application it should open a file called map.txt and change the first bytes into the sequence "abcdef...xyz". But when I read the file after I've run that application, the file seems to be unchanged. Changes appear first when I unmount that fs and mount in again. Then the file looks like a concatenation of the unchanged and the changed version.
> 
> Is this a bug? And if it is a bug, is this a known bug?

Well, i haven't had time to work on jffs lately so i haven't talked much
about this... But, as currently implemented, writing to mmaped jffs files
is serioiusly broken. Of the address space operations only readpage is
implemented. To get a correcly working mmap implementation writepage and
prepare_write_page (or whatever it's called, don't have source handy right
now) should be implemented. This could cause consistancy problems though,
because we're not using the (possibly modified) mmaped data when writing
directly to a file, we also in some way guarantee that all writes are
done to the log in the correct order. It will also be an inefficient way
to write data to jffs, since we have to rewrite whole pages instead of
only the written part.

All this, and the fact that the missing needed mutex around the writing to
the log makes the jffs filesystem quite seriously borked. It can be used,
but it's *clearly* marked experimental in the config, and should be
treated so.

/ Alex (On vacation)




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
