Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I11VK-0005GN-Gs
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 10:49:56 -0400
Subject: Re: sync() takes minutes while erasing
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
References: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Jun 2007 16:49:52 +0200
Message-Id: <1182350992.2969.128.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-20 at 16:21 +0200, Joakim Tjernlund wrote:
> Here we go again :)
> 
> Noticed one again large delays when rebooting and jffs2 is busy
> erasing block via pdflush.
> 
> Can't see where sync() ends up in jffs2, anyone
> know the jffs2(or pdflush) functions involved during a sync?
> 
>  Jocke 

Ok, found the cause:
 jffs2_erase_pending_blocks(c, 0) is called from
 jffs2_write_super() and it hangs until all
 pending erases are complete.

Why do jffs2_write_super() need to call 
jffs2_erase_pending_blocks(c, 0)? Seems like a bad idea to me.

 Jocke
