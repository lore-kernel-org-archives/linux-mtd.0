Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rcgu-00036L-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 10:31:32 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rcgt-00036D-00
	for mtd@infradead.org; Mon, 23 Apr 2001 10:31:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001801c0cbd7$d09d70c0$0a01a8c0@Win1> 
References: <001801c0cbd7$d09d70c0$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: "'David Schleef'" <ds@schleef.org>, mtd@infradead.org
Subject: Re: JFFS2 as root FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 23 Apr 2001 10:31:08 +0100
Message-ID: <7217.988018268@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


joakim.tjernlund@lumentis.se said:
>  I noted that your man page(nice work) states that JFFS2 and
> mkfs.jffs2 do not support hard links, but the MTD homepage states
> otherwise. Is it just mkfs.jffs2 that don't support hardlinks? 

JFFS doesn't. JFFS2 does.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
