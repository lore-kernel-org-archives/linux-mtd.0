Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh3PS-0003HW-4v
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 08:49:20 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177587666.2755.353.camel@pmac.infradead.org>
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
	<1177587307.8841.8.camel@gentoo-jocke.transmode.se>
	<1177587666.2755.353.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 14:49:16 +0200
Message-Id: <1177591756.8841.21.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-04-26 at 12:41 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 13:35 +0200, Joakim Tjernlund wrote:
> > 
> > ehh, me think I forgot to look in the syslog, I only checked the console
> > and these does not end up there, blushing :(
> > 
> > I think the CRC are from earlier poweroffs(just pulling the board when
> > app is running)
> 
> No, they're something weirder. Node that they're _node_ header CRC
> failures. Although actually my tests seem to show that _isn't_ a failed
> CRC. It should be good. 
> 
> Did you see those errors too, when you did look in the syslog?
> 

hmm, just checked and I don NOT see any CRC errors, I just get the
inode debug in scan, if (ino == 9943), printout.

 Jocke
