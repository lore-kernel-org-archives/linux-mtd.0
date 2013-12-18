Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vt5Ya-0008GH-Nr
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 01:04:13 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so7721074pbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 17:03:47 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd-utils: nanddump: write requested length only
Date: Tue, 17 Dec 2013 17:03:06 -0800
Message-Id: <1387328586-24356-1-git-send-email-bisson.gary@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nanddump was always writing a whole page of data into the output
discarding the length actually requested. This patch allows to
write only the remaining length if oob is omitted. In case oob
is needed, it makes sense to copy the entire page.
---
 nanddump.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 4ee7ed4..300aca6 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -445,8 +445,14 @@ int main(int argc, char * const argv[])
 						pretty_buf, PRETTY_BUF_LEN, true, canonical, ofs + i);
 				write(ofd, pretty_buf, strlen(pretty_buf));
 			}
-		} else
-			write(ofd, readbuf, bs);
+		} else {
+			/* Write requested length if oob is omitted */
+			size_t size_left = end_addr - ofs;
+			if (omitoob && (size_left < bs))
+				write(ofd, readbuf, size_left);
+			else
+				write(ofd, readbuf, bs);
+		}
 
 		if (omitoob)
 			continue;
-- 
1.8.5.1
