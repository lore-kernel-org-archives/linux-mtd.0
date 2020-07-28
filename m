Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D78EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 09:57:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69A082074F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 09:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCZMDKqL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rQgpUurl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69A082074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DdylevJmsdz+zHjAGirOEg1ISLNOzWw3n0jJzeTWzDg=; b=NCZMDKqLroK2Apx0OKLeWPPP+
	BplflycgokikQrYuiS25fABAbOr7pSKNrOWrFrQZiTb490WeDF6WiMzi6FYEiVOORLSewcYMOCIjs
	zcvWldONJmggZxvsw/dMbd6q35ItqPf5UksDTypyuMoH2oU2aJFe/ddAjZjI9WxWioZPGRccy0jwh
	eOIsga5istXZ1HyVxi0ku4eonDGxNbGYtHkBLaymmYOmtM/BUa+cifncucpfKLtcib754kJ5zacIr
	f9thlDan7cSODdelDRLNRIa9+9FDa5qEPd8kdC8aU3VhGSo2NUdxMtimzxnGriEUW3R123CFM8IUR
	iReS0Cp8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0MLA-00076A-L5; Tue, 28 Jul 2020 09:56:08 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ML7-00075J-Gc
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 09:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595930165; x=1627466165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KhvNa8E40sXAjwFl0sqFki4lRCuz5/nv22mAe6ewzeA=;
 b=rQgpUurlh2eTzBnccFJCkFlNCNyehxgzhq1cqtn9xRpumTqMrrXd78C7
 jZRy6y9/eBprCQoSkZRIHydvLND4fscymmRXxzkccu/40gVxnDhLUJuTg
 UU9wc3LLb5onHVGhJDbE17b3PAUmzmLGV88G8lZ6jBuBI3YSpQAnU2wgv
 uk/sv/YS87ArfDzP9A6+pNYNyAthE+QSoKe09SNuv7t3yNBgDN7eOINn4
 5X+fUKQfL878ub+A5lO8wlI3YoJjSla7mcIAo0LvImJcy5RbSbQlsaIGo
 iodrZsej9cKcTY3d6VF1OZmO8Y5RK/4BreJpotSuePw5OSj0xpXJ5L0JO A==;
IronPort-SDR: 83JkuCKG7D1qAdNvrKfIem0ne4IQrJruMShDWB8fBEJvwBknXCGwROl1o4Azw/MHix89Y4dCKw
 xGo3R8g94fH8wga1HArMilEpSf0z8T/u8vvDkHd8yI44yPd//qad/Ku4pM1cCIkLZrCyqdl0cM
 3UNDmgFClj7G2oOJYhNjmYtiNDikdKC8j1nmvh6lE70bU9rIfZwb881leNZhWl2WAWM1mQKTi7
 AQfg/WNtbzcpgVnIOs2N3MJhT0V9FdIvKUInAlt9NGw9ojFu4tkPL8eRAroxs5O5YfM3zCdVbU
 3Nk=
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="83495961"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2020 02:56:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 28 Jul 2020 02:55:15 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 28 Jul 2020 02:55:59 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Luis Alberto Herrera <luisalberto@google.com>
Subject: Re: [PATCH] mtd: revert "spi-nor: intel: provide a range for
 poll_timout"
Date: Tue, 28 Jul 2020 12:55:58 +0300
Message-ID: <159592990737.214287.1329265893720399161.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200610224652.64336-1-luisalberto@google.com>
References: <20200610224652.64336-1-luisalberto@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_055605_760150_4BD77488 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 Jethro Beekman <jethro@fortanix.com>, linux-mtd@lists.infradead.org, Miquel
 Raynal <miquel.raynal@bootlin.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 10 Jun 2020 22:46:49 +0000, Luis Alberto Herrera wrote:
> This change reverts aba3a882a178: "mtd: spi-nor: intel: provide a range
> for poll_timout". That change introduces a performance regression when
> reading sequentially from flash. Logging calls to intel_spi_read without
> this change we get:
> 
> Start MTD read
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> End MTD read
> 
> [...]

Applied to spi-nor/next, thanks!

[1/1] mtd: revert "spi-nor: intel: provide a range for poll_timout"
      https://git.kernel.org/mtd/c/e93a977367b2

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
