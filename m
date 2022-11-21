Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABC1C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 10:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4nK1Y6MXD4Yp4K2h8KzCMSHvie0uBlrSTBJ4cUE0PFc=; b=g4Yhd2oHtzZ+8z
	BZIamZ/b6UfhgANnrLI4/3GRsK+h/T2MTEqVkLyGp3kFGE8ekEOTyX2gLcTp9aY7OC3LiRckRgWzJ
	yP84/eKNm6xhxNxPFGnV8kHbj/pYRvuKx+NOyMkGvCDFvkyVRBzII3BVI3yclaBSLUplUZHo8n7GM
	y46K6TNTvAB2PBAkA4OlsKrr6bodJgsHIUrp/I2XA6/6936Cidlfoily86MFK9slg3px7qp2L7ZBD
	DQUUNLRsBeiB+N9OdUrDStWzsgCyECEzKQUC+EkCptFV68WRBkET3pwSOdiS9B0bQ+1dYExqXVSn9
	tee7TP2xxwNoTyu0yFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Ve-00Ckpb-7r; Mon, 21 Nov 2022 10:58:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4Vb-00CkoR-E2; Mon, 21 Nov 2022 10:58:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id n12so27527761eja.11;
        Mon, 21 Nov 2022 02:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuufDN8MAkZ+z/1NDCLZ9tHt7lifmvSE7ROToVJ/Z04=;
        b=ZLoPWLhoKYxmHi/+IEWgDRPnqyYviYWLV2Jv3fhHz4fokTK+GyWrKFeWB7iIwuoSTz
         Quf2F9gQ7o0rGRz0uKepfni+gYMcuVSWOXz8HuXsvBJcxzEc1Z49vHixl0t6xsU4sBYH
         FN/3u2GhJ+gEC8xhq7k6JBDttv/s3SbT5fNUgDAAUWjgaTdlsaHfQUvdxVzOvh0XY2NN
         II+b9Hrg8zgRJ1FxdZpxY9RRrhVxg0EWAda9OKconHCmHU2uk9rTF+9t2RVuBcc/SnG7
         HK4W+EjgDr0EDbn41X0qNZkiMuVir3Dhy2Q4v0rKlXZkIB7AKHsiiibfm6TTRYYGPO2K
         GdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuufDN8MAkZ+z/1NDCLZ9tHt7lifmvSE7ROToVJ/Z04=;
        b=lQkcYcrYZ6BnUM01brgK8fnaIKveVxqRRJsc3uaHMARkiSzvYx+UuxAD7KYPTMQuZ9
         d8pi8qUXfdvFYYlfpjES3G2caCVKUDag6FIo+ZZJ4JtkkPRECVH4ZUDcareXIRSFi69p
         AJYpG4mAqeX35R49kxAc8QWCaexKS17Kgbjoc5jAHW9AlFNZMmdMJNgotT43IC7LIa+5
         xmnJht0vHOSnycl3rl0n1+f76VOCKGk19NqYHsShtdP3s37vAfO1DrFmYWEmhOrA6HkA
         gtXDpG75uMs5dFU7V56G4eWLMxCgAcIA/rbx158k8TEg5Waht+bJ3snv/x4iiPkoDGLJ
         2Vpw==
X-Gm-Message-State: ANoB5pl8B7d5xKb2dkjJECxq8aQRCrLgyi9D0RmlnLtDOm/o3DNYtYcC
	34lZSBm1zRGRQ5eEzporSQo=
X-Google-Smtp-Source: AA0mqf54asC375YIqRZi1ostE5mdXb4wOP9ZiJG3ecr1g4Kt9CqeEvbwGhIPZ6W7NP+kX0CDNqsmpQ==
X-Received: by 2002:a17:906:901:b0:7ae:23c:3cb4 with SMTP id i1-20020a170906090100b007ae023c3cb4mr14566927ejd.599.1669028315126;
        Mon, 21 Nov 2022 02:58:35 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id mf20-20020a1709071a5400b0078a543e9301sm4869041ejc.200.2022.11.21.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:58:34 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Walle <michael@walle.cc>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH dt-schema.git] schemas: add NVMEM cell with #nvmem-cell-cells
