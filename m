Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3770E94114
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJI/52CH/+OZqidK1J0tiqwZ+bhWtdei5gi0l0xm/hM=; b=Cu1RNTYEK5WV04
	4OI0m58VvUAcnfpi5YzJgcdd9T95iodBSpfJj7WWJn/oTfZds9UdM1JwGly76SkBWT+v7UsipIrNv
	CtrfO081+w0MspOHQ4GVuEJO+u33SLodzItcYL0K3iMZq27OtgnNcVohdmCIdt/LZmy/0hNaeupU3
	fE8+TObzJNxhcm/uQU/xSFhYFBES2HG8XRK1nIJWD3X4VxJl5+vGzC5sWT/10Y0xYhq/7O8DGAD2Z
	peW4A6BP27yzEVIPai99HBeIPJHbsu2pWY/U6pOEbq8Eua1vNL1+hdwbgJ3G3x9oN0eSo1NU9tCTc
	KLJ/hp3d6umzKjdpP73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qorGR-006RIn-2r;
	Fri, 06 Oct 2023 20:17:35 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qorGP-006RHY-2E
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 20:17:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-584bfb14c59so1744891a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2023 13:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623451; x=1697228251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44cFvtKqMAZFN6/2W4HaH3hNmYSsLMnAgOIOpwVomfM=;
        b=BPOqYWmkcymDmJDHY2z5blxSP/Ql4X5eMnAQSLwu9+DcLe9xN8xaI+DmzQp5Ym3HIM
         yRqi9ecAflL5T7d0APnOlFQqWPXOmj6K7hPpKmz5M7mCPKMHvkHY4914RS7wae0Iz0tf
         W3UbuavF1yiFnJ2IzTVCqR/v6U/ZQP+mKtcUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623451; x=1697228251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44cFvtKqMAZFN6/2W4HaH3hNmYSsLMnAgOIOpwVomfM=;
        b=t7tL16UL3a9ADSRIxqx4TXE0ZFwpOlQyn4q4qWajJhDqIJpRGk4nH6wV0nQXR63Uk5
         pyiVLs2hjDjhLXquUqNgcSW8D7iKrRHOI+AXNA7F2CmVAfhzDxaxlsSMaHDL8syQ12hE
         uQOTNmZcSV3sx5pmjvCzL/fgIYmkbfYX4fazW/Z0gQ5JRtXnS9w31OGdceFPIImiFoL9
         yQUTr7x2MOXHLi668sjRb5KzBXDFaeE1x/VJbeboEdoxWnCsV7wl1nWD7qXtna0Mr/cN
         yxZkk35riio+jIcoBHIUc8DJfgL8AMtshCE+W+vx1OaINWSgrZIWPApQ8JMqVmLFEi9y
         Ky+g==
X-Gm-Message-State: AOJu0Yx1Zj2RweO+E7HYLwMrDq4N9m9kYy6HWoNksaN/6TXjZ1Yqsmji
	E/yuvDPIUBOjoym/nMjuTyvg0w==
X-Google-Smtp-Source: AGHT+IE8lO1ha8XBa5ezgrgQtzWsAVLftgkmKffd4oVNSVoxQYbXsRdlq6o27BW5+g4zJ9hXC4kqeA==
X-Received: by 2002:a17:90a:e98c:b0:268:414c:ff3 with SMTP id v12-20020a17090ae98c00b00268414c0ff3mr9383030pjy.23.1696623450927;
        Fri, 06 Oct 2023 13:17:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id rm10-20020a17090b3eca00b0026d214a2b33sm5865157pjb.7.2023.10.06.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:17:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <treding@nvidia.com>,
	Roger Quadros <rogerq@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Chuanhong Guo <gch981213@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mtd: rawnand: Annotate struct mtk_nfc_nand_chip with __counted_by
