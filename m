Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qEvE-0000IF-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 14:56:36 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: mkfs.jffs2 again 
Date: Thu, 19 Apr 2001 15:56:01 +0200
Message-ID: <000f01c0c8d8$7844cd80$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <19069.987688353@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

That figures :-)

I will give it a try (hopefully) next week. Any hints?

    Jocke

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Thursday, April 19, 2001 15:53
To: joakim.tjernlund@lumentis.se
Cc: mtd@infradead.org
Subject: Re: mkfs.jffs2 again 

joakim.tjernlund@lumentis.se said:
> Magic bitmask 0x1985 not found at 0x00000000: 0x8519 instead

You ran mkfs.jffs2 on a little-endian machine and tried to mount the 
resulting filesystem on a big-endian machine. You have two options:

 1. Don't do that.
 2. Give me a patch for mkfs.jffs2 which does byteswapping when asked.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
