Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnvI0-0000Vz-HC
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:52:09 +0000
Subject: [PATCH] Series short description
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Fri, 11 Feb 2011 16:52:06 +0100
Message-ID: <20110211155153.25082.56038.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Anatolij Gustschin <agust@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following series implements...

---

Guillaume LECERF (1):
      Simplify write buffer size calculation by using mtd->writebufsize.


 drivers/mtd/chips/cfi_cmdset_0001.c |   13 ++++++-------
 drivers/mtd/chips/cfi_cmdset_0002.c |    3 +--
 drivers/mtd/chips/cfi_cmdset_0020.c |   16 ++++++++--------
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
Signature
