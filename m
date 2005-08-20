Received: from xena.bway.net ([216.220.96.26] helo=mail.bway.net)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E6Gna-0006Cp-Pu
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2005 20:01:24 -0400
Message-ID: <430672D0.5070900@bway.net>
Date: Sat, 20 Aug 2005 00:01:20 +0000
From: "Ryan B. Lynch" <rlynch@bway.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: Removal of devfs support from MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I don't know if anybody else is still stuck in the time-warp that is
devfs, compiling kernels on parchment and generally being obsolete.  But
since I spent 2 hours last night trying to figure out why my device
nodes stopped appearing after I applied the latest MTD patches, I
thought I'd make a public service announcement.

(For what it's worth, the upgrade to Udev was totally
painless--everything works like it always should have.)

-Ryan
