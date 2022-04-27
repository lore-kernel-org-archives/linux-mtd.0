Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABABC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrTf9aexlISuUomONig7D9dPunr3LawhhZU7ga8rQUQ=; b=ZSeud35PlAro+a
	MY2nUtDC77+xBYfXEDbsg7LXnlsHfYrVPJ7SJgyekBqS+5A6dNxXehwv7Uot8vww6pH3XINtGAEQH
	nCVQwdkU0HfukR0ATTNKaFN4/aSQP4vKCM31FwcBgKByMj3FV5m/DIrmI1Rsw1TMO7HTUpdQO+CHc
	SYiNFNRP7BfYrQF0O0Xr34ATiKWlMOFy+wKTeAKgI8ura0nZ4xRKBhlWGbrZ3gX/sWSOTLoSD4/EJ
	uhLmZVkvgVL5pcEWOmLqoBiEHU8AbOkPctEVaOdf0d4Zsy6boSY2GoWLqA01m3ToWRmHIsyhfS4MQ
	i6+89wIPhx3eggXNwazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nje1D-000kqP-3b; Wed, 27 Apr 2022 09:31:31 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nje1A-000kpE-Hp
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 09:31:30 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23R9VNJp101899;
 Wed, 27 Apr 2022 04:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651051883;
 bh=WnkMojl+5yTgWYJKpIINGd1qbrRLPAPKKGmGJon3tAE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=J7PxTdJIHETzM3q9K8isnAOHS5u/2SjgbY5cA7/OJuWzStACI5TeR8UHz1ZhVxfRh
 +9DFWpiC8WJUgxQWfHt5VZ7SCUUWfDte6qoo+7ZxJzdPb2W/WZtm2TiJfT/zi9OoJy
 Ji+kWXun+boNLARw4/7aE4Kx3v1mArBBD5mZRvhU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23R9VN8q025146
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 Apr 2022 04:31:23 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 04:31:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 04:31:23 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23R9VKtQ033801;
 Wed, 27 Apr 2022 04:31:21 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Chen-Tsung Hsieh <chentsung@chromium.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
Date: Wed, 27 Apr 2022 15:01:18 +0530
Message-ID: <165105175022.2301505.17772932971669614523.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126073227.3401275-1-chentsung@chromium.org>
References: <20220126073227.3401275-1-chentsung@chromium.org>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_023128_669346_C8DEFFED 
X-CRM114-Status: UNSURE (   8.38  )
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

On Wed, 26 Jan 2022 15:32:26 +0800, Chen-Tsung Hsieh wrote:
> Read back Status Register 1 to ensure that the written byte match the
> received value and return -EIO if read back test failed.
> 
> Without this patch, spi_nor_write_16bit_sr_and_check() only check the
> second half of the 16bit. It causes errors like spi_nor_sr_unlock()
> return success incorrectly when spi_nor_write_16bit_sr_and_check()
> doesn't write SR successfully.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: core: Check written SR value in spi_nor_write_16bit_sr_and_check()
      https://git.kernel.org/mtd/c/70dd83d737

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
