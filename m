Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D398DC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 10:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E74261205
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 10:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E74261205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+EFZJqqc1vWbxTlK5iEAsXLTFlEOFrteyHbiQsUuGU=; b=vmx92Z30fh2dNP
	0lfQeotUQ8IkdIsrS/ODPu7izWQ0rg70BI6EIYWs+OMXhFJtNzjl1giXMlADla3xxVzFG8dxYrSkS
	G9gtzTlQQoAhX+kkHVBifQL6rFVS2jiPDUdUxhBGr1SsE/k9NqupHeX4KnDPf3xXSbRxWnopoVK3q
	Qm20RnlTRxNrbxKDPqh2CHO8/AnNP0qHn10DDQCqtIaPeqHND2MpIVAkvX8NRuqJIQLY8FJEZV1U/
	UtqeMMnyVk3ueumrwwPFkfQUEiWvVtvDGGCMTq8Pzfb5UiUb4SDKF2l3bbviTUZOmxUrU/vMi+0/t
	yMubwSI+AtiZaqyXZBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdVkr-007IfG-F4; Thu, 21 Oct 2021 10:57:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdVko-007Iej-8t
 for linux-mtd@lists.infradead.org; Thu, 21 Oct 2021 10:56:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id g141so214848wmg.4
 for <linux-mtd@lists.infradead.org>; Thu, 21 Oct 2021 03:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=39afoYGUkYPdTo99bikNZ1ltN9VTjEDU2ENwyEnc/5Y=;
 b=ULyLaKQTcMO3bWLg15IZyPvQwZijHgvO4Rj+TL3TnNp+8VtdilSuXC1D3L9TM0QvMq
 nnDGxvgMKiZWvpXi9zuV8HZ1erpPoaR8vyNaI62WjIQkX4soEQMrAslzjxr6T9+XVX1a
 a4BBJNMNGK6JaxNAaVx7rwRig/G2qN6kg9bZoBYFA+YVF1gNBx9nQvtSEY6BF26b/7HQ
 IflbR3UaO8SmOT3Lc9WNeiHUwGejgTQrtOMuLX82mqBL2vyLb3brPQtNRtkmX2X2OzOI
 CTo5v1XPQiwouOSmVFhV3mE74Uv0pfcafJXWVAZZ+BP0q7zOAk3wjKH+cF4EGlgxKNtz
 m5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=39afoYGUkYPdTo99bikNZ1ltN9VTjEDU2ENwyEnc/5Y=;
 b=1z4scRcFtbxJy1C0FggsFLJAlHpYzqZNiYqYLuvVghu9gAbRnLbh0W50pYR9Cm4VYo
 oPr5Zo2/LpxLTgIPZ02uKkAhtdU2igfErv6oL4OHdRhXwrUF1lD1f3wJqOdfEqtZ84e0
 /nUU0lZkZob9jNJ1aM75bkRQaFraSD1Bmm0iVAucuOFBNDqYaP1AQVU3+xsd+ykTFSUu
 e1Wb9IhCNfsGoWb6vp8AI5E0v4DQU0fv8TzUI2bpCK7VjCSpBFmhLL3iRm0z27r27lZn
 sMjCT4GBPag+5NNffAP6MZwEBgM8l4psjlfj4JIY767PSvznrz9g0hwp+puX0Xai7aQG
 BfvA==
X-Gm-Message-State: AOAM5338VTpyxPoiFkzEDZtQgkKGkFp7Ou8vOAtel8CV1g7Tv1ZOI/nO
 62Cik9h8iyKEbazWq/+oyIvtYQ==
X-Google-Smtp-Source: ABdhPJzwYAtbGrx2TS7FcUijvbw0vcgFSZMTwkU2IG6ZYWcxgIPJyHBFL+RaxBRuqeFFKDFw6s628Q==
X-Received: by 2002:a05:600c:1d1f:: with SMTP id
 l31mr20128477wms.44.1634813816174; 
 Thu, 21 Oct 2021 03:56:56 -0700 (PDT)
Received: from google.com ([95.148.6.207])
 by smtp.gmail.com with ESMTPSA id o6sm7708225wms.3.2021.10.21.03.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:56:55 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:56:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: intel-spi: Disable write protection
 only if asked
Message-ID: <YXFHdXE91+PjSDv2@google.com>
References: <20211007112132.30934-1-mika.westerberg@linux.intel.com>
 <20211007112132.30934-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007112132.30934-2-mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_035658_342826_4FF41DFC 
X-CRM114-Status: GOOD (  13.73  )
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

T24gVGh1LCAwNyBPY3QgMjAyMSwgTWlrYSBXZXN0ZXJiZXJnIHdyb3RlOgoKPiBDdXJyZW50bHkg
dGhlIGRyaXZlciB0cmllcyB0byBkaXNhYmxlIHRoZSBCSU9TIHdyaXRlIHByb3RlY3Rpb24KPiBh
dXRvbWF0aWNhbGx5IGV2ZW4gaWYgdGhpcyBpcyBub3Qgd2hhdCB0aGUgdXNlciB3YW50cy4gRm9y
IHRoaXMgcmVhc29uCj4gbW9kaWZ5IHRoZSBkcml2ZXIgc28gdGhhdCBieSBkZWZhdWx0IGl0IGRv
ZXMgbm90IHRvdWNoIHRoZSB3cml0ZQo+IHByb3RlY3Rpb24uIE9ubHkgaWYgc3BlY2lmaWNhbGx5
IGFza2VkIGJ5IHRoZSB1c2VyIChzZXR0aW5nIHdyaXRlYWJsZT0xCj4gY29tbWFuZCBsaW5lIHBh
cmFtZXRlcikgdGhlIGRyaXZlciB0cmllcyB0byBkaXNhYmxlIHRoZSBCSU9TIHdyaXRlCj4gcHJv
dGVjdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVy
YmVyZ0BsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL2xwY19pY2guYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrLS0KPiAgLi4uL210ZC9z
cGktbm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS1wY2kuYyAgIHwgMjkgKysrKystLS0tCj4gIGRy
aXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaW50ZWwtc3BpLmMgICB8IDQxICsrKysrKy0t
LS0tLS0KPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3g4Ni9pbnRlbC1zcGkuaCAgIHwg
IDYgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMo
LSkKCkZvciB0aGUgTUZEIHBhcnRzOgoKIEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgoKV2hvZXZlciBlbmRzIHVwIHRha2luZyB0aGlzIG5lZWRzIHRvIHNlbmQgb3V0
IGEgcHVsbC1yZXF1ZXN0IHRvIGFuCmltbXV0YWJsZSBicmFuY2ggcGxlYXNlLgoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2Vydmlj
ZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxv
dyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
