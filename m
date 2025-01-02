Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCADE77188
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2025 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5dmBMHKqQfMh18nUZ8DiLbB+DSj8Wnv406Bbl8lXOO4=; b=fbkEkMZlxMyTnp
	3Y8lxnWqwUXmOQO4pwdxwW0O2tT242J3sPZBhprkZwlcSw4t8A11A5PE4PHuI0CTYb2sHHNsXW8Dc
	PbMl0s8MPsJyg0RDe0uxdN5ssNwHImMjryz+CULHRsGRstU+/3D4w8RdP684jTiyUB5A3cYxbcM2t
	0JFLHZWtL4+9fgsKSK3MzjWm4cFaPiMCzT5euwitHJesvHR29uLVgTVUYRUk3ow6YTRlptHYArAgY
	8DXzX9yZoDdw9N8MNqWYWEP96HKojJ9PwTmIs6Po+aPCq634sV9ijD9Q2imPGo04nKA4Tyt0U/15k
	eCcwV5V9CnfqwhCCg1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJjh-0000000AHs0-0Nll;
	Thu, 02 Jan 2025 11:51:33 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJjd-0000000AHrT-2zrN
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jan 2025 11:51:31 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 502BpPTT066127;
	Thu, 2 Jan 2025 05:51:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735818685;
	bh=I9a5SEfZtwuBxnOCzsHpayY+H1xhNpnw3elu7vtCMi0=;
	h=From:To:CC:Subject:Date;
	b=R7y55bUycun4SbKIm0ppM9GhO5DDPd7sLeaBz/ryYh7m0dZZn5DuWW5HaKJb8amuO
	 6Ntkwnkal3OvGiIeReHnGfrm0kdh+D8xUiBVJsO3vKLdTW7BfRxnCRR77nRl1d848r
	 j2HPRjAHHKQVyw2VZAEnEbxJOXaMbLmJ56MNyqQg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502BpPD6010424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 05:51:25 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 05:51:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 05:51:24 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502BpLpE030343;
	Thu, 2 Jan 2025 05:51:22 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <quic_sridsn@quicinc.com>, <quic_mdalam@quicinc.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <p-mantena@ti.com>, <s-k6@ti.com>
Subject: [PATCH 0/3] Add OSPI NAND support
Date: Thu, 2 Jan 2025 17:21:07 +0530
Message-ID: <20250102115110.1402440-1-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_035129_855717_63D508B7 
X-CRM114-Status: UNSURE (   8.16  )
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

This series adds the OSPI NAND support to K3 devices such as
AM62Ax, AM62x LP SK in 1S-8S-8S mode.

Due to ERRATA-i2383, switching to DDR mode is not possible. So, we
stay in SDR mode during probe. [1]

The upcoming series will contain the Device Tree changes.

Repo: https://github.com/santhosh21/linux/tree/uL_next
Test results: https://gist.github.com/santhosh21/71ab6646dccc238a0b3c47c0382f219a

[1] https://www.ti.com/lit/er/sprz544b/sprz544b.pdf?ts=1734605642081&ref_url=https%253A%252F%252Fwww.google.com%252F

Regards,
Santhosh.

Santhosh Kumar K (3):
  mtd: spinand: Define OctalIO ops
  mtd: spinand: winbond: Add support for W35N01JW
  mtd: spinand: winbond: Fix oob_layout for W25N01JW

 drivers/mtd/nand/spi/winbond.c | 72 +++++++++++++++++++++++++++++++++-
 include/linux/mtd/spinand.h    | 12 ++++++
 2 files changed, 83 insertions(+), 1 deletion(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
