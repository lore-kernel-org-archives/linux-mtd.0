Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Indqc-0002BO-K0
	for linux-mtd@lists.infradead.org; Thu, 01 Nov 2007 13:28:56 -0400
Subject: Re: [PATCH] NULLify ->raw after jffs2_mark_node_obsolete().
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1193868865.2651.148.camel@shinybook.infradead.org>
References: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193841682.2651.104.camel@shinybook.infradead.org>
	<1193867924.11355.27.camel@gentoo-jocke.transmode.se>
	<1193868865.2651.148.camel@shinybook.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 01 Nov 2007 18:28:48 +0100
Message-Id: <1193938128.9647.11.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-10-31 at 18:14 -0400, David Woodhouse wrote:
> On Wed, 2007-10-31 at 22:58 +0100, Joakim Tjernlund wrote:
> > Well, I just did what I belived you wanted me to do so I did not think
> > much about it. I can redo the first patch with the necessary part or
> > you can do it with any extra checks you deem necessary. I just want
> > some variant in mtd git so I can have the same to avoid conflicts
> > later on.
> 
> How about this... I also cleaned up the list traversal stuff now we're
> not actually removing from the list.

[SNIP]

This looks good to me (especially the commenting is much better
than mine :)

Havn't had a chance to test it as I been putting out "fires" at work.
Now I am leaving for the weekend so I won't be able to test it
until early next week. I am very confident that it will work just fine
though.

 Jocke
