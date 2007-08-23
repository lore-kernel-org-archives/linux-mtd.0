Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOMVa-0002Tq-1v
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 19:54:39 -0400
Received: by nf-out-0910.google.com with SMTP id h3so519216nfh
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 16:54:37 -0700 (PDT)
Resent-Message-ID: <200708240150.59098.jesper.juhl@gmail.com>
Message-Id: <1d6727f1f17e3ccd2986154ff549d5ffeb1884fe.1187912217.git.jesper.juhl@gmail.com>
In-Reply-To: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
References: <1554af80879a7ef2f78a4d654f23c248203500d9.1187912217.git.jesper.juhl@gmail.com>
From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Fri, 24 Aug 2007 01:51:44 +0200
Subject: [PATCH 08/30] mtd: Avoid a pointless kmalloc() return value cast in
	TQM8xxL mapping handling code
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: Kirk Lee <kirk@hpc.ee.ntu.edu.tw>, linux-mtd@lists.infradead.org,
	Jesper Juhl <jesper.juhl@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In drivers/mtd/maps/tqm8xxl.c::init_tqm_mtd() it is pointless casting
the return value of kmalloc() since it returns void*.

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---
 drivers/mtd/maps/tqm8xxl.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/tqm8xxl.c b/drivers/mtd/maps/tqm8xxl.c
index 37e4ded..1d75ce4 100644
--- a/drivers/mtd/maps/tqm8xxl.c
+++ b/drivers/mtd/maps/tqm8xxl.c
@@ -141,8 +141,7 @@ int __init init_tqm_mtd(void)
 			goto error_mem;
 		}
 
-		map_banks[idx]->name = (char *)kmalloc(16, GFP_KERNEL);
-
+		map_banks[idx]->name = kmalloc(16, GFP_KERNEL);
 		if (!map_banks[idx]->name) {
 			ret = -ENOMEM;
 			/* FIXME: What if some MTD devices were probed already? */
-- 
1.5.2.2
