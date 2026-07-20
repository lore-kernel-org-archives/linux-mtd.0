Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5560BC4452A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=05VS5QN8x82NVtle1FGEU+Y5Y+u25GDqTfiTzQSZAmw=; b=2epxU0NXHd95Yl
	TM8emp87DiLzUOidbIh8HgG1LMJr8VsxNv3PXdSHpW79wkG4Rhngv2ltpC7R2OlZ20rLVsU5WtVq/
	6WFkW+TT8UyDkvPmVW62sf8my67G49o8PLLNcUPNTBLomX2fKmS1DyXSKYejov4xw1MwPxvPVTugk
	9GWmJS4Jo7vYG/lUxsA/uHFszEBQh1GBSo+daJl49/TPnr4+9FWjDOfKAlODNk9pNMCfFhjohIzYr
	JnFEzO8QffCwXpH6ZDuipZ3FFGazhcDS/BI5lu3v5UnmMk7+Vva+MmXyA/ljlU9TTazdkQETB0LXw
	3EjMnrm4CKKvrxqI7zcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlojs-00000006vhU-3RTO;
	Mon, 20 Jul 2026 14:13:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlojp-00000006veQ-2FKH
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 14:12:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cad4170e8eso139197085ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2026 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784556776; x=1785161576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7fiBXjtAildm8IwhfbH+uJoTnJQ5uXcULnuq06T9ao=;
        b=MNXjJ4QgicXCzhDk33i6ngWLjWzjsbK0UY8caoTJSQGSocoLXThEdwnwU46XxbFqs6
         QP8arqCV4TNUGu1mHRA3yt1F/2zHvKjvnCUHHD+ptloMYVwZSvd0NFWou7T/OOY3ciVN
         97QVGrMRnOREvISOS8hv8dyoGReDCAicZuFqeUS0yDT65uWTO0cQUAU/fM27MAYoM9Dj
         U5z+PWQUqgidzP69Ep7Ji2N2NHeSGiuf4Kvr6IJTdbGBG5vIukUV8IqTbMOc1m8Rqlod
         URIMAPUo66KQRNE4y6S4W1FqrnlECtehDwKYtMrnpo+1nrbZAAYsoLjf1YIoqF/7OeUL
         lafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556776; x=1785161576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7fiBXjtAildm8IwhfbH+uJoTnJQ5uXcULnuq06T9ao=;
        b=Q9ozDxJgi0woaPXXRd/hCpvmFBY19Esb2iM8Lh5UAkCEdVX3Vi8u3UPJTo2GixB6OA
         2qSLFXgEAjDNGfZAEOexY0qWvJPFDJvk5OXnY8x+IWa3oxyBERy5L37WAp79S1POeF50
         UcnAf3+BbWdIe00JfK0Nl5J8D8VNOm84HR1KuI7AoSoYrQBJtObM4zq9Zp4G3CItzGwj
         eLWi9ZP3oBs6lF8aoDhpaxsenMBbEap5nYHauaD0T2wGYcLq3At85iWB6OLSfpVtRF/h
         56sUGfIob5UrmiBsl6TuX2B62VYR0v+bu/jXBuD8zLd3HwDP8J9CwfM0pzQWn9eWF/FA
         eACQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSoxSDTNK9kRsgUWIb/6b2P4ATXNusAeh5lHli0V62X/V3lUn8Fep2Lbug6K5r9BH2kblSr3FBqkw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw47zuY8ArZq0Gc8mbYpW2kzmXJLAYN2u+5amvHYVYLO/TDse9i
	d7/Z0JCRxqHr+oYzsmZc11udVaVBpyvTz0A7PbDqQCN9QkktXmXVZZQb
X-Gm-Gg: AR+sD11lFyl8HrJmYthVdqK0VtnzgllWXrfvd6W9suD89pp8AHVvAYVRf6ZWo2uQPr9
	GjzjNjIBZQHZqLUVm5FOuG4ugBO6kOygNeK3ef7INyKUcAsX5VPJ/S4z/MP4WRjstJM+ekLePXP
	4ffPgvhNcMcUJmW7lWc/WxHbWTsu1e+lRBlsDoVKtetvMZrQiIFj99D0gIbKfAkfb0GSvjEI5ZQ
	2lnls1P6klD/ipGpBMyOmrvJXZySmk5LtNOPrgdr21/H/DPhh0wjd9p8UM+Ty0hmo9n5VNrU3FK
	+j3Cvyd8rzZWX1kvNkjcXn0eTsgSQ88w6df3XYoqAsNrNp0i9pDABtWAXtPQX3VJVlxus9pb6qS
	LiySj1eZYCCbcz9lJUQHl2k2H3KYugBbqCyayXvn6xGYogEdiTpNosEW+2iND/1IOb5d/jhDpk8
	iRxgs151V6i5HZno+uPRT3970unVhETWRfVLSh16XfL/m9Kv6QDv06B6yNwTW+MJdle70=
X-Received: by 2002:a17:902:e752:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2cf349910d3mr151274905ad.32.1784556776008;
        Mon, 20 Jul 2026 07:12:56 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34730e35sm57578155ad.64.2026.07.20.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:12:55 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: takahiro.kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: sfdp: bound two optional parameter tables
Date: Mon, 20 Jul 2026 23:11:02 +0900
Message-ID: <20260720141104.2054417-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071257_576641_D9018851 
X-CRM114-Status: GOOD (  11.17  )
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

Two of the optional SFDP parameter table parsers size a buffer from the
table length the flash reports, then index it at fixed offsets without
checking the table is long enough.

  spi_nor_parse_profile1()  reads up to DWORD5,  never checks the length
  spi_nor_parse_sccr()      reads up to DWORD22, never checks the length

The spi_nor_parse_4bait() already guards its table this way, so both
patches apply the same check. The two parsers were added at different
times, so they carry different Fixes tags and get one patch each.

Found by code inspection. I have no xSPI or multi-die part to reproduce
this on, so this is not runtime tested.

changes since v1:
 - reworded both commit messages to be more precise
 - renamed the two constants from _DWORD_MAX to _DWORD_MIN
 - Link to v1: https://lore.kernel.org/linux-mtd/20260719010820.1924739-1-sammiee5311@gmail.com/

HyeongJun An (2):
  mtd: spi-nor: sfdp: check the length of the xSPI Profile 1.0 table
  mtd: spi-nor: sfdp: check the length of the SCCR map

 drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
