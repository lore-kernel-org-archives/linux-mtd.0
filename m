Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A507C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Oct 2022 05:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DNfH6VgJImyhjN5cFuQ9f/4zrQZIl/fPvTV8Bs4/88Y=; b=POFKejF4KsYo9H
	BaoHBP6Lqok4T6LVtKitqKpl5NKW0ZzNOi846xHnuM6qahaDUkcrEREVNA9F+lnQfDBWpazZEZSxd
	DFrChcNhN8Z4k9kplZ8mOGySU9TipjiERoKiGuF6f5E/vCRQcvchTCAOznfT4p629R86rImingkLt
	zMUC6VcAuut15G6Cp9j4qdVi1KoqOSKSOlm0hQDQ/QuzO9LSxoMJ42kVze7Y+nZh7+mfepJFZStAA
	07W37Tq55Xb93KM6mis6F8SxdKioMcgYlYvzuYWQM04f5WXzk+ARpXm4wsZogpbX3t6romgsC8zuF
	QQct3B18y5Um+2NgE5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiTvO-006qf0-1e; Wed, 12 Oct 2022 05:04:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiTvJ-006qdi-PZ; Wed, 12 Oct 2022 05:04:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id d26so28498702eje.10;
        Tue, 11 Oct 2022 22:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4gqOMlbs92RCL0Ysa0hqvx+eg7bHJri4dGP4mEDs80=;
        b=cJUhVLawvPYnZ9EBQKO2ZunzswCUf0WgRMNrdFYyJSDxGMvjCa/g8En72Mpfq9/NLJ
         43+7hdQs2dYfAoY6UVpPNe6B88XhsXdl3+MfRmv63MbgMv9Db3CnfYdot3NItEt7QIgr
         jlRUbWsGVsFJqWySvdK7RsvxeCobwKrsOp79o+meRag767brfRUjYSGLPFA+Xk7JE2tv
         4n8ZutrzXMjR4NPqoVVUSfBYaH/Iz7zHIgKQmKw+W0u7GO4HkuMDqTCwc7OlccFljX39
         Ju2S0+fy9trH/lcATN8gznvLBX4eDkt4CmMU3taHDqxrgP9jmXJx0VmfC9p2FdJYSip6
         9l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4gqOMlbs92RCL0Ysa0hqvx+eg7bHJri4dGP4mEDs80=;
        b=sqkRLjkxxLdgjLHtcCjZbPLshx7s9GJi9ecVxq8tJjFaq+tXcysJSnFV13PkV12OkJ
         oW/H16PufaQF3I3JH5I7lEVFTyVPolnGpy48T675HxEJNenJ8VyaLLkj+ARqe+A+VFDV
         CGCb5jJby08PGRIrI1TWkMPp54mV7CVwluNHC2I7Os2qAZIwUc1gsJu2sjGuPZwuCjMb
         NkWAcZs7ri951gk8cpn/bb5ELso3kJS+oD0cHD8cdK+aST3itv8gAKIij4gJ2PuNHtSH
         GlYQPb0kEPC3h8gO6XA6zTQPQLn8kWOUiLO/z+ratuYu9P3IKP2cj+/2EkSc6BaVJow9
         n7GQ==
X-Gm-Message-State: ACrzQf2xtsocWEL86I+l9cJItu4gZPZVWYv31rCerQmILxEmT9XTxjRX
	n/8A3MPS72itAorpK1xXv2I=
X-Google-Smtp-Source: AMsMyM7Lv6eqNKd0zzmTCV0Vwpt7bAhdY4jQSyF4I6uECSsPSAvnrM2zb69LyIb7/S7cGh1DCosPfw==
X-Received: by 2002:a17:907:3d9f:b0:787:8706:6885 with SMTP id he31-20020a1709073d9f00b0078787066885mr21163698ejc.280.1665551090072;
        Tue, 11 Oct 2022 22:04:50 -0700 (PDT)
Received: from localhost.lan ([194.187.74.233])
        by smtp.gmail.com with ESMTPSA id e11-20020a170906314b00b0073ddb2eff27sm573916eje.167.2022.10.11.22.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 22:04:49 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	bcm-kernel-feedback-list@broadcom.com,
	John Crispin <john@phrozen.org>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date: Wed, 12 Oct 2022 07:04:41 +0200
