Received: from smtp-01.datacomm.ch ([212.40.2.26])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MXbfy-00027D-2k
	for linux-mtd@lists.infradead.org; Sun, 02 Aug 2009 14:04:42 +0000
Received: from [192.168.1.40] (121-140.76-83.cust.bluewin.ch [83.76.140.121])
	(Authenticated sender: Neukomm@vtxmail.ch)
	by smtp-01.datacomm.ch (VTX Datacomm AG) with ESMTPA id 9509F1DC15B
	for <linux-mtd@lists.infradead.org>;
	Sun,  2 Aug 2009 16:04:34 +0200 (CEST)
Message-ID: <4A759CF3.2010908@vtxmail.ch>
Date: Sun, 02 Aug 2009 16:04:35 +0200
From: Daniel Neukomm <Neukomm@vtxmail.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: patch for mkfs.ubifs devtable.c increment in dev_table is wrongly
	interpreted
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

patch for mkfs.ubifs devtable.c increment in dev_table is wrongly 
interpreted

with the device table one can add /dev entries to the root file system 
image.
The device table file contains among others the fields minor, start, 
increment and count.
If there is an entry with minor=0 start=0 increment =32 and count=4 the 
mkfs.ubifs makes
128 device entries, with minor numbers from 0 to 127
The correct version makes 4 entries with minor number 0,32,64,96.

/dev/mtd c 640 0 0 90 0 0  2 7
This gives 14 devices /dev/mtdXX instead of  7 devices.
Due to this error mtd_debug info /dev/mtd3 delivers the information of 
/dev/mtd1 instead of. 

diff --git a/mkfs.ubifs/devtable.c b/mkfs.ubifs/devtable.c
index 236a6e7..e2d96dc 100644
--- a/mkfs.ubifs/devtable.c
+++ b/mkfs.ubifs/devtable.c
@@ -248,7 +248,7 @@ static int interpret_table_entry(const char *line)
                        goto out_free;
                }
        } else {
-               int i, num = start + increment * count, len = 
strlen(name) + 20;
+               int i, num = start + count, len = strlen(name) + 20;
                char *nm;

                for (i = start; i < num; i++) {
@@ -262,7 +262,7 @@ static int interpret_table_entry(const char *line)
                        nh_elt->mode = mode;
                        nh_elt->uid = uid;
                        nh_elt->gid = gid;
-                       nh_elt->dev = makedev(major, minor + i - start);
+                       nh_elt->dev = makedev(major, minor + (i - 
start)*increment);

                        nm = malloc(len);
                        if (!nm) {
