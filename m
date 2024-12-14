Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E0DE77180
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b+dOpF6y/F4Z3/noxnF3WePE7w/ePCBam+ow8jQnqZg=; b=hRUgvwSuqi7ZDn
	ts2aAWPfKWPoxHh5qshBY5m2Vjctm5IiG85TJ4fBHk08wYoryKijPvikDG6DSOj/ZwfN8XolHvoXG
	wlWpVy8qwdfW2swuVxP9TQsnheBiNENDz46Nk0ja/t7hTkfh5+AKoo3wfJWkC/wta3umUJ5XOmdyx
	0TODLnaaWTjsCg05SXs0Jw9ryJTWjgMrVyAbtnj6PHwxdI/LwvHbC7OyQParjLCQ090X3mOUSucxs
	iw2bpUguwuHIZyiZ8ENYjMKFo6kgylZjR4Q772yd5rDCu58qTbK4JosyS7T3iOZHZYoItfH66qeVM
	yk3RcBrLxjM8jILnkVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPTu-00000006BHD-11uP;
	Sat, 14 Dec 2024 10:34:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMPTq-00000006BGm-3ws8
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 10:34:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436381876e2so62835e9.1
        for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734172477; x=1734777277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq6s/wfYBk+ZemjMddvYvogmPT2NqpMDY7p5OVNj6tE=;
        b=kOqnxkPDqixNSF2pOrBQmTfge0Jm66RXTdPoPsYYFdIpfdQqgBZv2Z3wEgijScuAco
         i0gQguWNpwhZCuoNF6SVE6BIJONHU5UJigZXYZmnbuOE9ifU4F/b0IN6VV/k8Cd555V3
         m80vhTMAHheO2eQ8/XvQg802FDjQfuh6yO8x9IcMv/5rW9Z11Rno6q9MesFWRE35tRwm
         agLaGC01h/gZDNax7kHAPYcwwP+tlf3PQGSJadWvAjSh532qtbMq1UED146rgjaOycJC
         61PHafvQqIJUTXtBrepFw7iX9mFPifCDVUniE462ogdjfNIRckEbGLyx5doCz4D+hbY2
         EOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734172477; x=1734777277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq6s/wfYBk+ZemjMddvYvogmPT2NqpMDY7p5OVNj6tE=;
        b=xIMitAl4Mj7IAD4jH29iCzvED/OMNuEYnwaMuhP8qrgzXz71xDjIAfSFl80Qqfqs9y
         tll3aAGWWxQd4S9Dzg34mK8bFQbiYaKpRN6x8mghAdPNJdwvbsjImrC7dvQy4mkFub3X
         Jx6WMaEDnaD4YL2kModxZhIomYGBjr8oRCqeOoPgZcAjiDWt0zmMJIR9BlfE7aYXt3C9
         VqWdKbhzf6WW57atVel3qzA3sKSZGdnxAe0b2m8OoFZXDKhn1W0wuUdejyckumNTdNO6
         pKMlIXsYgzDsz9ATvCYO7qUZqR7K3sFqockwwgDOiBbi9GQrWOdalk/uBek5WiGWxbRL
         EQLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd1K1Gs6ojygLgX/ycLEQ2VBkRfNz8vu8dblfqxgVJ8qvPLY4RkUj+q7eQ19zwnTNjobCBlTTusAc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yze6xTL3o+npUXBq7aVdi5kVxQ2k9yfzlCq2xg2pLbfyK8f9v5P
	DfO+2nGYc+WOd+wdLFbVHvyLuhLakPTtoG5x0PV+FUI0jGO+hdQ+MhNOYhFFETU=
X-Gm-Gg: ASbGncuVT+O445D6K8lTRZKmUcV5fw1PhqP7oKrnRjB5uwLeyyblOBNP4RvcjgGOCL1
	tXJJ6fgNLCSjhL9S9kOk1ahhOzcJLF1w3pW05Y3wmkTjicF8tmedWqU7ZRR4wqpIt31JECg1iaq
	A8IC0VnTKvgMD835QBbrvdUCK9UNjrV3RABH2uxoOPL2RPM8ECWh38hvMuBNSMfQs7Bn3Y8Yovl
	Q0oaKprRVZj5l2HN6PnqhSwWbBqR3HHQP/bBW+aY7BzslWEzWwXWqfx7d9oxVx1nMD6HO8=
X-Google-Smtp-Source: AGHT+IGZVqeMRUhAYbg9AH7voB3+lxMPHQ/ldtxAwyAOMtaECInhdRHcp3XSg6K8vSgxZBBT3kSEOQ==
X-Received: by 2002:a05:600c:35c6:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-4362aa9f021mr19335045e9.5.1734172477096;
        Sat, 14 Dec 2024 02:34:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c357sm75243735e9.10.2024.12.14.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:34:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-mtd@lists.infradead.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: stable tag with TI AEMIF for v6.14
Date: Sat, 14 Dec 2024 11:34:28 +0100
Message-ID: <20241214103429.17501-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_023439_210371_2D781BA2 
X-CRM114-Status: UNSURE (   7.37  )
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

Hi,

TI AEMIF memory bits for NAND/MTD.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-ti-6.14

for you to fetch changes up to df8e78607d4795806b59564ba7a3e2e125d119fc:

  memory: ti-aemif: Export aemif_*_cs_timings() (2024-12-09 20:38:27 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.14 - TI

TI AEMIF driver enhancements: some refactoring around timing
parameters and finally adding plus exporting interfaces for devices
using the AEMIF interface (e.g. TI Davinci NAND controller) to better
configure the memory interface.

The exported functions are going to be used by:
drivers/mtd/nand/raw/davinci_nand.c

----------------------------------------------------------------
Bastien Curutchet (6):
      memory: ti-aemif: Store timings parameter in number of cycles - 1
      memory: ti-aemif: Remove unnecessary local variables
      memory: ti-aemif: Wrap CS timings into a struct
      memory: ti-aemif: Create aemif_check_cs_timings()
      memory: ti-aemif: Create aemif_set_cs_timings()
      memory: ti-aemif: Export aemif_*_cs_timings()

 drivers/memory/ti-aemif.c       | 192 ++++++++++++++++++++++++----------------
 include/linux/memory/ti-aemif.h |  32 +++++++
 2 files changed, 148 insertions(+), 76 deletions(-)
 create mode 100644 include/linux/memory/ti-aemif.h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
