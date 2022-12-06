Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83149C47090
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Dec 2022 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcwEGeZOb0MEzh/ZGyDlfWn0C0Hf+sxWHZ5J/A/2+ko=; b=jC0BOgzieoVi2GZ6ybnzFUTFOl
	c7b7DPm9b7P9MxcglU2kZpQU+GFfmCUCIT/TtMUR0wRxIBc2sX7iZmwTCn2qK3AB9NRhNyba6+PLb
	mepG7ud1KA3reoMbj4+p8V4ZumYS/zktlc5Lop81yKpUTUtrHrteP0QnhO11aKUvDrcvJfo91YDwn
	YvYmuFN5CzwSk2+YBgtQkOpm0oBjBHM8FntEw+27fq0xFf1ckXaD5W5kCFwjfkicY83zQAfpTmc0b
	HGcAQyfXlpg9uNSIPnhToAxAHZIpQSJgzLDrbrW3DIvFvYQCrrEbenVlJ9m+lQFtBx5n+5a0esyFi
	y12xh3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2T9C-004cUH-Jt; Tue, 06 Dec 2022 08:17:50 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2T98-004cIW-Vf
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2022 08:17:48 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 43810126D;
	Tue,  6 Dec 2022 09:17:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1670314663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6s4cTi1vPx1lT99w7gcEu65YdC3MGfHB7p5R+XR4p4U=;
	b=ob1t0gLMJPazAqQkmbSP/tuTKYGDYWefM9gGUEn/GHS7a8PYoy2i43fb59b5fXrjAkEqKd
	rCvNnifxFIw1FBT+zdGarmWsYTyvmABtoDyMrHv/336fHzXMZjNx6Vb4XAAQavZ0hxH3WX
	6rON1ZlEQRBxKuqBXpjcSAuMIhNBUW/DNXU2/r0BnAmP3fZ1JKloN9Gy6ok5dRTche3660
	r6+1YyzWtz/Vym4bO8PpT+w+hl26qeGsxqLGG8mqmsccZY8y9rZfdUCuFK4Eja605QFk76
	8jEBIhuOoJNiwtZkPZFpd7NSTeVAPBrLaxZCqIK30FDjmymtUf9MY5whxEkGKQ==
MIME-Version: 1.0
Date: Tue, 06 Dec 2022 09:17:43 +0100
From: Michael Walle <michael@walle.cc>
To: Vlim <vlim@gigadevice.com>
Cc: Victor Lim <victorswlim@gmail.com>, tudor.ambarus@microchip.com,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 vikhyat.goyal@amd.com, amit.kumar-mahapatra@amd.com,
 alejandro.carmona@amd.com
Subject: Re: [PATCH] Linux: SPI: add Gigadevice part #
In-Reply-To: <TY0PR06MB5658B73E2F22472D0AF48BDBBB1B9@TY0PR06MB5658.apcprd06.prod.outlook.com>
References: <20221204080000.4100-1-vlim@gigadevice.com>
 <dee37d18f8de5af7d07388031fc08571@walle.cc>
 <TY0PR06MB5658B73E2F22472D0AF48BDBBB1B9@TY0PR06MB5658.apcprd06.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d147146428a078bd01ddbb5c1a9a65ce@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_001747_206373_3435B7CB 
X-CRM114-Status: UNSURE (   7.14  )
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

Hi,

Am 2022-12-06 02:27, schrieb Vlim:
>  I will redo the patch following this doc.
>  At the meantime, can you point out a few mistakes that I am making so
> that I can correct it in the next submit.

I really don't know what you want to achieve with this patch. It
has a bunch of renames. So what is the intention of the renames?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
