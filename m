Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf1pR-0004dg-VZ
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 15:02:27 -0500
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>,
   "Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Thu, 16 Dec 2004 21:02:19 +0100
Message-ID: <BCEFJBPJCGFCNMMMIDBHAEMECJAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041216194931.GA10285@wohnheim.fh-wedel.de>
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

> On Thu, 16 December 2004 20:15:00 +0100, Jörn Engel wrote:
> >
> > PS: Now you've done it.  I'll implement crc24 and crc16 and benchmark
> > them against adler32.  Darn you!
>
> Testcase going through 45MB of data in chunks of 4k.  Machine is
> PIII-1166 with warm caches.
>
> Doing three runs and discarding the fastest and slowest ones:
>
> crc32:
> real    0m0.214s
> user    0m0.133s
> sys     0m0.076s
>
> adler32:
> real    0m0.128s
> user    0m0.061s
> sys     0m0.066s
>
> crc24:
> real    0m0.969s
> user    0m0.882s
> sys     0m0.073s
>
> crc16:
> real    0m0.382s
> user    0m0.312s
> sys     0m0.061s
>
>
> Looks like those cold hard numbers beat the crap out of my previous
> argument.  So unless someone can seriously optimize below functions,
> just pick adler32.

hmm, crc32 is much faster than crc16/crc24. That means that there is plenty of room
for optimization. One probably needs for find a table driven algoritm and do
a little unrolling.

 Jocke
