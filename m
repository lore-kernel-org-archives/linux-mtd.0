Date: Tue, 7 May 2013 12:32:38 -0700
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: refactor call to request_module
Message-ID: <20130507193238.GA2235@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Rusty Russell <rusty@rustcorp.com.au>,
 James Hogan <james.hogan@imgtec.com>, David Woodhouse <dwmw2@infradead.org>,
 Kees Cook <keescook@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reduces the size of the stack frame when calling request_module().
Performing the sprintf before the call is not needed.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/chips/gen_probe.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 74dbb6b..ffb36ba 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -211,9 +211,7 @@ static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
 
 	probe_function = __symbol_get(probename);
 	if (!probe_function) {
-		char modname[sizeof("cfi_cmdset_%4.4X")];
-		sprintf(modname, "cfi_cmdset_%4.4X", type);
-		request_module(modname);
+		request_module("cfi_cmdset_%4.4X", type);
 		probe_function = __symbol_get(probename);
 	}
 
-- 
1.7.9.5


-- 
Kees Cook
Chrome OS Security
