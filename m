Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eZUQ-0002Yf-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 11:00:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B24@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B24@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo w:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Sep 2001 11:06:58 +0100
Message-ID: <26212.999684418@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

jonas.holmberg@axis.com said:
>  My partition is fairly small so the mount time is OK right now, but I
> will also be using a larger partition (about 3MB) later. Is anybody
> working on this checkpointing thing? Could you explain the concept
> briefly?  

Currently we have to scan the whole thing on startup because we know 
nothing about its state. By occasionally writing a checkpoint - a brain 
dump of the jffs2 code's internal state, we can speed up the mount.

You'd only ever write a checkpoint at the beginning of an erase block. 
The mount code would look at the beginning of each block, and would note 
the most recent checkpoint. It can suck in the state from that checkpoint 
and then go on to read every node in the blocks which were written _after_ 
that checkpoint.


>  Is it possible to "hide" a bootloader at the beginning of a jffs2
> partition so that jffs2 ignores it (when mounting read-only) and still
> be able to upgrade the whole partition (bootloader + jffs2 fs) using
> the mtd character device? 

Not really. Why not just upgrade bootloader and jffs2 fs using two separate 
character devices?

--
dwmw2
