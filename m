Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrHhH-0001Tc-JI
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 10:24:40 -0500
Date: Wed, 19 Jan 2005 16:24:27 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050119152427.GB26711@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
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

On Wed, 19 January 2005 13:07:39 +0000, Artem B. Bityuckiy wrote:
> On Tue, 18 Jan 2005, Joakim Tjernlund wrote:
> 
> > Another idea is to calculate the checksum while reading/writing(much like
> > the networking code does). That would probably require support from the MTD layer
> > and that the checksum is stored at the end of the JFFS3 node.
> Hmm. How to do this? In case of NAND we issue 
> read command and provide buffer, and it is up to driver/hw how to read. 
> One may use DMA.

Something like this?

int jffs3_write_with_checksum(void *data, ...)
{
	...
	if (mtd->write_with_checksum)
		return mtd->write_with_checksum(data, ...);
	mtd->write(data, ...);
	mtd->write(checksum(data), ...);
}

Jörn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike
