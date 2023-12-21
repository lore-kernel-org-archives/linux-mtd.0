Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241A3C46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVZ2hgakljheu/5sjOP0jf/6e6kch87PjGfcbeHiYDo=; b=UhRVPOijMrZ1IB
	0fprg3js7cH8HZxHLu+en+kTSHSbYoaBTPkVxtV8BNKWcKr7ZStSn4JTGnizp7sNakENJ0Njgtwj6
	wZjpxApCIZ/aNqbRpdwPWrxqKSNH8kxhkDNF1OdWIxgY/Bj4CoYGcyMxOQrZls/kJ6UXxgIa1sBh0
	pxNZhzK8sVHlRuW7SIO0iUR/QDH/DXyOUcYDlyDn4kGFSbLrXi06kWeFW0aONPv1g0nnLEdwj8Zr1
	6FczUPEwXVwJ60ay6o5vz6cBTnp1nzsPJtWOxcIPQqMhyEaURBjkRgHdrCYFemGLvEwxadTygep6Y
	DDdMuXqFJQZnxfa6axyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwa-003g9E-14;
	Thu, 21 Dec 2023 17:34:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwS-003g2t-28;
	Thu, 21 Dec 2023 17:34:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5534d8fcf7bso1263553a12.3;
        Thu, 21 Dec 2023 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703180077; x=1703784877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uejKEmqNBQrYztiORMBuyN6ikCtupKPpOgESMooLig8=;
        b=Qhxj33QJ9IOYJylBWAHC5Q/Qng0h5I1MswEVsxLrJZ2xM4LGDzXl8ljE9aCVFoZHYW
         dOstXzwJ//c6r5rVZ++r6XdCWOEX6NC//N8pIjeJ+jlTCDIOWXNDMLI14Sc4trP2ofcQ
         BUqmZB9tbruuvMgIV+WbcGfbwodZQpBs0MTAeDNECmmD+1gzgZdu7cE/JtpYF61B7rhD
         ocyunDun0FSQb6YYgvu3TVQwIH1W4vbbik7WNByUd3XBlYIvyxuuiW/x4O/hxrOruAro
         kjKCmN/9stjcBQ7WX7nunYIH4gCmVAp2l/+PDQJQ1BCxsIDNWyNVrQLhpUBdVxmNuWXM
         Gyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180077; x=1703784877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uejKEmqNBQrYztiORMBuyN6ikCtupKPpOgESMooLig8=;
        b=eR4dJSz8uBoC/fKHqok85e/aTJyCFP1s175zmGeIwdGqKUz/woKfxEpTmGYeFM6Jnc
         y1uk+XcbMWe3cZCJgQguAvxYqKrdenc2Lks8jMqmZn+MfjAS6jKHykWuvujlTYucmVmz
         C1sFyn2ldAmK4xiUrnFfXBgnSnVdWiA8WxSh7RGS/axZQu6vnRBffirn+PyZWOGoqJG2
         Clg33HutzXSediaXIl+chLPu8zNHt/rckev/0ZKUQopSvdRLZTauv8/sNAXl0Pn7O+qi
         01EljRahWQgKyDMFYdeeFt4GX+yKFZvLH+XodwDDywrnyQBgiJAt3c+G67hhgyIJvj7u
         1a6w==
X-Gm-Message-State: AOJu0Yw+k/NgKSjS5ZLcRUMnDEosNGJmJ6tLvTCv5HZdKxmmXrGDLuFZ
	EpaADQwE7XmYEgpFz3I9h58=
X-Google-Smtp-Source: AGHT+IHBM2cuaZaaA6HZDolSKAmB6b+hcQMYNNQNKu4rhLvbzqoo/2RVerHBx7krYnQ1piWwRFQhkw==
X-Received: by 2002:a17:906:29cf:b0:a23:8a00:cfbe with SMTP id y15-20020a17090629cf00b00a238a00cfbemr73085eje.132.1703180077492;
        Thu, 21 Dec 2023 09:34:37 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709060ad900b00a23499f1d7dsm1176118ejf.209.2023.12.21.09.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:34:37 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 4/6] nvmem: u-boot-env: use nvmem device helpers
