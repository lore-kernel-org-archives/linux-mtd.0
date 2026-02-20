Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FFEC55178
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8zigUijm9+mztnZKtYo3G/TPpHfmyR/5G1ba3J4Eak=; b=VyOTeyhtPhIWjq
	7sQOU2sXBwQGTanZGrTlndj4Rf9pQrT+lhHXej1XI2S9xde8rA9i0+dShK1Whwms9ss+1rtGV3F6g
	tqRteuaqr9i/Jd23MNxzDqE9auzcTTLsX2h3Vfn8r+GT6a/VCl9htASkWr0VX4hT/SV3RiW5qv6tn
	hAWayR7knS+ZbJ/+QldBG6kwJGqVLGCrVZfjdTIvGMgUxFKItbaMWL3N5cJSKQVy3lSDcM+mIKz7f
	BGjproo7YqI/9LJNym2L/6ZD14TVnZc6OHt0+8PVYQjEAISYGcBFMxfIxQndTOKPebavf3J7ai9j8
	FN2LiNMX/fA1Ibuot5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtN39-0000000DbzD-38U1;
	Fri, 20 Feb 2026 09:43:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtN37-0000000Dbxo-3BqH
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 09:43:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a7bced39cfso20560215ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Feb 2026 01:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771580628; x=1772185428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4uplamd9/w5BrxAeYVRlbMIObI4QDvXn0N4hAlODzU=;
        b=WuVpDC4awN234bVqQLgVMquvQEO2QwTNBm+wg7sA4eAEmyElRICDZlKzfAAd2C5buT
         v5RRzKfpeMUc/ZtfSVjEOo21ZDyjYPLD5aJzZHTGPVO6I/Pf0Bk9BPCGPX9lLTQKFRCF
         slbSRa4awckvaZtOMalM8cBH3ginGBQgTvGkRi3gt1UZMIDZdK+ZV6mhLMElOl2oCfsX
         3t1Jgej1ZRD2qWF2Y0DQ04Ya6VtNC0iGKklO1Ga4IdzwscRP9GWopLJFUCOdp2QLWKpQ
         OpMahli3y1fqJ2XchOWCnnYM0ti7vjyOhMvq9d4CJ/3eY8luNh9CV4sqphF/yFtdKgZU
         jYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580628; x=1772185428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4uplamd9/w5BrxAeYVRlbMIObI4QDvXn0N4hAlODzU=;
        b=DpStSca6J+xV4bp5tIfPA9ZhK8xz5oD4gYuUjgxZ+XOslA0gWZ6OxfchN+2ymfWVxJ
         1LrFwYt/8eyI+so8fkr5S5s4ZpANM3eQx7sX1mo+BeAkkAz55IpgCWdChhBuL3Ncn6p2
         BCoxx8C+fkomVWu3Ju3IAxRuFrKrTehtaSF/v6t9QtnrUShe0dOsBolwEcJYKPWPY7S0
         BjwZTaG9D7fCWWSDPvgkwfNrKjgyp8gvp6aaMzTB1fhDOgT3yeQgB0Nn1nh0HR84DocQ
         xC+7RoHx9Rgwljij0CaS9+TQk9b3sxRVM20qjJycN3xd4Ngw41FBuD2ZEnhxCPil536H
         t97Q==
X-Gm-Message-State: AOJu0YwtnNHOnqZIhegJWX+Brf52ZGCd7kOdnVNBDJwBaosiCvtScoN7
	DMXCB8nD77jm29JdUFPchBO13/YQ/P6SSaj/GrclHMxHIzvdvpPjEId4IksKbA==
X-Gm-Gg: AZuq6aJ8OC02iGx5HH5plAcGFAFqAyZyMN6XRS1lQg0i9IJxVlskebmeyyFV0ui5Kdn
	1L5F6HrYgkzf1SirNdsHGvO/eplsyYstctSZn3o4lTAVfKPrK90dDFeomVlbbCMLBDBWqDVtDrW
	GUQqQHsPZXBZ9mzI1aErEzTdkXoTvnAnq+ou1oNeCn22CCYbx1OnzbV1P/1GDAAAIPH7xtxGvZl
	I79BVn/jRa6GF5xF7m66OXl098FgXh4zABGPiqhYIW1inFJCBeuqtC/aCk/yhog3ACFj33amGxs
	FJOubNfQvAzXP0nXKq1WA3qMc+Al/Aup7YkmQPL1mO6+EMDXx54CthiVWufMWhkV0QlbgXn22SI
	+M5kGWT4AzLmr9aI1rqgHAx3yee0DQy1UgXcjXERIu1F5Y9NImVU292ZsiCGYBIfUyqrjmNLkzj
	OthvaCNynnd4ba4BBcy3QI/IR6fGO60w==
X-Received: by 2002:a17:903:fa3:b0:2a9:451d:a69 with SMTP id d9443c01a7336-2ad50e5895emr85877095ad.10.1771580628045;
        Fri, 20 Feb 2026 01:43:48 -0800 (PST)
Received: from f0d65881db18 ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1ace5e25sm185309555ad.91.2026.02.20.01.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:43:47 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: Fix SST AAI write mode
Date: Fri, 20 Feb 2026 09:42:34 +0000
Message-ID: <20260220094236.28-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_014349_804603_E4DB2F64 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>

This series fixes SST flash AAI (Auto Address Increment) write mode,
which was broken due to two issues:

1. When writing starts at an odd address, a single byte is programmed
   first using the byte program (BP) command. The flash hardware clears
   the Write Enable Latch (WEL) after this operation, but the driver
   did not re-enable writes before starting the AAI sequence.

2. When the SPI controller does not support direct mapping (nodirmap=true),
   the write path falls back to using an operation template created at
   probe time. This template has the standard page program opcode, not
   the AAI opcode, causing AAI writes to fail.

Tested on SST25VF016B with i.MX8X running linux-imx 5.15.71.
The conditional write enable (only when AAI follows) is based on
code analysis and not runtime tested.

v2: Resend with corrected maintainer email addresses

Sanjaikumar V S (2):
  mtd: spi-nor: sst: Fix write enable before AAI sequence
  mtd: spi-nor: core: Fix AAI mode when dirmap is not available

 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/sst.c  | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
