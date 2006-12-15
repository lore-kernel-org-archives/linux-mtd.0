Received: from mtagate2.uk.ibm.com ([195.212.29.135])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvCjT-0000Z0-55
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 13:04:15 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate2.uk.ibm.com (8.13.8/8.13.8) with ESMTP id kBFD3okM173364
	for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2006 13:03:50 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kBFD3oxB1478840
	for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2006 13:03:50 GMT
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kBFD3oND023173
	for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2006 13:03:50 GMT
Message-ID: <45829D2E.4060008@linux.vnet.ibm.com>
Date: Fri, 15 Dec 2006 14:03:42 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
To: Artem <dedekind@infradead.org>
Subject: [PATCH] [UBI] Resize of static volumes
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I noticed that after resizing static volumes, the used_bytes value in the
data table record is set to the new size of the volume. This is correct
for dynamic volumes, but for static volumes, this value should not be
changed.

Kind regards,

Alexander Schmidt

Signed-off-by: Alexander Schmidt, <alexs at linux.vnet.ibm.com>

---

diff --git a/drivers/mtd/ubi/volmgmt.c b/drivers/mtd/ubi/volmgmt.c
index 750dfa1..cb9fbad 100644
--- a/drivers/mtd/ubi/volmgmt.c
+++ b/drivers/mtd/ubi/volmgmt.c
@@ -241,7 +241,7 @@ int ubi_vmt_rsvol(const struct ubi_info *ubi, int vol_id, int reserved_pebs)
         if (err)
                 goto out_unlock;

-       ubi_dtbl_set_dtr(ubi, vol_id, reserved_pebs * vtr->usable_leb_size);
+       ubi_dtbl_set_dtr(ubi, vol_id, dtr->used_bytes);

         err = ubi_wl_erase_flush(ubi);
