Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE41FEB64D7
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 11:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XRmX14UxFj2ZlIQk55rMudpJFZVVLqLqSiABWjV9Ic=; b=1I79Tfa09TcEKw
	SDiX6K94hWa+k3Dzo05BTxKfxTZDYyNh4YpwLVG4wJueLke1gKRN1ToWHlYRzBFJygpeOTfdiximy
	hDwdj4RmjTn6GzntCpdZWMsSgtTPprWJs08vqUPSXA08tMvWWm6uw8r+yCP0x4aZgdCZJTohoavUC
	Q2MyduMxXHlovRMmJUYGsFl5hmeuhiwM3ccUkG7imqL7EXmvqlyK7gL/PuNVO6kgZEB4obLZn3Vv6
	0v117BUT7wa6fjfxPKC3vFO2MQsqkOPDQaM7aumRCrcfnaM+1bT+CUj4xbZP19zdvUCM3ShBK57v5
	9wJ/MCk3CaOpnrFK/w6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkXH-00A6t2-2e;
	Mon, 26 Jun 2023 11:37:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkXE-00A6rt-1v;
	Mon, 26 Jun 2023 11:37:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso4003492e87.3;
        Mon, 26 Jun 2023 04:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687779448; x=1690371448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jHKe5lG5M490XdynJa/tSmNSdNOnKPsg3CzhJJHwz24=;
        b=C5GlRe75uQd4OzstdlmX6YmpNA8Oqp5MN9SMk34uTEBTGxK9CPbEKj8UiayB9vrukO
         Ao4Oq1hg7Qnh7nar2N60o3uP67d8a9SFi2uYTEtrDLHIEy2oB0KhC7yl/M90BRDQxaYj
         wXbQ/Mf8vN8MOXBQmhMcJoGrnklJBtgRF2wFJvS/xX6+0xiWcV7KBQeG6IanSzzF8QcE
         T8G6j1mwMY/TOvItXw0vw+02zHd/9oMkuFEw34mlbAT85W7N1jh/sWmm5DkMg07ATz+Z
         h0MJei/GZ9oUuACNqAYdh4l0mWAQgHoMidtoAPyFUoDTK7uGpPqf6VXL2aJTdeOaX+vi
         pV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687779448; x=1690371448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHKe5lG5M490XdynJa/tSmNSdNOnKPsg3CzhJJHwz24=;
        b=bXG7vM8hzQmJ4pvI6viuxtfAQDz7VNTu97Bx0gHPCVmO27s0Ymr3yyOKGj2Lm3nZOR
         LJi1yptVvpw7Eo9vZbJIFRGeghhULKrd1erbBqwk5CS+VhsIl6nJ+aLOb56jCcAM8XKf
         rniw3Jb3tEPH+FZfVIJwy9OEFkujCOulyjOJ0pNL2MEAhTUveBziSeACWqQNcRmrYpsl
         +2hixG2ntiIgKVjABpD0j71G7nmKVP9fyrMZoPZ5Q6Jppdxxnj29ss7Vqxz2Yzx/iVdf
         DqWar67JsW/xfsThgMPp2NHaVwzn1CyMaxkSDAcrwj4cfZcN15Jcax7TFAk6VGAjdWt9
         sh2A==
X-Gm-Message-State: AC+VfDyQUIa9BeF7mZ7P5UZBqmLz9IAaiWLEBxAXwFb17TE1S8BnJbjZ
	2ZwOTO3FEMFI3//aLTjL5rpOzuJNZfk=
