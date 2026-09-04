Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A61C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUjEjqj7llIkEbapOmTFhm3ELt9AT9Z3Al3SwyLfXXk=; b=p/Wl/UyxyvnSuA
	wCQg67d2uXepKwgUpcLx+PYruD70ST6F0tJg2qhKBYHy2ysUJIN8Mq97WtVVMUeEW9CMTfMYDn4ZA
	iRsWIo/OdIEOuD6poGasxvs17efHBoW+MXhaJnIlMm4V4+fyNt5X8n2PmhWVrhVqoKqaVasZCk7aG
	ay2FUGozBfdUAr2Zn11zICNQXdNenzlNmTvduNE1R3oZcwzq3KopvVQ37zt2ZM2zWMjC7gH8Eyk1S
	aZgTJIdQHuOgHc78HeFFD2M4FEos5ySAay9sjBv1kZfVrrgOS7IVNlot02qFHaWTIX1c1DhUuYeGN
	9DNgY8Kr97kKoYNd/Z3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Yhc-000000034ui-0sVW;
	Fri, 04 Sep 2026 18:31:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YhY-000000034tZ-0aDp
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:31:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 265E01A19C8;
	Fri,  4 Sep 2026 18:31:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA9476057F;
	Fri,  4 Sep 2026 18:31:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A6E511C78158;
	Fri,  4 Sep 2026 20:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788546699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=P+rdDJwO1BaO3hbIt3/EpCrUPVPc1TD/epdBPBg67zI=;
	b=fp7eHj3IgTf5mmV0IwpYZtRclyXlk0Pu+yb/2whutuBYdtRbH0GGwUk1RFS/YhdBbr6jVY
	11Ldmbf6/7b+P6cE63ASK7GuMYSWSt46SltJ2AZo5+L+S3XgfCsqTlFqMcWn/nuE21Kok6
	R/J2jfDbpjxXqY21hdD9yW+b7ILGSt/xNlFMmuFTzGkPV2FG1Dc+ET9z2d5xZcSNHarRyX
	u2buxRlFFHMBE7SLdKF5PS5Wa1HO+LAEHb/p/ejyaV6iTMRqvzwvZxQ1bEtPnR6sRPo4Pd
	uOjHeAYASW4OtFnszft1EIF2y0/Y+f2BVB7d8KMwA1qnLA95A8HXBJiqMGirnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: md.alam@oss.qualcomm.com,  Johan Alvarado <contact@c127.dev>,
  konradybcio@kernel.org,  pengpeng@iscas.ac.cn,  j4g8y7@gmail.com,
  quic_varada@quicinc.com,  quic_srichara@quicinc.com,
  linux-spi@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic-snand: publish the ECC context to
 snandc->qspi
In-Reply-To: <apsKiRC-bn7oPS2P@sirena.co.uk> (Mark Brown's message of "Fri, 4
	Sep 2026 19:14:33 +0100")
References: <20260825013848.1056946-1-contact@c127.dev>
	<178854349408.1467647.16557341714581809344.b4-ty@bootlin.com>
	<apsKiRC-bn7oPS2P@sirena.co.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 20:31:35 +0200
Message-ID: <874ig4zx4o.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_113148_314503_65905331 
X-CRM114-Status: UNSURE (   6.69  )
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

On 04/09/2026 at 19:14:33 +01, Mark Brown <broonie@kernel.org> wrote:

> On Fri, Sep 04, 2026 at 07:38:14PM +0200, Miquel Raynal wrote:
>> On Mon, 24 Aug 2026 20:38:48 -0500, Johan Alvarado wrote:
>> > qcom_spi_ooblayout_ecc() and qcom_spi_ooblayout_free() read the ECC
>> > configuration through snandc->qspi->ecc. qcom_spi_probe() points it at a
>
>> [1/1] spi: spi-qpic-snand: publish the ECC context to snandc->qspi
>>       commit: 93bc7c4d2f4198586a6dbd7797c3bbf1ca845761
>
> Oh?

-ETOOMANYKEYWORDS ._.

Dropped, my bad :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
