Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 147zwz-0003aY-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 13:03:33 +0000
Received: from [195.224.55.237] (helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 147zwy-0003aR-00
	for mtd@infradead.org; Mon, 18 Dec 2000 13:03:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A3E07C4.22A3F127@arcom.co.uk> 
References: <3A3E07C4.22A3F127@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: JFFS: rmdir wierdness 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Dec 2000 13:02:56 +0000
Message-ID: <23862.977144576@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
> # mkdir a
> # ls
> a
> # rmdir a
> # ls
> # mkdir a
> mkdir: a: File exists
> 
> Also
> 
> # mkdir b
> # touch b/a
> # rm b/a
> # rmdir b
> rmdir: b: Directory not empty
> 
> rmdir() thinks `b' still has children (I think).

More problems with the deletion code since I did the use counts.
Hmmm. This was sort of why I didn't want to commit it immediately, till I'd 
had time to do some sanity checks on it.

Try this:

Index: intrep.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs/intrep.c,v
retrieving revision 1.84
diff -u -r1.84 intrep.c
--- intrep.c	2000/12/18 13:00:23	1.84
+++ intrep.c	2000/12/18 13:02:30
@@ -1387,7 +1387,7 @@
 	D3(printk("jffs_find_child()\n"));
 
 	for (f = dir->children; f; f = f->sibling_next) {
-		if (f->name
+		if (!f->deleted && f->name
 		    && !strncmp(f->name, name, len)
 		    && f->name[len] == '\0') {
 			break;


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
