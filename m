Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A88606A33B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CbM47Ijt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=htGssCv7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RE3wc6mt6elbYG41ZrRvEHxv/5gqoVeeedh+5NSty2M=; b=CbM47IjtJFF+9BKN2r9QilGDt1
	MzyTivvKiMXaTzwQD5mawxqC6mKSTf2KqdanwwChAQUpb3bp9Hx1FVI715luLIChQneoj/yRWanoP
	uEmq7rscv81HV1fOWAL5vfqDJz5i3bIdvrFGcBb08N437wnbGcI2xm/6uFli68ilySm0hd4qUmTvY
	+i3bDMWbZiJ+Wpoy+mYEvUfooQU+S6WE4naUszBMHeD/A8W8blI2x8/GoBGc6niPhNUqk8CxTj5/0
	MG6Z8kZNnBM3DV90mTLqgXRH1EdbEP+tePnM7JgCz9N8ojjCfeIypAbdVuoIFhLAcxgOAxMNXyux5
	R3LrcWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR3p-0000000FVHx-1Gvc;
	Fri, 20 Nov 2026 16:02:01 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR3a-0000000FVEg-1Hx4
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 16:01:56 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-86288992de5so819900a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 08:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190505; x=1795795305; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NtVw7HJE+FU9DI3xWpl8Pyt0L7yMJpDS2sfT356C23w=;
        b=htGssCv7MuZer0tqtecwxU8t90h8j4g9HW8D+XUk+bc1PJvyZknOkH0OvwQQB7T2u4
         sj1E10RscihJ6oTlhlJg7nO01w5Er3uc8fZmP/rGmACfWdS611rx7dtNzb4FjE0KeskL
         b/3sMnslPAAMb0n/jE5acINLvUMM1MZteWeMw0ZEtcGUl46H/KkZBmJzDI6vFbosM4Qz
         9m7PgSb8mB+mC6f+/cULVl0vFAizyuDMg99Uhiz15L+crju7+FGSX9aYWzVeeVcOygKF
         zh4az/rQh+gvebjLpeFB7hdTB4SZ1W+hSFaVrfFeKCT2Xtzs91n9wL2jn0ln4MLf5fSR
         S7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190505; x=1795795305;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NtVw7HJE+FU9DI3xWpl8Pyt0L7yMJpDS2sfT356C23w=;
        b=Owd6seGdof+7NranZXIh8AFRnVTuv8bXhtK5L2VAplMatSiTAE5Hi4QYih2+hw+/Ll
         k5ZrKkmh1iMeXQeIJzrF/EaY1lMGVYwdB+xpfJUeGByAZfEpuy22rGaee+pjTGlwi8iY
         Wy+VV9x7Txx57xG888/Xo9s29iXRjvIKLBTxOm+4X/oSvDBG+eWohKM2gM1ppho1D41N
         Ep/Wb6tbpW5FCu7R1L//gHpL7HocgxpBd/wi97NurCWS56EuqkdhFwTsNzAC0//WXdCF
         Zu6efEd80Eu/5eQDbV5/m/pHRp9mL5Ygsh0hhYdIIMjlsdFuYS2dGGWEBB5T8ZO71+Gf
         KfSA==
X-Gm-Message-State: APuU4Z+zphvSMsNhYS/AtpvLB1WEr21nwoBPm32i93YaShJsZbJzedn1
	HqGrGTqVG81oguj/YFdORGk4uOL3W8fduzlZsI+0gj+85duVmXnUdaQ+
