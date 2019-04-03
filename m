Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85F9C4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 10:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8921E2084C
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 10:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E3mrRqqY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rC07FCy8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8921E2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QQb0hlMyN7Z4fHFso4L148jQ78EDpFqKp4Q/AiLXsE=; b=E3mrRqqYEgPYMv
	Tfmj3oaGQfIJMtJzHLexhOVZ31e2x7DvIOB3mHRgumsAX1KpSWXpMZg+QSp31xfz1cP1kI7LWNlNO
	r2WWNa/WFv50qg7mE20USO59VoHCTFbtNsYRfia3iQ7ohhQLRTD20MgpRbawUXLCp/gZtN700G2yG
	3X4qXONisJSCiLqJyL/tQRWebCIw2fm+mpx6mdmyOdSmjCsrTs7ysQfAtRiwpuNk30zSHJ9UBJL5p
	2rLuKE1+AZe6ztmpk2WUUPY2wmzbzQV55tN3yXuvzVpSNR9N67dQVeoLyzNhAFmFvROQ7CsjKnR2X
	2JFZ5DLzWNVsGe+PyAaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBcpX-0001dO-Ln; Wed, 03 Apr 2019 10:09:15 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBcpO-0001Uc-Tg
 for linux-mtd@lists.infradead.org; Wed, 03 Apr 2019 10:09:08 +0000
Received: by mail-pg1-x544.google.com with SMTP id i2so8064929pgj.11
 for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2019 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Pt08u+qgVaJIOskSRhQGw1Bt62Ds9fDTXx3KQLjZb3Y=;
 b=rC07FCy8J032unPAnpDT9Q+GdIy1UpOk8rfav0n0rjfMsqWfU/M7oDdyAFTfWRXRxH
 eHXCqcJWWNZDZfpiI6rNJPlrjlnSAOvwv9a9fDVRoIga8yWjsiKNzlcEToZWmGTy/mnT
 nghqntYVvfJD81pOFsW3aPgUhXxF2/Dm5/wg0IfUzv+tPypA6Uz0b8JXlVoEmNyx2UPl
 XgvthJsNKrLjRQW0BM20VWo9ZxAWLm3hA/S7kVaCi1o0BZ04vI34c1jJlVXKp2TQQSrf
 fWjgSqDe2Yc7WbpS2RM5ODPU6quIkgq/WMquc0T7qRj8w9AlW5OqQvEax5XW+Hq38CIz
 ac9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Pt08u+qgVaJIOskSRhQGw1Bt62Ds9fDTXx3KQLjZb3Y=;
 b=jyF5+SVxACEEgaInxSzJun0o4RxHG3BiGUuGawJCoIvl8CWJb7Ec8fI05iG3kf+NAF
 VvvZPV6R6ccrmcxfv8mdhdP7brB7s21lFfhKhMj+WzSGDATnDTm1ye+W8G3FWSjrAEcj
 2Q8QdrzcXXv9oZkY6EeeT8Hv7DuCF5iBoKNdSyBtYPw+fVa9cLVODQ9wNceaFS1cofpB
 1udVgTmeQf781gD9kd7NoCBTADbfuNVt90Pc2/+adyYfznugZx4mcEGYT21htlI+OxVy
 +7gJnl0it/OmuDCJ9G1JMNAJkQD75TddKe2Hkcz3qPwT7fjOc2NJh1G/K/ipzVzN7vP8
 4Rqw==
X-Gm-Message-State: APjAAAWslAYQuFFFm9rNuLehzGiwaBbn1Iz6A11j6TqG2Gjo/wGGobCx
 I1KhhQlDOjG3WsSbTv4BZvwOcg==
X-Google-Smtp-Source: APXvYqx/e2wy8045fbET+eDWS0nuppPJ8sZahZ0XctSUbEPMdxDHfeUMs/B0SQ5Eu1pPC6panCQeiA==
X-Received: by 2002:a63:6142:: with SMTP id v63mr71898331pgb.342.1554286146122; 
 Wed, 03 Apr 2019 03:09:06 -0700 (PDT)
Received: from dell ([147.50.13.10])
 by smtp.gmail.com with ESMTPSA id k131sm30077509pfc.183.2019.04.03.03.09.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Apr 2019 03:09:05 -0700 (PDT)
Date: Wed, 3 Apr 2019 11:08:58 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH 09/11] mfd: syscon: atmel: switch to SPDX license
 identifiers
Message-ID: <20190403100858.GM11301@dell>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
 <20190213085930.31578-10-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213085930.31578-10-tudor.ambarus@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_030907_040325_2C4B8EDF 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, Ludovic.Desroches@microchip.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMyBGZWIgMjAxOSwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgoK
PiBGcm9tOiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4gCj4g
QWRvcHQgdGhlIFNQRFggbGljZW5zZSBpZGVudGlmaWVycyB0byBlYXNlIGxpY2Vuc2UgY29tcGxp
YW5jZQo+IG1hbmFnZW1lbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVk
b3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zeXNj
b24vYXRtZWwtbWF0cml4LmggfCA2ICstLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zeXNjb24v
YXRtZWwtbWMuaCAgICAgfCA2ICstLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vYXRt
ZWwtc21jLmggICAgfCA1ICstLS0tCj4gIGluY2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9hdG1lbC1z
dC5oICAgICB8IDYgKy0tLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAx
OSBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
