Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgOUM-0006Ib-8C
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 13:21:46 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'Jarkko Lavinen \(NMP/Helsinki\)'" <jarkko.lavinen@nokia.com>,
   "'MTD List'" <linux-mtd@lists.infradead.org>
Date: Tue, 13 Jan 2004 14:19:11 +0100
Message-ID: <000601c3d9d7$d770b630$0a01a8c0@LUMENTIS02>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040113125031.GA5146@angel.research.nokia.com>
Subject: RE: JFFS2 mount time
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I am working with an embedded device with 64MB nand chip. I am able to
> read from chip at 6MB/s and able to read the whole chip in 10 seconds
> using character mtd device. The device has Omap1610 running at 190MHz,
> kernel 2.4.21.
> 
> With 80% file system usage the mount time is 8 seconds which is
> unacceptable for root file system on a handheld device. I assume the
> scan time is linear with respect to the size of the flash partition
> and the file system usage.
> 
> Is there anything that could be done to reduce the mount time of large
> JFFS2 partitions?  Lazy mounting with prioritized scanning?

Yes, it is already done in JFFS2 CVS. Mount time for me is about a second on
a 64MB JFFS2 NOR flash.

      Jocke
