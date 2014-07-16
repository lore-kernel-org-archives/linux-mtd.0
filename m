Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7WKB-0001cX-7y
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 21:01:16 +0000
Message-ID: <53C6E800.1030409@nod.at>
Date: Wed, 16 Jul 2014 23:00:48 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Akshay Bhat <abhat@lutron.com>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
 <53B19D09.2000007@lutron.com> <53B20A42.6020008@huawei.com>
 <53B267E6.7060708@nod.at> <53B2C321.4050407@lutron.com>
 <53B2C682.7080605@nod.at> <53B2C9BA.2090507@lutron.com>
 <53B2CC06.3000205@nod.at> <53BF07E4.4010302@lutron.com>,
 <53C04D02.9080002@nod.at>
 <CE1A3161FE28A24FA02F0C9A95F25FA3AEA99BB6F0@MB003.cb.intra.lutron.com>
In-Reply-To: <CE1A3161FE28A24FA02F0C9A95F25FA3AEA99BB6F0@MB003.cb.intra.lutron.com>
Content-Type: multipart/mixed; boundary="------------010608000401030608030000"
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010608000401030608030000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Akshay,

Am 16.07.2014 19:31, schrieb Akshay Bhat:
> 
>>>
>>> Hi Richard, wanted to check if you got a chance to dig into this? Thanks.
> 
>> Can you please rerun with the attached patch applied?
>> Maybe it can give use a hint. :)
> 
> I ran the tests with the patch, below is the dmesg log (note: the first kernel panic resulted in the log running over since I wasn't around, so I had to reboot and re-run the test to capture a new panic).

Thanks a lot for the log!

> # dmesg
> [ 1571.338966] UBI error: refill_wl_pool: didn't get all pebs I wanted!
> [ 1571.367128] UBI error: refill_wl_pool: didn't get all pebs I wanted!
> [ 1571.367159] UBI error: ubi_wl_get_peb: User WL pool is empty!

This is interesting.
Looks like a race in ubi_wl_get_peb(), two threads enter the function and the pool needs refilling.
While T1 triggers a ubi_refill_pools(), T2 goes immediately to " if (!pool->size) {" this triggers
as T1 resets pool->size to 0 while refilling.

Please test the updated debug patch.

Can you also please share your test script with me?
So far none of my boards run into that issue. :(

Thanks,
//richard

--------------010608000401030608030000
Content-Type: text/x-patch;
 name="debug.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="debug.diff"

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0f3425d..d02b5f9 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -575,8 +575,10 @@ static void refill_wl_pool(struct ubi_device *ubi)
 
 	for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
 		if (!ubi->free.rb_node ||
-		   (ubi->free_count - ubi->beb_rsvd_pebs < 5))
+		   (ubi->free_count - ubi->beb_rsvd_pebs < 5)) {
+			ubi_err("didn't get all pebs I wanted!");
 			break;
+		}
 
 		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
 		self_check_in_wl_tree(ubi, e, &ubi->free);
@@ -600,8 +602,10 @@ static void refill_wl_user_pool(struct ubi_device *ubi)
 
 	for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
 		pool->pebs[pool->size] = __wl_get_peb(ubi);
-		if (pool->pebs[pool->size] < 0)
+		if (pool->pebs[pool->size] < 0) {
+			ubi_err("didn't get all pebs I wanted!");
 			break;
+		}
 	}
 	pool->used = 0;
 }
@@ -631,15 +635,16 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 	    wl_pool->used == wl_pool->size)
 		ubi_update_fastmap(ubi);
 
+	spin_lock(&ubi->wl_lock);
 	/* we got not a single free PEB */
-	if (!pool->size)
+	if (!pool->size) {
+		ubi_err("User WL pool is empty!");
 		ret = -ENOSPC;
-	else {
-		spin_lock(&ubi->wl_lock);
+	} else {
 		ret = pool->pebs[pool->used++];
 		prot_queue_add(ubi, ubi->lookuptbl[ret]);
-		spin_unlock(&ubi->wl_lock);
 	}
+	spin_unlock(&ubi->wl_lock);
 
 	return ret;
 }
@@ -654,6 +659,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 	int pnum;
 
 	if (pool->used == pool->size || !pool->size) {
+		ubi_err("WL pool is empty!");
 		/* We cannot update the fastmap here because this
 		 * function is called in atomic context.
 		 * Let's fail here and refill/update it as soon as possible. */

--------------010608000401030608030000--
