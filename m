Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp7iw-0006rZ-3p
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 11:21:27 -0500
Date: Thu, 13 Jan 2005 17:21:03 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050113162103.GF18864@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
	<20050113151724.GB18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
	<20050113154037.GC18864@wohnheim.fh-wedel.de>
	<1105631350.26551.204.camel@hades.cambridge.redhat.com>
	<20050113161302.GD18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131614000.17331@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501131614000.17331@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 January 2005 16:16:35 +0000, Artem B. Bityuckiy wrote:
>
> IMHO:
> Keeping CRC at the end still makes sence.

Sure, but does it have to be CRC?  Wouldn't adler32 be stong enough?

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
