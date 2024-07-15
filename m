Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C448C3DA5D
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2024 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lsARLFn/82GCldwl9Kmt8YtiuxdLILaEdePj/ZWNDZQ=; b=I5wsJ2kqiYt1Kf
	NOvZOuHRBU/WTimtQqeHNlm6wwiOH2Tdr0NiZmYAEBKPFEBCvU5VU7CGjrI0x7M2VrtIZIPtPgdpO
	9W3kp9RTjrP2IZZEwyitwhPTDlfHDJnPV30nUUe+/J9+04DFnzC2nrl1By8qiDq1yJPsj2r1BVA/S
	asXbb4Yb8CSUp9BW9l1KN4iM1VN/yaKqtwxM0IbX2YuVd1Jm7H+De8pS7tGlYmO0PlfanjaYgfqPI
	KCYv4vVAQdijXvhZlyDurJ8mDPamseJXKsCg34RLCOvqj4MDDs1twOZOHBR/pPLYXMKuR9NJeVtyM
	m6ULFOAxP62TMviKyxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTMBt-00000007Hg8-2ESM;
	Mon, 15 Jul 2024 13:56:33 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTMBb-00000007HZT-3Tyt;
	Mon, 15 Jul 2024 13:56:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a77e6dd7f72so522649466b.3;
        Mon, 15 Jul 2024 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721051773; x=1721656573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJEofbM7JJv/OPvTziaKTUDT40OBgVWW/o2FBZFQ/8c=;
        b=iz70JgaIpypbydmFQVRUa4njdx+9s3PRg9D7Pgm6qAyZ65AQW22GiVKhST6G0keU0k
         3cp09cgPuy0eCQ+XUn8sL7qCjhOM6BhrUxBw+iGjZJEw8o8RvBvj26CqTykuISUky38z
         otFm7ki6gmRdNxxG3iUrXCZ4Ksg1fylfpT0jqDlq3YuqG0Je+SVNMM5hFTc6rKpskNOR
         suCWRMQwNQaPYySAOuujwmzqZcroXroYgILiMX6SmE26xSWiIkEJq/MNbJUI61EK4su7
         ++THJcQDwL2A3naoMO6lPoYGcaaLaGvTHu/ykfg96w8hG1ieI8Q49juSZk2IUdDi4jYb
         o9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721051773; x=1721656573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJEofbM7JJv/OPvTziaKTUDT40OBgVWW/o2FBZFQ/8c=;
        b=Yv9PLitHSQr9y5Qt4rYQZCyy8A9vBVD436ZNfjWia0GIE+SAbH3Q+vVpSEvdM57fjo
         vD/ay67dmxCS8HkWBczbW7DrW47pTHy1smqH78hRy8irqW/lG7+RNtAipEg4OrEfUHJW
         sSSbECHbG/6UrmOVMs1gr7PDdELBymgKRAFvqn3VCdmaXPpn41q9RJXofR7ejOwekbdj
         D0A29UzPbql+EDG1sIN8TdwwjpwcBEMK+lBcBhzpmm/DrxqKO97KdlQLzbl+fSPLP9Oy
         m5ubMPwWXz6wzc2fb7e40tgwyNQuf5eEKJ1Doyih2KfWgh1W6WgydTGAG+0nJIwi4Lhu
         V20Q==
X-Forwarded-Encrypted: i=1; AJvYcCX11tbLcngjCXewrGZh78iWAwDG8lAz6TB6t/tdXaDvXvSs4X585153RsjIhEc2VWpLuKn08jJJOdrh+fpGeIm+CwLiIiJOa3Ufv9+AKWPtKQj12xaxeTqAC86Y5Z3zyy3YwRrN1i8es9WvUVReCFsx3hqu
X-Gm-Message-State: AOJu0Yy8IluJpz1fyuSUlMq88vvz9ms8/N4saBxQmdX0lKFKIBrOeJfK
	t8S8PfQNrZEdnQzMhoJ5kxcTAOIAkHjwRZhO5Hs6C5B/9N1xNtHR
