Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3FLN-0005mJ-2a
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2010 21:46:42 +0000
In-Reply-To: <AANLkTikttX8kwa2upG1_T78y=r_cOZgoUrt4PWOZWv3i@mail.gmail.com>
References: <AANLkTikttX8kwa2upG1_T78y=r_cOZgoUrt4PWOZWv3i@mail.gmail.com>
Subject: Re: questions about jffs2 jffs2_erase_pending_blocks in erase.c
To: Aaron Nabil <krellboy@gmail.com>
Message-ID: <OF3CECC71D.A74C9639-ONC12577B3.0077252E-C12577B3.0077564B@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 5 Oct 2010 23:43:28 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Again apologies if I'm doing this wrong, I rarely poke at the kernel
> and only have a few days experience looking at jffs2 and don't
> understand the "big picture" yet, but I'm seeing some things I don't
> understand and would be grateful for any help.  Please contact me
> off-list if you want to send me a "you are so stupid, it's supposed to
> be doing that", in fact I'd welcome that over silence.  I'd even thank
> you.
>
> My question:
>
> jffs2_erase_pending_blocks is only called with 1 or 0 as count arguments.
>
>  nodemgmt.c jffs2_reserve_space  121 jffs2_erase_pending_blocks(c, 1);
>  nodemgmt.c jffs2_find_nextblock 248 jffs2_erase_pending_blocks(c, 1);
>  super.c    jffs2_write_super     67 jffs2_erase_pending_blocks(c, 0);
>
> The test  if (!--count) seems to be testing for (count == 1) as the
> decrement happens first.  If count is 0 it will be decremented
> negative, underflow and wrap around to positive, and then eventually
> hit 0 4 billion loop interations later.
>
> Thanks in advance to anyone looking at this,

Yes, this will ensure JFFS2 erases until the list(s) are
empty.
Also, latest kernel has reworked this area so you might want to update.
