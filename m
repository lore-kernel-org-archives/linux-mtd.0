Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eYPS-0002QG-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 09:51:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B21@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B21@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd <linux-mtd@lists.infradead.org>,
    Wojciech Kromer <krom@dgt-lab.com.pl>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo w:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Sep 2001 09:57:47 +0100
Message-ID: <15879.999680267@redhat.com>
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
>  I sometimes get decompression errors from cramfs with a configuration
> like that. My guess is that you really shouldn't have a
> cramfs-partition on the same flash- chip as a jffs or jffs2 partition
> since cramfs doesn't use mtd and does not know if the chip is busy
> writing or erasing?

The mtdblock driver ought to deal with it correctly. If it doesn't, it's 
broken.

--
dwmw2
