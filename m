Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67467C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 13:23:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F0220661
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 13:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SCXH9+cI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x+U57V8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35F0220661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C4I8G6S4GfHbjYLstMJ6kDHfFimDhHSWxYp0klnUj3Q=; b=SCXH9+cICkrxt1TbxJLezxUDED
	cQQnV7+FW2KXw50iUb47LeE0xIJiZTbHd+KAZdjpaSPO3sFe03AOO5C0M3tCfN7JUqT2fiODePbLu
	r1i+8YtRohan1rsjbGUJjN21CS6hxzkSQnEQnQnDxj/RwaWsUbES3rsmcNRBBOYr7OGTO4zAioLfX
	9nilWRT3d+NnKmKkOe7NUMgWNxUfkdd5HZa3XLDPFoAKtL8iGepW8hK5vHsD3SG/MDyR1Fnv3WVsZ
	DZZZ2W7FyVVaAdcqzgCRXMgPTe7W44BoBfcIQpPS2yrxIDqPMEaci+Yv7hUDeJ1ne3+k3JSCNL2Bh
	yXoexxWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyzBg-0005Cd-F0; Wed, 27 Feb 2019 13:23:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyzBd-0005CL-MW
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 13:23:50 +0000
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4775213A2;
 Wed, 27 Feb 2019 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551273828;
 bh=eSh7sCEcfuUOZUz4P6QT96CSlN/bRycXermA99FFb88=;
 h=Date:From:To:To:To:CC:Cc:Cc:Subject:In-Reply-To:References:From;
 b=x+U57V8qykHgx+AIJeZPHH8xbL52HA+sI/VaSJyfX56EPWoptKxRbDqPw8EbnU/k1
 /y05zTpUqG9G046v3q1P13tk6NKU2wBTyfnRhp6jIynLlNWMWEfmO8xcA7HO9mc5vY
 CtiPW+GscHd5OnZ+0QlDVjtSOM8X/MjIATEgewao=
Date: Wed, 27 Feb 2019 13:23:47 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] spi-nor: intel-spi: Avoid crossing 4K address boundary on
 read/write
In-Reply-To: <20190226112334.401-1-alexander.sverdlin@nokia.com>
References: <20190226112334.401-1-alexander.sverdlin@nokia.com>
Message-Id: <20190227132348.A4775213A2@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_052349_756680_075B4DBF 
X-CRM114-Status: UNSURE (   7.39  )
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
Cc: , "Sverdlin, Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v4.20.12, v4.19.25, v4.14.103, v4.9.160, v4.4.176, v3.18.136.

v4.20.12: Build OK!
v4.19.25: Build OK!
v4.14.103: Build OK!
v4.9.160: Failed to apply! Possible dependencies:
    8afda8b26d01 ("spi-nor: Add support for Intel SPI serial flash controller")

v4.4.176: Failed to apply! Possible dependencies:
    8afda8b26d01 ("spi-nor: Add support for Intel SPI serial flash controller")

v3.18.136: Failed to apply! Possible dependencies:
    8afda8b26d01 ("spi-nor: Add support for Intel SPI serial flash controller")
    f617b9587c16 ("mtd: spi-nor: add driver for NXP SPI Flash Interface (SPIFI)")


How should we proceed with this patch?

--
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
