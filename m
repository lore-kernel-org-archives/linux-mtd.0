Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1ConCi-0005xn-OW
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:26:50 -0500
Date: Wed, 12 Jan 2005 19:26:38 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050112182638.GK25638@wohnheim.fh-wedel.de>
References: <41E4D6E5.1090407@imc-berlin.de> <41E4EDBE.8070302@inf.u-szeged.hu>
	<41E52EAD.2090302@imc-berlin.de>
	<Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
Cc: linux-mtd@lists.infradead.org, Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 15:11:09 +0000, Artem B. Bityuckiy wrote:
> On Wed, 12 Jan 2005, Steven Scholz wrote:
> 
> > If a sector got broken just by reading it then the whole embedded system is 
> > broken and has to be replaced ...

Amen, brother!

> This seems to be true for NOR. But  chrcking CRC helps at least *detect* 
> and *report* media problems.

Well, more and more I come to the conclusion that media problems are a
non-issue.  At least, flashes are about as reliable as hard drives.

So, who can name a hd-oriented file system that does crc-checking of
it's date?

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
