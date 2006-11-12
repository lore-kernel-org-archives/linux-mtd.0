Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GjICc-0003kT-GK
	for linux-mtd@lists.infradead.org; Sun, 12 Nov 2006 16:29:04 +0000
Message-ID: <45574BB5.5010601@transmode.se>
Date: Sun, 12 Nov 2006 17:28:37 +0100
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: cfi_cmd0001.c broken w.r.t Erase Suspend
Content-Type: multipart/mixed; boundary="------------050406010305080005080103"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050406010305080005080103
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi List

I found some problems that I think is flash driver
related(cfi_cmd0001.c). Somehow the
flash is in Erase suspend when do_erase_oneblock has returned from
INVAL_CACHE_AND_WAIT
I have tried lots of "fixes" but the only one that works is to detect
the Suspend in do_erase_oneblock
and issue a new resume and go back to INVAL_CAHCE_AND_WAIT, see attached
patch.
I am uing Intel P30 flash and 2.6.19-rc3 on powerpc

How to reproduce:
apply patch to kernel

boot to userspace and do:
cp -a /bin /root/tt1
cp -a /bin /root/tt2
cp -a /bin /root/tt3
cp -a /bin /root/tt4
cp -a /bin /root/tt5

Fill up the rest JFFS2 FS to it is full using dd to create an huge file
until the FS is full.
make sure syslog and klogd is running and is logging to file on the
JFFS2 FS.

Now do
1)
rm -rf /root/tt5
cp -a /root/tt1 /root/tt5

wait a few secs to a minute, then go to 1)

a few other observations:

It is very hard to trigger a erase, seems like the gc daemon uses that
as its last resort. Why not
erase blocks as soon they are ready to be erased?

I have seen cp consume 100% CPU sevral times

Also noticed gc sleeping whil cp is running and making no progress.
had to kick gc with a kill -HUP <gc pid> to make it run to make room for
the cp.

The above observations makes me think there is a bug or two in JFFS2 as
well.

 Jocke

--------------050406010305080005080103
Content-Type: text/x-patch;
 name="cfi_cmd0001.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cfi_cmd0001.patch"

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 2fd5cef..6f2d2d9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -751,6 +751,8 @@ static int get_chip(struct map_info *map
 		map_write(map, CMD(0x70), adr);
 		chip->oldstate = FL_ERASING;
 		chip->state = FL_ERASE_SUSPENDING;
+		if (chip->erase_suspended)
+		   printk("chip already suspended");
 		chip->erase_suspended = 1;
 		for (;;) {
 			status = map_read(map, adr);
@@ -775,6 +777,9 @@ static int get_chip(struct map_info *map
 			/* Nobody will touch it while it's in state FL_ERASE_SUSPENDING.
 			   So we can just loop here. */
 		}
+		if (chip->erase_suspended != 1)
+		   printk("SUSPEND: chip not suspended");
+
 		chip->state = FL_STATUS;
 		return 0;
 
@@ -854,10 +859,15 @@ static void put_chip(struct map_info *ma
 		   sending the 0x70 (Read Status) command to an erasing
 		   chip and expecting it to be ignored, that's what we
 		   do. */
+		if (chip->erase_suspended != 1)
+		   printk("RESUME: chip not suspended");
+		chip->erase_suspended = 0;
 		map_write(map, CMD(0xd0), adr);
 		map_write(map, CMD(0x70), adr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
+		if (chip->erase_suspended)
+		   printk("RESUME: chip suspended");
 		break;
 
 	case FL_XIP_WHILE_ERASING:
@@ -1718,7 +1728,7 @@ static int __xipram do_erase_oneblock(st
 	map_write(map, CMD(0xD0), adr);
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
-
+ again:
 	ret = INVAL_CACHE_AND_WAIT(map, chip, adr,
 				   adr, len,
 				   chip->erase_time);
@@ -1734,6 +1744,15 @@ static int __xipram do_erase_oneblock(st
 	map_write(map, CMD(0x70), adr);
 	chip->state = FL_STATUS;
 	status = map_read(map, adr);
+#if 1
+	if (map_word_bitsset(map, status, CMD(0x40))) {
+		printk("resume again:%lx\n", MERGESTATUS(status));
+		chip->state = FL_ERASING;
+		map_write(map, CMD(0x50), adr); /* reset status */
+		map_write(map, CMD(0xd0), adr); /* resume */
+		goto again;
+	}
+#endif
 
 	/* check for errors */
 	if (map_word_bitsset(map, status, CMD(0x3a))) {
@@ -1770,6 +1789,7 @@ static int __xipram do_erase_oneblock(st
 	xip_enable(map, chip, adr);
  out:	put_chip(map, chip, adr);
 	spin_unlock(chip->mutex);
+	printk("ERASE DONE: chip:%p adr:%x, status 0x%lx\n", chip, adr, MERGESTATUS(status));
 	return ret;
 }
 

--------------050406010305080005080103--
