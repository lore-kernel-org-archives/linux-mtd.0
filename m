Date: Thu, 16 Dec 2004 14:50:57 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-Reply-To: <JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
Message-ID: <Pine.LNX.4.58.0412161449410.8020@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
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

On Thu, 16 Dec 2004, Joakim Tjernlund wrote:

> > On Thu, 16 Dec 2004, Joakim Tjernlund wrote:
> > 
> > > Hi List
> > > 
> > > I am a long time JFFS2 user(and developer), but I haven't been following
> > > JFFS2 for a year or two. I have noticed that JFFS3 has begun and I figured
> > > I would offer a few thoughts.
> > > 
> > > 1) Consider changing the start seed to crc32 from 0 to -1. Zero
> > >    is not a good start seed for crc32
> > If you do point 2 this will not be needed :-)
> 
> Yes, but if you do point 2, you still have to consider start seed and it should
> be != 0 regardless of what checksum you choose.

Do you have some of your Ideas done? :)

> 
> >  
> > > 
> > > 2) Consider another checksum algorithm. Crc32 is very expensive
> > >    and JFFS2 suffered severely in the early days. Now that crc32 is
> > >    very optimized that problem is less visible, but crc32 is still
> > >    expensive. Maybe an Adler32 checksum is good enough or a crc16?
> > IMHO, NAND/ECC NOR are additionally protected by ECCs so that sounds 
> > reasonable. NORs are reliable, so that is reasonable too, IMHO.
> 
> Exactly.
> 
> > 
> > > 
> > > 3) Don't calculate a Adler32 checksum when comressing with zlib.
> > >    JFFS2 already has its own checksum.
> > This is really seems reasonable. Personally I didn't do that, but guess it 
> > is possible to ask zlib not to add Adler32 checksums, right?
> 
>  Yes, I tried this once but that was too long time ago for me to remember how
>  I did it. Currently JFFS2 skip the adler32 check upon read.
> > 
> > 
> > I'll put your ideas to jffs3/TODO if you don't mind :-)
> 
> I don't mind :)

Done.

> 
>  Jocke
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
