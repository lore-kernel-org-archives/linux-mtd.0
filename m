Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrHoy-0001xZ-A8
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 10:32:37 -0500
Date: Wed, 19 Jan 2005 16:32:33 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050119153233.GD26711@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 January 2005 15:27:53 +0000, Artem B. Bityuckiy wrote:
> > 
> > Something like this?
> > 
> > int jffs3_write_with_checksum(void *data, ...)
> > {
> > 	...
> > 	if (mtd->write_with_checksum)
> > 		return mtd->write_with_checksum(data, ...);
> > 	mtd->write(data, ...);
> > 	mtd->write(checksum(data), ...);
> > }
> > 
> > Jörn
> Can't get it - What is the goal? Some advandages?

As you explained, Joakim's proposal doesn't always make sense.
Basically, if the underlying drives uses DMA, there is no point.  If
it does memcpy(), then it's faster to checksum/copy in a single loop,
rather than do both things individually.

With the above code, an mtd driver can supply a converged
checksum/copy method, but doesn't have to.  If it doesn't, we do
regular copy (through mtd->write) and checksum instead.

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
