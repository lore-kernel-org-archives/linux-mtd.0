Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hgjqy-0003hA-Gh
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 11:56:26 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177515855.2755.252.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 25 Apr 2007 17:56:23 +0200
Message-Id: <1177516583.5073.22.camel@gentoo-jocke.transmode.se>
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

On Wed, 2007-04-25 at 16:44 +0100, David Woodhouse wrote:
> On Wed, 2007-04-25 at 17:40 +0200, Joakim Tjernlund wrote:
> > That will OOPS in __jffs2_dbg_dump_fragtree: 
> 
> Heh. Yeah, the fragtree is, strangely, empty. What length is it being
> truncated to? What nodes exist for this inode?
> 
size into: jffs2_truncate_fragtree (c=0xcff2b800, list=0xc0237a10,
size=0x2800) 

dunno how to list to inode you are asking for.

On Wed, 2007-04-25 at 16:46 +0100, David Woodhouse wrote: 
> On Wed, 2007-04-25 at 17:40 +0200, Joakim Tjernlund wrote:
> > +       if (!list->rb_node)
> > +          __jffs2_dbg_dump_fragtree(frag); 
> 
> That one wouldn't have oopsed if you had passed it 'f' as you were
> supposed to, instead of passing it NULL.

ehh, what 'f'? there is no 'f' in jffs2_truncate_fragtree()
