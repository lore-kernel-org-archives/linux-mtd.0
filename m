Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qE8U-0008AH-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 14:06:14 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qE8S-00089U-00
	for mtd@infradead.org; Thu, 19 Apr 2001 14:06:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000b01c0c8ce$8d5d3d10$0a01a8c0@Win1> 
References: <000b01c0c8ce$8d5d3d10$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: "'Florian Schirmer / TayTron'" <schirmer@taytron.net>,
    "'Vipin Malik'" <vipin.malik@daniel.com>, mtd@infradead.org
Subject: Re: JFFS2 as root FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Apr 2001 14:02:22 +0100
Message-ID: <13506.987685342@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


joakim.tjernlund@lumentis.se said:
>  I have tried to mount the FS again and the files are still there. It
> still takes 1 min and 30 sec to mount it and sometime when I do a ls
> the system hangs for 10-20 sec before the output from ls is seen. Is
> this normal? 

That's very very slow. I don't know why it's being so slow for you. 

Your CPU isn't particularly fast, but that shouldn't really make _that_ 
much difference. 

Can you set CONFIG_JFFS2_FS_DEBUG=1 and set default_loglevel to 8 in kernel/
printk.c, then log the messages that it produces? I'd like to see if 
anything untoward is happening.

If it's really just being slow, then maybe you're going to need one or two 
of the features on the wishlist implemented - checkpointing and 
prepopulating inodes on mount.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
