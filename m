Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGXn-0003FX-T8
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:24 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 02/10] mtd-tests: io_paral: build error,
	"variable length strings"
Date: Mon, 27 Jun 2011 11:27:19 -0700
Message-ID: <1309199247-19248-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some compilers will complain about use of strlen() within a static array
size declaration. For this type of string, "sizeof() - 1" is equivalent
and prevents the build error.

Error:

   io_paral.c:48:13: error: variably modified 'vol_nodes' at file scope

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 tests/ubi-tests/io_paral.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/ubi-tests/io_paral.c b/tests/ubi-tests/io_paral.c
index 9754a0d..1d9a97c 100644
--- a/tests/ubi-tests/io_paral.c
+++ b/tests/ubi-tests/io_paral.c
@@ -45,7 +45,7 @@ static int vol_size;
 
 static struct ubi_mkvol_request reqests[THREADS_NUM + 1];
 static char vol_name[THREADS_NUM + 1][100];
-static char vol_nodes[THREADS_NUM + 1][strlen(UBI_VOLUME_PATTERN) + 100];
+static char vol_nodes[THREADS_NUM + 1][sizeof(UBI_VOLUME_PATTERN) + 99];
 static unsigned char *wbufs[THREADS_NUM + 1];
 static unsigned char *rbufs[THREADS_NUM + 1];
 
-- 
1.7.0.4
