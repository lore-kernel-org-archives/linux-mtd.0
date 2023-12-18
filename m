Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CEDC35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 12:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkeJgDxsABg5znXLScX/kNuhEzu5iGdzqyMm1Yj0KmU=; b=T7RzhuPDBC4AbZaSmM9+yWhPf8
	9Kk6dHbJ5Fr0V5oCwC7dJ9qe+PqlM/gXKsGaCBpiEUcgVlZsU7iisDK7P97br854/K4rHOpB10AiL
	A5phuZ81UnpFfBYugfYR8GTEtZ2B+vxUDgPO4sgK5ZhPxjQuHGQzK7JHZ/FvZfF1SaKbGzzIOJ8ao
	BxZkKU4spr8ydNN29mSpXXCEk073hWvGR8vSsrPhti3uCMmCA8nv3IIm5ztYeJ0W16lLY2a26haCe
	GRAcEJEol2w1TicDKf0+Y+82BnID16UR740ZkmtkZHTkgAa4L8Z8NoVJGuqk21Rb/avr/HK1tNzN0
	MljkayAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCSt-00AZMF-0x;
	Mon, 18 Dec 2023 12:11:19 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCSp-00AZKw-0U
	for linux-mtd@lists.infradead.org;
	Mon, 18 Dec 2023 12:11:17 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0CF9B5D4;
	Mon, 18 Dec 2023 13:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702901473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1YrvLcZmhYxcBs0+MrjLM+H/Py5ZDv19n+yvqj0ggI=;
	b=XQm5+G/eJ2d//DoBR3tlIWuqoG3vQWsCxZNdBqvU/a3M6UFfJaTh4QYK/+5MwGv0Fh0JE4
	2UcHyY0Yiptn03utfxrYVFKMujLVfnLzkJ/9tbD88PpXBwAu+9JRLnb28lB+PJx9Ue2dng
	nISdDuFv9FaD5yKH58t5fXdp30jEHJkMRpei/pmoIPZmEPWXlNIi2I5AvKYBepMHmpNtZ4
	fxOZceabLstVvVCL2JWkThoFS/ZFD8pqSj+x9YaTeo0M3HosSV4imgbfxYfojYpa21I3r/
	K7tSI1P/LZQxtF0TFGDCHxAH8DKK7VMsKvfd2n/jvJVFrssFbRZfIej29tGrEQ==
MIME-Version: 1.0
Date: Mon, 18 Dec 2023 13:11:12 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mtd: spi-nor: sysfs: hide the flash name if not set
In-Reply-To: <20231215082138.16063-4-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
 <20231215082138.16063-4-tudor.ambarus@linaro.org>
Message-ID: <15561027b3896faadfc34274df76f533@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_041115_339888_FDD71474 
X-CRM114-Status: UNSURE (   6.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2023-12-15 09:21, schrieb Tudor Ambarus:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 
> The flash name is not reliable as we saw flash ID collisions.
> Hide the flash name if not set.
> 
> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> [ta: update commit subject and description]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Great!

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
