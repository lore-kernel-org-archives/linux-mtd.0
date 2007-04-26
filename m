Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh3mU-0004Yg-1s
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 09:13:08 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177592932.2755.383.camel@pmac.infradead.org>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
	<1177517258.2755.261.camel@pmac.infradead.org>
	<1177522774.28488.4.camel@gentoo-jocke.transmode.se>
	<1177587937.8841.13.camel@gentoo-jocke.transmode.se>
	<1177590673.2755.369.camel@pmac.infradead.org>
	<1177591404.8841.18.camel@gentoo-jocke.transmode.se>
	<1177591781.2755.373.camel@pmac.infradead.org>
	<1177592422.8841.24.camel@gentoo-jocke.transmode.se>
	<1177592932.2755.383.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 15:13:04 +0200
Message-Id: <1177593184.8841.29.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-04-26 at 14:08 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 15:00 +0200, Joakim Tjernlund wrote:
> > No, its gone. Is yours still there?
> 
> Nope. I think the offending node got marked obsolete after we fixed the
> kernel not to crash when it saw it.

Yes, thats what I am thinking too. I can restore to the image I sent you
and see if the errors return. Will that help in any way?

> 
> I strongly suspect that the root cause here is the fact that you turned
> SUMMARY off -- in particular the way that affected the setting of
> jffs2_can_mark_obsolete().
> 
> That will have meant that _some_ nodes were actually marked obsolete on
> the medium, while other nodes weren't. I'm trying to construct a
> detailed scenario in which that leads to the error we saw, so I can
> convince myself 100% that this was the problem....

Thanks,

    Jocke
