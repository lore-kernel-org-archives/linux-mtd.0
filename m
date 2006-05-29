Received: from smtp001.mail.ukl.yahoo.com ([217.12.11.32])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fkf0A-00039g-Sg
	for linux-mtd@lists.infradead.org; Mon, 29 May 2006 06:29:38 -0400
Message-ID: <447ACCF2.1080700@themis.com>
Date: Mon, 29 May 2006 12:29:06 +0200
From: jean-francois simon <jfs@themis.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: do_erase_oneblock() wait queue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am going through the MTD code and I was wondering what function
is doing the wake_up() after do_erase_oneblock goes to sleep (see
1260 below).
My basic problem is that when i do an "eraseall /dev/mtd[x]' I
get a lot of input/output errors:

ash-3.00# eraseall /dev/mtd1
Erasing 256 Kibyte @ 0 --  0 % complete.
eraseall: /dev/mtd1: MTD Erase failure: Input/output error

My geometry is:
-interleave = 4
-bankwidth = 8 (64b)
p/n = ST MICRO M29DW640

In chip_good() I get a weird status of 005c005cffff0018 or
005cffff00180018

I am thinking that maybe I get woken up too early and before 
erase is complte, but since I  can't find who is doing it, I am 
not sure of it.
Note that it I comment out the "return -EIO" (line 1294) I can
erase the chips and write to them.

Thanks for the help,

-jf simon

1219 static inline int do_erase_oneblock(struct map_info *map,
struct flchip *chip, unsigned long adr, int len, void *thunk)
1220 {
1221         struct cfi_private *cfi = map->fldrv_priv;
1222         unsigned long timeo = jiffies + HZ;
1223         DECLARE_WAITQUEUE(wait, current);
1224         int ret = 0;
1225
1226         adr += chip->start;
1227
1228         cfi_spin_lock(chip->mutex);
1229         ret = get_chip(map, chip, adr, FL_ERASING);
1230         if (ret) {
1231                 cfi_spin_unlock(chip->mutex);
1232                 return ret;
1233         }
1234
1235         DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",
1236                __func__, adr );
1237
1238         ENABLE_VPP(map);
1239         cfi_send_gen_cmd(0xAA, cfi->addr_unlock1,
chip->start, map, cfi, cfi->device_type, NULL);
1240         cfi_send_gen_cmd(0x55, cfi->addr_unlock2,
chip->start, map, cfi, cfi->device_type, NULL);
1241         cfi_send_gen_cmd(0x80, cfi->addr_unlock1,
chip->start, map, cfi, cfi->device_type, NULL);
1242         cfi_send_gen_cmd(0xAA, cfi->addr_unlock1,
chip->start, map, cfi, cfi->device_type, NULL);
1243         cfi_send_gen_cmd(0x55, cfi->addr_unlock2,
chip->start, map, cfi, cfi->device_type, NULL);
1244         map_write(map, CMD(0x30), adr);
1245
1246         chip->state = FL_ERASING;
1247         chip->erase_suspended = 0;
1248         chip->in_progress_block_addr = adr;
1249
1250         cfi_spin_unlock(chip->mutex);
1251         msleep(chip->erase_time/2);
1252         cfi_spin_lock(chip->mutex);
1253
1254         timeo = jiffies + (HZ*20);
1255
1256         for (;;) {
1257                 if (chip->state != FL_ERASING) {
1258                         /* Someone's suspended the erase.
Sleep */
1259                         set_current_state(TASK_UNINTERRUPTIBLE);
1260                         add_wait_queue(&chip->wq, &wait);
1261                         cfi_spin_unlock(chip->mutex);
1262                         schedule();
1263                         remove_wait_queue(&chip->wq, &wait);
1264                         cfi_spin_lock(chip->mutex);
1265                         continue;
1266                 }
1267                 if (chip->erase_suspended) {
1268                         /* This erase was suspended and resumed.
1269                            Adjust the timeout */
1270                         timeo = jiffies + (HZ*20); /* FIXME */
1271                         chip->erase_suspended = 0;
1272                 }
1273
1274                 if (chip_ready(map, adr))
1275                         goto op_done;
1276
1277                 if (time_after(jiffies, timeo))
1278                         break;
1279
1280                 /* Latency issues. Drop the lock, wait a
while and retry */
1281                 cfi_spin_unlock(chip->mutex);
1282                 set_current_state(TASK_UNINTERRUPTIBLE);
1283                 schedule_timeout(1);
1284                 cfi_spin_lock(chip->mutex);
1285         }
1286
1287         printk(KERN_WARNING "MTD %s(): software timeout\n",
1288                __func__ );
1289
1290         /* reset on all failures. */
1291         map_write( map, CMD(0xF0), chip->start );
1292         /* FIXME - should have reset delay before continuing */
1293
1294  		     ret = -EIO;
1295  op_done:
1296         chip->state = FL_READY;
1297         put_chip(map, chip, adr);
1298         cfi_spin_unlock(chip->mutex);
1299         return ret;
1300 }
1301




-- 

Best regards,
_______________________________________
jean-francois simon - themis computer
5, rue irene joliot curie
38330 eybens - france
+33 (0)870 448 638
+33 (0)4 76 14 77 85 - jfs@themis.com



	

	
		
___________________________________________________________________________ 
Yahoo! Mail réinvente le mail ! Découvrez le nouveau Yahoo! Mail et son interface révolutionnaire.
http://fr.mail.yahoo.com
