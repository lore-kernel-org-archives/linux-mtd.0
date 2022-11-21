Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E527C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 11:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8W/O3UEL0MO0bGqxSsmyIYtGYCeN/qVF2FrS5BUSb9s=; b=FcDle0itXVw3Qp
	y4pIR9wNTlxfRleQK5hBRn/RX7VMROFyKXJkHv6UJqLemoezzAl9Z0uns1eSW6KYKJcuiejTrUCDM
	zgUH6SuIQ7Z7WMQxD97z8rt09SKF0vEVazFXGVQKZKJzsSXA9huwTpGWFAV6Oe7lXPVEpddlaoMKp
	i2fdPN+1kMU99RJ6EISsrS7Na7TJrUwvmk0qO4BEdGgqRNEM5mUwtoH02bK+/t9bfYGldY+yWHA9O
	MMZ0MhF+44CCAeormQypHnA3U/Dgmk9a50+npaJ8qZfZthulnF3YpAerjRdn820Gmd13+aBXTo2w/
	zPGwwk0kvmt7yruNzpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5Gk-00D3O8-Hp; Mon, 21 Nov 2022 11:47:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5Gg-00D3KF-Te; Mon, 21 Nov 2022 11:47:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id x102so15930178ede.0;
        Mon, 21 Nov 2022 03:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJJXhf0ZouG6Lq8s9N2QMo51VNGYLGy26YpCtzoJ2sk=;
        b=OMnwEgxNbalqU/91dk07RZKyJeY3LIN8hoJUoyi4ZUcDCO+SznDrmQyTrPKMwZ+6Wl
         Qx6cuVY6MXEr6ldwwjhpkfF4DIr4risDwAoafJ8GuvHjrmIOZZoeOWz6sO48LUNvANFD
         MqRyS29A1kTIVBC28vvCAw0lsAzuf9x7BfmPloqQ+vlgtaYm+mYM9h/RFXx5yW4CaF8M
         9ROox944URXG6anEIGWGT4Ezw/LNG+Q24qfIP/fPe0SW7ms7CHGfVC0+iHDwsw/YpU2H
         xO7Oo+mcOi0t2DpeAC8c7jJhjSId5Um7B0OqFN2SguJ8z+8Gar9OMea5VVmTWxIw9l8Y
         S2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJJXhf0ZouG6Lq8s9N2QMo51VNGYLGy26YpCtzoJ2sk=;
        b=kZAUGf6hhWOfq1mAabR6nGx1i2HMQ6/BXBBvFMyNU+gwvcwmqjPIObf5mqbIH8ffg8
         mOOyeeElUbnInnRY0+tBnYO5j+4I6Ll56T8fZ6rCt+VtEUgqfWGQAN96sM+jj063RZ2x
         GIgYBzt66bjgLoAOkvqV2KordrMESHYYbJzvaZd2XzM/pGjLzCWsdzfxbNKKiH1Je8rG
         UiPte0qvnrLpICXRQAcCpSI24mnrYqeN2w+K+s0jzr6xSOdyJBVnvPl2CjcD2geNxVfd
         1nOzJWImdxuBli1LtVXBNxx2B4CXcwbY3/cSMSN7sB0uYaMjpEDiyHBuAPqYnbXsWsuQ
         5oFg==
X-Gm-Message-State: ANoB5pnf9A+X4RBikWCdOzQWhFdQK9Fj4FWF5maIiiQ/9lU0UAg8ZSmG
	ltoUKRwMJjFv0IEC1jVIE2s=
