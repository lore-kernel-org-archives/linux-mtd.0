Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M2YL-0002ho-7w
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 10:21:29 +0100
Date: Sat, 31 May 2003 11:21:43 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: James Morris <jmorris@intercode.com.au>
Message-ID: <20030531092143.GA19898@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "David S. Miller" <davem@redhat.com>
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: [PATCH for testing] 1/2 central workspace for zlib, for 2.5.70
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a very stupid port from the 2.4 code.  Quite enough for 99.9%
of all users, but the final one should register callbacks for cpus
being added and removed.

Patch 2/2 applies to both 2.4.20 and 2.5.70, so I won't resend.

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
