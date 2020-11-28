Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125D2C63777
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:16:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E0A722256
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uXc1IJ3p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SgAO8R3I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E0A722256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nVYC5L5AZzO6rI4FxPKYpwmTY7Fdc6fcaVq4QnB9KYg=; b=uXc1IJ3p2B42I8w8rQ+xKbmEg
	v64EjGqEd+Inj6hU0ouOa5n7mQwypNIFZN0kUtRuSpqycPS8tK2FObtfiURb5Z3y222DzE/v89mgm
	b1KhPDusIEXFnBsupvutCur2+30+JEjs6KV5vMcuxyguPO3+IbqM2nUQhCfLs1urx6HSHBjUVgM0U
	jhhljzgXbBe+Uxp3lRZN/sBdSc8ZfokMjWVL3GWTCMVoGv9gZ7gqNdZqjg2dd5YWuoIHYQ8AuttzW
	2vCu7XoWnhOSC3yaAAOTiY1QtdiZLu8iF7CmoMSHCNcqXy8XE+Qk/7KBg+YD7y4Ptvad8LPR4Vtjz
	yymSPAUOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2sZ-0000kd-0n; Sat, 28 Nov 2020 16:15:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sV-0000kE-Uo
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=q/6oPwiIP+97CmAmgE17x+n1vZ9NZz+/8fOXv1YD02c=; b=SgAO8R3IwJuteSY6umhfsYuAu9
 kWEW8O8rTPXsntH8lghpGc9d4kQKvbiaetMO+WybmoWKPnjE72M7VilvKVVKWjjvhjW6jDh8fbroR
 GBufS8fipe/YusjIrCeTImC2Lr2MSHGA0F2NrouIAPoizr9NyruCBKzRtpDzT1KDeITpakoW22UKT
 XSDlZ3K0R4sqljZtrs7KhLxKurm1MxwhMH/VA92lT9LTYosySUwqSqzSrwtvFG4nKEf1SJOmS2Hit
 nFLEVirKREbx+v8i/CrUERiArR+UMsdxi22XmxyQqSrcXPZ7fxROJnZel8hsU4ehXSyPymQvMALyp
 DkJfu7Mg==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sT-0000Bo-J8; Sat, 28 Nov 2020 16:15:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 01/45] blk-cgroup: fix a hd_struct leak in
 blkcg_fill_root_iostats
Date: Sat, 28 Nov 2020 17:14:26 +0100
Message-Id: <20201128161510.347752-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Hannes Reinecke <hare@suse.de>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

disk_get_part needs to be paired with a disk_put_part.

Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io.stat")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Acked-by: Tejun Heo <tj@kernel.org>
---
 block/blk-cgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index c68bdf58c9a6e1..54fbe1e80cc41a 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -849,6 +849,7 @@ static void blkcg_fill_root_iostats(void)
 			blkg_iostat_set(&blkg->iostat.cur, &tmp);
 			u64_stats_update_end(&blkg->iostat.sync);
 		}
+		disk_put_part(part);
 	}
 }
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
