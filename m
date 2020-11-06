Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F9EC55178
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B062087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aIXbjtTP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zN3HMYCq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B062087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+U3sS6H8bUecG4vRjwiNkWV128hPbbxApvqgzX5PHU=; b=aIXbjtTP1qSQ8EU4CF/tBS5OM
	WMfdRPCaw0oAtMOalWFBx1iqnGbQw7zhi18owKODNAHfSbuLXJMEYdQhtJ2qTRTCSokxGeJBmBNzm
	EAJV9JPxkmRUYowB5OQEfgX0nyVi+D/aP2Fnmbq3gPOjy9qiW8Uh5EyB/+p5RGMGq5v0KfRPuvEu3
	sm49GFAi3Zg9Z02M9jKqImCuUb9+ZEzPrH4ftYSXeFETXVokmbnwu25s48NPWl7cWmtq6v4bp2lYc
	MpdlyfHZ7M3lZC6/s9EeSJ1oZIPgJ6tw5hV60CPgNjhl2ad6JFwXRWj55tIfXE2VjNX5ErbGq9KMK
	1CWyeXn5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Q1-0002aY-6U; Fri, 06 Nov 2020 21:37:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Pr-0002WF-G8
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id y12so2770920wrp.6
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8hCxezfBEukY2Vv+vLD9fRtFnmoWP6TcMu+uvwdTys=;
 b=zN3HMYCqikaYDuFdN2FyT7u1VRBPEI1jhuTxeWKaEIUEJEKqczXhiXmdNxeF6BmXsf
 xW9j8LJ7SzpuZcqhnLLyfNyoIW3rdRprihAgL0oTBi0RnS2fkAFBNYUSTGrj88V70rLT
 0MV45KU6Qa96eMsyRzSVrCgdDVY6iHGNGWgKOWMcPME6nSjytk/o1eP6y+ligHh3cIiA
 ryg/AXa0ihDFKoEXvUeOkxw2wGY0RyCYut+/y33995zEnQ6MiLrd1IPWtY99+no3nP08
 F4Y34O0g62eVXcCb4JnpX+dBzbAfsNVK2uSnuRCjxVglxPBkgPW1LFnuS9LMkG4JwOId
 f5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8hCxezfBEukY2Vv+vLD9fRtFnmoWP6TcMu+uvwdTys=;
 b=GGsYqtwrfBZqy8Fu73chGqJ/FdEr7nLpgN8FiN9a8/XjzTam4js9/85H7Fqud0E1Gy
 44/5y7X9N7OmSYtuDBnnNp0eWGZbalPLfk5ndvg71n/sAq5NtY8FsaAkHW+h55YjTPOT
 YuGQpAHWk7RE5XmaDNf57pI3qMcM1+QEM4A7y3lCssM77FRdw8sp+wtJAbXf+LN1NewN
 93X51By/ahtcdwW3WhuodHZWnrbowvy6zj5h6rlwypYSovscwxpy49Vwy4vNWOn2UG7J
 KdaFAtaqyw9/iE0Oh2/wpOkQYBWFkOVQs7r42MCPz2MaJ+Nj6s9fVr4YC3aggIK90KBL
 h5/A==
X-Gm-Message-State: AOAM5325YwwS+FLeLoge9bas2/3Q8ZXhaXE+Zfd27F6GdtslSYGJxK1Z
 Li7J+lnfwaIwkb4rqAk+TXQLJg==
X-Google-Smtp-Source: ABdhPJwnOfmE+grSUy3IUuxC8O/dxfml4JKVdl13CBjGOKdbiK0k4DZK2tnynZ8Gmo76dXrd+t6Thw==
X-Received: by 2002:adf:ce12:: with SMTP id p18mr4707669wrn.52.1604698622355; 
 Fri, 06 Nov 2020 13:37:02 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 02/23] mtd: devices: phram: File headers are not good
 candidates for kernel-doc
Date: Fri,  6 Nov 2020 21:36:34 +0000
Message-Id: <20201106213655.1838861-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163703_561729_B9790B42 
X-CRM114-Status: GOOD (  14.25  )
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
