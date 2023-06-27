Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974F8EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jun 2023 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NRfvYpVX1t2mcyKihZMSR8d+F4Z3iYMZP7GJx43KZhY=; b=OxIfz5Ex/o2LDl
	AIcf0U+rNQQ1UwHXIQDrwv2UwTyrH7W2Hwpoh+LMbNSuDnmkFMXovP4QKYKK7VDbI4oadAIVHiR6M
	yTgpHFoqctwmVHI+0alleDEAZvMSeiL0l4AQJ0UukPNCg6uVDjtZthjV0LOK1k4xjHVapNoV07QWc
	3wQBnpwHY0Gp1/6yT3rmNJNDWQY8qjZGcLtMfx75JdV1n37onWejBYgsz6iMY71LM924pghJJZ3IQ
	ZkCjpjZTAXDJTIMyKzjG7Y3WKNQ9hamKcXMpCEKk3slHQs6gc31x/XfXUHRpPd/GBsbPq3IPQgiWI
	vzMNBC7BDvYnREOj2dSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEFaK-00E7LU-11;
	Tue, 27 Jun 2023 20:46:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEFaH-00E7Jx-1f;
	Tue, 27 Jun 2023 20:46:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb8ede27eeso245151e87.0;
        Tue, 27 Jun 2023 13:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687898801; x=1690490801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg4AxPhZP87yhv5fBI4Lu3V6Q+5JB9PVkPOY/RBS8xY=;
        b=TgFikHdUqIJnj50tFvQd/5p7XVGi/8nDLwTb/aK/3zSRDpMPLr93oqo5vayGq0D5fg
         pCImK4lgNb4XTy/6SiV6xcHFKwp668xFDounZjw9VWISxiTK85z1ZZiujkGolQUJxzuX
         w2sd8ZRocIizP7neeVZDZ2WHL6uVUCIa+Go2asBW5OnD2qN/Qk6PRGFgrcouUjZKLGEt
         jDvrPdIUWt6N92FEguGVevDZPcqvJKnO0BbEEmwa5aM3ayGNqYXN40Z1oohU1HZWoZRL
         pjDnYpXppmyh4ZeYhQAc5I+AY6ykD7fuHVnBPZppUet5eFO6Xf4ebMo2Bx122PQYevOP
         OZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687898801; x=1690490801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xg4AxPhZP87yhv5fBI4Lu3V6Q+5JB9PVkPOY/RBS8xY=;
        b=K3P1UGL+lAdJfIGcif9xq0OW9wO/HkOwQENhuW8S+bvtzqnppMt1oheKr9zF0RO6sH
         VhnT0sivFu6hoxuBcbm5l0ATxfWyy1fFG+CYoz8BtCf3dZvpj3Mkj8VQLkwLPkYnVTck
         929HR3zaZlFNQMQhfg+CD6OIi6u5NuDdLc4dRPII7nNI97/RPV4zN3l0jKM6crtiS1ky
         FhhvJdcQuiAG4tTk4HIQjuWUbxgpDRgqFBiZKAH6ILoSXOVg7lt+j2wTYaO+DmNazX10
         pmRVR9P1fJzrkL8vGr8U4dMlVKrBjiJCj7LYD1c36cajWdJ/7zd6CIeuw1mKVv9TUn+u
         LegQ==
X-Gm-Message-State: AC+VfDx+7PUqyG58zRWp6D3v/3W5hDZFhZg6IFgcAaY/0aFMKOT3NbpB
	yGDARkIS/8lvNqNy2irCZuY=
X-Google-Smtp-Source: ACHHUZ7Jta8Fiw0a6MNemirv+o2WHCgY+IOaudKsuyPKCc31koNIFA8H/b/wyOTmLo+/Kh0jdxJgzA==
X-Received: by 2002:a19:da12:0:b0:4f9:5622:4795 with SMTP id r18-20020a19da12000000b004f956224795mr11514929lfg.42.1687898800559;
        Tue, 27 Jun 2023 13:46:40 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id t5-20020ac243a5000000b004eb44c2ab6bsm1654087lfl.294.2023.06.27.13.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 13:46:40 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V4] dt-bindings: nvmem: fixed-cell: add compatible for MAC cells
