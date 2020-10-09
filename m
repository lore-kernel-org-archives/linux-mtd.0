Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3599DC433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:16:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2799215A4
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vhPHiNUA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b08g4wy4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2799215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/U0mBLGOjoPZrminBk1IKdoo0fI3LhzomrRmZwFC1ws=; b=vhPHiNUAAvZBQsDW5eMnf68gj
	Jg5n5D6Jz+LrJ0lIIo1U0VWOB7bTBccOzinkfXv5hk+XmQ1MdH8Y4bOxPKQQvncFiPx1k7fKKKo9M
	oSvfRT5EE+FviCuBA/X1W9oeDh74JS74aUsHBivyu3SDGEdGPoaj1Ub1if02my6Uf2XIdXzHTXvxq
	g13Dw2y9ngFm9hQveVh8Kv2GAecKjgV4Bbs1szB8ykMYDK3PBC4AknEQ00J1+SlXuDeO8M3rBjkxl
	7WkBoXGv0pZEjVbr0mzFoEdp2vA+4tsKsNC/laP0JVWc5S4jHH5FvIXTVLlCw+wZbT+4aa/a8/Y8q
	LxGyHhhUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQynI-0006Qk-3h; Fri, 09 Oct 2020 20:15:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyj6-00014k-Mm; Fri, 09 Oct 2020 20:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YRIKYmxc6UZQaNDNDt7ZbhBGcrM8JXT8RwEcpigZ4aI=; b=b08g4wy4KUJfVXJ2wdukxA/CLz
 3xVefgqhfgqYqXf6pfDW2qdcRlJ2rDlmGHhK5hGFfcOSvz1wuiMo4IxBfCsui/d6BdPWmN2cKpgQO
 wv7Q3zg/+5rJS38nB44TX+QjHS3+jfXpJ7MwFVbLJBtWr21rhp9NUkhz0Y/rtqFXZVAPKlsXEjqoE
 CHbrYKqkkaiHqUIfjFbxnPZUvaK5aRzJasmVZmG4oUo4JXQhqFBDVRtN3Nluh68ey4HI3+zRvunHw
 OBQsG0ItKY8OgvTvtOnIk2UNgngRWOV3fncaWGfHhE+3YdRpbEV9a/qagxB/u/ES/pFLvov7Uiy8l
 TdWe8IlQ==;
Received: from mga17.intel.com ([192.55.52.151])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQyQ6-0001GC-L8; Fri, 09 Oct 2020 19:51:17 +0000
IronPort-SDR: jq3hZw+KIZJbcTuZsIOY1WwOF7qshb0WpHxT5qJKqAsCh8DnObJQs57dIjf50VxO5KvQ+pTMFP
 ADJUQ73LQyfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397251"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397251"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:11 -0700
IronPort-SDR: 7ZsxuYrd4RIh+I9L87qE8QKpDxHdxlIArpw96UL8x0WQ0i4hLag3NZ1m816qhb9i0FMTl4f1za
 dG2KA2sC/NWA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="312652519"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:09 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 07/58] drivers/drbd: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:42 -0700
Message-Id: <20201009195033.3208459-8-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_205115_210052_C54640D5 
X-CRM114-Status: GOOD (  14.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, kexec@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this driver are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/block/drbd/drbd_main.c     |  4 ++--
 drivers/block/drbd/drbd_receiver.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 573dbf6f0c31..f0d0c6b0745e 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -1532,9 +1532,9 @@ static int _drbd_no_send_page(struct drbd_peer_device *peer_device, struct page
 	int err;
 
 	socket = peer_device->connection->data.socket;
-	addr = kmap(page) + offset;
+	addr = kmap_thread(page) + offset;
 	err = drbd_send_all(peer_device->connection, socket, addr, size, msg_flags);
-	kunmap(page);
+	kunmap_thread(page);
 	if (!err)
 		peer_device->device->send_cnt += size >> 9;
 	return err;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 422363daa618..4704bc0564e2 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1951,13 +1951,13 @@ read_in_block(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
 	page = peer_req->pages;
 	page_chain_for_each(page) {
 		unsigned len = min_t(int, ds, PAGE_SIZE);
-		data = kmap(page);
+		data = kmap_thread(page);
 		err = drbd_recv_all_warn(peer_device->connection, data, len);
 		if (drbd_insert_fault(device, DRBD_FAULT_RECEIVE)) {
 			drbd_err(device, "Fault injection: Corrupting data on receive\n");
 			data[0] = data[0] ^ (unsigned long)-1;
 		}
-		kunmap(page);
+		kunmap_thread(page);
 		if (err) {
 			drbd_free_peer_req(device, peer_req);
 			return NULL;
@@ -1992,7 +1992,7 @@ static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)
 
 	page = drbd_alloc_pages(peer_device, 1, 1);
 
-	data = kmap(page);
+	data = kmap_thread(page);
 	while (data_size) {
 		unsigned int len = min_t(int, data_size, PAGE_SIZE);
 
@@ -2001,7 +2001,7 @@ static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)
 			break;
 		data_size -= len;
 	}
-	kunmap(page);
+	kunmap_thread(page);
 	drbd_free_pages(peer_device->device, page, 0);
 	return err;
 }
@@ -2033,10 +2033,10 @@ static int recv_dless_read(struct drbd_peer_device *peer_device, struct drbd_req
 	D_ASSERT(peer_device->device, sector == bio->bi_iter.bi_sector);
 
 	bio_for_each_segment(bvec, bio, iter) {
-		void *mapped = kmap(bvec.bv_page) + bvec.bv_offset;
+		void *mapped = kmap_thread(bvec.bv_page) + bvec.bv_offset;
 		expect = min_t(int, data_size, bvec.bv_len);
 		err = drbd_recv_all_warn(peer_device->connection, mapped, expect);
-		kunmap(bvec.bv_page);
+		kunmap_thread(bvec.bv_page);
 		if (err)
 			return err;
 		data_size -= expect;
-- 
2.28.0.rc0.12.gb6a658bd00c9


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
