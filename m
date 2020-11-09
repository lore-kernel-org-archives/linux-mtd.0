Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14BFC388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5544E206C0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ur6B9Yl5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xmEhULjI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5544E206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+U3sS6H8bUecG4vRjwiNkWV128hPbbxApvqgzX5PHU=; b=Ur6B9Yl5jD23/0KG2ULjyfpVZ
	qqGeuYPkBWOX4gg+jk4ZwhAok7GH6psotwHn8v7fS138CsYL6vMI8nzVOPQGKJ1hbLp5LSFbASxvC
	dqN2EmdZG828IusgqxYnNHwDHmUv09gNkf1P1Y8ohvxQ86YpW3Zuichhk75bqN2HP/HJb7n4e1nNV
	76xy2dAO+XXkvWvgh+PXJ01D/Ydw9mamfu41LWpkkVaaVoLKngxc9yLGQkN06QqrUDtpHbFuLl9fn
	7HY7+SSeLFYlQUU5qFKWZnXCOncz3ynOML1fQHEclflUXUeViJDUcF77WioKAoZGg+ZOYM+oihks4
	BQUWByuTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBo9-0000pV-R7; Mon, 09 Nov 2020 18:22:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBo5-0000nq-3E
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id 10so399055wml.2
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8hCxezfBEukY2Vv+vLD9fRtFnmoWP6TcMu+uvwdTys=;
 b=xmEhULjIYrAV9iDsTFrweCaJ9IisRqKXO9hwggTCiFAh8EfLA0GHBczNXLqw1MknyQ
 yqutDnIFNVCKRPwh0lKABziBXpYPhBF7+VzRhlfa7XZiJKBbmv79d0MU/WsRTIAF2DWs
 uAYYyPShqo+WYwgSlnLWYfB73ehIHQaAg4ZVE+pUgNqdDLL6eUCBWx35dDGyyXSwbXA4
 FeIM/hDxNCDnRBfMhZmL3dC0u+yEexSUHpRJldelOMwGRlZXsICy9Zk03WCNvlT2uyVL
 +mwXMKUhDrLjWMAYwIcJBpWhasL6p7rMTWKD2Cu5EJCzQlpeBm4yELElnn4pdyAeNaU1
 F5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8hCxezfBEukY2Vv+vLD9fRtFnmoWP6TcMu+uvwdTys=;
 b=ElmzsNXEeqmbirXm3mGsnDgz29FRaOdwlGskAwSQDfWV9Ius88PflHHHtBjkR32yUY
 qlOIKwrVZLJmPTtCYh1aOQGE7YK/72FVlE4ERZsXNb4iKvuVPho9Dj+2d3atySkArJ0w
 ciOchDdkB2qEbwuMTFoeyLV8Sc6tKoCWpAL06Mp2UyfD+qC82GW6n9+/Zql8rKa1d6Gk
 g2Ze2ZBOpyxlAOtqXBZsLpcWNSdGn6YMx6EoyVlRp6loQ/8PCD22PaGyiRO/ttIwCpc1
 UcuJbeuuC0ZKdi1CP9w+XY6p2jrAaHGmTxQ/Z3C6Z+VLhHgJvPJZnLzYZVxpwdtN2upn
 zYow==
X-Gm-Message-State: AOAM532iehV9RiCt+JHB7KhJlqjEXcbP9tHJeT9JN9lKdU+UE1HQb743
 iM+X9kKdeU5gIdXRbVnBqYVQRA==
X-Google-Smtp-Source: ABdhPJxfXraeo0LywdAq7+mLOydhEj2ijEp9rCLKkhSDyvX/tw7ttuh+cBu8nPSRC3YIzPrSI5eW5Q==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr518089wmk.4.1604946140016;
 Mon, 09 Nov 2020 10:22:20 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 02/23] mtd: devices: phram: File headers are not good
 candidates for kernel-doc
Date: Mon,  9 Nov 2020 18:21:45 +0000
Message-Id: <20201109182206.3037326-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132221_163931_B16B95B3 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?q?Jochen=20Sch=C3=A4uble?= <psionic@psionic.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9tdGQvZGV2aWNlcy9waHJhbS5jOjE5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdmbXQnIG5vdCBkZXNjcmliZWQgaW4gJ3ByX2ZtdCcKCkNjOiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4KQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6
ICJKb2NoZW4gU2Now6R1YmxlIiA8cHNpb25pY0Bwc2lvbmljLmRlPgpDYzogbGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKaW5k
ZXggMDg3YjVlODZkMWJmYi4uOWU0ZDYwYmQ0MjdmYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
ZGV2aWNlcy9waHJhbS5jCisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwpAQCAtMSw1
ICsxLDUgQEAKIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKLS8qKgor
LyoKICAqIENvcHlyaWdodCAoYykgPz8/PwkJSm9jaGVuIFNjaMOkdWJsZSA8cHNpb25pY0Bwc2lv
bmljLmRlPgogICogQ29weXJpZ2h0IChjKSAyMDAzLTIwMDQJSm9lcm4gRW5nZWwgPGpvZXJuQHdo
LmZoLXdlZGVsLmRlPgogICoKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