Date: Tue, 27 Jun 2023 22:46:30 +0200
Message-Id: <20230627204630.9476-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_134645_558437_404DD5FC 
X-CRM114-Status: GOOD (  16.12  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQSBsb3Qgb2YgaG9tZSBy
b3V0ZXJzIGhhdmUgTlZNRU0gZml4ZWQgY2VsbHMgY29udGFpbmluZyBNQUMgYWRkcmVzcyB0aGF0
Cm5lZWQgc29tZSBmdXJ0aGVyIHByb2Nlc3NpbmcuIEluIH45OSUgY2FzZXMgTUFDIG5lZWRzIHRv
IGJlOgoxLiBPcHRpb25hbGx5IHBhcnNlZCBmcm9tIEFTQ0lJIGZvcm1hdAoyLiBJbmNyZWFzZWQg
YnkgYSB2ZW5kb3ItcGlja2VkIHZhbHVlCgpUaGVyZSB3YXMgYWxyZWFkeSBhbiBhdHRlbXB0IHRv
IGRlc2lnbiBhIGJpbmRpbmcgZm9yIHRoYXQgYXQgTlZNRU0KZGV2aWNlIGxldmVsIGluIHRoZSBw
YXN0LiBJdCB3YXNuJ3QgYWNjZXB0ZWQgdGhvdWdoIGFzIGl0IGRpZG4ndCByZWFsbHkKZml0IE5W
TUVNIGRldmljZSBsYXllci4KClRoZSBpbnRyb2R1Y3Rpb24gb2YgTlZNRU0gZml4ZWQtY2VsbHMg
bGF5b3V0IHNlZW1zIHRvIGJlIGFuIG9wcG9ydHVuaXR5CnRvIHByb3ZpZGUgYSByZWxldmFudCBi
aW5kaW5nIGluIGEgY2xlYW4gd2F5LgoKVGhpcyBjb21taXQgYWRkcyBhICpnZW5lcmljKiBjb21w
YXRpYmxlIHN0cmluZzogIm1hYy1iYXNlIi4gQXMgYWx3YXlzIGl0Cm5lZWRzIHRvIGJlIGNhcmVm
dWxseSByZXZpZXdlZC4KCk9wZW5XcnQgcHJvamVjdCBjdXJyZW50bHkgc3VwcG9ydHMgfjMwMCBo
b21lIHJvdXRlcnMgdGhhdCBoYXZlIE5WTUVNCmNlbGwgd2l0aCBiaW5hcnktc3RvcmVkIGJhc2Ug
TUFDLlQgaG9zZSBkZXZpY2VzIGFyZSBtYW51ZmFjdHVyZWQgYnkKbXVsdGlwbGUgdmVuZG9ycy4g
VGhlcmUgYXJlIFRQLUxpbmsgZGV2aWNlcyAoNzYgb2YgdGhlbSksIE5ldGdlYXIgKDE5KSwKRC1M
aW5rICgxMSksIE9wZW5NZXNoICg5KSwgRW5HZW5pdXMgKDgpLCBHTC5pTmV0ICg4KSwgWlRFICg3
KSwKWGlhb21pICg1KSwgVWJpcXVpdGkgKDYpIGFuZCBtb3JlLiBUaG9zZSBkZXZpY2VzIGRvbid0
IHNoYXJlIGFuCmFyY2hpdGVjdHVyZSBvciBTb0MuCgpBbm90aGVyIDIwMCBkZXZpY2VzIGhhdmUg
YmFzZSBNQUMgc3RvcmVkIGluIGFuIEFTQ0lJIGZvcm1hdCAobm90IGFsbAp0aG9zZSBkZXZpY2Vz
IGhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gRFQgdGhvdWdoKS4KCkl0IHdvdWxkIGJlIGltcHJhY3Rp
Y2FsIHRvIHByb3ZpZGUgdW5pcXVlICJjb21wYXRpYmxlIiBzdHJpbmdzIGZvciBOVk1FTQpsYXlv
dXRzIG9mIGFsbCB0aG9zZSBkZXZpY2VzLiBJdCBzZWVtcyBsaWtlIGEgdmFsaWQgY2FzZSBmb3Ig
YWxsb3dpbmcgYQpnZW5lcmljIGJpbmRpbmcgaW5zdGVhZC4gRXZlbiBpZiB0aGlzIGJpbmRpbmcg
d2lsbCBub3QgYmUgc3VmZmljaWVudCBmb3IKc29tZSBmdXJ0aGVyIGRldmljZXMgaXQgc2VlbXMg
dG8gYmUgdXNlZnVsIGVub3VnaCBhcyBpdCBpcy4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tClYyOiBEcm9wICJtYWMtYXNjaWkiIGFzIGxlbmd0
aCBjYW4gYmUgY2hlY2tlZCBpbnN0ZWFkCiAgICBGaXggImFsbE9mIiBieSBhZGRpbmcgcmVxdWly
ZWQ6IFsgY29tcGF0aWJsZSBdClYzOiBGaXggY2VsbCBsZW5ndGggaW4gImRlc2NyaXB0aW9uIiAo
dGhhbmsgeW91IFJvYiEpClY0OiBGaXggY2VsbCBsZW5ndGggKDEyIOKGkiA2KSBpbiBmaXhlZC1s
YXlvdXQueWFtbCBleGFtcGxlIGFzIHdlbGwKLS0tCiAuLi4vYmluZGluZ3MvbnZtZW0vbGF5b3V0
cy9maXhlZC1jZWxsLnlhbWwgICAgfCAyNiArKysrKysrKysrKysrKysrKysrCiAuLi4vYmluZGlu
Z3MvbnZtZW0vbGF5b3V0cy9maXhlZC1sYXlvdXQueWFtbCAgfCAxMiArKysrKysrKysKIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlhbWwgICAgICB8ICA1ICsrKy0KIDMgZmls
ZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWNl
bGwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRz
L2ZpeGVkLWNlbGwueWFtbAppbmRleCBlNjk4MDk4NDUwZTEuLmFjMjM4MWU2NjAyNyAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4
ZWQtY2VsbC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS9sYXlvdXRzL2ZpeGVkLWNlbGwueWFtbApAQCAtMTEsNiArMTEsMTUgQEAgbWFpbnRhaW5lcnM6
CiAgIC0gU3Jpbml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3Jn
PgogCiBwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIG9uZU9mOgorICAgICAgLSBjb25z
dDogbWFjLWJhc2UKKyAgICAgICAgZGVzY3JpcHRpb246ID4KKyAgICAgICAgICBDZWxsIHdpdGgg
YmFzZSBNQUMgYWRkcmVzcyB0byBiZSB1c2VkIGZvciBjYWxjdWxhdGluZyBleHRyYSByZWxhdGl2
ZQorICAgICAgICAgIGFkZHJlc3Nlcy4KKyAgICAgICAgICBJdCBjYW4gYmUgc3RvcmVkIGluIGEg
cGxhaW4gYmluYXJ5IGZvcm1hdCAoY2VsbCBsZW5ndGggNikgb3IgYXMgYW4KKyAgICAgICAgICBB
U0NJSSB0ZXh0IGxpa2UgIjAwOjExOjIyOjMzOjQ0OjU1IiAoY2VsbCBsZW5ndGggMTcpLgorCiAg
IHJlZzoKICAgICBtYXhJdGVtczogMQogCkBAIC0yNSw2ICszNCwyMyBAQCBwcm9wZXJ0aWVzOgog
ICAgICAgICBkZXNjcmlwdGlvbjoKICAgICAgICAgICBTaXplIGluIGJpdCB3aXRoaW4gdGhlIGFk
ZHJlc3MgcmFuZ2Ugc3BlY2lmaWVkIGJ5IHJlZy4KIAorYWxsT2Y6CisgIC0gaWY6CisgICAgICBy
ZXF1aXJlZDogWyBjb21wYXRpYmxlIF0KKyAgICB0aGVuOgorICAgICAgaWY6CisgICAgICAgIHBy
b3BlcnRpZXM6CisgICAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICAgIGNvbnRhaW5zOgor
ICAgICAgICAgICAgICBjb25zdDogbWFjLWJhc2UKKyAgICAgIHRoZW46CisgICAgICAgIHByb3Bl
cnRpZXM6CisgICAgICAgICAgIiNudm1lbS1jZWxsLWNlbGxzIjoKKyAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOiBUaGUgZmlyc3QgYXJndW1lbnQgaXMgYSBNQUMgYWRkcmVzcyBvZmZzZXQuCisgICAg
ICAgICAgICBjb25zdDogMQorICAgICAgICByZXF1aXJlZDoKKyAgICAgICAgICAtICIjbnZtZW0t
Y2VsbC1jZWxscyIKKwogcmVxdWlyZWQ6CiAgIC0gcmVnCiAKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWxheW91dC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQt
bGF5b3V0LnlhbWwKaW5kZXggYzI3MTUzN2QwNzE0Li45YmQzNGJkNWFmMzAgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWxh
eW91dC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9s
YXlvdXRzL2ZpeGVkLWxheW91dC55YW1sCkBAIC00NCw2ICs0NCwxOCBAQCBleGFtcGxlczoKICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owog
CisgICAgICAgIG1hY0AxMDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7
CisgICAgICAgICAgICByZWcgPSA8MHgxMDAgMHg2PjsKKyAgICAgICAgICAgICNudm1lbS1jZWxs
LWNlbGxzID0gPDE+OworICAgICAgICB9OworCisgICAgICAgIG1hY0AxMTAgeworICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJtYWMtYmFzZSI7CisgICAgICAgICAgICByZWcgPSA8MHgxMTAgMHgx
MT47CisgICAgICAgICAgICAjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKyAgICAgICAgfTsKKwog
ICAgICAgICBjYWxpYnJhdGlvbkA0MDAwIHsKICAgICAgICAgICAgIHJlZyA9IDwweDQwMDAgMHgx
MDA+OwogICAgICAgICB9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL252bWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbnZtZW0vbnZtZW0ueWFtbAppbmRleCA5ODAyNDQxMDA2OTAuLjlmOTIxZDk0MDE0MiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlh
bWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlh
bWwKQEAgLTQ5LDcgKzQ5LDEwIEBAIHByb3BlcnRpZXM6CiBwYXR0ZXJuUHJvcGVydGllczoKICAg
IkBbMC05YS1mXSsoLFswLTddKT8kIjoKICAgICB0eXBlOiBvYmplY3QKLSAgICAkcmVmOiBsYXlv
dXRzL2ZpeGVkLWNlbGwueWFtbAorICAgIGFsbE9mOgorICAgICAgLSAkcmVmOiBsYXlvdXRzL2Zp
eGVkLWNlbGwueWFtbAorICAgICAgLSBwcm9wZXJ0aWVzOgorICAgICAgICAgIGNvbXBhdGlibGU6
IGZhbHNlCiAgICAgZGVwcmVjYXRlZDogdHJ1ZQogCiBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1
ZQotLSAKMi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
