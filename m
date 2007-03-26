Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HVlo1-0000E0-El
	for linux-mtd@lists.infradead.org; Mon, 26 Mar 2007 05:48:02 -0400
Subject: Excessive scanning of empty space due to point/unpoint methods
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 26 Mar 2007 11:47:53 +0200
Message-Id: <1174902473.26465.383.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have noticed that the point/unpoint methods used by default by
cfi_cmdset_0001.c causes excessive scanning of empty flash space.
My mount time goes down from ~15 seconds to <1 second if I
remove the extra scanning.

point/unpoint sets buf_size to 0 in jffs2_scan_medium and that
makes jffs2_scan_eraseblock assume a scan length equal to
sector size:
	if (!buf_size) {
		/* This is the XIP case -- we're reading _directly_ from the flash chip */
		buf_len = c->sector_size;
	} else {
		buf_len = EMPTY_SCAN_SIZE(c->sector_size);
		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
		if (err)
			return err;
	}
This apperently has something to do with XIP but I don't know much
about the requierments of XIP so could someone comment why XIP
needs to scan the whole flash?

 Jocke
