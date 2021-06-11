Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23B3C48BD1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 18:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAB961002
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 18:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAB961002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzi9o3De0F2DGm12uKQdaPpMjLpguIZQvAW2E3funmM=; b=IlGDMrzfNtFQzc
	xkSHkELL8kLAc0jU6HrkoajDXaiClAARYO61PpVkZXZbyGi4UkXd+gQShF+wx9YoArZ1V10VnhGdc
	64ZeVVDg74/1dP5pILrtMzDvpNTI517UpkoSRQVuQahc2uOKazmKK8MLkDniO37Q3GfN7uHk8KlWN
	oopHkFfHoPcXmE1syVoBL5R8GhI+nLl+8ce1KdPRCHeGAiW9h7KJySSi4Z53Xuo/KHQLCHJ5Tejez
	RCGJ974dzpLhtyRNuW8Q+g9Q1TJ4fOHEf31ofP+kfWb+8hoiUsIbvSvkcORkzUOAVkzKM/hTUSHos
	dKRMgcmCi2E6GFrA7UWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrm8f-006Ulm-Cb; Fri, 11 Jun 2021 18:44:17 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrm8c-006UlE-Dd
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 18:44:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EF4E01BF207;
 Fri, 11 Jun 2021 18:43:50 +0000 (UTC)
Date: Fri, 11 Jun 2021 20:43:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, linux-mtd@lists.infradead.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [GIT PULL 2/2] memory: pl353-smc for v5.14
Message-ID: <20210611204325.192ad206@xps13>
In-Reply-To: <20210611140659.61980-2-krzysztof.kozlowski@canonical.com>
References: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
 <20210611140659.61980-2-krzysztof.kozlowski@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_114414_613763_316366CD 
X-CRM114-Status: UNSURE (   6.34  )
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

SGkgS3J6eXN6dG9mLAoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBj
YW5vbmljYWwuY29tPiB3cm90ZSBvbiBGcmksCjExIEp1biAyMDIxIDE2OjA2OjU5ICswMjAwOgoK
PiBIaSwKPiAKPiBEZWRpY2F0ZWQgYnJhbmNoIGZvciBwbDM1My1zbWMgZHJpdmVyIGNoYW5nZXMu
CgpUaGFua3MgZm9yIHRoZSBicmFuY2gsIEknbGwgaW5jbHVkZSBpdCBhbmQgYWRkIHRoZSBsYXN0
IE5BTkQgcGF0Y2hlcyBvbgp0b3Agb2YgaXQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
