Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CewsR-0001js-0W
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 09:45:12 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Thu, 16 Dec 2004 15:45:00 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0412161420360.8020@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Thu, 16 Dec 2004, Joakim Tjernlund wrote:
> 
> > Hi List
> > 
> > I am a long time JFFS2 user(and developer), but I haven't been following
> > JFFS2 for a year or two. I have noticed that JFFS3 has begun and I figured
> > I would offer a few thoughts.
> > 
> > 1) Consider changing the start seed to crc32 from 0 to -1. Zero
> >    is not a good start seed for crc32
> If you do point 2 this will not be needed :-)

Yes, but if you do point 2, you still have to consider start seed and it should
be != 0 regardless of what checksum you choose.

>  
> > 
> > 2) Consider another checksum algorithm. Crc32 is very expensive
> >    and JFFS2 suffered severely in the early days. Now that crc32 is
> >    very optimized that problem is less visible, but crc32 is still
> >    expensive. Maybe an Adler32 checksum is good enough or a crc16?
> IMHO, NAND/ECC NOR are additionally protected by ECCs so that sounds 
> reasonable. NORs are reliable, so that is reasonable too, IMHO.

Exactly.

> 
> > 
> > 3) Don't calculate a Adler32 checksum when comressing with zlib.
> >    JFFS2 already has its own checksum.
> This is really seems reasonable. Personally I didn't do that, but guess it 
> is possible to ask zlib not to add Adler32 checksums, right?

 Yes, I tried this once but that was too long time ago for me to remember how
 I did it. Currently JFFS2 skip the adler32 check upon read.
> 
> 
> I'll put your ideas to jffs3/TODO if you don't mind :-)

I don't mind :)

 Jocke