X-Google-Smtp-Source: AA0mqf4aDDhBcDN72x3wx/EDR7Z7QMMR9UBxCv5euJ+PDL5gyJvUvP5LZEM7gvGXLJvBRYzMteJtaw==
X-Received: by 2002:aa7:d3c9:0:b0:459:aa70:d4b6 with SMTP id o9-20020aa7d3c9000000b00459aa70d4b6mr16023510edr.224.1669031235224;
        Mon, 21 Nov 2022 03:47:15 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id ay12-20020a170907900c00b00780982d77d1sm4913753ejc.154.2022.11.21.03.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:47:14 -0800 (PST)
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
Subject: [PATCH V2 dt-schema.git] schemas: add NVMEM cell with #nvmem-cell-cells
Date: Mon, 21 Nov 2022 12:47:08 +0100
Message-Id: <20221121114708.10161-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_034718_999911_7EEA1B22 
X-CRM114-Status: GOOD (  14.38  )
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
ZmFsQG1pbGVja2kucGw+Ci0tLQpWMjogRHJvcCByZWR1bmRhbnQgcXVvdGVzICh0aGFua3MgS3J6
eXN6dG9mKQoKUGxlYXNlIG5vdGUgdGhlcmUgaXMgb25nb2luZyB3b3JrIGJ5IE1pY2hhZWwgd2hv
IGNob3NlIHRvIG1vZGlmeQptZXRhLXNjaGVtYSBpbiBoaXMgd29yazogaHR0cHM6Ly9naXRodWIu
Y29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9wdWxsLzg5CgpUaGlzIGJpdCBpcyByZXF1aXJl
ZCBmb3IgbW92aW5nIGZvcndhcmQgd2l0aCB0aGUKW1BBVENIIHYyIDAwLzIwXSBudm1lbTogY29y
ZTogaW50cm9kdWNlIE5WTUVNIGxheW91dHMKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
YXJtLWtlcm5lbC8yMDIyMDkwMTIyMTg1Ny4yNjAwMzQwLTEtbWljaGFlbEB3YWxsZS5jYy8KCkFz
IHBvaW50ZWQgb3V0IGJ5IFJvYiAjbnZtZW0tY2VsbC1jZWxscyBzaG91bGQgYmUgYWRkZWQgdG8g
dGhlIGR0LXNjaGVtYQphbmQgbm90IGEgTGludXggYmluZGluZzoKUmU6IFtQQVRDSCB2MiAxNS8y
MF0gZHQtYmluZGluZ3M6IG52bWVtOiBhZGQgWUFNTCBzY2hlbWEgZm9yIHRoZSBzbDI4IHZwZCBs
YXlvdXQKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIyMDkxMjE5
MjAzOC5HQTE2NjE1NTAtcm9iaEBrZXJuZWwub3JnLwoKc2wyOCBpcyBvbmUgZXhhbXBsZSB0aGF0
IG5lZWRzICNudm1lbS1jZWxsLWNlbGxzCnUtYm9vdCxlbnYgaXMgYW5vdGhlciBvbmUKLS0tCiBk
dHNjaGVtYS9zY2hlbWFzL252bWVtL252bWVtLWNlbGwueWFtbCB8IDIzICsrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGR0c2NoZW1hL3NjaGVtYXMvbnZtZW0vbnZtZW0tY2VsbC55YW1sCgpkaWZmIC0tZ2l0
IGEvZHRzY2hlbWEvc2NoZW1hcy9udm1lbS9udm1lbS1jZWxsLnlhbWwgYi9kdHNjaGVtYS9zY2hl
bWFzL252bWVtL252bWVtLWNlbGwueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwLi4xYTE3NDFkCi0tLSAvZGV2L251bGwKKysrIGIvZHRzY2hlbWEvc2NoZW1hcy9udm1lbS9u
dm1lbS1jZWxsLnlhbWwKQEAgLTAsMCArMSwyMyBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogQlNELTItQ2xhdXNlCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252bWVt
L252bWVtLWNlbGwueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvYmFzZS55YW1sIworCit0aXRsZTogTlZNRU0gQ2VsbCBDb21tb24gUHJvcGVydGllcwor
ZGVzY3JpcHRpb246IFNjaGVtYSBmb3IgTlZNRU0gY2VsbCBkZXZpY2V0cmVlIGJpbmRpbmdzCitt
YWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CisgIC0g
U3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgorCisj
IGFsd2F5cyBzZWxlY3QgdGhlIGNvcmUgc2NoZW1hCitzZWxlY3Q6IHRydWUKKworcHJvcGVydGll
czoKKyAgIiNudm1lbS1jZWxsLWNlbGxzIjoKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBkZXNjcmlwdGlvbjogPgorICAgICAgU29tZSBOVk1F
TSBjZWxscyBtYXkgY29uc2lzdCBvZiByYXcgZGF0YSB0aGF0IHJlcXVpcmVzIHNvbWUgZXh0cmEK
KyAgICAgIHByb2Nlc3NpbmcuIFRoZXkgbWF5IHByb3ZpZGUgbW9yZSB0aGFuIDEgdmFsdWUuCisK
KyAgICAgIFBhc3NpbmcgZXh0cmEgYXJndW1lbnQocykgYWxsb3dzIHNlbGVjdGluZyBkYXRhIHRv
IGFjY2Vzcy4KKworYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUKLS0gCjIuMzQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
