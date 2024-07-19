Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2DDC3DA59
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jul 2024 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r/tSAjngpnSFJogu0Kk9/gFwyuzJhIYxGNeyZ6/pkq0=; b=neeU0AZuXyVCck
	RhXLDxIECBfNB/bWD7qH2Xs3ACsNIbBNyXD2jsRPSOy9pY0mKiWQgwwkIjwMdAnSBoJnUhQQIMd2h
	JOcxeN/9umshPjpzSGZwgjjihRSIdEMa+iMk3FDHjdgDYKRLuTFyt2bnAb7dzRruHTniVbzFKtl8X
	Dx7NanZaxQDFdhvKadLAjp6Y0of5+rzrISWE+WNeLJ1CS/4R7iMyQgzvSkyGpfg4QEsEArXrrqwjN
	0th9H368R2aWoPFUHq99f3/B4cvk3qjrvk3iXMqyXmVeI6hP1gWPG392aNwpiVVyA8ZTN5D93NH5s
	ABLQr0JymblAUV500b4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUrg4-00000003Q0W-2qGj;
	Fri, 19 Jul 2024 17:45:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUpUz-000000035Bd-2Jl6
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jul 2024 15:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721402778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f6d0hXH4uLkiXaZ4xSn07DWYcvQaiD8KGm9d+DE/JVs=;
	b=RmNmAANzINLq66IA/WZNidGQICNdcGTJ4kCbw2AyLBzD/rxMiYpaSgE6+suElrUl3PLWbH
	HMN0xcyDuaMRSEjzj0u5dcgtq7iQnTdBP+34U9ta5334qjjzKfYDJe8IUJkzzwr0FWIy/X
	k4HXs7UcoTfAxV4yjGGcjF92zpvwIc4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-cUiENI3kM0aTQrqC_bjUsA-1; Fri,
 19 Jul 2024 11:26:12 -0400
X-MC-Unique: cUiENI3kM0aTQrqC_bjUsA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B62CB1955D4E;
	Fri, 19 Jul 2024 15:26:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.18])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5AB361955F40;
	Fri, 19 Jul 2024 15:26:05 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	Knop Ryszard <ryszard.knop@intel.com>
Subject: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.
Date: Fri, 19 Jul 2024 17:24:13 +0200
Message-ID: <20240719152542.1554440-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_082621_729934_BA925F72 
X-CRM114-Status: GOOD (  12.17  )
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

When the kmsg_dumper callback parameter changed, the reason variable
in mtdoops_do_dump() was not updated accordingly.
This breaks the build with mtdoops.

Fixes: e1a261ba599e ("printk: Add a short description string to kmsg_dump()")
Reported-by: Knop Ryszard <ryszard.knop@intel.com>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

The offended commit is in the drm-misc tree, because it was needed
by drm_panic. So I will push the fix there too.

 drivers/mtd/mtdoops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 86d49db9196d..7bf3777e1f13 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -305,7 +305,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 	struct kmsg_dump_iter iter;
 
 	/* Only dump oopses if dump_oops is set */
-	if (reason == KMSG_DUMP_OOPS && !dump_oops)
+	if (detail->reason == KMSG_DUMP_OOPS && !dump_oops)
 		return;
 
 	kmsg_dump_rewind(&iter);
@@ -317,7 +317,7 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 			     record_size - sizeof(struct mtdoops_hdr), NULL);
 	clear_bit(0, &cxt->oops_buf_busy);
 
-	if (reason != KMSG_DUMP_OOPS) {
+	if (detail->reason != KMSG_DUMP_OOPS) {
 		/* Panics must be written immediately */
 		mtdoops_write(cxt, 1);
 	} else {

base-commit: 26dbffb2a4c4d4639c7b336f6b74a437c23dadd4
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
