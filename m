Received: from [212.234.111.251] (helo=mail.telecom-design.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KepTn-0001X9-PY
	for linux-mtd@lists.infradead.org; Sun, 14 Sep 2008 11:09:25 +0000
Received: (from uucp@localhost) by mail.telecom-design.com id m8EB9KFr004564
	for <linux-mtd@lists.infradead.org>; Sun, 14 Sep 2008 13:09:20 +0200
Subject: [PATCH] [MTD] gen_probe.c: Probe chips in decreasing device size
	(most significant first)
From: Michel Stempin <michel.stempin@telecom-design.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Sun, 14 Sep 2008 13:09:12 +0200
Message-Id: <1221390552.25179.14.camel@Mikeul>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Probe chips in decreasing device size to detect most significant chip
IDs first in case there are two chips with the same LSB.

This case has been found between SST39VF3201 (Mfr: 0x0020, Id: 0x235B)
and SST49LF080A (Mfr: 0x0020, Id: 0x005B) chips.

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
---
 gen_probe.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c
b/drivers/mtd/chips/gen_probe.c
index f061885..d1875f8 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -170,7 +170,7 @@ static int genprobe_new_chip(struct map_info *map,
struct chip_probe *cp,
 {
        int min_chips = (map_bankwidth(map)/4?:1); /* At most 4-bytes
wide. */
        int max_chips = map_bankwidth(map); /* And minimum 1 */
-       int nr_chips, type;
+       int nr_chips, min_type, type;
 
        for (nr_chips = max_chips; nr_chips >= min_chips; nr_chips >>=
1) {
 
@@ -181,9 +181,9 @@ static int genprobe_new_chip(struct map_info *map,
struct chip_probe *cp,
 
                /* Minimum device size. Don't look for one 8-bit device
                   in a 16-bit bus, etc. */
-               type = map_bankwidth(map) / nr_chips;
+               min_type = map_bankwidth(map) / nr_chips;
 
-               for (; type <= CFI_DEVICETYPE_X32; type<<=1) {
+               for (type = CFI_DEVICETYPE_X32; type >= min_type;
type>>=1) {
                        cfi->device_type = type;
 
                        if (cp->probe_chip(map, 0, NULL, cfi))
