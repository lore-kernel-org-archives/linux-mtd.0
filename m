Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eZQA-0002YG-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 10:56:34 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B24@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Wed, 5 Sep 2001 12:01:32 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> If the mount time is OK for you, yes. Otherwise you'd want 
> checkpointing 
> implemented first. 

My partition is fairly small so the mount time is OK right now, but I will
also be using a larger partition (about 3MB) later. Is anybody working on this
checkpointing thing? Could you explain the concept briefly? 

> 
> Note that I actually made it obey 'readonly' quite recently. 
> Until a month 
> or so ago, it was still starting the GC thread when it was 
> supposed to be 
> RO.

It has worked fine for me this far.

Is it possible to "hide" a bootloader at the beginning of a jffs2 partition
so that jffs2 ignores it (when mounting read-only) and still be able to upgrade
the whole partition (bootloader + jffs2 fs) using the mtd character device?

/Jonas