Date: Thu, 21 Dec 2023 18:34:19 +0100
Message-Id: <20231221173421.13737-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231221173421.13737-1-zajec5@gmail.com>
References: <20231221173421.13737-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_093440_723233_BBF9475F 
X-CRM114-Status: GOOD (  14.58  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVXNlIG52bWVtX2Rldl9z
aXplKCkgYW5kIG52bWVtX2RldmljZV9yZWFkKCkgdG8gbWFrZSB0aGlzIGRyaXZlciBsZXNzCm10
ZCBkZXBlbmRlbnQuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+ClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgotLS0KVjI6IERvbid0IGludHJvZHVjZSBtZW1sZWFrIHdoZW4gaGFuZGxpbmcgbnZtZW1f
ZGV2aWNlX3JlYWQoKSBmYWlsdXJlcwpWMzogU3BsaXQgUEFUQ0ggMy8zIGludG8gdHdvCgogZHJp
dmVycy9udm1lbS91LWJvb3QtZW52LmMgfCAyMyArKysrKysrKysrKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMgYi9kcml2ZXJzL252bWVtL3UtYm9vdC1lbnYu
YwppbmRleCBkZDlkMGFkMjI3MTIuLjExMTkwNTE4OTM0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
dm1lbS91LWJvb3QtZW52LmMKKysrIGIvZHJpdmVycy9udm1lbS91LWJvb3QtZW52LmMKQEAgLTEy
NywyNyArMTI3LDM0IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9hZGRfY2VsbHMoc3RydWN0IHVf
Ym9vdF9lbnYgKnByaXYsIHVpbnQ4X3QgKmJ1ZiwKIAogc3RhdGljIGludCB1X2Jvb3RfZW52X3Bh
cnNlKHN0cnVjdCB1X2Jvb3RfZW52ICpwcml2KQogeworCXN0cnVjdCBudm1lbV9kZXZpY2UgKm52
bWVtID0gcHJpdi0+bnZtZW07CiAJc3RydWN0IGRldmljZSAqZGV2ID0gcHJpdi0+ZGV2OwogCXNp
emVfdCBjcmMzMl9kYXRhX29mZnNldDsKIAlzaXplX3QgY3JjMzJfZGF0YV9sZW47CiAJc2l6ZV90
IGNyYzMyX29mZnNldDsKIAlzaXplX3QgZGF0YV9vZmZzZXQ7CiAJc2l6ZV90IGRhdGFfbGVuOwor
CXNpemVfdCBkZXZfc2l6ZTsKIAl1aW50MzJfdCBjcmMzMjsKIAl1aW50MzJfdCBjYWxjOwotCXNp
emVfdCBieXRlczsKIAl1aW50OF90ICpidWY7CisJaW50IGJ5dGVzOwogCWludCBlcnI7CiAKLQli
dWYgPSBrY2FsbG9jKDEsIHByaXYtPm10ZC0+c2l6ZSwgR0ZQX0tFUk5FTCk7CisJZGV2X3NpemUg
PSBudm1lbV9kZXZfc2l6ZShudm1lbSk7CisKKwlidWYgPSBrY2FsbG9jKDEsIGRldl9zaXplLCBH
RlBfS0VSTkVMKTsKIAlpZiAoIWJ1ZikgewogCQllcnIgPSAtRU5PTUVNOwogCQlnb3RvIGVycl9v
dXQ7CiAJfQogCi0JZXJyID0gbXRkX3JlYWQocHJpdi0+bXRkLCAwLCBwcml2LT5tdGQtPnNpemUs
ICZieXRlcywgYnVmKTsKLQlpZiAoKGVyciAmJiAhbXRkX2lzX2JpdGZsaXAoZXJyKSkgfHwgYnl0
ZXMgIT0gcHJpdi0+bXRkLT5zaXplKSB7Ci0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlYWQg
ZnJvbSBtdGQ6ICVkXG4iLCBlcnIpOworCWJ5dGVzID0gbnZtZW1fZGV2aWNlX3JlYWQobnZtZW0s
IDAsIGRldl9zaXplLCBidWYpOworCWlmIChieXRlcyA8IDApIHsKKwkJZXJyID0gYnl0ZXM7CisJ
CWdvdG8gZXJyX2tmcmVlOworCX0gZWxzZSBpZiAoYnl0ZXMgIT0gZGV2X3NpemUpIHsKKwkJZXJy
ID0gLUVJTzsKIAkJZ290byBlcnJfa2ZyZWU7CiAJfQogCkBAIC0xNjksOCArMTc2LDggQEAgc3Rh
dGljIGludCB1X2Jvb3RfZW52X3BhcnNlKHN0cnVjdCB1X2Jvb3RfZW52ICpwcml2KQogCQlicmVh
azsKIAl9CiAJY3JjMzIgPSBsZTMyX3RvX2NwdSgqKF9fbGUzMiAqKShidWYgKyBjcmMzMl9vZmZz
ZXQpKTsKLQljcmMzMl9kYXRhX2xlbiA9IHByaXYtPm10ZC0+c2l6ZSAtIGNyYzMyX2RhdGFfb2Zm
c2V0OwotCWRhdGFfbGVuID0gcHJpdi0+bXRkLT5zaXplIC0gZGF0YV9vZmZzZXQ7CisJY3JjMzJf
ZGF0YV9sZW4gPSBkZXZfc2l6ZSAtIGNyYzMyX2RhdGFfb2Zmc2V0OworCWRhdGFfbGVuID0gZGV2
X3NpemUgLSBkYXRhX29mZnNldDsKIAogCWNhbGMgPSBjcmMzMih+MCwgYnVmICsgY3JjMzJfZGF0
YV9vZmZzZXQsIGNyYzMyX2RhdGFfbGVuKSBeIH4wTDsKIAlpZiAoY2FsYyAhPSBjcmMzMikgewpA
QCAtMTc5LDcgKzE4Niw3IEBAIHN0YXRpYyBpbnQgdV9ib290X2Vudl9wYXJzZShzdHJ1Y3QgdV9i
b290X2VudiAqcHJpdikKIAkJZ290byBlcnJfa2ZyZWU7CiAJfQogCi0JYnVmW3ByaXYtPm10ZC0+
c2l6ZSAtIDFdID0gJ1wwJzsKKwlidWZbZGV2X3NpemUgLSAxXSA9ICdcMCc7CiAJZXJyID0gdV9i
b290X2Vudl9hZGRfY2VsbHMocHJpdiwgYnVmLCBkYXRhX29mZnNldCwgZGF0YV9sZW4pOwogCWlm
IChlcnIpCiAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjZWxsczogJWRcbiIsIGVycik7
Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
