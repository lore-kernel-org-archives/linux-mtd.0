Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgl9m-00026P-Oi
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:38:36 -0500
Date: Tue, 21 Dec 2004 15:38:30 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Message-ID: <20041221143830.GE22636@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEEEGDCPAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEEEGDCPAA.joakim.tjernlund@lumentis.se>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 December 2004 14:20:43 +0100, Joakim Tjernlund wrote:
> 
> 2) Consider another checksum algorithm. Crc32 is very expensive
>    and JFFS2 suffered severely in the early days. Now that crc32 is
>    very optimized that problem is less visible, but crc32 is still
>    expensive. Maybe an Adler32 checksum is good enough or a crc16?

Ok, after further thought, I actually like adler32.  It uses two
checksums that individually are very weak.  But the combination of the
two proves to be surprisingly strong.  Running my hash-table test,
adler32 is on par with the best hash function I could come up with
(and faster than any hash function in the kernel).

The hash-table test is quite nice, as it penalizes weak hash
functions.  Hash functions that run fast, but cause many collisions,
cause more time to be spent in search for a free slot.  So only
functions that are fast _and_ strong do well.  And adler32 does
extremely well.

So, unless you want to change the function to run backwards, I'd
propose to use adler32.

Jörn

-- 
/* Keep these two variables together */
int bar;