X-Gm-Gg: AYBFou0pKNAlHUY3tEU2kDlmpdfBoKrOPax6OHBYQ5dBFdPG6SvY1OYz+Vo5pI0ueAj
	oU8UJVg64/LPry1M336FO68MtuuhHbiHCe56ob5zRdrgzkfe9dLmubDPxKj3uG+0Y/gdNlc+7uy
	jY7KGHKS6WMBhfl7YpHje9hKGAgjdeJw1M7+wdMtywqLeT/TFiqPEdRV4S6cXEESBKiZ5hJmptg
	7zKE7RHBrnDXzTxYwMnCE/R7FC5iFsB7J7Z2Fu0hVJSpt+URkNFmk6jAh9XfTVOGp8CKSQbRKEU
	o7ZLPfmvbXEFGO0g6Mpcksi1HpU/uAIgaCMtIJqLnyfTMBHbw5ODnnIo31tbnim7B414tfCZqCP
	Y1WfFUzxnmjygOudbtWMrxaZwYbmxdZCSSRa4rs4TTSBkevO8EVkjk5I3bWM4szmqQ9AIbBrxXx
	iFEc7QJmAaAYLjHZhOTSgONMFnKG7Q2rVESOgOi9ZxYoWA6s4ywyD5tUyx7tqNeyQ85HigewrN5
	Xq7C8ZQYYIAI1Un+eE8enT8PhfOGUeScsArsJCKbkVtWM7lQIiwHtmQwdGAcvfNxDQajcloyQF0
	wwq9ikAUUvLGmA8IvqSKSBBXM0B8HDhAKDTKabTOHfOsk4T5gL7aKgsp4Pg2t7moXiuoC697BJO
	ndcmDM7Te4THV83nrH+hAO+17PhqpJHcwDrQUQsnx+Hb+iisSM6JonbckzHFiu8+LrLjtig6Mgq
	MpK+iE1qdGeI+Cb1jyQBzXN+I8K75cJUqvRFQ4DufCTiOW1YNJ5Ps=
X-Received: by 2002:a05:6830:3916:b0:845:614b:eab9 with SMTP id 46e09a7af769-863091a9d18mr3867703a34.6.1795190505053;
        Fri, 20 Nov 2026 08:01:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2307408a34.14.2026.11.20.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:01:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:01:35 -0700
Subject: [PATCH v2] mtd: take a reference when opening an unpartitioned
 master
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-mtd-master-open-reference-v1-v2-1-5c2e2ede4ea7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw7CMAxEr4KyxtBU9CNW3AN1kSamNSJJlYQKV
 PXuOO0JkOzFeOznWUTEQBjF9bCIgDNF8o5FeTwIPSo3IJBhLcqirKUsWojv3lICmwxYFRMG8BM
 6CPjAgE4jzBKU7JuqNtrgpRFMmtilz/bl3u2aMU/UKaPzRq8iQh+U02MeMf2ce79if6SYfPhuM
 WeZOf8l4pLQNlIp3eoai+o2WEWvk/ZWdOu6/gDe9JtUCAEAAA==
X-Change-ID: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_080146_695903_3BC82C61 
X-CRM114-Status: GOOD (  14.91  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_MTD_PARTITIONED_MASTER disabled, a flash device with no
partitions still gets a /dev/mtdX node. Opening that node does not take
a reference on the master MTD. If the driver unregisters the flash
before the file is closed, the core can unregister the MTD device and
its NVMEM provider while the file is still open.

Take a master reference for a handle on the master and drop it when the
handle is released. A handle on a partition still takes a master
reference only when CONFIG_MTD_PARTITIONED_MASTER is enabled.

Fixes: 264725e35fbc ("mtd: Clean refcounting with MTD_PARTITIONED_MASTER")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Clarify which handles take a master reference and what is released early.
- Link to v1: https://patch.msgid.link/20261108-submit-mtd-master-open-reference-v1-v1-1-871aac8c6e05@gmail.com
---
 drivers/mtd/mtdcore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b170c3144ca8..c51067ea19c8 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1330,6 +1330,7 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	int err;
 
 	if (master->_get_device) {
@@ -1350,7 +1351,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1435,6 +1436,7 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1445,7 +1447,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);

---
base-commit: 14b6830335eb6d70dec7a235094d66c22d38eb07
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
change-id: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
