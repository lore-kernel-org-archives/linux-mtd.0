Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140nxU-0004I0-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 16:50:20 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140nxT-0004Ht-00
	for mtd@infradead.org; Tue, 28 Nov 2000 16:50:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00B4D286538DD311BC6E005004E9EFC73B0F6C@M4EXCH> 
References: <00B4D286538DD311BC6E005004E9EFC73B0F6C@M4EXCH> 
To: Simon Munton <Simon.Munton@m4data.co.uk>
Cc: mtd@infradead.org, "JFFS (E-mail)" <jffs-dev@axis.com>
Subject: Re: Oops in JFFS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Nov 2000 16:49:36 +0000
Message-ID: <2744.975430176@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Appears to be dying at 

    printk("***jffs_remove(): file = \"%s\", ino = %ld\n", _name, dentry->d_inode->i_ino);

dentry->d_inode == NULL?



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
