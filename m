Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Com2r-0003oe-Kz
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 12:12:36 -0500
Date: Wed, 12 Jan 2005 18:11:59 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050112171159.GH25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<20050112170256.GF25638@wohnheim.fh-wedel.de>
	<1105549562.26551.120.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105549562.26551.120.camel@hades.cambridge.redhat.com>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 17:06:02 +0000, David Woodhouse wrote:
> 
> Cheaper and faster. But remember who Jared works for :)

:)

> Seriously though, XIP is a win on power -- it doesn't take constant
> application of power to keep your data in flash. If you start comparing
> prices of SRAM and flash, the game becomes a little different.
> 
> Of course, if you're _that_ concerned about the power budget one has to
> wonder why you're using Linux, but then JFFS2 runs on eCos too...

In that case, most people I know use some 8bit or 16bit controllers
with less total code than jffs2 alone would weigh in.

But I also remember who you work for. :)

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
