Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh2Fg-0000RR-Us
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 07:35:10 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177586855.2755.350.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177569177.2755.274.camel@pmac.infradead.org>
	<1177575617.28488.17.camel@gentoo-jocke.transmode.se>
	<1177576195.2755.286.camel@pmac.infradead.org>
	<1177578263.28861.7.camel@gentoo-jocke.transmode.se>
	<1177586784.8841.3.camel@gentoo-jocke.transmode.se>
	<1177586855.2755.350.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 13:35:07 +0200
Message-Id: <1177587307.8841.8.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-04-26 at 12:27 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 13:26 +0200, Joakim Tjernlund wrote:
> > Actually I forgot these:
> > [JFFS2] Use yield() between GC passes in background thread.
> > [JFFS2] Check for all-zero node headers
> > 
> > Should be harmless though.
> 
> Should be.
> 
> I'm seeing a whole bunch of CRC failures...
> 
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3fd28d4. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f99d40. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f4e7b4. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f25bcc. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x38c9fd0. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f41ad4. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f43598. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f43554. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f432a4. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x3f45984. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x64368ec. {1985,c002,00000044,a4ef223e}
> JFFS2 notice: (27730) jffs2_get_inode_nodes: Node header CRC failed at 0x1710fd0. {1985,c002,00000044,a4ef223e}

ehh, me think I forgot to look in the syslog, I only checked the console
and these does not end up there, blushing :(

I think the CRC are from earlier poweroffs(just pulling the board when
app is running)

 Jocke
