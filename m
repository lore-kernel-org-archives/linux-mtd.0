Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxNrZ-00058z-Gq
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 07:44:55 -0400
Date: Tue, 26 Jul 2005 13:44:51 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050726114451.GC30656@wohnheim.fh-wedel.de>
References: <42E62254.9040806@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42E62254.9040806@inf.u-szeged.hu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: compressors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 July 2005 13:45:24 +0200, Ferenc Havasi wrote:
> 
> Artem's warned me about the compressors lzari and lzo, and he's right.
> 
> We adopted them for JFFS2 some years ago, but now they are unused
> because have no good performance, have messy code and licence problems.
> I think it's time to delete it from CVS. If nobody cares I remove it. I
> think we should consider to remove compressor rubin, also.

Makes sense.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface. 
-- Doug MacIlroy
