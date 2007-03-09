Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HPdnA-0004Yv-U9
	for linux-mtd@lists.infradead.org; Fri, 09 Mar 2007 07:02:05 -0500
Subject: Re: JFFS2 OOPS in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1173439455.3461.587.camel@pmac.infradead.org>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
	<1173379047.3461.482.camel@pmac.infradead.org>
	<1173430972.26465.20.camel@gentoo-jocke.transmode.se>
	<1173432194.3461.562.camel@pmac.infradead.org>
	<1173437173.26465.37.camel@gentoo-jocke.transmode.se>
	<1173438908.26465.54.camel@gentoo-jocke.transmode.se>
	<1173439455.3461.587.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Mar 2007 13:01:44 +0100
Message-Id: <1173441704.26465.61.camel@gentoo-jocke.transmode.se>
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

On Fri, 2007-03-09 at 11:24 +0000, David Woodhouse wrote:
> On Fri, 2007-03-09 at 12:15 +0100, Joakim Tjernlund wrote:
> > also I think this check should be before the real crc32 check. 
> 
> Does it matter? It's hardly a fast path :)

not really, I was thinking about soemthing else and I was wrong.

 Jocke
