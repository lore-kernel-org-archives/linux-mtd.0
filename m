Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14M9KR-0000tx-00
	for mtd-list@infradead.org; Fri, 26 Jan 2001 13:54:15 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14M9KP-0000tp-00
	for mtd@infradead.org; Fri, 26 Jan 2001 13:54:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <52AF3CB987C7D41183CD0090271F67C301C929@m4eng.m4data.co.uk> 
References: <52AF3CB987C7D41183CD0090271F67C301C929@m4eng.m4data.co.uk> 
To: Simon Munton <Simon.Munton@m4data.co.uk>
Cc: "MTD (E-mail)" <mtd@infradead.org>,
    "JFFS (E-mail)" <jffs-dev@axis.com>
Subject: Re: Problem with deleted files 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Jan 2001 13:53:49 +0000
Message-ID: <16862.980517229@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Simon.Munton@m4data.co.uk said:
>  This could be fixed by always setting a node's deleted flag if the
> corresponding file's deleted flag is set, when it is written in
> jffs_write_node() and jffs_rewrite_data(). Can anyone see any problems
> with this?

Er... I thought we already did this. Yes, that's what I'd recommend. Once 
you're sure it's happy, can you commit the same change to the 
linux-2_4-branch too, please?

Simon.Munton@m4data.co.uk said:
> Should the filesystem fail to mount if it finds a node with no parent?
> Would it be better to just throw away such nodes, or perhaps create a
> virtual lost+found directory and put them there? 

I'd just let it mark them as deleted. JFFS2 will do that anyway - I'm not
going to bother with marking inodes as deleted. They'll just fade away when
nlink (calculated dynamically from the dirents) gets to zero.

The whole thing gets _so_ much more interesting when you no longer GC in 
strict order, and you can GC the 'deletion' nodes before you actually GC 
the nodes they're deleting... 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