X-Google-Smtp-Source: ACHHUZ6Bi52qruhzhSDdUIjI8u9Fo8/QT9NApiTypTcfMPX0B4+OgUL9UMyJRN/uFTg4JMbdA9HUIA==
X-Received: by 2002:a05:6512:23a4:b0:4fb:18f4:4cd4 with SMTP id c36-20020a05651223a400b004fb18f44cd4mr2195631lfv.55.1687779448264;
        Mon, 26 Jun 2023 04:37:28 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id y24-20020ac24478000000b004f64fb058f7sm1064349lfl.225.2023.06.26.04.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 04:37:27 -0700 (PDT)
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
Subject: [PATCH V2] dt-bindings: nvmem: fixed-cell: add compatible for MAC cells
Date: Mon, 26 Jun 2023 13:37:16 +0200
Message-Id: <20230626113716.17674-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_043732_655256_E87F427B 
X-CRM114-Status: GOOD (  16.05  )
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
ZWQ6IFsgY29tcGF0aWJsZSBdCi0tLQogLi4uL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQt
Y2VsbC55YW1sICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwogLi4uL2JpbmRpbmdzL252bWVt
L2xheW91dHMvZml4ZWQtbGF5b3V0LnlhbWwgIHwgMTIgKysrKysrKysrCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sICAgICAgfCAgNSArKystCiAzIGZpbGVzIGNoYW5n
ZWQsIDQyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1jZWxsLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1j
ZWxsLnlhbWwKaW5kZXggZTY5ODA5ODQ1MGUxLi4wMzZhOWVkODg4OTMgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL2ZpeGVkLWNlbGwu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0
cy9maXhlZC1jZWxsLnlhbWwKQEAgLTExLDYgKzExLDE1IEBAIG1haW50YWluZXJzOgogICAtIFNy
aW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KIAogcHJv
cGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBvbmVPZjoKKyAgICAgIC0gY29uc3Q6IG1hYy1i
YXNlCisgICAgICAgIGRlc2NyaXB0aW9uOiA+CisgICAgICAgICAgQ2VsbCB3aXRoIGJhc2UgTUFD
IGFkZHJlc3MgdG8gYmUgdXNlZCBmb3IgY2FsY3VsYXRpbmcgZXh0cmEgcmVsYXRpdmUKKyAgICAg
ICAgICBhZGRyZXNzZXMuCisgICAgICAgICAgSXQgY2FuIGJlIHN0b3JlZCBpbiBhIHBsYWluIGJp
bmFyeSBmb3JtYXQgKGNlbGwgbGVuZ3RoIDEyKSBvciBhcyBhbgorICAgICAgICAgIEFTQ0lJIHRl
eHQgbGlrZSAiMDA6MTE6MjI6MzM6NDQ6NTUiIChjZWxsIGxlbmd0aCAxNykuCisKICAgcmVnOgog
ICAgIG1heEl0ZW1zOiAxCiAKQEAgLTI1LDYgKzM0LDIzIEBAIHByb3BlcnRpZXM6CiAgICAgICAg
IGRlc2NyaXB0aW9uOgogICAgICAgICAgIFNpemUgaW4gYml0IHdpdGhpbiB0aGUgYWRkcmVzcyBy
YW5nZSBzcGVjaWZpZWQgYnkgcmVnLgogCithbGxPZjoKKyAgLSBpZjoKKyAgICAgIHJlcXVpcmVk
OiBbIGNvbXBhdGlibGUgXQorICAgIHRoZW46CisgICAgICBpZjoKKyAgICAgICAgcHJvcGVydGll
czoKKyAgICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgICAgY29udGFpbnM6CisgICAgICAg
ICAgICAgIGNvbnN0OiBtYWMtYmFzZQorICAgICAgdGhlbjoKKyAgICAgICAgcHJvcGVydGllczoK
KyAgICAgICAgICAiI252bWVtLWNlbGwtY2VsbHMiOgorICAgICAgICAgICAgZGVzY3JpcHRpb246
IFRoZSBmaXJzdCBhcmd1bWVudCBpcyBhIE1BQyBhZGRyZXNzIG9mZnNldC4KKyAgICAgICAgICAg
IGNvbnN0OiAxCisgICAgICAgIHJlcXVpcmVkOgorICAgICAgICAgIC0gIiNudm1lbS1jZWxsLWNl
bGxzIgorCiByZXF1aXJlZDoKICAgLSByZWcKIApkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0LnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy9maXhlZC1sYXlvdXQu
eWFtbAppbmRleCBjMjcxNTM3ZDA3MTQuLmIzYTA5ZTg4NjRmMSAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvZml4ZWQtbGF5b3V0Lnlh
bWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMv
Zml4ZWQtbGF5b3V0LnlhbWwKQEAgLTQ0LDYgKzQ0LDE4IEBAIGV4YW1wbGVzOgogICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CiAKKyAgICAg
ICAgbWFjQDEwMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1hYy1iYXNlIjsKKyAgICAg
ICAgICAgIHJlZyA9IDwweDEwMCAweGM+OworICAgICAgICAgICAgI252bWVtLWNlbGwtY2VsbHMg
PSA8MT47CisgICAgICAgIH07CisKKyAgICAgICAgbWFjQDExMCB7CisgICAgICAgICAgICBjb21w
YXRpYmxlID0gIm1hYy1iYXNlIjsKKyAgICAgICAgICAgIHJlZyA9IDwweDExMCAweDExPjsKKyAg
ICAgICAgICAgICNudm1lbS1jZWxsLWNlbGxzID0gPDE+OworICAgICAgICB9OworCiAgICAgICAg
IGNhbGlicmF0aW9uQDQwMDAgewogICAgICAgICAgICAgcmVnID0gPDB4NDAwMCAweDEwMD47CiAg
ICAgICAgIH07CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bnZtZW0vbnZtZW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS9udm1lbS55YW1sCmluZGV4IDk4MDI0NDEwMDY5MC4uOWY5MjFkOTQwMTQyIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFtbAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFtbApAQCAt
NDksNyArNDksMTAgQEAgcHJvcGVydGllczoKIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAiQFswLTlh
LWZdKygsWzAtN10pPyQiOgogICAgIHR5cGU6IG9iamVjdAotICAgICRyZWY6IGxheW91dHMvZml4
ZWQtY2VsbC55YW1sCisgICAgYWxsT2Y6CisgICAgICAtICRyZWY6IGxheW91dHMvZml4ZWQtY2Vs
bC55YW1sCisgICAgICAtIHByb3BlcnRpZXM6CisgICAgICAgICAgY29tcGF0aWJsZTogZmFsc2UK
ICAgICBkZXByZWNhdGVkOiB0cnVlCiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCi0tIAoy
LjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
