Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pvAH-0007Gs-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 17:50:49 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pvAG-0007Gm-00
	for mtd@infradead.org; Wed, 18 Apr 2001 17:50:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001001c0c826$63b43200$0a01a8c0@Win1> 
References: <001001c0c826$63b43200$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: mtd@infradead.org
Subject: Re: JFFS2 as root FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Apr 2001 17:50:35 +0100
Message-ID: <22060.987612635@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



joakim.tjernlund@lumentis.se said:
>  I followed the mtd howto and I have a root partition(with the
> necessary files) and all I get is: "Kernel panic: I have no root and I
> want to scream" message. 

Does it still happen with CONFIG_DEVFS_FS=n?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