X-Google-Smtp-Source: AGHT+IGFwyv96gykRh2WQAFospTSXU2UQACz9q8YtryxBrJrikNX9BsuYSLrXYopy2ZsFmRYUjaEzg==
X-Received: by 2002:a17:906:2797:b0:a77:c5e4:eebf with SMTP id a640c23a62f3a-a780b87ef50mr1185426566b.54.1721051773034;
        Mon, 15 Jul 2024 06:56:13 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc820fb5sm214152666b.212.2024.07.15.06.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 06:56:12 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	u-boot@lists.denx.de,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: nvmem: convert U-Boot env to a layout
Date: Mon, 15 Jul 2024 15:54:33 +0200
Message-Id: <20240715135434.24992-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_065615_899054_5F49802E 
X-CRM114-Status: GOOD (  15.25  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVS1Cb290IGVudmlyb25t
ZW50IHZhcmlhYmxlcyBjYW4gYmUgc3RvcmVkIGluIHZhcmlvdXMgZGF0YSBzb3VyY2VzLiBNVEQK
aXMganVzdCBvbmUgb2YgYXZhaWxhYmxlIG9wdGlvbnMuIFJlZmFjdG9yIERUIGJpbmRpbmcgaW50
byBhIGxheW91dCBzbwppdCBjYW4gYmUgdXNlZCB3aXRoIFVCSSB2b2x1bWVzIGFuZCBvdGhlciBO
Vk1FTSBkZXZpY2VzLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMjIx
MTczNDIxLjEzNzM3LTEtemFqZWM1QGdtYWlsLmNvbS8KU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkg
PHJvYmhAa2VybmVsLm9yZz4KLS0tCkknbSByZXNlbmRpbmcgdGhpcyBhcHByb3ZlZCBieSBSb2Ig
UEFUQ0ggaW4gYSBwcm9wZXIgc2VyaWVzCgogLi4uL2JpbmRpbmdzL252bWVtL2xheW91dHMvbnZt
ZW0tbGF5b3V0LnlhbWwgIHwgIDEgKwogLi4uL252bWVtL3sgPT4gbGF5b3V0c30vdS1ib290LGVu
di55YW1sICAgICAgIHwgMzkgKysrKysrKysrKysrKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAz
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS97ID0+IGxheW91dHN9L3UtYm9vdCxlbnYueWFtbCAoNzUl
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9s
YXlvdXRzL252bWVtLWxheW91dC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL2xheW91dHMvbnZtZW0tbGF5b3V0LnlhbWwKaW5kZXggM2I0MGY3ODgwNzc0Li4z
ODI1MDcwNjA2NTEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9udm1lbS9sYXlvdXRzL252bWVtLWxheW91dC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL252bWVtLWxheW91dC55YW1sCkBAIC0yMSw2
ICsyMSw3IEBAIG9uZU9mOgogICAtICRyZWY6IGZpeGVkLWxheW91dC55YW1sCiAgIC0gJHJlZjog
a29udHJvbixzbDI4LXZwZC55YW1sCiAgIC0gJHJlZjogb25pZSx0bHYtbGF5b3V0LnlhbWwKKyAg
LSAkcmVmOiB1LWJvb3QsZW52LnlhbWwKIAogcHJvcGVydGllczoKICAgY29tcGF0aWJsZTogdHJ1
ZQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3Ut
Ym9vdCxlbnYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9s
YXlvdXRzL3UtYm9vdCxlbnYueWFtbApzaW1pbGFyaXR5IGluZGV4IDc1JQpyZW5hbWUgZnJvbSBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCnJl
bmFtZSB0byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy91
LWJvb3QsZW52LnlhbWwKaW5kZXggOWMzNmFmYzcwODRiLi41NmE4ZjU1ZDRhMDkgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52Lnlh
bWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMv
dS1ib290LGVudi55YW1sCkBAIC0xLDEwICsxLDEwIEBACiAjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCiAlWUFNTCAxLjIKIC0tLQotJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9udm1lbS91LWJvb3QsZW52LnlhbWwjCiskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252bWVtL2xheW91dHMvdS1ib290LGVudi55
YW1sIwogJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCiAKLXRpdGxlOiBVLUJvb3QgZW52aXJvbm1lbnQgdmFyaWFibGVzCit0aXRsZTogVS1Cb290
IGVudmlyb25tZW50IHZhcmlhYmxlcyBsYXlvdXQKIAogZGVzY3JpcHRpb246IHwKICAgVS1Cb290
IHVzZXMgZW52aXJvbm1lbnQgdmFyaWFibGVzIHRvIHN0b3JlIGRldmljZSBwYXJhbWV0ZXJzIGFu
ZApAQCAtMjEsOSArMjEsNiBAQCBkZXNjcmlwdGlvbjogfAogICBUaGlzIGJpbmRpbmcgYWxsb3dz
IG1hcmtpbmcgc3RvcmFnZSBkZXZpY2UgKGFzIGNvbnRhaW5pbmcgZW52IGRhdGEpIGFuZAogICBz
cGVjaWZ5aW5nIHVzZWQgZm9ybWF0LgogCi0gIFJpZ2h0IG5vdyBvbmx5IGZsYXNoIHBhcnRpdGlv
biBjYXNlIGlzIGNvdmVyZWQgYnV0IGl0IG1heSBiZSBleHRlbmRlZCB0byBlLmcuCi0gIFVCSSB2
b2x1bWVzIGluIHRoZSBmdXR1cmUuCi0KICAgVmFyaWFibGVzIGNhbiBiZSBkZWZpbmVkIGFzIE5W
TUVNIGRldmljZSBzdWJub2Rlcy4KIAogbWFpbnRhaW5lcnM6CkBAIC00Miw2ICszOSw3IEBAIHBy
b3BlcnRpZXM6CiAgICAgICAgIGNvbnN0OiBicmNtLGVudgogCiAgIHJlZzoKKyAgICBkZXNjcmlw
dGlvbjogUGFydGl0aW9uIG9mZnNldCBhbmQgc2l6ZSBmb3IgZW52IG9uIHRvcCBvZiBNVEQKICAg
ICBtYXhJdGVtczogMQogCiAgIGJvb3RjbWQ6CkBAIC01OCw2ICs1NiwxNyBAQCBwcm9wZXJ0aWVz
OgogICAgICAgICBkZXNjcmlwdGlvbjogVGhlIGZpcnN0IGFyZ3VtZW50IGlzIGEgTUFDIGFkZHJl
c3Mgb2Zmc2V0LgogICAgICAgICBjb25zdDogMQogCithbGxPZjoKKyAgLSBpZjoKKyAgICAgIHBy
b3BlcnRpZXM6CisgICAgICAgICRub2RlbmFtZToKKyAgICAgICAgICBub3Q6CisgICAgICAgICAg
ICBjb250YWluczoKKyAgICAgICAgICAgICAgcGF0dGVybjogIl5wYXJ0aXRpb25AWzAtOWEtZl0r
JCIKKyAgICB0aGVuOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmVnOiBmYWxzZQorCiBh
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6CkBAIC0xMDEsMyArMTEwLDIz
IEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgfTsKICAgICAgICAgfTsKICAgICB9OworICAtIHwK
KyAgICBwYXJ0aXRpb25AMCB7CisgICAgICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+OworICAgICAg
ICBsYWJlbCA9ICJ1YmkiOworICAgICAgICBjb21wYXRpYmxlID0gImxpbnV4LHViaSI7CisKKyAg
ICAgICAgdm9sdW1lcyB7CisgICAgICAgICAgICB1Ymktdm9sdW1lLXUtYm9vdC1lbnYgeworICAg
ICAgICAgICAgICAgIHZvbG5hbWUgPSAiZW52IjsKKworICAgICAgICAgICAgICAgIG52bWVtLWxh
eW91dCB7CisgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiI7CisK
KyAgICAgICAgICAgICAgICAgICAgZXRoYWRkciB7CisgICAgICAgICAgICAgICAgICAgICAgICAj
bnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgICAgICAgICAgfTsKKyAgICAgICAg
ICAgICAgICB9OworICAgICAgICAgICAgfTsKKyAgICAgICAgfTsKKyAgICB9OwotLSAKMi4zNS4z
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
