Return-Path: <SRS0=vQrn=CL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3102FC433E2
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 23:02:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E45BC20767
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 23:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vf8XKpQW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZHQCfge9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E45BC20767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ns3NHOCI9BDmszPvDnRfalKl5y9/CdyB4gczvcXfOGA=; b=Vf8XKpQWAtGpruAKdet6qVUzu7
	oKmF/PE15z/3RFk5dUdglhLpU3KZZW+/Jcd5GP0byMsnGb8xjfnsXO8g9RfffYaodz+bMINdDUN4q
	BIClqKJfzWx9P3tvgx9P4OoahV4dH080HvvOfUXq7Thw/TvLEEvRc7ebqIsnFnnt51dAzaqejGdlZ
	pWmchPRkqLl9mf6+ANZGIy7C34SIHlcuF/X9q3lL9LFhJ72ZKSE7KfGCiqszqiu2uxaKHi1N+PF8d
	rP2bgaHsC3aXT8XCsnGuhgf/WHCEUPJF4GOem3KKiIU/912z2/1RPrCmjZYVry5OQyBJSgBTkB6/I
	/GPUKUVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDbkg-0000QE-19; Wed, 02 Sep 2020 23:01:14 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDbkd-0000PG-Rk
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2020 23:01:12 +0000
Received: by mail-pj1-x1042.google.com with SMTP id k15so515861pji.3
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2020 16:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rckbD9u1Jvs+TO4H1QTBgAqxZmJHaw52NI12SCf1ONE=;
 b=ZHQCfge9W0rq1an4zjkDijL2d94hOEcsp54D7D1XkAj+MpNlBj3TQqpLnSitIdXXv1
 hdS7rRtTpLagXWGJvssRy511yVf2YiGxvh3k6UnOGOr72OCURZmG9PDAxHiOkc3L/FaV
 cYE+BvmQntdfWGfxc3njqOhjaxw4yxOaPLZIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rckbD9u1Jvs+TO4H1QTBgAqxZmJHaw52NI12SCf1ONE=;
 b=AFmCQHGfcf+bXAaEn6U2oJ7/apB/Jct8HKLdfACeSEpASTQLp8v6XU8HltWP/DlQOm
 EGE0prUJ6SXf/2y5XQ2/43AyRMSBtlsaM6gHiEeWvqxaqT9FslX+k0CRw6wxrl9kW3cZ
 2zdbOiX/FLOIPFrttmtA2rqZqccr4Az1eKWTBD6qwPgED328NbKgIImiE0to17lKRCYS
 LgMhWkpI8NCzpK1qSmIkGDvL4AP49jNYEBWLObDa+mEikAfCCwYCEhMmpBf/AqXzyQVt
 3JpByPYIRKN88nEvRp066Fzv49CkH1n07FCLHotgmZ4zR7PTPfUCH1iyr8us79SQ8D+U
 w3Zg==
X-Gm-Message-State: AOAM530h3p0/IECy1NmOlybkkRnRFcw0eYRdOXSXHP8GZbMyo0enUJ6v
 /Qp2f7rVf93SmH5LESJO96kG3g==
X-Google-Smtp-Source: ABdhPJyszZg/1OfgGHuppP5KPcJIiYoOULZVJ8PzQ7DlaVyEphP0+9pGBgoilk2OjPsVI+o7GUdnrA==
X-Received: by 2002:a17:90b:360a:: with SMTP id
 ml10mr44063pjb.198.1599087667564; 
 Wed, 02 Sep 2020 16:01:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id z1sm419825pjn.34.2020.09.02.16.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 16:01:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: Prefer asynchronous probe
Date: Wed,  2 Sep 2020 16:00:40 -0700
Message-Id: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_190111_907468_746B1728 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On my system the spi_nor_probe() took ~6 ms at bootup.  That's not a
lot, but every little bit adds up to a slow bootup.  While we can get
this out of the boot path by making it a module, there are times where
it is convenient (or even required) for this to be builtin the kernel.
Let's set that we prefer async probe so that we don't block other
drivers from probing while we are probing.

This is a tiny little change that is almost guaranteed to be safe for
anything that is able to run as a module, which SPI_NOR is.
Specifically modules are already probed asynchronously.  Also: since
other things in the system may have enabled asynchronous probe the
system may already be doing other things during our probe.

There is a small possibility that some other driver that was a client
of SPI_NOR didn't handle -EPROBE_DEFER and was relying on probe
ordering and only worked when the SPI_NOR and the SPI bus were
builtin.  In that case the other driver has a bug that's waiting to
hit and the other driver should be fixed.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mtd/spi-nor/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65eff4ce6ab1..756da93f0f16 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3470,6 +3470,7 @@ static struct spi_mem_driver spi_nor_driver = {
 		.driver = {
 			.name = "spi-nor",
 			.of_match_table = spi_nor_of_table,
+			.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		},
 		.id_table = spi_nor_dev_ids,
 	},
-- 
2.28.0.402.g5ffc5be6b7-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