Date: Mon, 21 Nov 2022 11:58:30 +0100
Message-Id: <20221121105830.7411-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_025839_494452_29E59D3C 
X-CRM114-Status: GOOD (  14.90  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU29tZSBOVk1FTSBjZWxs
cyBtYXkgcHJvdmlkZSBtb3JlIHRoYW4gMSB2YWx1ZS4gQW4gZXhhbXBsZSBjYW4gYmUgYmFzZQpN
QUMgYWRkcmVzcyB0aGF0IGlzIHVzZWQgZm9yIGNhbGN1bGF0aW5nIG11bHRpcGxlIE1BQ3MgKGZv
ciBmZXcKZGlmZmVyZW50IGRldmljZXMpLiBGb3Igc3BlY2lmeWluZyB2YWx1ZSB0byByZWFkIHBo
YW5kbGUgbmVlZHMgdG8gYmUKdXNlZCB3aXRoIGFuIGFyZ3VtZW50LgoKQ2M6IFNyaW5pdmFzIEth
bmRhZ2F0bGEiIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+CkNjOiBNaWNoYWVsIFdh
bGxlIDxtaWNoYWVsQHdhbGxlLmNjPgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Ci0tLQpUaGlzIGJpdCBpcyByZXF1aXJlZCBmb3IgbW92aW5nIGZvcndh
cmQgd2l0aCB0aGUKW1BBVENIIHYyIDAwLzIwXSBudm1lbTogY29yZTogaW50cm9kdWNlIE5WTUVN
IGxheW91dHMKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIyMDkw
MTIyMTg1Ny4yNjAwMzQwLTEtbWljaGFlbEB3YWxsZS5jYy8KCkFzIHBvaW50ZWQgb3V0IGJ5IFJv
YiAjbnZtZW0tY2VsbC1jZWxscyBzaG91bGQgYmUgYWRkZWQgdG8gdGhlIGR0LXNjaGVtYQphbmQg
bm90IGEgTGludXggYmluZGluZzoKUmU6IFtQQVRDSCB2MiAxNS8yMF0gZHQtYmluZGluZ3M6IG52
bWVtOiBhZGQgWUFNTCBzY2hlbWEgZm9yIHRoZSBzbDI4IHZwZCBsYXlvdXQKaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIyMDkxMjE5MjAzOC5HQTE2NjE1NTAtcm9i
aEBrZXJuZWwub3JnLwoKc2wyOCBpcyBvbmUgZXhhbXBsZSB0aGF0IG5lZWRzICNudm1lbS1jZWxs
LWNlbGxzCnUtYm9vdCxlbnYgaXMgYW5vdGhlciBvbmUKClBsZWFzZSBsZXQgbWUga25vdyBpZiBJ
IGdvdCB0aGlzIGJpbmRpbmcgcmlnaHQgYXQgYWxsLgotLS0KIGR0c2NoZW1hL3NjaGVtYXMvbnZt
ZW0vbnZtZW0tY2VsbC55YW1sIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHRzY2hlbWEvc2No
ZW1hcy9udm1lbS9udm1lbS1jZWxsLnlhbWwKCmRpZmYgLS1naXQgYS9kdHNjaGVtYS9zY2hlbWFz
L252bWVtL252bWVtLWNlbGwueWFtbCBiL2R0c2NoZW1hL3NjaGVtYXMvbnZtZW0vbnZtZW0tY2Vs
bC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmRmYTk5YjgKLS0tIC9k
ZXYvbnVsbAorKysgYi9kdHNjaGVtYS9zY2hlbWFzL252bWVtL252bWVtLWNlbGwueWFtbApAQCAt
MCwwICsxLDIzIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKKyRp
ZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252bWVtL252bWVtLWNlbGwueWFtbCMi
Ciskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9iYXNlLnlhbWwj
IgorCit0aXRsZTogTlZNRU0gQ2VsbCBDb21tb24gUHJvcGVydGllcworZGVzY3JpcHRpb246ICJT
Y2hlbWEgZm9yIE5WTUVNIGNlbGwgZGV2aWNldHJlZSBiaW5kaW5ncyIKK21haW50YWluZXJzOgor
ICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KKyAgLSBTcmluaXZhcyBLYW5k
YWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+CisKKyMgYWx3YXlzIHNlbGVj
dCB0aGUgY29yZSBzY2hlbWEKK3NlbGVjdDogdHJ1ZQorCitwcm9wZXJ0aWVzOgorICAiI252bWVt
LWNlbGwtY2VsbHMiOgorICAgICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy91aW50MzIiCisgICAgZGVzY3JpcHRpb246ID4KKyAgICAgIFNvbWUgTlZNRU0gY2VsbHMgbWF5
IGNvbnNpc3Qgb2YgcmF3IGRhdGEgdGhhdCByZXF1aXJlcyBzb21lIGV4dHJhCisgICAgICBwcm9j
ZXNzaW5nLiBUaGV5IG1heSBwcm92aWRlIG1vcmUgdGhhbiAxIHZhbHVlLgorCisgICAgICBQYXNz
aW5nIGV4dHJhIGFyZ3VtZW50KHMpIGFsbG93cyBzZWxlY3RpbmcgZGF0YSB0byBhY2Nlc3MuCisK
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
