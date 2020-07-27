Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6E2C433E3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 12:34:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6803220663
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 12:34:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JQ2JHIVS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZeL5/Osz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6803220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=55DxQ9wSN+C3T3vDwnMxv+EBKVrbPsfeS8dCrq8YML8=; b=JQ2JHIVSoJBzBcJSs7sNHldpD
	/IXVGfcJPizHwkwhHOJigDQ3cDbMc8Mz7Xj0rsTueJdkOMva6yyIL+tyoQaX++NCYhk3ZVjB7yDYG
	Y4vll0+AFvh18SqKJRWsXAIjYY5ut+5z0ANILX1j36DFGesEM1HX8ZFK/cVWlEGca+UOtA2mZbx4R
	D/ZKxVXXjhCa27vkRZg2ZiDOR91gubeciSe1HIs0omBaqA7FhB1DNZCVL0VNlqTvp8mky+a/Qd+by
	jVu8xMElXlWETc9YLJyCV+lWodXpC/NNd0kp03lNwJNLw5+jTdwIZU/I4Jm14G7r/14vb+KBRF3l1
	qjnC4StEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k02KM-0006QB-G4; Mon, 27 Jul 2020 12:33:58 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k02KJ-0006Oy-OK
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 12:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595853235; x=1627389235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtilPSvSam8OEHgIiWTJY2vcTm66N/Xl5vDBzDpMN6o=;
 b=ZeL5/Osz8zxt4B1Z3c9h0y3SXlle1a0RaLfB6GdaG9wgPygzET9hcJaD
 IUp5dXsQizcq36QaywWRcir691m5DTyNZpmoX08eUudZQt7aghXEtj953
 DoSRgh5Om/8ewRlWQc2qFZVtKU0qatZmDK0H2j31+EazJVYgWydN7xq1v
 i++3l7+G4iUc3tLczrYOu1HWw/dxlHcZGVKYg92qkxi2AXmMTlVm0FZ4l
 Nfj8QJ5hL28CkzwMiDQ6iBax3aAQk28gY1uhrnrJpg5Q0sbMFzK+8/32X
 oCcywLJSp3qwJaD+1nyY9ou63hmy0Sls5xWbdR13hEMeycNp49U9ZyoTc Q==;
IronPort-SDR: WzRxzmIqEwjn3JaGiYUZxaTqX8ngHZCOnPX4k+1ghOZUwwr/VCZ36GEziExP0+LsQPfwqfNm12
 XhlWqR3ULbPlkmXno13cfltJgFvs6k77jtjCcmcM6fCKwkB67mihfsKxOs9zPxI7bsLkD6ucqv
 Syluogt7sywKkofN9cwT9LiRjZjJ1OgMJXKTMvSvSeHZjHfgM80h2o43+WBPIaUkNaVmrXMhpH
 3ZwB/6imKuX5YouDwGSd2ksm0aiJc1BOt65jh4jTjdIM5B42CeaO0ndG9HAHdt/qDacktSH7r2
 qRM=
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="89236541"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2020 05:33:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 05:33:10 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 27 Jul 2020 05:33:05 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Simulate WRDI command
Date: Mon, 27 Jul 2020 15:33:42 +0300
Message-ID: <159585278400.156466.5298743072819361191.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <282e1305-fd08-e446-1a22-eb4dff78cfb4@nokia.com>
References: <282e1305-fd08-e446-1a22-eb4dff78cfb4@nokia.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_083356_002896_B93E7DB5 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: Baurzhan Ismagulov <ibr@ilbers.de>, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 22 Jul 2020 16:01:36 +0200, Alexander Sverdlin wrote:
> After spi_nor_write_disable() return code checks were introduced in the
> spi-nor front end intel-spi backend stopped to work because WRDI was never
> supported and always failed.
> 
> Just pretend it was sucessful and ignore the command itself. HW sequencer
> shall do the right thing automatically, while with SW sequencer we cannot
> do it anyway, because the only tool we had was preopcode and it makes no
> sense for WRDI.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: intel-spi: Simulate WRDI command
      https://git.kernel.org/mtd/c/44a80df4bfce

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
