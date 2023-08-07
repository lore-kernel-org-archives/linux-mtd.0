Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006BFEB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 08:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ghDFhl7fmneZ2Gh5+U2H7Ayutt/aHQBXju1upBGTYcE=; b=MR7Q3QLXXQONEH
	e2iKbsoVREAJw0mQ6tA77R7vrkfvF+Z8NEiNAE17mnZ7bwjqmKdd98v0Ee0x5GvGaDIasOkmvFyvA
	KeLzkJ/ofs3x8Q1Ccqi5ezl69fybihwE2TU4suJoKM4cBZn7kMPvmnrnxlqeOa92WSGw4EOu8J6js
	V63sMH+643YgxsHWPUa5vMNz8jZGjwR+wG3F7oSBBq2stjxNwimeXt4HYuYL0Qz/5TFCHSo4x46Le
	QKK90pUfSJALbTh1Z2VRqrZDPOALgjpwxyU7kptQFhknMlQIiXiE2Vve56bWIqvVjlbVV65mUelyZ
	jxha5LX5SGklULY6ioow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvh0-00GSnS-1g;
	Mon, 07 Aug 2023 08:34:22 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvgv-00GSlD-0i
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 08:34:21 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44AAB218A9;
	Mon,  7 Aug 2023 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691397251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CkiLjiLMxObzy3Sb9w3oxtxHFV8IOAxBlCK+K5bcwaE=;
	b=r+DUjLGFEllhgYp/YiieuZF0DOCjFDWeLyJoWFD0+nxlhS2s+B4eZvPMd4W3P12+txsJ5K
	G431i69aOhsJSqtUZcspvZ0xB1KGBCaF8Sc0PPEF5QWSdWdODP1kf6Odvb05n1/K6EP4OM
	2N5m5JFtHu58v9ZyWEHYpAtkTXoamI0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691397251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CkiLjiLMxObzy3Sb9w3oxtxHFV8IOAxBlCK+K5bcwaE=;
	b=PmOcswpF0o6Csfk6kbt4+f54rrFElHQs3ovyF4w1bqSUJ5n6roG5qyOxTHY7f0PI1TMtU0
	9q+79oecr2eV8RBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F71013487;
	Mon,  7 Aug 2023 08:34:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9RkuA4Os0GTCBwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Mon, 07 Aug 2023 08:34:11 +0000
From: Vlastimil Babka <vbabka@suse.cz>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	gregkh@linuxfoundation.org,
	hch@lst.de,
	joern@lazybastard.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org,
	loic.poulain@linaro.org,
	miquel.raynal@bootlin.com,
	regressions@lists.linux.dev,
	richard@nod.at,
	snitzer@kernel.org,
	vigneshr@ti.com,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH for 6.5 regression] PM: hibernate: fix resume_store() return value when hibernation not available
Date: Mon,  7 Aug 2023 10:33:57 +0200
Message-ID: <20230807083356.19222-2-vbabka@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_013417_423593_DC7606B2 
X-CRM114-Status: GOOD (  14.69  )
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

On a laptop with hibernation set up but not actively used, and with
secure boot and lockdown enabled kernel, 6.5-rc1 gets stuck on boot with
the following repeated messages:

  A start job is running for Resume from hibernation using device /dev/system/swap (24s / no limit)
  lockdown_is_locked_down: 25311154 callbacks suppressed
  Lockdown: systemd-hiberna: hibernation is restricted; see man kernel_lockdown.7
  ...

Checking the resume code leads to commit cc89c63e2fe3 ("PM: hibernate:
move finding the resume device out of software_resume") which
inadvertently changed the return value from resume_store() to 0 when
!hibernation_available(). This apparently translates to userspace
write() returning 0 as in number of bytes written, and userspace looping
indefinitely in the attempt to write the intended value.

Fix this by returning the full number of bytes that were to be written,
as that's what was done before the commit.

Fixes: cc89c63e2fe3 ("PM: hibernate: move finding the resume device out of software_resume")
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Resend with review/ack tags added and not buried in the thread.
Link: https://lore.kernel.org/all/2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz/

 kernel/power/hibernate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index e1b4bfa938dd..2b4a946a6ff5 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1166,7 +1166,7 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	int error;
 
 	if (!hibernation_available())
-		return 0;
+		return n;
 
 	if (len && buf[len-1] == '\n')
 		len--;
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
