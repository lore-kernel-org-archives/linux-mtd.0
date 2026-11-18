Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F344E60A2604
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wSpIG7hq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0Cb5ONB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pQ2jX/vaeP5hG8AVa7Kyc+r48FbPmFsw7vbkqv5XIF8=; b=wSpIG7hqeK2RcM3Spm72LAhGSC
	iZruyt+7zSuiWOmAqkzJLuNmHDEUY/cRtP/HSLdrrAMbtY1yQp8AOaXQIEvnMpvspryviiDMqn1UE
	o+ojvzPSQjavxi8DAbNOa4aTvnPq2WgNM5ZA6sHXTupwy4b3V+JBGGu2SBtEykMb0JazazIjgePNf
	p2NyHD18asdnQcU8BzMFRo7mXF7eYQh5aLld64wysJFHTsBbH6uL2JZoZzz1lOgL0i6zRq2OtRMdE
	JkF+nM/R1iAzUMGa3PMHz4yJ/xcaeD8vDQNL+VAa9XIHCm2WDgMmLGVp6VOT/Y9mYqbP3AyUJNh1t
	le9g3hCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjJu-00000009knL-3paX;
	Wed, 18 Nov 2026 17:19:42 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjJs-00000009kmz-0nGj
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:19:41 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-71ad099391dso712447eaf.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795022379; x=1795627179; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6gP6svfhzOhB+3p01vqjLTOkJSkqMxk4Z3G7OPboewU=;
        b=u0Cb5ONB7G/WvgmGKVwPdhygZS7leehhusN5bnk8qNmgS6yyDphLHPFNFOIIZIDw9m
         pYxhhGzYUonFCtnCLBbzzKoSMUoZOlnAr/ubzTbr4X2sj5TNGToMJfzISlJAeBl5hFRg
         apJsnAszZL05nB7EgTTO3crys6J5vVJKqe5u2Sxn7EF+Ct74evRpIW/bhb6s8Yw4SW9t
         eKNlLQNZp7IByAXDU8SWv0qaghOoJT0WzbsTPzpWR5KOmcPcD+Kc2Wqj7WAnqT/qn/PX
         Iz7+SPCRqVHhSANZZLo/OKpsBD06T2yvBjxz5rfCuoesD/XxYvJjxKGMphiQkSFftH7g
         yNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022379; x=1795627179;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6gP6svfhzOhB+3p01vqjLTOkJSkqMxk4Z3G7OPboewU=;
        b=zZuuo5OQ1NW3cqFdjT4Fhub49j2R61mJ+ihOzdJ51PkCMH9g3iJoYWEbMOjeX9Snu7
         t2XMge0RLCkqUuviXMOZTJhyrqM1nMfmyRjDE0AwboPkKytQ7XKy8zM+4PWP06jH7s6r
         Jhc7yCVlZxbGdWpPdsi3etfr66xDvt72C5Zk6Dr1SNgI6KYRc6gZQJPI5PuZiICeP3kU
         f7tTJ1yrvSgY+DmLdSpw0mBhNG085G4Oqk33y9lpmKaFDyWJ4X93GmJEYdkbKizD4sNf
         8UTtfeVltHNBh9qauUDOP2uUfqSZ6DbwWmKd8G3JMnzl8PBjKPmeZMwdXNVD1xTjSFYr
         pXIw==
X-Gm-Message-State: APuU4Z/sLLX6htGaNZo2+Ll2FfGOCJGq/LC8DBUnDEw8hCYWCcL/PSIG
	A/5skgazF7APGcIXiX0+2Nyb1IlZMODLuOibv758rFwkhzq70539BmjC
