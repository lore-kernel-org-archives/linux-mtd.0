Received: from lizzard.sbs.de ([194.138.37.39])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKMwZ-0003K3-OG
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 10:51:43 +0000
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
 by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v5CAp89I019994
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2017 12:51:08 +0200
From: Daniel Wagner <daniel.wagner@siemens.com>
To: linux-mtd@lists.infradead.org
Cc: Daniel Wagner <daniel.wagner@siemens.com>
Subject: [PATCH v0 08/20] mtd-utils: ftl_format: Use return directly to leave
 main function
Date: Mon, 12 Jun 2017 12:50:49 +0200
Message-Id: <20170612105101.18223-9-daniel.wagner@siemens.com>
In-Reply-To: <20170612105101.18223-1-daniel.wagner@siemens.com>
References: <20170612105101.18223-1-daniel.wagner@siemens.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We can use return with the exit code instead of the sliglty odd exit,
return pattern.

Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
---
 misc-utils/ftl_format.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/misc-utils/ftl_format.c b/misc-utils/ftl_format.c
index 74322c7f03eb..649984b2a8cc 100644
--- a/misc-utils/ftl_format.c
+++ b/misc-utils/ftl_format.c
@@ -333,6 +333,5 @@ int main(int argc, char *argv[])
 	}
 	close(fd);
 
-	exit((ret) ? EXIT_FAILURE : EXIT_SUCCESS);
-	return 0;
+	return ret ? EXIT_FAILURE : EXIT_SUCCESS;
 }
-- 
2.9.4
