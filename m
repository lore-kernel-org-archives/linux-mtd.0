Received: from eppat.qlogic.com ([63.170.40.2] helo=EPEXCH01.qlogic.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D8k53-000845-KM
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2005 14:09:22 -0500
Received: from swahl-linux.qlogic.org (localhost.localdomain [127.0.0.1])
	by swahl-linux.qlogic.org (8.12.8/8.12.8) with ESMTP id j28J9Ij8009351
	for <linux-mtd@lists.infradead.org>; Tue, 8 Mar 2005 13:09:18 -0600
Received: (from swahl@localhost)
	by swahl-linux.qlogic.org (8.12.8/8.12.5/Submit) id j28J9IfT009348
	for linux-mtd@lists.infradead.org; Tue, 8 Mar 2005 13:09:18 -0600
Date: Tue, 8 Mar 2005 13:08:53 -0600
From: Steve Wahl <steve.wahl@qlogic.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050308190853.GA18903@qlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: jedec_probe.c bug: AMD AM29LV800 in byte mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Trying again, maybe I was overbose last time. :-) If I missed a
response, feel free to bash me with a clue-by-4.]

When this chip (AM29LV800) is in byte mode, the id should be read from
location 2, and when in word mode, the id should be read from location
1.

jedec_read_id() (jedec_probe.c, near line 1675) seems to do the exact
opposite (read from 2 in word mode, and 1 in byte mode).  Because of
this, it is not finding this chip for me.  

I hacked it to always read from 2 rather than 1.

I'm willing to develop a patch for this, but I'm sure some chips
actually work with the current code, and I don't want to break them.
So I need some guidance on how to proceed.

Should I be reading both location 1 and location 2, and add a field to
jedec_table[] that indicates which location(s) to compare with?

--> Steve Wahl, Qlogic Corporation
