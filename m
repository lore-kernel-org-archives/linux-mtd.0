Return-Path: <SRS0=FkjY=TK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4D2C04A6B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 13:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C43D216C4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 13:44:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bqEOXhLm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hcwBXIZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C43D216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAyfP0Xvqdholx6KKNt/lE4w9Knk0iSeKkfGO9o3aYA=; b=bqEOXhLmT1FKpT
	AFcHTdtzlv2Du/3UQVoyywnOCmkq40q7dtlS7nctbP1LptPVK8RHuhS8g/LcDCNTKlLJK3fH/f1DS
	vNmEppe0XE3oJQ88gMZtmlYxQ91kkttWqb6VxbFSao1ld8W40emcWfYk0Y6KU/7bkz3ctso6FI6nq
	ECfzXXDiTDCp9JTuruil8q8E19yD+h8/n6V9TkEOaDS+9hJCxkx8E3tsaT/r8YJIRPQ96z25+RTCn
	YMZ0Xc61eKpXTJN1v9ROhEvQcBGLCoxr3HHDP1lmKV8v4MbIskp+aYZUXUbfqyWKwaXXzef6O5Y9F
	7jUk9YRfVpdVl6ltZkUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP5oo-0001P2-O1; Fri, 10 May 2019 13:44:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP5om-0001ME-Tm
 for linux-mtd@bombadil.infradead.org; Fri, 10 May 2019 13:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrS8aGnRYh0Lk1LUQNEEz6RGRhOEPYka1fJNsNIAs8s=; b=hcwBXIZBcBywSjpt2+sGOUA8qQ
 BKnPlmus7zZIeHUZViAZivkoqZn8/EyTzIxZ9ZzhhaCX+kZJqrormIL1FbSWdACgCiIYLgwa6fD7z
 EgfwSSyi3mahlmowv2MsU+nAKblMHFlr9UnJPhwmABWUF0x2Y1+QryNyGoS1mSJw/M+y94xjSooXy
 AyObWtuU+aarPvEVnL1++QPrTRyD7Rrm/n7Pi98aRJJCxkggglgnrPYPriZA4B56aXxnluBlBJqc4
 2iRefHrF6Vwdw8L0jG2Wrx/PgyWuaQMztkV6QRzQ/sAjmZLX3+urYbKT00WMi0s+gZ+MvJSV6HaUC
 JPPRpF5Q==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP5ie-0002yn-2O
 for linux-mtd@lists.infradead.org; Fri, 10 May 2019 13:37:50 +0000
X-Originating-IP: 90.88.28.253
Received: from windsurf.home
 (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr [90.88.28.253])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 939B11C001A;
 Fri, 10 May 2019 13:37:05 +0000 (UTC)
Date: Fri, 10 May 2019 15:37:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190510153704.33de9568@windsurf.home>
In-Reply-To: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_143748_143058_AF17C148 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

Some purely cosmetic suggestions below.

On Fri, 10 May 2019 15:41:02 +0800
Mason Yang <masonccyang@mxic.com.tw> wrote:

> +	if (ret)
> +		pr_err("set feature failed to read retry moded:%d\n", mode);  

I don't know what is the policy in the MTD/NAND subsystem, but
shouldn't you be using dev_err() instead of pr_err() here to have a
nice prefix for the message ?

		dev_err(&nand_to_mtd(chip)->dev, "set feature ..", mode);

> +static void macronix_nand_onfi_init(struct nand_chip *chip)
> +{
> +	struct nand_parameters *p = &chip->parameters;
> +
> +	if (p->onfi) {

Change to:

	if (!p->onfi)
		return;

This way the rest of the function can save one level of indentation.

> +		struct nand_onfi_vendor_macronix *mxic =
> +				(void *)p->onfi->vendor;
> +
> +		if (mxic->reliability_func & MACRONIX_READ_RETRY_BIT) {

Change to:

	if (mxic->reliability_func & MACRONIX_READ_RETRY_BIT == 0)
		return;

And the rest of the function can save one level of indentation.

> +			chip->read_retries = MACRONIX_READ_RETRY_MODE + 1;
> +			chip->setup_read_retry =
> +				 macronix_nand_setup_read_retry;
> +			if (p->supports_set_get_features) {
> +				set_bit(ONFI_FEATURE_ADDR_READ_RETRY,
> +					p->set_feature_list);
> +				set_bit(ONFI_FEATURE_ADDR_READ_RETRY,
> +					p->get_feature_list);
> +			}

Which will require less wrapping in those lines that are already at the
third indentation level.

To me, it is also more logical: we exclude the cases we are not
interested in and return early, and then if we are still in the case we
are interested, we handle it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
