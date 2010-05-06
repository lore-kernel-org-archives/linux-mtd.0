Message-ID: <4BE23ADB.9090409@renesas.com>
Date: Thu, 06 May 2010 12:43:23 +0900
From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH] mtd: Remove empty mtd/mtdbdi.c and mtd/internal.h files
References: <4BE23A03.1030001@renesas.com>
In-Reply-To: <4BE23A03.1030001@renesas.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: shinya.kuribayashi.px@renesas.com
Cc: Joern Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit a33eb6b9 (Move mtd_bdi_*mappable to mtdcore.c) forgot to 'git rm'
these files.

Cc: Joern Engel <joern@logfs.org>
Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
---
  0 files changed, 0 insertions(+), 0 deletions(-)
  delete mode 100644 drivers/mtd/internal.h
  delete mode 100644 drivers/mtd/mtdbdi.c

diff --git a/drivers/mtd/internal.h b/drivers/mtd/internal.h
deleted file mode 100644
index e69de29..0000000
diff --git a/drivers/mtd/mtdbdi.c b/drivers/mtd/mtdbdi.c
deleted file mode 100644
index e69de29..0000000
-- 
1.7.1
