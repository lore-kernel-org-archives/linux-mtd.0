Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3ECC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 18:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUhSEqBqBeWPjQug1Y+1V7kS2rGa9V36MnAc/b36tRo=; b=tylq3i23qyEzq7
	A0+4Cgvw+mZ22WduEe7rxtbZcO/FpFdcxjfeF/Sl0w0gmcnG2/xHsuNpGChFLq+o4t48q/aFLW9Fx
	AgzMoaJRygrxbJRVLGPwq7WVzQhNlBKBHKg7E4qKWoZvmbuo3/Uc0ODvB7r7jY7pCfGMwSPE097Rs
	Dgp14wC6JRtJG3pLVGzkd6MVgeTmI8W+o14FMMJPjTdEty/04EQAedYU9PLScTUU9hnvQX/NAPd3a
	Z54izf39Rd0yFqsHIHiPAiShPzFbRorR8Z/7cS3otwneHZQ8dzOiXo1dCfjEhgYh3159D6WMmmi2B
	pCMIp89Yo/7cbTuO32tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCQ8a-0098dn-NZ; Tue, 25 Jan 2022 18:01:48 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCQ8C-0098ZU-2L; Tue, 25 Jan 2022 18:01:25 +0000
Received: by mail-lf1-x12e.google.com with SMTP id z19so21627288lfq.13;
 Tue, 25 Jan 2022 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBYYHHcrj5iWKbV8iDsJjMg/wgtciWUkHYCjJmxtXi8=;
 b=YkDBRgLMrF9XmbvguP6Y67CU9AL6lAUs1LjxUejM3fh1klFFdQ4llHjpsv3eZoeYCl
 f2haVwMHPJcD5Tq0jvJgg8Z4OFcwPba1zlEgDEPe3Xe4L5KilTwWXTgjMJ5iykCmNxhz
 ZPzGnDFtsNMQ5GPzlsyeZUjOg3lnXXuIfXgXrwBemVyRt2zbT4MBUQzPMSdRn4htoGmg
 bUcSyI+rtGmoXo7E3JUE7+8coQEUHQB5oQpnl1zuCgC3EIPiMJgoDSmJLomtGwKPTAiv
 c9s3o37yEN7k5M35blvDgbVMtyEH7gSuIUU6QtTkZFu6Ih4Scs6iArWGeU1HmATokRYV
 TSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XBYYHHcrj5iWKbV8iDsJjMg/wgtciWUkHYCjJmxtXi8=;
 b=IB02pc/tpsGG18wpnLVV+uDI52ax4NvrRbsqqGbEPZlKDg4RrNOK0cruI27j+uXmfF
 ohu8JjMUVh8I9gYw83j3Q+jMDWOsXP8YaB9Q9M3bMOTUGLuCZJYttpsdI7gSFu3MogRs
 BdLdYl9rauqpJTjbDTAng/e4kA6IjIAW8EAioXjSBrRKOJzq2jeawdhRupfBhDdT35i3
 OSe08ZI4q0azsqTNyMEQYLvqAQH7VHTmEPhfKzELvSJV7ad6Mh3T2Bjv325oTP5I3YQ3
 lV0dynIbSHZmgaNuR6Iq8fMjq10U1H8MMrB+9eEcCRDhs4AJy/pCi0FKkGHOqB3v6tOd
 xyNA==
X-Gm-Message-State: AOAM533H5qbuBqgN1JnGEHEysyd1JRb9kGmrcnU6DBvmovdmVfYvgxqO
 1CfvEoAQ3Hz7HbngQfvrzuk=
X-Google-Smtp-Source: ABdhPJxEvKovHTQ3+tJlg+4T9j7URvdFNBsGv3zx6ejSUbnCIMZnkAFxMSkZrL3+wPSy2sYnU3HtSg==
X-Received: by 2002:a05:6512:3f84:: with SMTP id
 x4mr17279303lfa.486.1643133681974; 
 Tue, 25 Jan 2022 10:01:21 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id z24sm1149121lfb.206.2022.01.25.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 10:01:21 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: nvmem: extract NVMEM cell to separated file
