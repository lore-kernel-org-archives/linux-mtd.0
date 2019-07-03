Return-Path: <SRS0=y7vF=VA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAEEC5B57D
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 03:04:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BED8721721
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 03:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pf3njjAO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BED8721721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7Y/WozuuuJsUHiF23YlR635q4wkMoQbUc4WnhgX5TY=; b=pf3njjAOYC6nlA
	zt2uCMm6ugzXX2O3vF9NFGSUwsmSaMFW7KWVJ2SF9t8fwCtKpfhJZfVzvShMEQAo3Rf+HY6taAea3
	6lX6u6voGiJTqgarNinSLe9pRRWNzo4GsYlvjMyhJ7GxFIXbqYk7rsm0F1J5TfAfxwuT66u0iFjUj
	oudmOS0K3vRu+BHaiBX2T+YaL3yEe7O1qMFBTUJQ1EbWHHsv1TSjcM3EetAbMG/f8G7d/Hz0vJHyY
	HODGF4a6O5nzWgaKmRRnSAwOxfraBEHf7ZE2OJoAAFTTuv3/t17PeOUN0m0xjZfGwpbbWKG2+JWH7
	eZ7eksQr5i1Dh3oFV0dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiVZW-0001Xn-9B; Wed, 03 Jul 2019 03:04:38 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiVZS-0001Wq-WD
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2019 03:04:36 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x6333J7g046150;
 Wed, 3 Jul 2019 11:03:19 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 1CBFD7CFFB98E88ECBE7;
 Wed,  3 Jul 2019 11:03:19 +0800 (CST)
In-Reply-To: <20190627193635.29abff43@xps13>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>	<1561443056-13766-2-git-send-email-masonccyang@mxic.com.tw>
 <20190627193635.29abff43@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add Macronix Raw NAND controller
MIME-Version: 1.0
X-KeepSent: 041E283A:13DCC1D9-4825842C:000C9C7C;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF041E283A.13DCC1D9-ON4825842C.000C9C7C-4825842C.0010C960@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 3 Jul 2019 11:03:21 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/07/03 AM 11:03:19,
 Serialize complete at 2019/07/03 AM 11:03:19
X-MAIL: TWHMLLG3.macronix.com x6333J7g046150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_200435_308687_0066DD1D 
X-CRM114-Status: UNSURE (   5.02  )
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
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at,
 anders.roxell@linaro.org, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> > Add a driver for Macronix raw NAND controller.
> 
> Could you pass userspace major MTD tests and can you attach/mount/edit
> a UBI/UBIFS storage?

The other userspace MTD tests are passed.

nandwrite, nanddump and nandtest.
i.e.,
zynq> ./nandtest -k /dev/mtd1
ECC corrections: 0
ECC failures   : 0
Bad blocks     : 0
BBT blocks     : 0
00100000: writing...random: crng init done
005c0000: checking...
Finished pass 1 successfully
zynq>


UBI/UBI-FS test is also passed.
i.e.,
UBI/UBIFS storage test on mtd2 as example
1. ubiformat /dev/mtd2
2. ubiattach /dev/ubi_ctrl -m 2
3. ubimkvol /dev/ubi0 -N ubifs -m
4. mknod -m 777 /dev/ubi0 c 244 0
5. mount -t ubifs ubi0_0 /mnt/ubifs
6. copy a file to /mnt/ubifs
7. sync and power off - on cycle
8. ubiattach & mount /mnt/ubifs
9. read file and compare it with md5sum

thanks & best regards,
Mason

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
