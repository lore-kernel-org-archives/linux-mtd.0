Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch8S5-0008Ph-Jq
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 10:31:02 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>,
   "Artem B. Bityuckiy" <dedekind@infradead.org>
Date: Wed, 22 Dec 2004 16:30:20 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEGEKICPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041222151403.GA8943@wohnheim.fh-wedel.de>
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

> Here is backward engel32.  It runs about 1.5% faster than forward
> engel32 in my hash test.  Other backward algorithms should be in the
> same order (depending on hardware).

Hi again

Can you do
1) First run a forward and then a backward version on memory space >= 2*L1 cache
2) Then do two forward runs on the same memory.

Compare the delta between 1) and 2)
That should give a clue if it is worth having a backward version.

> 
> Adler32 beats the hell out of every other algorithm.  Except for the
> backwards part, it appears to be a clear winner.

Have you look at the assembler Engler32 generates? Every instruction counts
in such small loops.

 Jocke

PS.
 I am levaing for Christmas in 2 hours and will be offline more or less until January
 so I guess I won't be much help in the near future.
