Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9384CC43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 10:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD392080C
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 10:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AYAwQED+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0Rhhxic4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD392080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TFdSkLWqdyEmklzwtLdRs1Zisn1/pt0MBdQWrBsdigg=; b=AYAwQED+q+fNxPewF0i+oMfbzX
	5ek+manhCMieAxvvCn2vGEQKLnAIHtlA1vlQUz9XwegLI4AHfs0sueqteWeNqjYK8LYyuNEmVo3fM
	dV0JfM9xkcOctmxFA55gSQCfpn4l1MMPtcM40DA2g7axikYG4YauyrGrOiCfILc3DVO98RFoGMrjL
	z42NQ554QYL8NmdGsnP7qOQnZCo0NWH0NAE5LW5WkLtBSHZokETtES/hwHbOIFf660sUTIS5uTsRo
	fH1w3tSvvh+njOoW6Ir+1gr4/QK00oln1nTTg+mwV237Um6ApwRrSJuKQjgZwbYjTnKCxl0sd2pLn
	q1Y+gECg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLQ3j-00009g-F3; Tue, 30 Apr 2019 10:32:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLQ3R-0008FE-Sj
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 10:32:08 +0000
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5175421744;
 Tue, 30 Apr 2019 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556620325;
 bh=pNgo8hqolMekfISAhOzM9C8Hh7leArWpSo/Zbvy4glw=;
 h=Date:From:To:To:To:CC:Cc:Cc:Subject:In-Reply-To:References:From;
 b=0Rhhxic4JZVVaMSh/fSPFdDFDNBxuyQIrsUmGr8GBY8q52R++v14xngaMdwyUimvj
 5R6SOvXbUHkfgnS+zexNlZM7FJ3lRDHm2ZfAcEXUBjW5EQebKti2QMiCAFnQ4xGhFS
 b6FXVTiSyrJb2oHi+mBe00bCqaYUDmp1tz1cioM0=
Date: Tue, 30 Apr 2019 10:32:04 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v2 1/5] mtd: rawnand: mtk: Correct low level time
 calculation of r/w cycle
In-Reply-To: <20190430100250.28083-2-xiaolei.li@mediatek.com>
References: <20190430100250.28083-2-xiaolei.li@mediatek.com>
Message-Id: <20190430103205.5175421744@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_033205_943856_203DFAD4 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: , linux-mtd@lists.infradead.org, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: edfee3619c49 mtd: nand: mtk: add ->setup_data_interface() hook.

The bot has tested the following trees: v5.0.10, v4.19.37, v4.14.114.

v5.0.10: Build OK!
v4.19.37: Build OK!
v4.14.114: Failed to apply! Possible dependencies:
    Unable to calculate


How should we proceed with this patch?

--
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