Message-Id: <20221012050442.6815-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_220453_857362_F4A6D905 
X-CRM114-Status: GOOD (  14.70  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTW9zdCBUUC1MaW5rIGhv
bWUgcm91dGVycyB1c2UgdGhlIHNhbWUgcGFydGl0aW9uaW5nIHN5c3RlbSBiYXNlZCBvbiBhCmN1
c3RvbSBBU0NJSSB0YWJsZS4KCkl0IGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGFueSBvZmZpY2lhbCBu
YW1lLiBHUEwgc291cmNlcyBjb250YWluIHRvb2wKbmFtZWQgc2ltcGx5ICJtYWtlX2ZsYXNoIiBh
bmQgTWFrZWZpbGUgdGFyZ2V0ICJGbGFzaE1ha2VyIi4KClRoaXMgcGFydGl0aW9ucyB0YWJsZSBm
b3JtYXQgd2FzIGZpcnN0IGZvdW5kIGluIGRldmljZXMgd2l0aCBhIGN1c3RvbQpTYWZlTG9hZGVy
IGJvb3Rsb2FkZXIgc28gaXQgd2FzIGNhbGxlZCBTYWZlTG9hZGVyIGJ5IGEgY29tbXVuaXR5LiBM
YXRlcgppdCB3YXMgcG9ydGVkIHRvIG90aGVyIGJvb3Rsb2FkZXJzIGJ1dCBpdCBzZWVtcyB0aGUg
bmFtZSBzdGlja2VkLgoKQWRkIGJpbmRpbmcgZm9yIGRlc2NyaWJpbmcgZmxhc2hlcyB3aXRoIFNh
ZmVMb2FkZXIgcGFydGl0aW9ucyB0YWJsZS4gSXQKYWxsb3dzIG9wZXJhdGluZyBzeXN0ZW1zIHRv
IHBhcnNlIGl0IHByb3Blcmx5IGFuZCByZWdpc3RlciBwcm9wZXIgZmxhc2gKbGF5b3V0LgoKU2ln
bmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KVjI6IEZp
eCB0eXBvIGluIGNvbW1pdDogcy9zYW1lL25hbWUvCi0tLQogLi4uL3RwbGluayxzYWZlbG9hZGVy
LXBhcnRpdGlvbnMueWFtbCAgICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXIt
cGFydGl0aW9ucy55YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL3RwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy90cGxpbmss
c2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5lMzhhYWVhNWFhMTEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFy
dGl0aW9ucy55YW1sCkBAIC0wLDAgKzEsNDQgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL3RwbGluayxzYWZlbG9hZGVy
LXBhcnRpdGlvbnMueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIworCit0aXRsZTogVFAtTGluayBTYWZlTG9hZGVyIHBhcnRpdGlvbnMK
KworZGVzY3JpcHRpb246IHwKKyAgVFAtTGluayBob21lIHJvdXRlcnMgc3RvcmUgdmFyaW91cyBk
YXRhIG9uIGZsYXNoIChlLmcuIGJvb3Rsb2FkZXIsCisgIGZsYXNoIGxheW91dCwgZmlybXdhcmUs
IHByb2R1Y3QgaW5mbywgY29uZmlndXJhdGlvbiwgY2FsaWJyYXRpb24KKyAgZGF0YSkuIFRoYXQg
cmVxdWlyZXMgZmxhc2ggcGFydGl0aW9uaW5nLgorCisgIEZsYXNoIHNwYWNlIGxheW91dCBvZiBU
UC1MaW5rIGRldmljZXMgaXMgc3RvcmVkIG9uIGZsYXNoIGl0c2VsZiB1c2luZworICBhIGN1c3Rv
bSBBU0NJSS1iYXNlZCBmb3JtYXQuIFRoYXQgZm9ybWF0IHdhcyBmaXJzdCBmb3VuZCBpbiBUUC1M
aW5rCisgIGRldmljZXMgd2l0aCBhIGN1c3RvbSBTYWZlTG9hZGVyIGJvb3Rsb2FkZXIuIExhdGVy
IGl0IHdhcyBhZGFwdGVkIHRvCisgIENGRSBhbmQgVS1Cb290IGJvb3Rsb2FkZXJzLgorCisgIFRo
aXMgYmluZGluZyBkZXNjcmliZXMgcGFydGl0aW9uaW5nIG1ldGhvZCBhbmQgZGVmaW5lcyBvZmZz
ZXQgb2YgQVNDSUkKKyAgYmFzZWQgcGFydGl0aW9ucyB0YWJsZS4gVGhhdCBvZmZzZXQgaXMgcGlj
a2VkIGF0IG1hbnVmYWN0dXJpbmcgcHJvY2VzcworICBhbmQgZG9lc24ndCBjaGFuZ2UuCisKK21h
aW50YWluZXJzOgorICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KKworcHJv
cGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogdHBsaW5rLHNhZmVsb2FkZXItcGFy
dGl0aW9ucworCisgIHBhcnRpdGlvbnMtdGFibGUtb2Zmc2V0OgorICAgIGRlc2NyaXB0aW9uOiBG
bGFzaCBvZmZzZXQgb2YgcGFydGl0aW9ucyB0YWJsZQorICAgICRyZWY6ICIvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIiCisKK3JlcXVpcmVkOgorICAtIHBhcnRpdGlvbnMt
dGFibGUtb2Zmc2V0CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoK
KyAgLSB8CisgICAgcGFydGl0aW9ucyB7CisgICAgICAgIGNvbXBhdGlibGUgPSAidHBsaW5rLHNh
ZmVsb2FkZXItcGFydGl0aW9ucyI7CisgICAgICAgIHBhcnRpdGlvbnMtdGFibGUtb2Zmc2V0ID0g
PDB4MTAwMDAwPjsKKyAgICB9OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
