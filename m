Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh4CV-0006HT-AR
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 09:40:00 -0400
Subject: Re: OOPS at mount
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177593359.2755.386.camel@pmac.infradead.org>
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
	<1177593184.8841.29.camel@gentoo-jocke.transmode.se>
	<1177593359.2755.386.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Apr 2007 15:39:57 +0200
Message-Id: <1177594798.8841.37.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-04-26 at 14:15 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 15:13 +0200, Joakim Tjernlund wrote:
> > On Thu, 2007-04-26 at 14:08 +0100, David Woodhouse wrote:
> > > On Thu, 2007-04-26 at 15:00 +0200, Joakim Tjernlund wrote:
> > > > No, its gone. Is yours still there?
> > > 
> > > Nope. I think the offending node got marked obsolete after we fixed the
> > > kernel not to crash when it saw it.
> > 
> > Yes, thats what I am thinking too. I can restore to the image I sent you
> > and see if the errors return. Will that help in any way?
> 
> Only in that it'll confuse the hell out of me if they do. But go on, if
> it's not much trouble :)

restoring now, but its slow.

> 
> I haven't _quite_ placed my finger on a sequence of events which leads
> to you having a few older nodes of this inode and a later metadata node.
> 
> Had it been deleted while you were still using summary?

Talked to the lab and they THINK that they upgraded both
app and kernel at the same time after which they rebooted to
activate both kernel and app.
The old kernel had SUMMARY on, but the new one didn't.
 
