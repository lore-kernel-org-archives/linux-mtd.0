Received: from xerxes.tchmachines.com ([208.76.80.175])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVAsb-0005YH-Ay
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 14:54:36 -0400
Received: from archite by xerxes.tchmachines.com with local (Exim 4.68)
	(envelope-from <linux01@architechnical.net>) id 1IVAsX-0005Ea-IP
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 14:54:29 -0400
Message-ID: <49847.69.30.123.186.1189536869.squirrel@architechnical.net>
Date: Tue, 11 Sep 2007 14:54:29 -0400 (EDT)
Subject: nandwrite image fit re-checking?
From: linux01@architechnical.net
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nandwrite doesn't appear to retest if the image still fits into a
partition after it discovers bad blocks.  If I have an image the same size
as a partition and a block is bad, would it then try to write the last
block into the next partition after skipping the bad block?  (I assume the
MTD layer would know it's out of range and fail on pwrite).  Is this
considered a potential bug?
