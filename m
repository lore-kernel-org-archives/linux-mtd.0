Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qEsF-0000Hm-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 14:53:31 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qEsD-0000Hc-00
	for mtd@infradead.org; Thu, 19 Apr 2001 14:53:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000e01c0c8d6$dfb791c0$0a01a8c0@Win1> 
References: <000e01c0c8d6$dfb791c0$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: mtd@infradead.org
Subject: Re: mkfs.jffs2 again 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Apr 2001 14:52:33 +0100
Message-ID: <19069.987688353@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



joakim.tjernlund@lumentis.se said:
> Magic bitmask 0x1985 not found at 0x00000000: 0x8519 instead

You ran mkfs.jffs2 on a little-endian machine and tried to mount the 
resulting filesystem on a big-endian machine. You have two options:

 1. Don't do that.
 2. Give me a patch for mkfs.jffs2 which does byteswapping when asked.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
