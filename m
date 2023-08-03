Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6398C0015E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Aug 2023 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSTlfTgye36BSDIJtMiylc4oOUlEPYeLWt73s6IGHFU=; b=oOd/V4bF6/M2ir
	HPBeGN8va8Xr9LiizSfWwewvibxR5C3TK4JafXWXFcr/+ATZdjjGqD3E8KLQLlLTFKqcHXligoK3a
	85pyX/J5RxY/5Ek9bBBzyEeN8IsqG1h4voBMvY37z6avwOcLxFyxKNJXJqXwIORRrifS3JSx0Jt+9
	CRou/uZnq5R/F/DQy1nBtSprQTXK73lY2YF/TXoUDItJ6105GOs6/glUg/66PLvCkHSeOeBJ0qr+Z
	i9yWp1fCIh2eXgK8gyEUe6Vlo0UrbMbqwM8vLuh23Ekupla3BVEH+GVplkKS1YJqSUfvljH8xV3eq
	v20s1U1/vpZBQ3gQzkhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTgW-0071gW-27;
	Thu, 03 Aug 2023 08:27:52 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTgT-0071eU-0j
	for linux-mtd@lists.infradead.org;
	Thu, 03 Aug 2023 08:27:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8718521990;
	Thu,  3 Aug 2023 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1691051262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JKh0YoT5EtMkmw+6bQ4IAlmA0cKqBisDvoowqXZlsY=;
	b=QTwbY7tdSYtBbOr6bU3TIjPc48JFY0p1VEQ5UnC2EHaxwrykAGZGvKzQRdVgJSsKL/m+yM
	fJuEpmMtc+P5sgSlDFeiqXxqxaeXH3fz3fl5asZhjGqs41c7L3FfI7JED49+jtjEXd++iP
	tdAxoHZWGrv1GShKFMJxGJ048j17dSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1691051262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JKh0YoT5EtMkmw+6bQ4IAlmA0cKqBisDvoowqXZlsY=;
	b=SceAnaI/ZBi3nu/BhzdVcO/Exau4SNI7QBc/3iF9kI37OtrKOf3KYrOX0bS4DyIdl5GlUj
	1GPytqRNhMzqXLDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45FCC134B0;
	Thu,  3 Aug 2023 08:27:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oHFOEP5ky2SfUgAAMHmgww
	(envelope-from <vbabka@suse.cz>); Thu, 03 Aug 2023 08:27:42 +0000
Message-ID: <2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz>
Date: Thu, 3 Aug 2023 10:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 04/24] PM: hibernate: move finding the resume device out
 of software_resume
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Loic Poulain <loic.poulain@linaro.org>,
 dm-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230531125535.676098-1-hch@lst.de>
 <20230531125535.676098-5-hch@lst.de>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20230531125535.676098-5-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_012749_555706_C12CE87D 
X-CRM114-Status: GOOD (  24.93  )
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

On 5/31/23 14:55, Christoph Hellwig wrote:
> software_resume can be called either from an init call in the boot code,
> or from sysfs once the system has finished booting, and the two
> invocation methods this can't race with each other.
> 
> For the latter case we did just parse the suspend device manually, while
> the former might not have one.  Split software_resume so that the search
> only happens for the boot case, which also means the special lockdep
> nesting annotation can go away as the system transition mutex can be
> taken a little later and doesn't have the sysfs locking nest inside it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>

This caused a regression for me in 6.5-rc1+, fix below.

----8<----
From 95a310ae6cfae9b3cab61e54a1bce488c3ab93a1 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Wed, 2 Aug 2023 15:46:18 +0200
Subject: [PATCH] PM: hibernate: fix resume_store() return value when
 hibernation not available

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
---
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
