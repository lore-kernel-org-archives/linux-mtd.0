Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cfh8u-0003U8-B4
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 11:09:17 -0500
Date: Sat, 18 Dec 2004 17:09:08 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Message-ID: <20041218160908.GB1083@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0412171100470.8020@phoenix.infradead.org>
	<JPEALJAFNGDDLOPNDIEEEEHECPAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEEEHECPAA.joakim.tjernlund@lumentis.se>
Cc: jasmine@linuxgrrls.org, Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 December 2004 12:19:55 +0100, Joakim Tjernlund wrote:
> 
> Looked a little closer on csum_partial and I think JFFS3 can use it. You need
> csum_fold as well:
> seed = ~0;
> crc = csum_fold(csum_partial(buff, len, seed));
> 
> Don't know if it is good enough for JFFS3 but it is fast.

It sure is hard to read.  Is there any version in C around?

Jörn

-- 
It's not whether you win or lose, it's how you place the blame.
-- unknown
