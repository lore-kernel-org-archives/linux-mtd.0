Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A14C48BE6
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CBC61351
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CBC61351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Un5Ej1YsXujWPpbE9oxFI7Bu+CM3iRhveP+N2kT4Q9Q=; b=bNOvifSIpv9/fp
	3jRSi6npPtHrKoyqEIFVUFK71k/lUpybLGJ02QPscCF4rcbcFKOyi4PRinDNMmKKuXXrNlc5FUJ3t
	504MynIj2dm5joWiW7O+zZ7nyBNGjnSnVSASUEdtYUylEeWfKQKcmoqLVb7kcfKYjSfmlmC8+UhIP
	rksoYs4vZOXT/DCaKVz5KQ1g+o9fGSBUTZObV/uRkmeQCNC0/OFhIRGDHrC0jYArKMTV7CiKZ3780
	ekO6gWr+G4KRWKlo6JlycG1KTeq4Kt2bC+rSalR8Lx77JVpotGdi/0va3rMfPGCKZ4j20C5m7/N5J
	keatS+moNHAgo6fuogIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltYax-007Bvf-MV; Wed, 16 Jun 2021 16:40:51 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltYav-007Bto-6e
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 16:40:50 +0000
Received: by mail-pg1-x52e.google.com with SMTP id w31so2451316pga.6
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwtgVJkhTDK7FkC0vaUra0M374ERbF8RXthI68zkQrk=;
 b=PjKgFRjHSJToA5x31UIrlT2kQz8QWjvtUtYBHJLyMvk0e1Hb9GK88sJy3Wo1ywei+B
 z0DhACruELJPvs+3RZ33FJaX8HsHYVzcpOxltyO2La4fkO2wGBv6zH1UaGS7yZ5me6mJ
 vUp5deeq1o/Htj824MXRwhI+mkytJCSWrZDnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwtgVJkhTDK7FkC0vaUra0M374ERbF8RXthI68zkQrk=;
 b=PlCPffGQ7OBhuUid1R1tqgkYI7kLFlz43epmEfh0ROfXhxvkXy/RutOgqEh/F+gnQg
 QACspzNNKGVkhP3j4KFQ/L5G3pVQ7diAhmzgbPJdhklCYyewmITlzY4h7DCh4EV76vTR
 WQS0eE+85YdW8kjGnvuUBFDV2vchgpHyfPJ0e26DwKDBMFTvEC4TtyXSzB6C+In7kvt+
 C71Iopxx6X4/tqqJLU28+S8oNDPXfwL2gaBIyX6Oz4B9hmL+Ffx8oxxNPkTOoV4GPZfT
 GvvyHl2SgWys9c9fHZHV+YeO2UEx9prt64pqzYa/BvpyEofuDbFFYiEuZB2V+aGd8FUQ
 3EfQ==
X-Gm-Message-State: AOAM5328FiUzLnzS9nDBOu+nOT//4EsbWt/39Y/JOMIk5hSGWLvHjMWn
 PNbMomrxVs3CmW061zyu9FBqDw==
X-Google-Smtp-Source: ABdhPJyZY0hoVBBpbAB8LGirsSlZb/UXJaZdGclDdXDTOIGGnPZxvbdmt6gy8/o3bWoM59xye5Uu7g==
X-Received: by 2002:a05:6a00:844:b029:2f8:5436:dc39 with SMTP id
 q4-20020a056a000844b02902f85436dc39mr624754pfk.10.1623861646934; 
 Wed, 16 Jun 2021 09:40:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id ip7sm2663266pjb.39.2021.06.16.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:40:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 1/5] pstore/blk: Improve failure reporting
Date: Wed, 16 Jun 2021 09:40:39 -0700
Message-Id: <20210616164043.1221861-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616164043.1221861-1-keescook@chromium.org>
References: <20210616164043.1221861-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=95c1880167375f358445fa6b36d9d46efbebcc09;
 i=x+eth6WIY3ZV3RikljpGvsEDOkHC4+JR/D6VkOL4MwM=;
 m=KWKLltarrgCHVaChKkiXTTMXR+nWhEDb2yQ+7Fx0dy0=;
 p=hVqcquLAjJY5MNtchTMAytKSIfiafQn164H7tkcB2Bg=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKKYkACgkQiXL039xtwCZgHhAAode
 R8F21Ztaztm9OD+m51tZDz9H7Jmr3b179RR3mjQtLY5uCy9QlEpGuYAsz/ABz9YrgP0QBOkMztOPC
 oQPxj2VnCVVuMJRSzFTue9HH70ItKKMz/VIHIFeV7GPStnetLsLWB+ndgzT9ustwokFew+5O35X/l
 pOmZy7Ol4tvlE44IfAyL6U9z8p9P9r+3a9UyoxW9Hm+KrSC9fxCG0wayJe8PqBkEdSvJ7VolFsRPr
 bT2bKgOb1F1vZFcHVIK00XvErTh0b6lTlWZWU9m91uH0S47Z7T+rnsJyiRLAldZiTQW2TMWo4zkIs
 0QXC77HT2aXShl9P8FZkqmxDS/bYJqYFmt8ags6dV7EPjaOdAt42WMXdYEYuwsZBUVjFVwqpxZPm6
 v+z7VzEJQYXs4rrkOOdcUVk4p+BuoyTrmR6/YbOjHkmvW8ufWZxNlndmPcAXW2+CMqV+U8p3LiHnF
 Yt8bHShaW175vGPMGqhldiLQpQQvJUMtlfrf35EBWHfvA4lDbhJPkvYW/nytaYgyjrnSUmdNqcLTA
 sb5e0RWD0gXDZqBhYJX7byjf49AFfMoBn3f/Jke02up/jENft69J+Zz4+g+yXD8yERwRPUVy/A8fG
 Mty73UjHC9R3wIIIG2JsoPGhsP+8rLEgD7c7d6KYl/Pu9NcT44LdTcznpdHhVMi0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_094049_288097_4B3A0569 
X-CRM114-Status: GOOD (  12.81  )
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

There was no feedback on bad registration attempts. Add details on the
failure cause.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 4bb8a344957a..eca83820fb5d 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -114,8 +114,22 @@ static int __register_pstore_device(struct pstore_device_info *dev)
 
 	lockdep_assert_held(&pstore_blk_lock);
 
-	if (!dev || !dev->total_size || !dev->read || !dev->write)
+	if (!dev) {
+		pr_err("NULL device info\n");
 		return -EINVAL;
+	}
+	if (!dev->total_size) {
+		pr_err("zero sized device\n");
+		return -EINVAL;
+	}
+	if (!dev->read) {
+		pr_err("no read handler for device\n");
+		return -EINVAL;
+	}
+	if (!dev->write) {
+		pr_err("no write handler for device\n");
+		return -EINVAL;
+	}
 
 	/* someone already registered before */
 	if (pstore_zone_info)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
