Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pvJu-0007M7-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 18:00:46 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: JFFS2 as root FS 
Date: Wed, 18 Apr 2001 19:00:13 +0200
Message-ID: <001101c0c829$095eb570$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <22060.987612635@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

yes, I dont have devFS support compiled into the kernel.

 Jocke

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Wednesday, April 18, 2001 18:51
To: joakim.tjernlund@lumentis.se
Cc: mtd@infradead.org
Subject: Re: JFFS2 as root FS 




joakim.tjernlund@lumentis.se said:
>  I followed the mtd howto and I have a root partition(with the
> necessary files) and all I get is: "Kernel panic: I have no root and I
> want to scream" message. 

Does it still happen with CONFIG_DEVFS_FS=n?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
