Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cfi6S-0004qX-Gh
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 12:10:51 -0500
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>,
   "David Vrabel" <dvrabel@arcom.com>
Date: Sat, 18 Dec 2004 18:10:42 +0100
Message-ID: <BCEFJBPJCGFCNMMMIDBHEEMPCJAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041218161437.GC1083@wohnheim.fh-wedel.de>
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

> On Fri, 17 December 2004 11:33:42 +0000, David Vrabel wrote:
> > 
> > (Also, I wouldn't have thought crc16 on 32 bit archs would have any 
> > significant performance benefits.  But since I don't know either the 
> > crc16 or crc32 algorithms... *shrug*)
> 
> See my earlier posts in this thread for the algorithms.  Without
> special optimizations, you can process 16 bits at a time for crc16 and
> 0 (zero) bits at a time for crc32.

hmm, what about the kernel version of crc32. I think that one should
be classified as 32 bits at a time. Is that the version you use in your tests?

   Jocke
