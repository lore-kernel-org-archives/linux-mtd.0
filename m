From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060423122721.GC19326@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
	<20060423122721.GC19326@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Apr 2006 14:12:54 +0100
Message-Id: <1145797975.16166.198.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org,
	Nigel.Metheringham@dev.intechnology.co.uk
Subject: Re: [HOWTO] Using git for mtd (v3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-04-23 at 14:27 +0200, Jörn Engel wrote:
>   The mtd git server is behind a slow DSL line and does not have
>   enough network bandwith for people to clone the full tree on a
>   regular basis. 

Actually it's not on a DSL line. cvs.infradead.org is under my stairs,
but git.infradead.org isn't -- it's in a data centre somewhere. Its
bandwidth isn't great, but as you say I'm a cheap bastard. It's in free
hosting which was volunteered when Red Hat so abruptly and gratuitously
pulled the plug on it a couple of years ago, and I don't feel I can
pester them to improve it.

It seems to get about 2 Mbps inbound, and 1.2Mbps outbound. To be honest
I'm not actually sure _how_ it's connected. A machine right next to it
(zeniiia.uk.linux.org) seems to have better bandwidth -- perhaps
pentafluge is being limited somehow?

-- 
dwmw2
