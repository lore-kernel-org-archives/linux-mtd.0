Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF31BC10F13
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7gJ9bpoQLcUuB8qgmZYCJSPG+yFwI6IfR1dEkUGMys=; b=nMnxCO89Jtg9RW
	qW6FWQOV27qCGHVGrjbUrHpojZ4uUAZ07QBAjp4Vx65QPrODp2RL3Sq0SNSb9vy28DNkZLkEBjt5T
	4sNE18T1z2jHpUQnBAeW7dPEhDy1jTNrEQ6ifi1tf9VkTKWkvGHWwA5cU1lRG8RJ5rGM6CvL6XAoD
	SLHAAq/f/3xht87/QqSNjgjg7wJQnPYrhEBq6JuCz7crZcGLFzA9Rj9PV51N4Qi/szJFndRIIxoxE
	nshhnKoGt7YoutOKJPP/5gg27Jluj+3D2crVG3ye8wI53iibbQOuF2Wxc6aaGnIioO1jF79/sdgWJ
	Vuc8OcT1jXOAAlFFs2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi0M-005Lxb-0I;
	Mon, 11 Dec 2023 15:15:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgwl-00561u-2j
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Dec 2023 14:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6A1hyFolV4DwA0cn4I95Qr1kyif41MCoiCpm+Qrelpo=; b=F57xXDQ9LxaVQvVHFe9xozDz15
	NQmgH9vakJ/TsKpSjs3PT6SR6zGY45uV85Iu6iQJXjG941bItaT6ZgOoSdQXR8jDzTprDH9437ik+
	qZJbkrgbCGhH9Kj3bTqG+uAhbucWKeuzghTjmclYyWHbpqb4wIudhUHQyKvWsd5lKiKqqQfegezns
	vvSrNXaE7OfknxE9mGrW7CecihBycWLgYCOOBXtz5Rns1grzWyt4J7OUPvDhSEKA8/maFSzuoo8c5
	TCXRitz3GfPLj+NPEaUEtLGXZTnw3b2hvR4eYRBH4qFtw/1AAcRtZUt39SQ5QYliRJskUwIwvKZ8/
	wmHudgiQ==;
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgwg-0086V0-0Z
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 14:07:46 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Spk8d5hR7z4f3kKd
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:07:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id F30341A0A07
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:07:30 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDn6xGTF3dlDYFxDQ--.28013S12;
	Mon, 11 Dec 2023 22:07:30 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: axboe@kernel.dk,
	roger.pau@citrix.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	sth@linux.ibm.com,
	hoeppner@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	agruenba@redhat.com,
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	p.raghav@samsung.com,
	hare@suse.de
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v2 for-6.8/block 08/18] bio: export bio_add_folio_nofail()
Date: Mon, 11 Dec 2023 22:05:42 +0800
Message-Id: <20231211140552.973290-9-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211140552.973290-1-yukuai1@huaweicloud.com>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDn6xGTF3dlDYFxDQ--.28013S12
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw4rur1rtr17JFyUCF18AFb_yoW3Wrg_AF
	n7u3W8W3Z7W3WSk3Wvkay8AFWYv34rCF4Y9FWfJF9xZF1DGFnak340yr10vrs5CFykK3y3
	uw4DXryayw17XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbqxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_Gc
	Wl84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZ
	X7UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_140742_912621_08BD7887 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Yu Kuai <yukuai3@huawei.com>

Currently btrfs is using __bio_add_page() in write_dev_supers(). In order
to convert to use folio for bdev in btrfs, export bio_add_folio_nofail()
so that it can replace __bio_add_page().

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/bio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/bio.c b/block/bio.c
index 5eba53ca953b..a7b2bbb210ee 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1119,6 +1119,7 @@ void bio_add_folio_nofail(struct bio *bio, struct folio *folio, size_t len,
 	WARN_ON_ONCE(off > UINT_MAX);
 	__bio_add_page(bio, &folio->page, len, off);
 }
+EXPORT_SYMBOL_GPL(bio_add_folio_nofail);
 
 /**
  * bio_add_folio - Attempt to add part of a folio to a bio.
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
