Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfK7O-0005xa-0y
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 10:34:11 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Vrabel" <dvrabel@arcom.com>
Date: Fri, 17 Dec 2004 16:34:02 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEEEHHCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <41C2C416.5090602@arcom.com>
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

> Joakim Tjernlund wrote:
> > 
> > 2) Consider another checksum algorithm. Crc32 is very expensive
> >    and JFFS2 suffered severely in the early days. Now that crc32 is
> >    very optimized that problem is less visible, but crc32 is still
> >    expensive. Maybe an Adler32 checksum is good enough or a crc16?
> 
> Does anyone have links to the profilling data that showed this?

I had long time ago. That was the reason I optimized the in kernel
crc32() function to its current status.

> 
> (Also, I wouldn't have thought crc16 on 32 bit archs would have any 
> significant performance benefits.  But since I don't know either the 
> crc16 or crc32 algorithms... *shrug*)

Well, benchmarking the crc32() and csum_partial() functions in the
kernel should give a clue.

 Jocke
