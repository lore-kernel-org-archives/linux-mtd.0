Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfhE7-0003dt-RC
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 11:14:41 -0500
Date: Sat, 18 Dec 2004 17:14:37 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Vrabel <dvrabel@arcom.com>
Message-ID: <20041218161437.GC1083@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEEEGDCPAA.joakim.tjernlund@lumentis.se>
	<41C2C416.5090602@arcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41C2C416.5090602@arcom.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 December 2004 11:33:42 +0000, David Vrabel wrote:
> 
> (Also, I wouldn't have thought crc16 on 32 bit archs would have any 
> significant performance benefits.  But since I don't know either the 
> crc16 or crc32 algorithms... *shrug*)

See my earlier posts in this thread for the algorithms.  Without
special optimizations, you can process 16 bits at a time for crc16 and
0 (zero) bits at a time for crc32.

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown
