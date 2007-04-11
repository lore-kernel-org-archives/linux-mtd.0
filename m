Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HbmaG-0002Hs-2K
	for linux-mtd@lists.infradead.org; Wed, 11 Apr 2007 19:50:41 -0400
Received: from archite by server37.tchmachines.com with local (Exim 4.63)
	(envelope-from <linux@architechnical.net>) id 1HbmZy-0004Yh-Qi
	for linux-mtd@lists.infradead.org; Wed, 11 Apr 2007 19:50:22 -0400
Message-ID: <35297.69.30.123.186.1176335422.squirrel@architechnical.net>
Date: Wed, 11 Apr 2007 16:50:22 -0700 (PDT)
Subject: "OneNAND oobfree" revisited
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

In this conversation between Adrian and Kyungmin it's stated that the
OneNAND driver optimizes memcpy for 32-bit transfers:

http://lists.infradead.org/pipermail/linux-mtd/2007-January/017201.html

While this might work on some platforms, it seems to cause bus errors on
our PXA-270-based machine.  So I replace memcpy, memset, and memcmp with
local routines optimized for 16-bit access and the crashes go away.  I
also tried overriding the optimization with "EXTRA_CFLAGS += -O0" in the
Makefile but I doubt it has any effect.

My issue with this is that I'd have to patch onenand_base.c, or I could
put conditionals in, but either way I'm wondering if there's a cleaner way
to fix this.  Any ideas?
