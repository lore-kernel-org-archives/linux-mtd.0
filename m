Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5hi0-00078h-HA
 for linux-mtd@lists.infradead.org; Fri, 11 Jul 2014 20:46:21 +0000
Message-ID: <53C04D02.9080002@nod.at>
Date: Fri, 11 Jul 2014 22:45:54 +0200
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
 <53B2CC06.3000205@nod.at> <53BF07E4.4010302@lutron.com>
In-Reply-To: <53BF07E4.4010302@lutron.com>
Content-Type: multipart/mixed; boundary="------------070403030009070808040804"
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
--------------070403030009070808040804
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 10.07.2014 23:38, schrieb Akshay Bhat:
> 
> 
> On Tue 01 Jul 2014 10:56:06 AM EDT, Richard Weinberger wrote:
>> Am 01.07.2014 16:46, schrieb Akshay Bhat:
>>>
>>>
>>> On Tue 01 Jul 2014 10:32:34 AM EDT, Richard Weinberger wrote:
>>>> Am 01.07.2014 16:18, schrieb Akshay Bhat:
>>>>>
>>>>>
>>>>> On Tue 01 Jul 2014 03:48:54 AM EDT, Richard Weinberger wrote:
>>>>>> Am 01.07.2014 03:09, schrieb hujianyang:
>>>>>>>>
>>>>>>>> Is enabling UBI_FASTMAP the cause for the panic? If so I can disabled the
>>>>>>>> feature and re-test. Do you see any compatibility issue going from:
>>>>>>>> Current config -> New config -> Failsafe config
>>>>>>>>
>>>>>>>
>>>>>>> I don't know. But I found func ubi_wl_get_peb() in drivers/mtd/ubi/wl.c
>>>>>>> will return an error ENOSPC without any error messages. And this func
>>>>>>> seems related with fastmap feature.
>>>>>>
>>>>>> I have sort of an idea what could going on.
>>>>>> Akshay, can you please confirm that you face the issue only with UBI_FASTMAP=y?
>>>>>
>>>>> I have not been able to recreate the issue with UBI_FASTMAP=n
>>>>
>>>> Okay, you test case basically fills the filesystem over and over?
>>>> And after some time you face the said issue.
>>>> Is this correct?
>>>
>>> Yes. From testing, the "some time" is typically after crossing the WL threshold.
>>
>> Good. I'll dig into that by the end of the week.
> 
> Hi Richard, wanted to check if you got a chance to dig into this? Thanks.

Can you please rerun with the attached patch applied?
Maybe it can give use a hint. :)

Thanks,
//richard

--------------070403030009070808040804
Content-Type: text/x-patch;
 name="debug.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="debug.diff"

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0f3425d..90588d4 100644
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
@@ -632,9 +636,10 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 		ubi_update_fastmap(ubi);
 
 	/* we got not a single free PEB */
-	if (!pool->size)
+	if (!pool->size) {
+		ubi_err("User WL pool is empty!");
 		ret = -ENOSPC;
-	else {
+	} else {
 		spin_lock(&ubi->wl_lock);
 		ret = pool->pebs[pool->used++];
 		prot_queue_add(ubi, ubi->lookuptbl[ret]);
@@ -654,6 +659,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 	int pnum;
 
 	if (pool->used == pool->size || !pool->size) {
+		ubi_err("WL pool is empty!");
 		/* We cannot update the fastmap here because this
 		 * function is called in atomic context.
 		 * Let's fail here and refill/update it as soon as possible. */

--------------070403030009070808040804--
