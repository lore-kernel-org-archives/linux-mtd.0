Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D299C61D9B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Nov 2023 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy8Nbyo7DXyWW5RFPfhBsoisKEIk+6BtiR3hhkwGoxM=; b=0THH6a0diBpdZJ
	JFoEU/aWPqmNiwVyeeyI/R0aGtbSB+1psMkXqYPwuMUb2NJnuTlfGBwlYBisbYRqf/b5ktuBiSEh0
	2ZkWOI3zi3eY+Iyjf4Us/7kVkPrYvrElXyym2dpZfEFXjdzqKppghYQX1CvjiagBLKp7/QHO/qJx0
	EpXNVZAMLovZsiIGSm3xcPJldt+6y18lKCuguy+3U8yk2tNENzhQUOAqtm0H79B6DyD47/+ai0w/B
	06y9kWt8o3YVmCndKlqHHaxoNrzvWBeAyWXznS5t8NostUm4U4yQRsrbVVFzzjo8/wsqNweOcGuDD
	m/6HonNwnYKmJIjJN3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mxl-001uDP-1h;
	Wed, 22 Nov 2023 13:08:17 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mxj-001uCn-0M
	for linux-mtd@lists.infradead.org;
	Wed, 22 Nov 2023 13:08:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 740B4240006;
	Wed, 22 Nov 2023 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700658489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFvIffjeh7UJPy7HOhTCrJstZpn+ngVTAePPWXClIk8=;
	b=b22uI0fU6uVROmNHIJUVxCRkvwkKJ8Nwog9Pd9sSD6nGP3631K6YDNIpgosh03ReDOswsm
	ptKkyqsPt/9HaJZnxxB8ZyN1LiWs86OCrhWaXWkmeFBlaizKDLsIsyVNhW9mJSapFRSFAb
	b68clEpLdXqxBA6vRcUj8FpE8RwWhvZQ7I3aVOlFe2Bnc47aIy9FMQWynO7HjYBZCIGdUD
	ezUf0lrgiLbiCGd6rFG/bVzhfXQxF2XGqtU90CDa2Neke2yIU0ABtPF8S18qj+3f6BYTbQ
	r4fBqNLBnPeKbD7+HRDADqjNfqlKkfgBSl/v2JEiVkzzIqW0q986lTGzCoI58A==
Date: Wed, 22 Nov 2023 14:08:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Jean
 Delvare <jdelvare@suse.de>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Alexander
 Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v5 19/39] mtd: rawnand: add support for ts72xx
Message-ID: <20231122140803.239a3c17@xps-13>
In-Reply-To: <ZV3y-IJ7JSD3fJeI@smile.fi.intel.com>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
	<20231122-ep93xx-v5-19-d59a76d5df29@maquefel.me>
	<ZV3y-IJ7JSD3fJeI@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_050815_417344_7D7E521D 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5keSwKCj4gPiArCWludCByZXQ7Cj4gPiArCj4gPiArCXJldCA9IG10ZF9kZXZpY2VfdW5y
ZWdpc3RlcihuYW5kX3RvX210ZChjaGlwKSk7Cj4gPiArCVdBUk5fT04ocmV0KTsgIAo+IAo+IElz
IHRoaXMgYSByZXF1aXJlbWVudCBieSBNVEQgdG8gaGF2ZSByZXR1cm4gdmFsdWUgYmVpbmcgY2hl
Y2tlZD8KClllcywgZm9yIG5vdyB0aGlzIGlzIHRoZSBwcmVmZXJyZWQgd2F5LCB3aXRoIHRoZSBo
b3BlIHNvbWUgZGF5IHRvIHR1cm4KdGhlIHJldHVybiB2YWx1ZSBpbnRvIHZvaWQuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
