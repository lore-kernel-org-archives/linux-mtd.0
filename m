Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC432EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3rDNwKmfUgLiY6eMfbfjbw0EHSh9tH50Is2esSeriv0=; b=K8uHb8tTz7x3Rt
	kuB6mWrFuf2HKS7pmMdNeB21mG2+1Sw6F0wtLVAp2Uezh09ddkA/tA0T5sABHbDe1H7otg+dpRN+Y
	E/v3KNKU55Yp+bMO36q04BGhJoaspYZxVGKTgJjtGVpM5HDEp/RE75Nod6XhScosrMIOL0IhHOLmc
	fIvP8v+LkT2IQJWXoR8+S3bjlFqM9P0dOppobQqhcyRvi4BJ0LFKojxcSLKcsKUULr5A1h9QEfswA
	Fi05wIHT2KUxT+63QtQVjs0+IAudJLacGx8iKuAyMQMSZuTCegJazXWsUSYEjZDBJ3g4BHz7bbm3I
	76YzraaKbdjQ4NzWhVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAH1y-001uUU-0c;
	Fri, 16 Jun 2023 21:30:54 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAH1v-001uTk-0x;
	Fri, 16 Jun 2023 21:30:52 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b4636bb22eso4139501fa.2;
        Fri, 16 Jun 2023 14:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686951048; x=1689543048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlSbhPNbssIprDpHNOXePwMeZq9BONqa1optZho/VFA=;
        b=X2Oqo9eS3GakYna+Mz41cEIe+tLHSdc9nn9qX81F6dp1fe84pLTVlOKyUUKnleimWG
         d6G5FZPKEA9F1BJ2xInh7TSoGWeNJXcCRtD0D8y28iUNRojahSZZIvjg2ZmTegnQHZFE
         EtQJd7Cgbd8wALKiFqcDgijigm6JDhUtXaR9np0bIoBM0QMDappFhgj4l9yeFvXhMe2V
         JUYNJ6jplFilgm9wjP3yPV00CMaVIQXCjB8kYST6dwL/njBHL25N6BG2Tn95VfF0NTsF
         KuAadI8k7MFvjaruxjbeQq+LnTmuJaKW19E3b8vgFt6sMeANA/bYlp60TAh+gVQIyYv/
         AC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686951048; x=1689543048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlSbhPNbssIprDpHNOXePwMeZq9BONqa1optZho/VFA=;
        b=NpCgInfHC4AINrhsXkWGQU7WgXO9dTPYZiFNJbKHPbzJvYi+8emdn0+Yb+hIwJWPe7
         BfKplzf4n7p0Hij27MhyJrOf1KexfYs6LW2pasMvPLJhds7aOsLpYcYcLX2YcUGefxi+
         F8zqJSHoFZKsOOoykWalbaYKRr8C1XyRJ2Q89a+ma/EnnkpsDCnSwdKB6MpqsRKyAD6i
         ajXO/8wnQZJWmxV+9migWK9NyDvOSQmk+hG9PmACIgxLKBzO4M4qmxirCaHEy8eqFu4g
         VAGUqNmSeTYcWTP5SYt2FxgphI1DVqMDXGkrOHFo2VZnSvTRDN1cVXlBCVGuONNtwzlI
         4LtA==
X-Gm-Message-State: AC+VfDzhH/8ufdUe3JRWvlmGaiKNHIZCPpbxSilST8JYaVgWHyzryh0q
	W9R2oumoD7jfuZ28KwSc1xY=
X-Google-Smtp-Source: ACHHUZ4AzhyGOtF7rvB9gv6YHMUR1Zu3KGBIF9HNAkK08t5zoh8CJKAb9ppOvrCPtQ5asfg4HI9Ilg==
X-Received: by 2002:a2e:3306:0:b0:2b4:5b21:a94e with SMTP id d6-20020a2e3306000000b002b45b21a94emr1951020ljc.7.1686951047501;
        Fri, 16 Jun 2023 14:30:47 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e90d2000000b002b445237affsm1060608ljg.58.2023.06.16.14.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 14:30:46 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: nvmem: fixed-cell: add compatibles for MAC cells
