Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rs4I-0003ag-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 02:56:42 +0100
Date: Mon, 23 Apr 2001 18:56:21 -0700
From: David Schleef <ds@schleef.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Re: JFFS2 as root FS
Message-ID: <20010423185618.A17555@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <20010423040017.A22290@stm.lbl.gov> <001801c0cbd7$d09d70c0$0a01a8c0@Win1> <7217.988018268@redhat.com> <20010423040017.A22290@stm.lbl.gov> <22604.988023856@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22604.988023856@redhat.com>; from dwmw2@infradead.org on Mon, Apr 23, 2001 at 12:04:16PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, Apr 23, 2001 at 12:04:16PM +0100, David Woodhouse wrote:
> 
> That is true. Nobody's yet written the code to notice hard links in the
> source directory and put appropriate hard links in the created JFFS2
> filesystem.

Can you (or someone) comment on whether or not JFFS2 satisfies
the necessary criteria for a POSIX-compliant file system?  I
could not (quickly) find a reference to what qualifies as a POSIX
file system, otherwise I would have checked myself.

> Note that once you realise you only need to keep a cache of (dev,inode)
> tuples for inodes with i_nlink > 1, rather than every inode you touch, and 
> that you only need to look into that cache when you're writing out such an 
> inode, it becomes a much more feasible task.

That actually seems to be more complicated than checking every
inode.  That is, if you consider if(n_links>1) more complicated.
Also, you need to check the device to make sure its not the
same inode number on a different device.  But I digress and
become nitpicky.




dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
