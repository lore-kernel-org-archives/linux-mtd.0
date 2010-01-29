Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Naxw0-00086o-D7
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 20:59:25 +0000
Subject: [PATCHv3 6/9] idr: Export idr_get_next()
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Fri, 29 Jan 2010 20:59:17 +0000
Message-Id: <1264798757.2785.36.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: sf-linux-drivers <linux-net-drivers@solarflare.com>,
	linux-mtd@lists.infradead.org,
	KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

idr_get_next() was accidentally not exported when added.  It is about
to be used by mtdcore, which may be built as a module.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 lib/idr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/idr.c b/lib/idr.c
index 1cac726..21f9266 100644
--- a/lib/idr.c
+++ b/lib/idr.c
@@ -621,7 +621,7 @@ void *idr_get_next(struct idr *idp, int *nextidp)
 	}
 	return NULL;
 }
-
+EXPORT_SYMBOL(idr_get_next);
 

 /**
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
