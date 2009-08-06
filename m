Received: from exhub015-3.exch015.msoutlookonline.net ([207.5.72.95])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MYr2s-0004ET-CW
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 00:41:30 +0000
Message-ID: <4A7A26B3.7020503@orb.com>
Date: Wed, 5 Aug 2009 17:41:23 -0700
From: Jehan Bing <jehan@orb.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/5 v3] [MTD-UTILS] Unified reading from standard input and
	from file
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allow writing the OOB when using the standard input.

Signed-off-by: Jehan Bing <jehan@orb.com>

--- a/nandwrite.c	2009-08-05 15:48:25.000000000 -0700
+++ b/nandwrite.c	2009-08-05 15:48:49.000000000 -0700
@@ -392,12 +392,6 @@ int main(int argc, char * const argv[])
 		goto restoreoob;
 	}
 
-	/* For now, don't allow writing oob when reading from standard input. */
-	if (ifd == STDIN_FILENO && writeoob) {
-		fprintf(stderr, "Can't write oob when reading from standard input.\n");
-		goto closeall;
-	}
-
 	pagelen = meminfo.writesize + ((writeoob) ? meminfo.oobsize : 0);
 
 	/*
