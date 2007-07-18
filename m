Received: from xerxes.tchmachines.com ([208.76.80.175])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBIwo-0003df-QK
	for linux-mtd@lists.infradead.org; Wed, 18 Jul 2007 19:28:47 -0400
Message-ID: <30183.69.30.123.186.1184801323.squirrel@architechnical.net>
Date: Wed, 18 Jul 2007 16:28:43 -0700 (PDT)
Subject: flash_eraseall -j / jffs2 oobfree / OneNAND
From: "Pete MacKay" <linux@architechnical.net>
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

Looking at the latest mtd-utils.git pull I see that flash_eraseall -j
truncates the cleanmarker to the length in the first oobfree structure,
which is a bug for a segmented OOB like the OneNAND.  (It has a 3 free
bytes at offset 2 and another 2 at offset 14 so it has to truncate to 5
anyway).  This causes unnecessary erase cycles on the scan when I mount a
jffs2 file system.

Also in onenand_base.c:onenand_fill_auto_oob there may be a bug (overrun)
in checking free->length for the onenand_oob_32 structure, which only has
4 (< MTD_MAX_OOBFREE_ENTRIES) oobfree entries.

Should I hack this locally, or am I seeing something that affects anyone
else?

Thanks,
Pete MacKay
