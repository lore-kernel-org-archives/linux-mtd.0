Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADBEC43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 21:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F91206DD
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 21:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Swx0ilFe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Myy6nJwj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F91206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:References:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RjT+zTzGcZ8nSrQpTdybtdQnKtA9jxH0gyZubBr23Y0=; b=Swx0ilFe0QMeQd
	dMXAr4h6g4YMAoSnfTgiFGslBlsnopzr+fn1PTksCPPawiyVGbpwRQOkQwd4jcw68bHMk80UNK8fz
	tvTskZxyHmfTGsIJLYC+olmUs6LK3ZOCQ/p9HZVem8S06dXlNp66U+pYCc7sySGQ9lVQAM8+6lOq1
	Oq5zvoh3aq3W+Hlei8Ns6lhBoZuRRWMgU+wQKZ0o2gQHBk/MFdCUdcY+gZzrK3663J7ixmy3yT4/j
	Ou1K3keGZzT+dQe1NK3LJVn7kcqXiLwLm1iLfHMYWsDQ4Icryc3XfPPPHYGvjLiQayOy9Wf1vXk8V
	AfrCTdGHFSbAtIcEO1gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzpbd-0004Hs-Pv; Fri, 01 Mar 2019 21:22:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzpba-0004HS-St
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 21:22:08 +0000
Received: from localhost (unknown [23.100.24.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88DF5206DD;
 Fri,  1 Mar 2019 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551475324;
 bh=5qP87EDdspSsXNjJt8R3v1lgTwo1iQ2aYkH7E3O2wp8=;
 h=Date:From:To:To:To:CC:Cc:Cc:Subject:In-Reply-To:References:From;
 b=Myy6nJwj/9jGysosqym2TSfT6RTMThwm8gBUqkJwtkiukdyj/LxvuQHl548W/TXb+
 AwS+ve6ZNrpMslgUPJx3AGmoMpW0gsLu2K2+6DcedKIFQ/iRBXXS57x6/O69EYOIVR
 rrAAvkH9VD30T/yrVLbpkZAjMKDDkTdgFLPY3fFQ=
Date: Fri, 01 Mar 2019 21:22:03 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] spi-nor: intel-spi: Avoid crossing 4K address boundary
 on read/write
In-Reply-To: <20190227095617.20968-1-alexander.sverdlin@nokia.com>
References: <20190227095617.20968-1-alexander.sverdlin@nokia.com>
Message-Id: <20190301212204.88DF5206DD@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_132206_953241_788F8D53 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: multipart/mixed; boundary="===============4217328251000652014=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4217328251000652014==
Content-Type: text/plain

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v4.20.13, v4.19.26, v4.14.104, v4.9.161, v4.4.176, v3.18.136.

v4.20.13: Build failed! Errors:
    drivers/mtd/spi-nor/intel-spi.c:636:3: error: ‘blocksize’ undeclared (first use in this function); did you mean ‘block_size’?
    drivers/mtd/spi-nor/intel-spi.c:693:3: error: ‘blocksize’ undeclared (first use in this function); did you mean ‘block_size’?

v4.19.26: Build failed! Errors:
    drivers/mtd/spi-nor/intel-spi.c:636:3: error: ‘blocksize’ undeclared (first use in this function); did you mean ‘block_size’?
    drivers/mtd/spi-nor/intel-spi.c:693:3: error: ‘blocksize’ undeclared (first use in this function); did you mean ‘block_size’?

v4.14.104: Build failed! Errors:
    drivers/mtd/spi-nor/intel-spi.c:507:3: error: ‘blocksize’ undeclared (first use in this function); did you mean ‘block_size’?
    drivers/mtd/spi-nor/intel-spi.c:561:3: error: ‘blocksize’ undeclared (first use in this function); did you mean ‘block_size’?

v4.9.161: Failed to apply! Possible dependencies:
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


--===============4217328251000652014==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4217328251000652014==--
