Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14re8q-00041z-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 12:04:28 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14re8p-00041t-00
	for mtd@infradead.org; Mon, 23 Apr 2001 12:04:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010423040017.A22290@stm.lbl.gov> 
References: <20010423040017.A22290@stm.lbl.gov>  <001801c0cbd7$d09d70c0$0a01a8c0@Win1> <7217.988018268@redhat.com> 
To: David Schleef <ds@schleef.org>
Cc: joakim.tjernlund@lumentis.se, mtd@infradead.org
Subject: Re: JFFS2 as root FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 23 Apr 2001 12:04:16 +0100
Message-ID: <22604.988023856@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ds@schleef.org said:
>  I meant to say that mkfs.jffs2 did not handle hard links properly,
> because I didn't see evidence of a hard link cache in the code. Is
> that true, or no? 

That is true. Nobody's yet written the code to notice hard links in the
source directory and put appropriate hard links in the created JFFS2
filesystem.

Note that once you realise you only need to keep a cache of (dev,inode)
tuples for inodes with i_nlink > 1, rather than every inode you touch, and 
that you only need to look into that cache when you're writing out such an 
inode, it becomes a much more feasible task.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
