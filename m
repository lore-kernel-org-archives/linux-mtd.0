Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf2pQ-0005i4-O6
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 16:06:30 -0500
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>,
   "Thomas Gleixner" <tglx@linutronix.de>
Date: Thu, 16 Dec 2004 22:06:21 +0100
Message-ID: <BCEFJBPJCGFCNMMMIDBHCEMGCJAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041216205102.GC10285@wohnheim.fh-wedel.de>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
Reply-To: Joakim.Tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > unsigned short crc16 (unsigned char *buf, size_t len)
> > {
> >         unsigned short crc = 0xffff;
> >         while (len--)
> >                 crc = (unsigned short) (crc >> 8) ^ 
> > 		     crc16tab[(crc ^ (unsigned short)(*buf++)) & 0xff];
> >         return crc;
> > }
> > 
> 
> Thomas, you respond faster than I can think!
> 
> real    0m0.395s
> user    0m0.326s
> sys     0m0.067s
> 
> The algorithm doesn't run that fast, though.

There is still more one can do, look in lib/crc32.c in the kernel to see
what I mean. It is tricky to get everything right, but just unrolling it a bit will help.

 Jocke
