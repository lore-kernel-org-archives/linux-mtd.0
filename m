Received: from sonolo.xs4all.nl ([80.126.206.91] helo=sendmail.metro.cx)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CiwgD-0001uP-9k
	for linux-mtd@lists.infradead.org; Mon, 27 Dec 2004 10:21:07 -0500
Date: Mon, 27 Dec 2004 16:20:54 +0100
From: "K.F.J. Martens" <kmartens@sonologic.nl>
To: linux-mtd@lists.infradead.org
Message-ID: <20041227152054.GA14835@metro.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@redhat.com, trivial@rustcorp.com.au, linux-kernel@vger.kernel.org
Subject: [PATCH] Bug in 2.6.10 mtd driver for physmem mapped flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The patch below fixes a small but fatal bug in the code that handles
non-buswidth-aligned writes. The problem is that the code used the same
index in both map_word and buf, therefore putting the wrong words in the
map_word that partially contains old data and partially contains new
data. The result: corrupt data is being written.

Signed-off-by: Koen Martens <kmartens@sonologic.nl>

--- linux-2.6.10/include/linux/mtd/map.h        2004-12-24 22:34:31.000000000 +0100
+++ linux-2.6.10-gmc/include/linux/mtd/map.h    2004-12-27 15:59:02.631211329 +0100
@@ -322,7 +322,7 @@ static inline map_word map_word_load_par
                        bitpos = (map_bankwidth(map)-1-i)*8;
 #endif
                        orig.x[0] &= ~(0xff << bitpos);
-                       orig.x[0] |= buf[i] << bitpos;
+                       orig.x[0] |= buf[i-start] << bitpos;
                }
        }
        return orig;

-- 
K.F.J. Martens, Sonologic, http://www.sonologic.nl/
Networking, embedded systems, unix expertise, artificial intelligence.
Public PGP key: http://www.metro.cx/pubkey-gmc.asc
Wondering about the funny attachment your mail program
can't read? Visit http://www.openpgp.org/
