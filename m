Return-Path: <SRS0=ozsj=FN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23E3C4361B
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 14:37:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677FE227C3
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 14:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677FE227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F30wizWdZkirS90BCMUGWjWCGiiJFebS6y3DeiooORA=; b=h9JzGGybIlLvzFBMpXTfsFJlG
	XcoPmb8kNVVc1L6pPShnTLPuuEX7h8nsg7MoGqPb/kjPVsWqyYGlDpr9Mu4WPVqzLFvvX6a90a1zd
	OHNtvmpzoZNpTf3J+alPK9LvqIZl0b5P4tWhF+dBztlR/nEyhGRxFDgtqvJDw319Uvmo3mwSht6x4
	gKKZSt4laD6EH5uHsro2eaAufBE06GUChdFukaDMYtQ2+lYz9//HDOsK68n38vUaJbEJtgSCaPcyS
	cA8I5AhacY3CSoEes4Li088f5/ZYMEsu3YGKEift/sMFhzmky/UrT5d8HFpwExcKRrBMRvulzyWmw
	K+BAsZHvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn0aA-0005ku-7S; Wed, 09 Dec 2020 14:36:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn0a6-0005jo-Cy
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2020 14:36:40 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9EaSmQ102124;
 Wed, 9 Dec 2020 08:36:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607524588;
 bh=iaQVHNYxJpWkMNbC/2TKJjISMK1mUEKpvDp5u8woOWM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=lNi9IYg7OKjtdvUwjypn/M0tsNmzLTK/4vaVQWXCwvX3qsphnZSV7pbS8+eXLujZa
 GtK5bdW9z2SoSswdk/Ey9mXNOtYC0KWagg6xuYpbbfIrEwmk/D32Vq/9ZzCpcJlKOa
 iFHFo9GkotcI+iTTFBZ8pQB0235ZZGKGvWkqZE5g=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9EaSqx041674
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Dec 2020 08:36:28 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 08:36:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 08:36:28 -0600
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9EaPeJ075567;
 Wed, 9 Dec 2020 08:36:26 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-kernel@vger.kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v8 0/7] mtd: spi-nor: keep lock bits if they are
 non-volatile
Date: Wed, 9 Dec 2020 20:06:10 +0530
Message-ID: <160744362728.26394.4055203896031176694.b4-ty@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203162959.29589-1-michael@walle.cc>
References: <20201203162959.29589-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_093638_618654_B3AC2346 
X-CRM114-Status: GOOD (  11.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael,

On Thu, 3 Dec 2020 17:29:52 +0100, Michael Walle wrote:
> I bundled this as a series, because otherwise there will be conflicts
> because the "remove global protection flag" patches modify the same lines
> as the main patch.
> 
> There are now two more patches:
>   mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
>   mtd: spi-nor: ignore errors in spi_nor_unlock_all()
> Both are fixes and are first in this series. This will ensure that they
> might be cherry-picked without conflicts as the following patches touches
> the same lines.
> 
> [...]

Appreciate all the hard work!

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/7] mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
      https://git.kernel.org/mtd/c/989d4b72ba
[2/7] mtd: spi-nor: ignore errors in spi_nor_unlock_all()
      https://git.kernel.org/mtd/c/bdb1a75e4b
[3/7] mtd: spi-nor: atmel: remove global protection flag
      https://git.kernel.org/mtd/c/e6204d4620
[4/7] mtd: spi-nor: sst: remove global protection flag
      https://git.kernel.org/mtd/c/a833383732
[5/7] mtd: spi-nor: intel: remove global protection flag
      https://git.kernel.org/mtd/c/afcf93e9d6
[6/7] mtd: spi-nor: atmel: fix unlock_all() for AT25FS010/040
      https://git.kernel.org/mtd/c/8c174d1511
[7/7] mtd: spi-nor: keep lock bits if they are non-volatile
      https://git.kernel.org/mtd/c/31ad3eff09

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
