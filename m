Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2455606D80E
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LaVcAQq6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=coP94Zuh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=T+QIhiL04F1tw/NkjHrWAf6N0MoliZK7cUYPSZcWIx8=; b=LaVcAQq6suvJK662xbUaQraGbB
	GeV7eBL80wJe0r1JwwxFvxiBO/LH/E1lbLiaWNMzAZHhazQiTEZCENIrW6en2eT++VJITmjTDigew
	cLIwRe9p01TOJN46GZNPFtOFOOQeVesEnDJvcJLHHkTJ1tLkAS66hbCJcaYm6r2YVhhoOBRnKbzIb
	iGh8/tJHBAVy800KUxnfppkDao9QaE9kp/l+VKyrwxUBUmd2NOcao0m8lFNUtVm1YQQdbw1vbNvKJ
	WREhzKn4f7tKfx3kvi4Z58w/7fiBQeLmMPDy5tCp+CR8xkL4iwGsaz0SrXuEpOGYSpxUYB988wT49
	gKvBlEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBaj-0000000Gqx5-0rRi;
	Sun, 08 Nov 2026 22:42:25 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBag-0000000Gqw1-0uuT
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:42:23 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-53dbe9b8d6eso275776b6e.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177741; x=1794782541; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
        b=coP94Zuh1THU1gqql0AyB2B5a8EJYbr6cYnAwkplHrWaz5FOsAJC5sfwTjbILW64VH
         a8B/kdUVlPS1a2DCJRDqLreWd0X2lEXJZAwP2EbXsPyMw+//QuylhXhIqDOntPhCy8YD
         E0LQ8vAt7gKka9+tkM+FERhlr2H0K6B+bZHwhuu946nw2BiAf+KPE59vxV1g9TqDzMIh
         kagD/NOt5zx0844vmgS+9pnYFp0E9Wn9C1qZVOCbwoJe84G3GdtN0/wgkWlgUhsync32
         37NVVTNlCde2PgY3Wi2xzRex1aNDEFYJQdzfboKPk/TTlJWQBrE+EM8Axx/5br5Zj91j
         kLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177741; x=1794782541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbe9BNDMr49UztD1Swhygj7sG/vajGHKtETS4f+BRsc=;
        b=YUWdPOrKf+7vo6cqST56xAok7GPXJe8+BQrAZvDHxSetpAlclmFF+b9Vl05/ie6E5Z
         9KkMyvhlT56LeOwmVKpkawIGhq43OUddxknsIq5nt4AXl3QLr+AElkMC+TO+qQ/4VzFp
         s8zlEdSN2ahVWabiH8KyDmoA0HyO7OYGtGilBiiZawQydvt+kpjWXDRuWnNiZcto4Igo
         Ul8asUeF7lC5qn8Q3h/CRnfowp99jnAj3cYZLedDPPChmFj6XRnuPy5SXODrXfsgAi4/
         OkERVyCLIF54UxhU3TeC4jwaEYCmra7ow251v+VdOkbnoeV2Pf/Hdh6+o/Yp2syhhIbk
         Sckw==
X-Gm-Message-State: APuU4Z/4kOqVNYus5Uq2od6yBJcSroLiMNGnBOdUFDJYSDgiNsavg3/i
	zluW49p/jAvq6tr/SggjhgdxZjs/xlmH2Yo58Ftkj222+Y5HeL+q/qLs
X-Gm-Gg: AYBFou0B19q41ICFkiry/fBfX83uT195tIxYLLQjtqJ3E30+0vsas25ZEoje4uirXdY
	pYmGnlBAfJN9Blx0rCQjbPikaXuhqrRwoxLHsq3nSVW1LsYlTryZrwgSxDo275k+ZcFGcyY7Q8T
	9S5Vfs6tZ4O0clqq9R+ogYuqT82FIMxdZXnxLsjmA81AyHT+7LgXZHyLb9otVj+ZTX/N449TX6h
	4AJohtJz9T06Xe35K/8+t/nzqUDWk1SgVrpNOcTx9rhAeB/ixLWWgWvNv+QR+LRmLiuw3AO+tfH
	cGzo7uyWynx1ntufucjk/yp38TXl6t1mLauGFWrTIzjhKJioGAYxWqji0rkJdSs6Ej2I8lpXjdT
	OoIVlXPcHJLv6W/Huz/OwmfmZM5x69NRiL15dj1p3m7Bv5xoB4z5M8pnACJF+SDo2gM1HcLJrmq
	S1EZMt/txqFYfSxGR6YN2Vc3xrbEFYXJiYIAj8FiaP3PZOT1qXCmrGnSgLkV4Xd24rpKAT/7JXp
	uk4Z4GoF4TYCEtq9awOEzUMcBKHhfUt6Wwj2lcuM75S3sciNZkzf7kY1JZSiMeatjcXHvMqmlD8
	NrJD9npMWDJ0gfzE/scvkhU++LgleOKHohzhaOsWBAGPMq3HxxDW6k2hy5EXU31c+Qba3+dGxag
	roKe92ylQjMjpnjY6UmZa+RckHxDP6v/DSLGdvjIqv33AdeHiWSt07J4D5a87XLrKYYWhJdYoJ6
	B2zb4zinogmDe5PQFMrmhgJBoBziWOXCS2Y58XmP7u+d7p2I0fg2ohwQ==
X-Received: by 2002:a05:6808:50a1:b0:55b:f88d:6e84 with SMTP id 5614622812f47-567fd57f184mr2789475b6e.37.1794177741024;
        Sun, 08 Nov 2026 14:42:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/4] mtd: rawnand: qcom: unwind failed child
 initialization
Date: Sun, 08 Nov 2026 15:42:07 -0700
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OPQ7CMAxGr4IyY0haSikT90AMaeJSI5qAE6oi1
 LuTgNiRvDz/PH8vEZAJg9gvXoJxpEDeJSiWC2F67c4IZBOLQhZbpWQN4dEOFOFu/ABOOwump6u
 FG/sWAZk9BxgVdBUWtSy1qnUlkuzG2NH0eXQ8fTmZLmhitueNVgeElrUzfW4N0a6zf+1winneU
 4ien5+ko8qeX6jdv6FSSahk05VSN6g29nAeNF1X6Uyc5nl+AwsHQcIOAQAA
X-Change-ID: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_144222_273294_19E47BDE 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep the shared BAM transaction usable when resizing it fails, validate
the boot-partition layout before publishing a chip, and propagate child
probe failures after unregistering any previously published chips.

The first three patches fix layout validation, allocation failure and
controller-wide probe unwind. The fourth scans every chip before
publishing any MTD devices, so initialization cannot race with I/O
on an earlier chip using the shared controller state.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v2:
- Add a patch separating initialization of all chips from MTD
  registration, addressing the concurrent BAM replacement report.
- Track which scanned chips are registered for probe-error cleanup.
- Link to v1: https://patch.msgid.link/20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com

To: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Christian Marangi <ansuelsmth@gmail.com>
To: Sricharan R <quic_srichara@quicinc.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (4):
      mtd: rawnand: qcom: parse boot partitions before registering MTD
      mtd: rawnand: qcom: retain the BAM transaction if replacement fails
      mtd: rawnand: qcom: unwind registered chips on child probe failure
      mtd: rawnand: qcom: scan all chips before registering MTD devices

 drivers/mtd/nand/raw/qcom_nandc.c | 72 ++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
