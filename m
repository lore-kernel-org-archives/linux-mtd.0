Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14re53-00041A-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 12:00:33 +0100
Date: Mon, 23 Apr 2001 04:00:17 -0700
From: David Schleef <ds@schleef.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: joakim.tjernlund@lumentis.se, mtd@infradead.org
Subject: Re: JFFS2 as root FS
Message-ID: <20010423040017.A22290@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <001801c0cbd7$d09d70c0$0a01a8c0@Win1> <7217.988018268@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7217.988018268@redhat.com>; from dwmw2@infradead.org on Mon, Apr 23, 2001 at 10:31:08AM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, Apr 23, 2001 at 10:31:08AM +0100, David Woodhouse wrote:
> 
> joakim.tjernlund@lumentis.se said:
> >  I noted that your man page(nice work) states that JFFS2 and
> > mkfs.jffs2 do not support hard links, but the MTD homepage states
> > otherwise. Is it just mkfs.jffs2 that don't support hardlinks? 
> 
> JFFS doesn't. JFFS2 does.


I meant to say that mkfs.jffs2 did not handle hard links properly,
because I didn't see evidence of a hard link cache in the code.
Is that true, or no?




dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
