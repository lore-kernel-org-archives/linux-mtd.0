Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAA7C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A49D610A0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A49D610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:Cc:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oF0yjYIJG2J8d5ZmiGhPyoFXNMazyg1h8vc53StnUY=; b=25NkRhrzFvveEV
	6JuTsExlxPO3h2uxqfZUQ8fzmcN+UNrSctwP6k3TdjQoBhdTjjSXXlrfHPM0k0Cjd0sL/yT64Ic4U
	K3IYvP01GG7QNmFS7tkmPSK++Pkc+RUsci87nfrz/NrM0Sg/CxVY33xbVfmMQ9WyCAlVaJZcD/QF1
	mBeEuC2Ghl+XvVUcetsOYAOCi3pmUa0J1wstdRVbXgKt5iH3BIifz7crPK7ltJhAE09P43wv1sORb
	2XStya3zPhMauVg/nYDmUQ0xeZN844Ou6vz8cF5LfqBKaE0pDSJ85MoqmtemIVPyr/JkHwgx3AAC+
	LUJHHth8+DjqDPRbdDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZxS-00Fe8c-Iu; Wed, 13 Oct 2021 08:49:54 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maYcO-00FKkQ-U6
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 07:24:07 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 19D7NkaN019186;
 Wed, 13 Oct 2021 15:23:46 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 4B960207F6AF699EF3AD;
 Wed, 13 Oct 2021 15:23:47 +0800 (CST)
In-Reply-To: <OF86339F0C.88E145E3-ON4825876D.002567AA-4825876D.002569D9@LocalDomain>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-10-miquel.raynal@bootlin.com>
 <OF86339F0C.88E145E3-ON4825876D.002567AA-4825876D.002569D9@LocalDomain>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Brown" <broonie@kernel.org>,
 "Xiangsheng Hou" <Xiangsheng.Hou@mediatek.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaimeliao@mxic.com.tw, juliensu@mxic.com.tw,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: =?Big5?B?UmU6IKZeq0g6IFtSRkMgUEFUQ0ggMDkvMTBdIHNwaTogbXhpYzogQWRk?=
 =?Big5?B?IHN1cHBvcnQgZm9yIGRpcmVjdCBtYXBwaW5n?=
MIME-Version: 1.0
X-KeepSent: 2120B7BA:FA9EA9F2-4825876D:002705BD;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF2120B7BA.FA9EA9F2-ON4825876D.002705BD-4825876D.0028A142@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Wed, 13 Oct 2021 15:23:47 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/10/13 PM 03:23:47,
 Serialize complete at 2021/10/13 PM 03:23:47
X-MAIL: TWHMLLG3.macronix.com 19D7NkaN019186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_002405_279650_D7BCD792 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


> Implement the ->dirmap_create() and ->dirmap_read/write() hooks to
> provide a fast path for read and write accesses.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mxic.c | 171 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 144 insertions(+), 27 deletions(-)

Hi Miquel,

I verified it by reading, writing, and erasing through normal and quad 
modes
on the Xilinx Zynq PicoZed FPGA board. Except for the need to update the 
SPI
MXIC driver version, it looks good.

Tested-by: Zhengxun Li <zhengxunli@mxic.com.tw>
Reviewed-by: Zhengxun Li <zhengxunli@mxic.com.tw>



CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
