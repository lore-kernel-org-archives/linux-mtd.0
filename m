Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0138BC4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0DA42053B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 08:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u0G9tI31";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wE02Ncx6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0DA42053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=on2v66RNluwgk2B5MKDOLsJzulotJcQENbE7p9cuO04=; b=u0G9tI31xzbBb1RsLOzsTHq97
	hk7QxYC8/N+I5gCOUJ3ZMhsWB9MbkDV2y64Zy8qeUzNcBLZXR3OBYE7SxjVPFp6/5vQApfUrTeuve
	tXEpqmi0ZOxo0Nzoek3eqphbpSQHlthGygmfBA6StHgNMnI4qh2nuFDa7PAvKSfQ7mLX3OsAbTiVA
	XW1nHgCprQNhDzMhaV/WcZbFeJ7xVqyt6VI4P6BTqnUVo3yujzHhXCI35VALJFmEdlHmQbuwd5mpA
	goo0Np0GKHEKXzVIkSK+kAeLqpoNyPdd51AmexEWBMH9AEJ9xc+keyQPxk7KQg1DZER/7ZgbyUQG0
	vJDEu+o3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXZo-0004t2-0w; Wed, 30 Sep 2020 08:35:04 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXZk-0004rj-SM
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 08:35:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Yw91019720;
 Wed, 30 Sep 2020 03:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601454898;
 bh=vyP7kkQO60gEdt3Yqemaz9AGjZ7Y49Hn9COTQL/iAm4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wE02Ncx6VDOKEESSJ5GWJv+32WsgCrPNKW29pwltPd75TkCh/bTJc6pfhDIuv+DKQ
 XFU9JGNNMkj9ljOQ8Nle2fAKxxSUOYvaIiWS+yfAZwc00apeEldzEhc0c/8TXMnbCb
 rXpi7dFJB1bCKfDddAl1iKp5ykrsxOVzFZ8lkWxE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U8YwtC036285
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 03:34:58 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 03:34:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 03:34:57 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U8Yo8k098804;
 Wed, 30 Sep 2020 03:34:54 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-mtd@lists.infradead.org>, Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [RESEND PATCH v4] mtd: spi-nor: winbond: Add support for w25q64jwm
Date: Wed, 30 Sep 2020 14:04:43 +0530
Message-ID: <160145480408.16293.15779441408974019689.b4-ty@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928060631.2090541-1-ikjn@chromium.org>
References: <20200928060631.2090541-1-ikjn@chromium.org>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043501_075507_C096E925 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 ST Lin <stlin2@winbond.com>, Xingyu Wu <wuxy@bitland.corp-partner.google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 28 Sep 2020 14:06:31 +0800, Ikjoon Jang wrote:
> Add support Winbond w25q{64,128,256}jwm which are identical to existing
> w25q32jwm except for their sizes.
> 
> This was tested with w25q64jwm, basic erase/write/readback and
> lock/unlock both lower/upper blocks were okay.
> 
> Signed-off-by: ikjn@chromium.org <ikjn@chromium.org>
> Signed-off-by: Xingyu Wu <wuxy@bitland.corp-partner.google.com>
> Signed-off-by: ST Lin <stlin2@winbond.com>
> Tested-by: Nicolas Boichat <drinkcat@chromium.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: winbond: Add support for w25q64jwm
      https://git.kernel.org/mtd/c/6eedfd858f

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