Date: Tue, 25 Jan 2022 19:01:13 +0100
Message-Id: <20220125180114.12286-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125180114.12286-1-zajec5@gmail.com>
References: <20220125180114.12286-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_100124_140342_51B043A7 
X-CRM114-Status: GOOD (  15.29  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyB3aWxsIGFsbG93
IGFkZGluZyBiaW5kaW5nIGZvciBtb3JlIHNwZWNpZmljIGNlbGxzIGFuZCByZXVzaW5nCihzaGFy
aW5nKSBjb21tb24gY29kZS4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxA
bWlsZWNraS5wbD4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxscy9jZWxs
LnlhbWwgfCAzNSArKysrKysrKysrKysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9u
dm1lbS9udm1lbS55YW1sICAgICAgfCAyNSArKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDM3IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxscy9jZWxsLnlhbWwKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vY2VsbHMv
Y2VsbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2NlbGxz
L2NlbGwueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjVkNjJk
MGM4ZjFlMQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9jZWxscy9jZWxsLnlhbWwKQEAgLTAsMCArMSwzNSBAQAorIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCist
LS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vY2VsbHMvY2VsbC55
YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCisKK3RpdGxlOiBOVk1FTSBjZWxsCisKK21haW50YWluZXJzOgorICAtIFNyaW5pdmFzIEth
bmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KKworZGVzY3JpcHRpb246
IE5WTUVNIGNlbGwgaXMgYSBkYXRhIGVudHJ5IG9mIE5WTUVNIGRldmljZS4KKworcHJvcGVydGll
czoKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisgICAgZGVzY3JpcHRpb246CisgICAgICBPZmZz
ZXQgYW5kIHNpemUgaW4gYnl0ZXMgd2l0aGluIHRoZSBzdG9yYWdlIGRldmljZS4KKworICBiaXRz
OgorICAgIG1heEl0ZW1zOiAxCisgICAgaXRlbXM6CisgICAgICBpdGVtczoKKyAgICAgICAgLSBt
aW5pbXVtOiAwCisgICAgICAgICAgbWF4aW11bTogNworICAgICAgICAgIGRlc2NyaXB0aW9uOgor
ICAgICAgICAgICAgT2Zmc2V0IGluIGJpdCB3aXRoaW4gdGhlIGFkZHJlc3MgcmFuZ2Ugc3BlY2lm
aWVkIGJ5IHJlZy4KKyAgICAgICAgLSBtaW5pbXVtOiAxCisgICAgICAgICAgZGVzY3JpcHRpb246
CisgICAgICAgICAgICBTaXplIGluIGJpdCB3aXRoaW4gdGhlIGFkZHJlc3MgcmFuZ2Ugc3BlY2lm
aWVkIGJ5IHJlZy4KKworcmVxdWlyZWQ6CisgIC0gcmVnCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVz
OiB0cnVlCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZt
ZW0vbnZtZW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9u
dm1lbS55YW1sCmluZGV4IDQ1NmZiODA4MTAwYS4uNmIwNzVjMWRiNDQ2IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFtbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFtbApAQCAtNDAs
MjkgKzQwLDggQEAgcHJvcGVydGllczoKICAgICBtYXhJdGVtczogMQogCiBwYXR0ZXJuUHJvcGVy
dGllczoKLSAgIkBbMC05YS1mXSsoLFswLTddKT8kIjoKLSAgICB0eXBlOiBvYmplY3QKLQotICAg
IHByb3BlcnRpZXM6Ci0gICAgICByZWc6Ci0gICAgICAgIG1heEl0ZW1zOiAxCi0gICAgICAgIGRl
c2NyaXB0aW9uOgotICAgICAgICAgIE9mZnNldCBhbmQgc2l6ZSBpbiBieXRlcyB3aXRoaW4gdGhl
IHN0b3JhZ2UgZGV2aWNlLgotCi0gICAgICBiaXRzOgotICAgICAgICBtYXhJdGVtczogMQotICAg
ICAgICBpdGVtczoKLSAgICAgICAgICBpdGVtczoKLSAgICAgICAgICAgIC0gbWluaW11bTogMAot
ICAgICAgICAgICAgICBtYXhpbXVtOiA3Ci0gICAgICAgICAgICAgIGRlc2NyaXB0aW9uOgotICAg
ICAgICAgICAgICAgIE9mZnNldCBpbiBiaXQgd2l0aGluIHRoZSBhZGRyZXNzIHJhbmdlIHNwZWNp
ZmllZCBieSByZWcuCi0gICAgICAgICAgICAtIG1pbmltdW06IDEKLSAgICAgICAgICAgICAgZGVz
Y3JpcHRpb246Ci0gICAgICAgICAgICAgICAgU2l6ZSBpbiBiaXQgd2l0aGluIHRoZSBhZGRyZXNz
IHJhbmdlIHNwZWNpZmllZCBieSByZWcuCi0KLSAgICByZXF1aXJlZDoKLSAgICAgIC0gcmVnCisg
ICJAWzAtOWEtZl0rJCI6CisgICAgJHJlZjogY2VsbHMvY2VsbC55YW1sIwogCiBhZGRpdGlvbmFs
UHJvcGVydGllczogdHJ1ZQogCi0tIAoyLjMxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