Date: Fri, 16 Jun 2023 23:30:33 +0200
Message-Id: <20230616213033.8451-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_143051_336168_B98F65F1 
X-CRM114-Status: GOOD (  18.00  )
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
aW5kaW5nIGluIGEgY2xlYW4gd2F5LgoKVGhpcyBjb21taXQgYWRkcyB0d28gKmdlbmVyaWMqIGNv
bXBhdGlibGUgc3RyaW5nczogIm1hYy1iYXNlIiBhbmQKIm1hYy1hc2NpaSIuIEFzIGFsd2F5cyB0
aG9zZSBuZWVkIHRvIGJlIGNhcmVmdWxseSByZXZpZXdlZC4KCk9wZW5XcnQgcHJvamVjdCBjdXJy
ZW50bHkgc3VwcG9ydHMgfjMwMCBob21lIHJvdXRlcnMgdGhhdCB3b3VsZCBiZW5lZml0CmZyb20g
dGhlICJtYWMtYmFzZSIgYmluZGluZy4gVGhvc2UgZGV2aWNlcyBhcmUgbWFudWZhY3R1cmVkIGJ5
IG11bHRpcGxlCnZlbmRvcnMuIFRoZXJlIGFyZSBUUC1MaW5rIGRldmljZXMgKDc2IG9mIHRoZW0p
LCBOZXRnZWFyICgxOSksCkQtTGluayAoMTEpLCBPcGVuTWVzaCAoOSksIEVuR2VuaXVzICg4KSwg
R0wuaU5ldCAoOCksIFpURSAoNyksClhpYW9taSAoNSksIFViaXF1aXRpICg2KSBhbmQgbW9yZS4g
VGhvc2UgZGV2aWNlcyBkb24ndCBzaGFyZSBhbgphcmNoaXRlY3R1cmUgb3IgU29DLgoKQW1vdW50
IG9mIGRldmljZXMgdG8gYmVuZWZpdCBmcm9tIHRoZSAibWFjLWFzY2lpIiBpcyBoYXJkIHRvIGRl
dGVybWluZQphcyBub3QgYWxsIG9mIHRoZW0gd2VyZSBjb252ZXJ0ZWQgdG8gRFQgeWV0LiBUaGVy
ZSBhcmUgYXQgbGVhc3QgMjAwIG9mCnN1Y2ggZGV2aWNlcy4KCkl0IHdvdWxkIGJlIGltcHJhY3Rp
Y2FsIHRvIHByb3ZpZGUgdW5pcXVlICJjb21wYXRpYmxlIiBzdHJpbmdzIGZvciBOVk1FTQpsYXlv
dXRzIG9mIGFsbCB0aG9zZSBkZXZpY2VzLiBJdCBzZWVtcyBsaWtlIGEgdmFsaWQgY2FzZSBmb3Ig
YWxsb3dpbmcgYQpnZW5lcmljIGJpbmRpbmcgaW5zdGVhZC4gRXZlbiBpZiB0aGlzIGJpbmRpbmcg
d2lsbCBub3QgYmUgc3VmZmljaWVudCBmb3IKc29tZSBmdXJ0aGVyIGRldmljZXMgaXQgc2VlbXMg
dG8gYmUgdXNlZnVsIGVub3VnaCBhcyBpdCBpcy4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCklmIHRoaXMgYmluZGluZyBnZXRzIGFwcHJvdmVk
IEkgd2lsbCBzdGlsbCBuZWVkIGEgbWlub3IgaGVscCB3aXRoIFlBTUwuCgpGb3Igc29tZSByZWFz
b24gbXkgY29uZGl0aW9ucyBpbiBmaXhlZC1jZWxsLnlhbWwgZG9uJ3Qgc2VlbSB0byB3b3JrIGFz
CmV4cGVjdGVkLiBJIHRyaWVkIHRvIG1ha2UgIiNudm1lbS1jZWxsLWNlbGxzIiByZXF1aXJlZCBv
bmx5IGZvciB0aGUKIm1hYy1iYXNlIiBidXQgaXQgc2VlbXMgaXQgZ290IHJlcXVpcmVkIGZvciBh
bGwgY2VsbHM6CgogIERUQ19DSEsgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252
bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0LmV4YW1wbGUuZHRiCkRvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWxheW91dC5leGFtcGxlLmR0YjogbnZt
ZW0tbGF5b3V0OiBjYWxpYnJhdGlvbkA0MDAwOiAnI252bWVtLWNlbGwtY2VsbHMnIGlzIGEgcmVx
dWlyZWQgcHJvcGVydHkKICAgICAgICBGcm9tIHNjaGVtYTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0LnlhbWwKCkNlbGwgImNhbGli
cmF0aW9uIiBkb2Vzbid0IGhhdmUgYW55ICJjb21wYXRpYmxlIiBzbyBpdCBzaG91bGRuJ3QgcmVx
dWlyZQoiI252bWVtLWNlbGwtY2VsbHMiLgpDYW4gc29tZW9uZSBoaW50IG1lIHdoYXQgSSBkaWQg
d3JvbmcsIHBsZWFzZT8KLS0tCiAuLi4vYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1jZWxs
LnlhbWwgICAgfCAzNSArKysrKysrKysrKysrKysrKysrCiAuLi4vYmluZGluZ3MvbnZtZW0vbGF5
b3V0cy9maXhlZC1sYXlvdXQueWFtbCAgfCAxMiArKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9udm1lbS55YW1sICAgICAgfCAgNSArKy0KIDMgZmlsZXMgY2hhbmdlZCwgNTEg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWNlbGwueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWNlbGwueWFt
bAppbmRleCBlNjk4MDk4NDUwZTEuLjA0N2U0MjQzOGE0ZiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtY2VsbC55YW1sCisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVk
LWNlbGwueWFtbApAQCAtMTEsNiArMTEsMTcgQEAgbWFpbnRhaW5lcnM6CiAgIC0gU3Jpbml2YXMg
S2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgogCiBwcm9wZXJ0aWVz
OgorICBjb21wYXRpYmxlOgorICAgIG9uZU9mOgorICAgICAgLSBjb25zdDogbWFjLWJhc2UKKyAg
ICAgICAgZGVzY3JpcHRpb246ID4KKyAgICAgICAgICBDZWxsIHdpdGggYmFzZSBNQUMgYWRkcmVz
cyB0byBiZSB1c2VkIGZvciBjYWxjdWxhdGluZyBleHRyYSByZWxhdGl2ZQorICAgICAgICAgIGFk
ZHJlc3Nlcy4KKyAgICAgIC0gY29uc3Q6IG1hYy1hc2NpaQorICAgICAgICBkZXNjcmlwdGlvbjog
PgorICAgICAgICAgIENlbGwgd2l0aCBiYXNlIE1BQyBhZGRyZXNzIHN0b3JlZCBpbiBhbiBBU0NJ
SSBmb3JtYXQgKGxpa2UKKyAgICAgICAgICAiMDA6MTE6MjI6MzM6NDQ6NTUiKS4KKwogICByZWc6
CiAgICAgbWF4SXRlbXM6IDEKIApAQCAtMjUsNiArMzYsMzAgQEAgcHJvcGVydGllczoKICAgICAg
ICAgZGVzY3JpcHRpb246CiAgICAgICAgICAgU2l6ZSBpbiBiaXQgd2l0aGluIHRoZSBhZGRyZXNz
IHJhbmdlIHNwZWNpZmllZCBieSByZWcuCiAKK2FsbE9mOgorICAtIGlmOgorICAgICAgcHJvcGVy
dGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAg
ICAgIGNvbnN0OiBtYWMtYmFzZQorICAgIHRoZW46CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAg
ICAiI252bWVtLWNlbGwtY2VsbHMiOgorICAgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUgZmlyc3Qg
YXJndW1lbnQgaXMgYSBNQUMgYWRkcmVzcyBvZmZzZXQuCisgICAgICAgICAgY29uc3Q6IDEKKyAg
ICAgIHJlcXVpcmVkOgorICAgICAgICAtICIjbnZtZW0tY2VsbC1jZWxscyIKKyAgLSBpZjoKKyAg
ICAgIHByb3BlcnRpZXM6CisgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgY29udGFpbnM6
CisgICAgICAgICAgICBjb25zdDogbWFjLWFzY2lpCisgICAgdGhlbjoKKyAgICAgIHByb3BlcnRp
ZXM6CisgICAgICAgICIjbnZtZW0tY2VsbC1jZWxscyI6CisgICAgICAgICAgZGVzY3JpcHRpb246
IFRoZSBmaXJzdCBhcmd1bWVudCBpcyBhIE1BQyBhZGRyZXNzIG9mZnNldC4KKyAgICAgICAgICBj
b25zdDogMQorCiByZXF1aXJlZDoKICAgLSByZWcKIApkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0LnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1sYXlv
dXQueWFtbAppbmRleCBjMjcxNTM3ZDA3MTQuLjA1YjgyMzBjZDE4YyAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91
dHMvZml4ZWQtbGF5b3V0LnlhbWwKQEAgLTQ0LDYgKzQ0LDE4IEBAIGV4YW1wbGVzOgogICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CiAKKyAg
ICAgICAgbWFjQDEwMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1hYy1iYXNlIjsKKyAg
ICAgICAgICAgIHJlZyA9IDwweDEwMCAweGM+OworICAgICAgICAgICAgI252bWVtLWNlbGwtY2Vs
bHMgPSA8MT47CisgICAgICAgIH07CisKKyAgICAgICAgbWFjQDExMCB7CisgICAgICAgICAgICBj
b21wYXRpYmxlID0gIm1hYy1hc2NpaSI7CisgICAgICAgICAgICByZWcgPSA8MHgxMTAgMHgxMT47
CisgICAgICAgICAgICAjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKyAgICAgICAgfTsKKwogICAg
ICAgICBjYWxpYnJhdGlvbkA0MDAwIHsKICAgICAgICAgICAgIHJlZyA9IDwweDQwMDAgMHgxMDA+
OwogICAgICAgICB9OwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL252bWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bnZtZW0vbnZtZW0ueWFtbAppbmRleCA5ODAyNDQxMDA2OTAuLjlmOTIxZDk0MDE0MiAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlhbWwK
QEAgLTQ5LDcgKzQ5LDEwIEBAIHByb3BlcnRpZXM6CiBwYXR0ZXJuUHJvcGVydGllczoKICAgIkBb
MC05YS1mXSsoLFswLTddKT8kIjoKICAgICB0eXBlOiBvYmplY3QKLSAgICAkcmVmOiBsYXlvdXRz
L2ZpeGVkLWNlbGwueWFtbAorICAgIGFsbE9mOgorICAgICAgLSAkcmVmOiBsYXlvdXRzL2ZpeGVk
LWNlbGwueWFtbAorICAgICAgLSBwcm9wZXJ0aWVzOgorICAgICAgICAgIGNvbXBhdGlibGU6IGZh
bHNlCiAgICAgZGVwcmVjYXRlZDogdHJ1ZQogCiBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQot
LSAKMi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
