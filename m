Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15earc-0002hC-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 12:29:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B25@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B25@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo w:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Sep 2001 12:35:00 +0100
Message-ID: <9158.999689700@redhat.com>
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
>  1. To be able to write to both devices the partitions must start on
> eraseblock block boundary. The bootloader I would use with this
> configuration is less than 10kB and my eraseblocks are 64kB. I would
> waste to much space on the loader partition. 

You really don't want JFFS2 erasing and reprogramming the sector with your 
bootloader in, surely?

--
dwmw2