Date: Fri,  6 Oct 2023 13:17:28 -0700
Message-Id: <20231006201728.work.750-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=keescook@chromium.org;
 h=from:subject:message-id; bh=wj52WE7CwlsQ2BB8Uem6TW+tv4z8geFWBQTRgq+pZr0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlIGtYrtnPKsIg2iO4Dd3ybiJdrRew0N9KKrFWo
 eR191/wOjuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZSBrWAAKCRCJcvTf3G3A
 JjxZEACEq9RQuj5y0ShuaIfEUoej7S27zHMK5VDww5pUKfNkAzMupLwYOh2Yk6q7ltkpvX6IuWW
 ROopZqHz/SA0ETIcIKxfWi6DKM+3eaNFCK84JR573dTGlnCvAQEuzLRPoHp7gYUAc1voMXNV4Eb
 onEUUeNpgaVY1gO+a5QuSTDx1ZFLJpzhHf9AyuEJ1j4o4W7ftzF5ZOrXwh3m2AEcdNudTDX8sdt
 TZ2xWMWVUU96nOJ351JSEB2DYIQc9B6G2zPFUxsa5FcaCAn76Tll91uRAEcrn8ZIJUwEGFlZccG
 XWqPoVBzHp4HNxPVdE800NRDNHXVtIZ/7j43uOZPXxRzgdoIcKqScm6sbIAbXp0R1EmfwoYAwfW
 Nu4VRs3Ar1aLm0xV82hvR3gW6mSSiRLFzRxzj/fl415Q98XkwErnfKjkEmrFO0ox6U9JjwMM4Om
 gXE59HAKzBYeWuaGTg8Prfd706WGU9dX+bcmHkGhSjZi9/s5cjyliCYIlKW3SZ5/r8eVDT7U5eM
 Ul6QML+ml7X3z4kkuuJ+h/wDqoXcal+zei2gPVUMcumoxLw1LIC01d6WE/KJ3P8ubWfTWyLJmjp
 13WmQW8lobfY1U0km8vVLpbpnjq3XkQP3rmrzLF282/rrCfukJH1zYa43nf6BLyjap2Bi6hSY66
 4Z3lS7/ Aj1sqFAQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_131733_729092_F9A5B80E 
X-CRM114-Status: GOOD (  13.57  )
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

UHJlcGFyZSBmb3IgdGhlIGNvbWluZyBpbXBsZW1lbnRhdGlvbiBieSBHQ0MgYW5kIENsYW5nIG9m
IHRoZSBfX2NvdW50ZWRfYnkKYXR0cmlidXRlLiBGbGV4aWJsZSBhcnJheSBtZW1iZXJzIGFubm90
YXRlZCB3aXRoIF9fY291bnRlZF9ieSBjYW4gaGF2ZQp0aGVpciBhY2Nlc3NlcyBib3VuZHMtY2hl
Y2tlZCBhdCBydW4tdGltZSB2aWEgQ09ORklHX1VCU0FOX0JPVU5EUyAoZm9yCmFycmF5IGluZGV4
aW5nKSBhbmQgQ09ORklHX0ZPUlRJRllfU09VUkNFIChmb3Igc3RyY3B5L21lbWNweS1mYW1pbHkK
ZnVuY3Rpb25zKS4KCkFzIGZvdW5kIHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9fY291bnRlZF9i
eSBmb3Igc3RydWN0Cm10a19uZmNfbmFuZF9jaGlwLgoKQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+CkNjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9k
LmF0PgpDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgpDYzogTWF0dGhp
YXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KQ2M6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CkNjOiAi
R3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KQ2M6IEhlaWtvIFN0
dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CkNjOiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdA
bnZpZGlhLmNvbT4KQ2M6IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUBrZXJuZWwub3JnPgpDYzogIlV3
ZSBLbGVpbmUtS8O2bmlnIiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpDYzogQ2Fp
IEh1b3FpbmcgPGNhaS5odW9xaW5nQGxpbnV4LmRldj4KQ2M6IENodWFuaG9uZyBHdW8gPGdjaDk4
MTIxM0BnbWFpbC5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogTGkg
WmV0YW8gPGxpemV0YW8xQGh1YXdlaS5jb20+CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1oYXJkZW5pbmdAdmdlci5rZXJu
ZWwub3JnCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9rZWVzL2tlcm5lbC10b29scy9ibG9iL3Ry
dW5rL2NvY2NpbmVsbGUvZXhhbXBsZXMvY291bnRlZF9ieS5jb2NjaSBbMV0KU2lnbmVkLW9mZi1i
eTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbXRrX25hbmQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5k
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jCmluZGV4IDI5YzhiZGRkZTY3Zi4u
NjAxOThlMzNkMmQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5j
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMKQEAgLTEzMCw3ICsxMzAsNyBA
QCBzdHJ1Y3QgbXRrX25mY19uYW5kX2NoaXAgewogCXUzMiBzcGFyZV9wZXJfc2VjdG9yOwogCiAJ
aW50IG5zZWxzOwotCXU4IHNlbHNbXTsKKwl1OCBzZWxzW10gX19jb3VudGVkX2J5KG5zZWxzKTsK
IAkvKiBub3RoaW5nIGFmdGVyIHRoaXMgZmllbGQgKi8KIH07CiAKLS0gCjIuMzQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
