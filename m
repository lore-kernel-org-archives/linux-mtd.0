Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh3Jl-0002vB-VM
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 08:43:27 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177590673.2755.369.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177587937.8841.13.camel@gentoo-jocke.transmode.se>
	<1177590673.2755.369.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 14:43:23 +0200
Message-Id: <1177591404.8841.18.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-04-26 at 13:31 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 13:45 +0200, Joakim Tjernlund wrote:
> > > JFFS2 warning: (316) jffs2_do_read_inode_internal: Truncating ino
> > #9943 to 4627829 bytes failed because it only had 16384 bytes to start
> > with!
> 
> I don't understand this. Looking at the image you gave me, and
> instrumenting jffs2_scan_inode_node() to print every node it finds
> belonging to that inode, I see this:
> 
> Node at 20830232 is ino #9943, version 2. Range 0x0-0x1000, isize 4096
> Node at 20832264 is ino #9943, version 3. Range 0x1000-0x2000, isize 8192
> Node at 20833744 is ino #9943, version 4. Range 0x2000-0x3000, isize 12288
> Node at 20834972 is ino #9943, version 5. Range 0x3000-0x4000, isize 16384
> Node at 46094176 is ino #9943, version 1172. Range 0x0-0x0, isize 16384
> 
> So I have no clue why your system is trying to truncate that inode to
> 4627829 bytes. Can you run with the same thing in scan.c? It looks like
> this...
> 
> 	if (ino == 9943)
> 	printk(KERN_DEBUG "Node at %u is ino #%x, version %d. Range 0x%x-0x%x, isize %u\n",
> 	       ofs,
> 		  je32_to_cpu(ri->ino), je32_to_cpu(ri->version),
> 		  je32_to_cpu(ri->offset),
> 	       je32_to_cpu(ri->offset)+je32_to_cpu(ri->dsize),
> 	       je32_to_cpu(ri->isize));
> 

I get this:
Node at 20830232 is ino #26d7, version 2. Range 0x0-0x1000, isize 4096
Node at 20832264 is ino #26d7, version 3. Range 0x1000-0x2000, isize 8192
Node at 20833744 is ino #26d7, version 4. Range 0x2000-0x3000, isize 12288
Node at 20834972 is ino #26d7, version 5. Range 0x3000-0x4000, isize 16384
Node at 46094176 is ino #26d7, version 1172. Range 0x0-0x0, isize 16384

And yes I did use SUMMARY and tured it off some tme ago.
