Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eYsw-0002Vz-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 10:22:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B23@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B23@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo w:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Sep 2001 10:28:15 +0100
Message-ID: <20308.999682095@redhat.com>
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
>  The latter i'm afraid... but I'm working on using jffs2 instead of
> cramfs. Would you recommend a read-only (mount -o ro) jffs2 root
> partition as a replacement for a cramfs root partition?

If the mount time is OK for you, yes. Otherwise you'd want checkpointing 
implemented first. 

Note that I actually made it obey 'readonly' quite recently. Until a month 
or so ago, it was still starting the GC thread when it was supposed to be 
RO.

--
dwmw2
