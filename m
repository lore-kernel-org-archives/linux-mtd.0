Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M7n48-0001Pw-Jt
	for linux-mtd@lists.infradead.org; Sat, 23 May 2009 08:58:59 +0000
Subject: Re: a suspected data race in /driver/mtd/ubi/build.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?UTF-8?Q?=ED=99=8D=EC=8B=A0?= shin hong <hongshin@gmail.com>
In-Reply-To: <2014bcab0905190434r687de23ued2af901636cd16c@mail.gmail.com>
References: <2014bcab0905190434r687de23ued2af901636cd16c@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 May 2009 11:58:45 +0300
Message-Id: <1243069125.21646.21.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-19 at 20:34 +0900, 홍신 shin hong wrote:
> Hi. I am reporting a susptected data race bug at
> ubi_attach_mtd_dev() in /driver/mtd/ubi/build.c .
> 
> This function creates a kernel thread by calling
> kthread_create(ubi_thread, ubi .. ). and then
> it assigns ubi->thread_enabled = 1.
> 
> However, ubi_thread() also reads ubi->thread_enabled.
> This may cause data race since the execution results
> would be differ depending on the scheduling.
> 
> I think, ubi_attach_mtd_dev() should be modified to protect
> the writing aceess to ubi->thread_enabled
> by spin_lock(&ubi->wl_lock).
> 
> But I do not have much background on the code.
> So please check this code and let me know your opinions.

Agreed, thanks for the report. I'm going to push the
following patch (sorry I wrote your name without the
hieroglyph characters because my vim refused them).

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBI: fix race condition

This patch fixes a minor problem where we may fail to wake
upe the UBI background thread. This is not fatal at all,
it may just result at sligtly worse performace for a short
period of time, just because the thread will be woken up
when real I/O on the UBI starts.

Anywey, the issue is the race condition between
'ubi_attach_mtd_dev()' and 'ubi_thread()'. If we do not
serialize them, the 'wake_up_process()' call may be done
before 'ubi_thread()' went seep, but after it checked
'ubi->thread_enabled'.

This issue was spotted by Shin Hong <hongshin@gmail.com>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 4048db8..c2c7827 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -380,7 +380,7 @@ static void free_user_volumes(struct ubi_device *ubi)
  * @ubi: UBI device description object
  *
  * This function returns zero in case of success and a negative error code in
- * case of failure. Note, this function destroys all volumes if it failes.
+ * case of failure. Note, this function destroys all volumes if it fails.
  */
 static int uif_init(struct ubi_device *ubi)
 {
@@ -872,9 +872,15 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 		ubi->beb_rsvd_pebs);
 	ubi_msg("max/mean erase counter: %d/%d", ubi->max_ec, ubi->mean_ec);
 
+	/*
+	 * The below lock makes sure we do not race with 'ubi_thread()' which
+	 * checks @ubi->thread_enabled. Otherwise we may fail to wake it up.
+	 */
+	spin_lock(&ubi->wl_lock);
 	if (!DBG_DISABLE_BGT)
 		ubi->thread_enabled = 1;
 	wake_up_process(ubi->bgt_thread);
+	spin_unlock(&ubi->wl_lock);
 
 	ubi_devices[ubi_num] = ubi;
 	return ubi_num;
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