X-Gm-Gg: AYBFou3xs/Pq/2SwLOo5LWA0g2AkMLEeJ8oa+MtoCnwks61CbH/cw1TtR/ssWpk72XH
	OgCqTL5a2HT1LcXEtySq3TnmUmqkx4XolinD6hm3w0+4H8eKovuQl5ZDqGUBDwBmvreF1Pun6AK
	fkjEcIC7vJlG+LRjPIImOoP/nIPIRsPpSuPjgvbu0Ko3xp9FXE2SWhulTlhcMMkPmwAa5KxjlEd
	JM7cPj1iClX11BRzxSQyoX1qDCGVDXtJYr7993Ixhu++I9VGPvvYptEmvR4WpPUs60WagY7vBB8
	Zb9pM/GffFv8g+CJuOQSic8LUQqk/R6QwUQdw1A87dbt22nKQd9jiPi1mg9pN/EZ42pU/vl+JCx
	q6ENn3YAQYmd2ULZ0/I5xUjJKowt6PKDDEQI+Pr6TPdVJHRz4oWdWXACkuUnu6XSGYl0QaS2110
	X6Zw+RX8DH8s/fcyF/eFfLESrkWkvZrUuxe7xqCabPvMWTxzac66dsbA9W0RHbMkbjPQaorr1LZ
	PBuXtYBgdHxOW37F2q3DCINKMeNKjDvNSrTqxsN1NYRXOOZGFSs0Geqx0vBQ3CBQBixHhEUcgny
	nXHGFuYEm2H+e6pclWTpcv8gUxjptVmU1qQUdeuQn5ikSHFVPvhKoT3KCB/7vvwpbabYsGD9xkH
	xGm4w4wl0GphFKNnL+C1dXmTALHndE50HaXvwa7dYjXPyrHQr8H4PbDytibk6bZmv7ku2K8nATA
	vz+W1szA/CvTSycgm+8e4z3PAHDgBmUFZSEkpaY87Qaa6ybesvxNw=
X-Received: by 2002:a05:6820:c3c8:b0:6f5:217:b0a2 with SMTP id 006d021491bc7-71b1827bc1fmr1617469eaf.12.1795022379086;
        Wed, 18 Nov 2026 09:19:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021298dsm2495575a34.16.2026.11.18.09.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:19:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 10:18:36 -0700
Subject: [PATCH v2] mtd: core: skip empty read and write requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-submit-mtd-empty-io-v1-v2-1-b980927931ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6dgxTmmpceQ/DopQBxlhK2kokh
 Ltb8AAmf/OS//5fRaTAFMWtWEWgmSP7MYM8FcIOZuwJuM0sZCk1YqkgvhvHCVxqgdyUFmAPM4I
 2pW6bq1ZYocjyFKjjzzH8qH+czSfZtK/tjYFj8mE5nmfce39PchCqTje2UxdF0tx7Z/h1tt6Je
 tu2L/6wvzPOAAAA
X-Change-ID: 20261104-submit-mtd-empty-io-v1-6a06db864131
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091940_238639_2D47B1E2 
X-CRM114-Status: GOOD (  12.73  )
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

When mtd_read() and mtd_write() became wrappers around the OOB helpers,
they lost their zero-length checks. An empty read at the end of a raw
NAND device can then compute a die index one past the last die and hit
the WARN_ON() in nand_select_target().

Return success from the common helpers without calling the driver when
the request is valid but has neither data nor OOB bytes to transfer.

Fixes: 2431c4f5b46c ("mtd: Implement mtd_{read,write}() as wrappers around mtd_{read,write}_oob()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-198544@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Clarify that the invalid die index triggers a warning at EOF.
- Link to v1: https://patch.msgid.link/20261104-submit-mtd-empty-io-v1-v1-1-3f6bcf474e2a@gmail.com
---
 drivers/mtd/mtdcore.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b170c3144ca8..ea21dc1bb5de 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1805,6 +1805,9 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	if (ops->stats)
 		memset(ops->stats, 0, sizeof(*ops->stats));
 
+	if (!ops->len && !ops->ooblen)
+		return 0;
+
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		ret_code = mtd_io_emulated_slc(mtd, from, true, ops);
 	else
@@ -1849,6 +1852,9 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	if (!master->_write_oob && (!master->_write || ops->oobbuf))
 		return -EOPNOTSUPP;
 
+	if (!ops->len && !ops->ooblen)
+		return 0;
+
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		return mtd_io_emulated_slc(mtd, to, false, ops);
 

---
base-commit: 760d2efe91a84363d25c1051a10572242e75fe86
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
change-id: 20261104-submit-mtd-empty-io-v1-6a06db864131

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
