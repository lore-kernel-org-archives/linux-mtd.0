Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf3m2-0006nB-MB
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 17:07:07 -0500
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
Date: Thu, 16 Dec 2004 23:06:41 +0100
Message-ID: <BCEFJBPJCGFCNMMMIDBHIEMHCJAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041216212210.GA12833@wohnheim.fh-wedel.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
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

> On Thu, 16 December 2004 22:06:21 +0100, Joakim Tjernlund wrote:
> > 
> > There is still more one can do, look in lib/crc32.c in the kernel to see
> > what I mean. It is tricky to get everything right, but just unrolling it a bit will help.
> 
> Sure.  But I won't do it tonight anymore and the rest of the week is
> booked.

Same here :(

> 
> In related news, I just had a look at adler32 code.  It's pretty
> obvious why it runs so fast and why we shouldn't use it as a checksum:
> o It splits data into chunks of 5552 bytes.
> o Inside each chunk, it basically implements the two weak checksums
>   from rsync. (And those really are weak.  I once tried using them for
>   a hash table and the result was horrible.)
> o At the end of each chunk, it implements crc16 on both weak
>   checksums.
> 
> With jffs3 node containing less than 5552 bytes each, the crc16
> operation, a simple modulo, is done but once.  So in effect, we end up
> with the weak checksums from rsync, which cause tons of collisions in
> hash tables.  Pretty nasty for a checksum.
> 
> Istr reading something from one of the two authors that basically
> states the adler32 weakness for short files.  But for long files, the
> checksum is getting strong enough and much faster.  Too bad that our
> "files" are short.

I too rember reading about that. So a new optimzed crc16 is probably the best bet.
It should do better than crc32 once it is done.

hmm, I rember that the networking code has some crc/checksum algorithm too.
Maybe it is possible to use that?

 Jocke
