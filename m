Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch9aK-0002Fl-PB
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 11:43:38 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>,
   "Jörn Engel" <joern@wohnheim.fh-wedel.de>
Date: Wed, 22 Dec 2004 17:43:31 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEKEKMCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, 22 Dec 2004, [iso-8859-1] Jörn Engel wrote:
>
> > On Wed, 22 December 2004 15:56:23 +0000, Artem B. Bityuckiy wrote:
> > >
> > > Preliminarily I'm planning:
> > > 1. Use adler32 on headers
> > > 2. Leave crc32 on data
> >
> > Why keep crc32?
> This is just my IMHO: headers are small and the probability that serious
> error appear there is lower that the probability of error on data. So it
> seems we may reduce crc strength for them.

Maybe, but it is the data CRC that costs. I don't think you will notice
the difference if you just change the header CRC to Adler32.

>
> In case of data - I just not sure if it is correct to use weaker
> algorithm...
> If somebody compitent may soundly explain why we may reduce CRC strength
> there...
>
> Anyway, saing zlib not to add adler32 CRC is good idea and I think should
> be done.

Yes, that one is independant of what CRC algorithm we choose.

 Jocke
