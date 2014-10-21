Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgURk-00006C-It
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 08:05:37 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <nicolas.ferre@atmel.com>
Subject: [PATCH 0/2] *** jffs2: fix debug outputs ***
Date: Tue, 21 Oct 2014 10:04:58 +0200
Message-ID: <cover.1413878259.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This series of patches fixes some bugs in the output of jffs2 debug functions.

Cyrille Pitchen (2):
  jffs2: fix wrong offset in an error msg from
    __jff2_dbg_prewrite_paranoia_check
  jffs2: fix buffer dump debug output

 fs/jffs2/debug.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

-- 
1.8.2.2
