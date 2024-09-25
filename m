Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BABC369C9
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YRw/8P1Mw/mJjjmTNRIGfF6y4trrNaBQJPJViSrSm64=; b=UlflmyZ/LAvSKn
	IU2EY7cSQjnqXWP/4Vqnvhu6MyXcoqopBZvXLj7pHKclJAk4wzX37DLyAJOVveLzqa3JqhYZKqJyy
	rLhInptg0Sig0GyxcoV00yCX+1rpnYxyKx/ctM8pkq/l8v0FzstdmTrVDjcht3ApuFi5tExNuSP1d
	AaxZlT6IrYO0iaakCslkmcwNT97r1bfwZ+m9+gJNKvYFJobkz6eAZZClmLqCsSDiq01hdUA66G7PQ
	dB1rgOKc9UJLkM7AqT3jtGGl6f/rzRry0Y5w03CTwmqT3v+UTMJNTlskZ6jo6LAzGXMuAoJmWqDt5
	707vpdrdEq7a5Y47Jj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP3C-00000004isJ-2ZZe;
	Wed, 25 Sep 2024 10:15:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP38-00000004iqw-3dIG
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 10:15:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so6443535f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727259309; x=1727864109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilIaUtbIEpTD2StWHvTRKlM/sRvr3jwjW7JtAZ7o8Ew=;
        b=WDd9RpbR9mo+gWixx0s0W8KkQ/QS8pX4vVugvZZi6PTulEZo7UanCZDMCgqalt/NN5
         qXvpZiGWSpA87PABG39JoqPlF+ZtM2GouaKsdfnLG39AGQld4U3G6Ri+fpQ0y1kpiFEn
         QnszyPhV67x8gcc6ZlGxAoulx+iKhZPcScowBgZ3Ql/0nmAYQBS6lWLPZY2HLAKSBvMO
         kmKDxYsdKkiljLyO/5Re1Tg6Lc0M6dg54o3CL0RCEqL52DEqzhDXuCW08YFiDpRxLu22
         zCpeYDzDqFq2uhcZl3QQWsHVr/J/H28nHCkBnpY5BDYF6dSxcgue/C8zvSI/TqsZgDnC
         vqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259309; x=1727864109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ilIaUtbIEpTD2StWHvTRKlM/sRvr3jwjW7JtAZ7o8Ew=;
        b=VwZZgdWwbm7LJc8EpP9E2Oq+Nqiah5zKp+OM7EpKf7sbj+9X/LhnIM4ncoJit3jqGh
         vW/YEmuKvndk1Trlhf9XSlqGxIx9MdGmObAh2SGrU5cQSMO9i2rrrfP9z8WWDkzGRXl+
         PNkDM7KYmZcdJEywA2wFqxYiL/omQB8tWLZvNWR8GvqHmwduZPQB9teZydj8vbJVxjwy
         Yi+/pturou3wqigM9tnhR9/qZX8+CjjDTvYTDnsEc4e0j+Lhm9Oe6+o/FI2kYgWlWLyG
         rLNgm0AdVD51j2g5wKnVsb1AA8rczUX4pCULXGXJsm3VtSksrhWHjzdyzwuLfUJhCPkD
         WfHw==
X-Forwarded-Encrypted: i=1; AJvYcCWcpbfM5nyN7X5ZTFD9GN2JPvnmn680NmY6MLSd0Dqszri6BKkgh32kLzr4l78Ny3PQCXNWrvwkJOE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsz1nX3Dlk523eO9BSoIh48yDfRZdXbF42whSHIwrjG58j74Zn
	FQv+k8Xsq9gGuj15HK03BaV8NB2UZEFDaRV7ulmhUqIp0hIFxLXn
X-Google-Smtp-Source: AGHT+IEmsRgIRfzVIU5fak3npQDb5hJ8p1AtivNkdH9EjqCFOo9Ah8NVO0bkOdgO29790nCRUCu71g==
X-Received: by 2002:a05:6000:1141:b0:374:c90e:990c with SMTP id ffacd0b85a97d-37cc2480bcdmr1731315f8f.33.1727259308798;
        Wed, 25 Sep 2024 03:15:08 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37cbc1560a7sm3628194f8f.0.2024.09.25.03.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:15:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	upstream@airoha.com
Subject: [PATCH 0/3] mtd: Add support for Airoha partition scheme
Date: Wed, 25 Sep 2024 12:13:56 +0200
Message-ID: <20240925101422.8373-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031510_939307_FC1DBA77 
X-CRM114-Status: GOOD (  17.02  )
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

This is split from a different series called "mtd: improve block2mtd +
airoha parser" with only the parser changes.

This series add support for the Airoha partition table where
the last partition is always ART and is placed at the end of the flash.

This require dynamic calculation of the offset as some dedicated
driver for bad block management might be used that reserve some space
at the end of the flash for bad block accounting. This special driver
change the end offset of the flash hence a dynamic parser is needed.

New aarch64 Airoha SoC (EN7581) make use of this partition scheme or
calibration data is not accessible.

Relevant Changes from old series:
Changes v3:
- Add compatible to partitions.yaml

Christian Marangi (3):
  of: also export of_update_property
  dt-bindings: mtd: Add Documentation for Airoha fixed-partitions
  mtd: parser: add support for Airoha parser

 .../partitions/airoha,fixed-partitions.yaml   | 80 +++++++++++++++++++
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 drivers/mtd/parsers/Kconfig                   | 10 +++
 drivers/mtd/parsers/Makefile                  |  1 +
 drivers/mtd/parsers/ofpart_airoha.c           | 57 +++++++++++++
 drivers/mtd/parsers/ofpart_airoha.h           | 18 +++++
 drivers/mtd/parsers/ofpart_core.c             |  6 ++
 drivers/of/base.c                             |  1 +
 8 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
 create mode 100644 drivers/mtd/parsers/ofpart_airoha.c
 create mode 100644 drivers/mtd/parsers/ofpart_airoha.h

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
