Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486E0C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:22:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 176F92084F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 13:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XSQj69kH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y6Ymagic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 176F92084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgiGJHKdlXdfXfH5DGEj3q3aGhZ5TK4Uw/YjYZggYTc=; b=XSQj69kHgu5a15
	cpvck7y9KVtOjVfNT0fZ/aOAtklKuYQYGV4AHM9kDkzGUhpYfaywFenq+x6YX2KGpofG+VR2j6D0N
	abtZaF96Z4y99VijrB43i8cSqd5phldPkNtUh7QQufSPvv3sQMfAZkgJ62x4chwOoeMKwmArURTRL
	YY1x+aSzJC+RK4GVDEUG+omAEyJFXt5G7zUE0y+N/s8jib4p7xfb5nAJQvz6Dg5aOMz/eihxeFXlJ
	JsxT9WyD6cbmpyrxOa7vaXleYgPBQTfhwIdJgWzmAKEt8DJDOPLqFeQWsLIz/sua4rvwyG9itOvPm
	rHgQNkvlMVYwuAPWRx0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwoIp-0002Pk-Vz; Thu, 21 Feb 2019 13:22:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwoIh-0002I8-HX; Thu, 21 Feb 2019 13:22:09 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02ADF2084D;
 Thu, 21 Feb 2019 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550755327;
 bh=S48oQwiBxU8MWekSwFC8xQpJ1OQ1a+mkyrpNS2MBGhY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=y6YmagicjZxb0hsjVIBAsRwCrN097NXPJ2B+24KWJnSbAWphFqcnHh41EHxMmJBXY
 cTC0iu2WaMYeWru3qHJFKDin0aHfBBEUiS9L4LQH/AfoeilZ2oqu4xJ0kyxOSJdgty
 J055nuVGqv1JbG76+m64dOTXcU6uYL+ZFC4kRrjU=
Date: Thu, 21 Feb 2019 14:22:00 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RFC PATCH 14/27] mtd: nand: ecc: Turn the software Hamming
 implementation generic
Message-ID: <20190221142200.01877314@kernel.org>
In-Reply-To: <20190221125806.28875-2-miquel.raynal@bootlin.com>
References: <20190221125806.28875-1-miquel.raynal@bootlin.com>
 <20190221125806.28875-2-miquel.raynal@bootlin.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_052207_591950_4DF1EA4D 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 13:57:53 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:


> -/*
> - * Detect and correct a 1 bit error for 256/512 byte block
> - */
> -int nand_correct_data(struct nand_chip *chip, u_char *dat, u_char *read_ecc,
> -		      u_char *calc_ecc);
> +int __ecc_sw_hamming_calculate(const unsigned char *buf,

Let's stop with these __ prefixes. Just prefix functions taking a
nand_device object with nand_ and leave others with the ecc_ prefix.

> +			       unsigned int step_size,
> +			       unsigned char *code, bool sm_order);
> +int ecc_sw_hamming_calculate(struct nand_device *nand,
> +			     const unsigned char *buf,
> +			     unsigned char *code);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
