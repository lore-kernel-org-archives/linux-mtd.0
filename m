Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cex6v-00029j-Nm
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 10:00:11 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Artem Bityuckiy" <dedekind@infradead.org>
Date: Thu, 16 Dec 2004 16:00:05 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEAEGGCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0412161449410.8020@phoenix.infradead.org>
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
> > > On Thu, 16 Dec 2004, Joakim Tjernlund wrote:
> > > 
> > > > Hi List
> > > > 
> > > > I am a long time JFFS2 user(and developer), but I haven't been following
> > > > JFFS2 for a year or two. I have noticed that JFFS3 has begun and I figured
> > > > I would offer a few thoughts.
> > > > 
> > > > 1) Consider changing the start seed to crc32 from 0 to -1. Zero
> > > >    is not a good start seed for crc32
> > > If you do point 2 this will not be needed :-)
> > 
> > Yes, but if you do point 2, you still have to consider start seed and it should
> > be != 0 regardless of what checksum you choose.
> 
> Do you have some of your Ideas done? :)

No, I had the removal of the Adler32 checksum, but it is gone now.
I could possibly do that again and a optimized crc16(I did the crc32 in current kernel
so it shouldn't be hard) or adler32 checksum algorithm.
It will have to wait as I got plenty to do currently.

 Jocke
