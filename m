Received: from gate.epygi.de ([212.126.211.241] helo=ally.epygi.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198d3H-00074v-Ti
	for <linux-mtd@lists.infradead.org>; Thu, 24 Apr 2003 10:30:00 +0100
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>, <manningc2@actrix.gen.nz>
Date: Thu, 24 Apr 2003 11:30:05 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJMEEHDAAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
In-Reply-To: <20030423202700.0DEF715788@desire.actrix.co.nz>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: RE: compare JFFS2 vs YAFFS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Charles,

Indeed I meant the over head that comes from reserved areas for garbage collection etc.
You say: "Since even the smallest NAND device holds many hundred blocks this is generally not an issue."
But if you are going to create a verry small NAND partition of a few hundred kilobyte this may be become an issue.

Thanks for the info,

Stephan

> -----Original Message-----
> From: Charles Manning [mailto:manningc2@actrix.gen.nz]
> Sent: Mittwoch, 23. April 2003 22:28
> To: Stephan Linke
> Subject: Re: compare JFFS2 vs YAFFS
> 
> 
> 
> >
> > How about the "out-take" that JAFFS2 requires for garbage collection? I
> > guess it is X times mtd->erasesize (X=2..5)? What's the "out-take" of
> > YAFFS?
> > I think this is the most importnat factor if you are going to use YAFFS or
> > JFFS2 on a small NAND partition.
> 
> 
> Can you explain what you mean by out-take a bit better? Do you mean 
> "overhead"?
> 
> If so, there are two types of overhead:
> 
> * NAND space. This is run-time configurable. YAFFS normally uses a reserve 
> space of 5 blocks (ie. 5x16kB), but should work fine with 2 blocks. 5 blocks 
> just gives extra comfort for blocks going bad at the same time as garbage 
> collection. Since even the smallest NAND device holds many hundred blocks 
> this is generally not an issue.
> 
> * Time: YAFFS does not stop for a long time while it does garbage collection. 
> The worst case is just the time to erase and rewrite a block (ie approx 
> 7milliseconds).
> 
> Another area where YAFFS is good is boot time. Systems with 512Mbytes of NAND 
> usually boot within 1 minute. There are plans to reduce this to a few seconds.
> 
> 
> -- Charles
> 
> 
> 
> 
