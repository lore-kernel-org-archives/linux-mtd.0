Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133DEC0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2025 07:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nkFsbytYcXgcZCdUQX8bBLT7ThCmljnc5xCQIP/O0qU=; b=NzQpQm/2AGVrSb
	/lUJJmSkxhFAlfGLSk768TZxtBVQS3pkzna/hmZck/qPoutbva0GmwsFXKILbLN0IUk1Qs1sB7Tz6
	Fr1MJZLZPPvLlx5e/ZzazmoLVn3/vA0Wh7yH0ow6ORdMC/tMDNroBhWCxdmIG0dSs0Wfb3fE1sLdA
	ymY0FMo8H5sM22zv5RCTbRKxVTF/NSTjbhJdjDqw1iz/JnBLAQ5+zuDZb611R5UNcue+bX/C4d+rx
	4jMcALXKoH1QufF+rIoeVrMmDtkDmvQREAhzYY6nmZf7YR+Tmh4ou2EEbIGTQwGI5jAb0T+4d10eR
	32XVewL85IztPEJSOJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUlu-00000009ZHz-3MR7;
	Wed, 22 Jan 2025 07:03:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUic-00000009YoF-288O
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jan 2025 07:00:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so11258299a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2025 23:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737529205; x=1738134005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1WkJFE/Sed7K/1w/cnr536dKRzwsHBM5/yCypYusGTA=;
        b=Chp0Gmd1HwlAQxZEtPuaruA4K/TNDzJut6Rw9sTWbsAZniN9+SsWeGxSqEXJNTC4tQ
         fd1ufbfzxD9dKnz1cnrCCHgTwqcxM+lhYzpF/w09UAxdCbC4OB4WjxiNavAyLJ1sqA/I
         C0usCxk4+qc5NPPL4uxTn2YtwdY3DfmOTPIFhV/Y0M9R+cHQvAGP3fZAi5sJz4ct1LAY
         hDpfBwO7PikR6ELg1Jy7vpdyc17rM6+UqhyFEZliQDtVyTmSs/u0QyIE2BRVhgzmSzPo
         bEjJqv+/ZR5kWfHfJOQBjbynOMYfE30SVauAe1cc7jHrCYZ+B0dASA+/crnfFTO7sv/Y
         dUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529205; x=1738134005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WkJFE/Sed7K/1w/cnr536dKRzwsHBM5/yCypYusGTA=;
        b=BamzD2bNmpMag9WIl4sasMdq75lFt/tYZLQEb5oi3uJc5GKl9ro8kLffimLlrA0Tp7
         zH7HWgvIoCbuSmtqWpahvG39cR3qERmZoXUbLA3+7UclKB/Fc+Yq5t899UFYgCNmuv9e
         U1MhWFg5TtubvpgrPQtnQRc5mmvbg9sefAHflKAfqg1uOOV81RDjN39SLKN7zGHvAypp
         9sZiMMao04N+bb43VcO5xCSGBYGrHWdykapMSoA7abvKwFTvMTl1VQSsDY0kOvPvGxhB
         T02bQ20nmQWjxhYyW8yyPzVaMal4xveSW4igkhYR7rYgVoCpb/EyyIjEKVCSDnVZtNwh
         fEKw==
X-Forwarded-Encrypted: i=1; AJvYcCV2niODHTwQZI7N3tcAkEU5hUggsGo6W1n4uzcrHtgpwW9oop+enDS2JFpci4SLO0rVerPHru0XyE8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCE/mT50DKFQtJp0/uQno3zRzF0rR0pmZknSWZlMNf/aX0NjsB
	geYG1PXMoNkXAQilyFFWTuZve3YxRFlSgtT93OT3hC6Cv4gteDxIb1EELA==
X-Gm-Gg: ASbGncuCq3shwRffBpBnh21NOiQG69m3v8GqyUjN1XB73zDuco1RlviVvwhFzLobJYt
	eyG1PUVsz9mOoTBquDzt/2odGE5pItxmTPbZwTmPZlA0PpEfYvZyI6XooG4foQtexJy/VVuilG4
	0gGUKOgqFJcMfsHk3dOEPa6ty5JuIIIHFqMg9FNUPLN0nV2H7DuM3kJ0O6RUR90BE5OsOPUIvpz
	8mwSzGrFv9U1SGRgbdazyWvY12CJ3Wh5LKYVSzxbi6ZIvODN/uO9qynbp6O+ce3T2UhEROnMCT2
	RqjGRJjkBSADtlU5Kw==
X-Google-Smtp-Source: AGHT+IHKcFyaGwkF21hGRmAmjs2DEoZKxhMm0F/ekZztkPH6Fc9QpKv/UbyVXttJL+RtMHMuBFhbAQ==
X-Received: by 2002:a17:90b:264e:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-2f782c4c28bmr25783235a91.5.1737529205046;
        Tue, 21 Jan 2025 23:00:05 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6b97e51sm766436a91.43.2025.01.21.23.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 23:00:04 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 4F4C98085A;
	Wed, 22 Jan 2025 15:11:07 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 0/2] Add support for read retry
Date: Wed, 22 Jan 2025 14:56:03 +0800
Message-Id: <20250122065605.285145-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_230006_549214_E2B58051 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

When the host ECC fails to correct the data error of NAND device,
there's a special read for data recovery method which can be setup
by the host for the next read. There are several retry levels that
can be attempted until the lost data is recovered or definitely
assumed lost.

For more detailed information, please refer to the link below:
Link: https://www.macronix.com/Lists/Datasheet/Attachments/9034/MX35LF1G24AD,%203V,%201Gb,%20v1.4.pdf

v3:
* If set_read_retry fails, it should return an error

v2:
* Remove fixups
* Remove the function of init_read_retry
Cheng Ming Lin (2):
  mtd: spi-nand: Add read retry support
  mtd: spi-nand: macronix: Add support for read retry

 drivers/mtd/nand/spi/core.c     | 35 ++++++++++++++-
 drivers/mtd/nand/spi/macronix.c | 79 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     | 14 ++++++
 3 files changed, 111 insertions(+), 17 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
