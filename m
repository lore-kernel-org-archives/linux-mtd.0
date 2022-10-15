Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5EFC433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Oct 2022 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nqEDSFFBsLS/xsdy5cOHWl6DWp53sRb4D2iaPJy380Y=; b=jIxoSuqMEAcbER
	XWD11WU4dYiLSPKVObajha5xuueaEpjn160004kIGupNX5u5YmT+MXjsHXgTaFzJWBKw7eI9xzx8o
	DtQ5908wDMhLLPE/H5MgN/eN6Hsf9/fmUZmhqeK7tNyzwDgLZ1PoiLtKfgo24FC0Z1/osmWWk9d2a
	g0ezqYC+cM+x9F1InW6w1FKfmoxI9+choKpiSr/FVb8GuwMryKchlhW+N0XYJM3lmnDawllCwEt4F
	YSWaFsapYeFmJq6PzrcY4+iVDaS2n6SoXu3cxyWHmbBmJiNQO9wWnK7hLw0+wUDzsroppwLKFnz90
	Fdzo3CBGkoVESGBs4GPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojdUV-00Ghc1-JX; Sat, 15 Oct 2022 09:29:59 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojdUT-00GhbV-27; Sat, 15 Oct 2022 09:29:58 +0000
Received: by mail-ed1-x52b.google.com with SMTP id l22so9769565edj.5;
        Sat, 15 Oct 2022 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YdzYzQPczOob4IO3pFuC56rrjAxpW/32RTAW6DZMbmw=;
        b=ScPcjlScG/12Dzm1gMutsJyhlbXrRHcQe5LoFTVzEPNAlIgbKfw9jTLOOJjsoXYvxt
         cPdraLACd90IvK/7cIXd1ehw6DDI9lqLttV27FM/coh5tUDubXuvdft3QygshnghsPJk
         NVmk56mAzQr5l4+f58oxFwggXQ0xeRI0Bo72u9UZqNjJ4J+ClZWT6t1SW89xKXm8wiLm
         IatFqAJvlBq2UiVl0pBZwvdJ9h7m0Xlgs7YYIlbKPlrv36WyK1uHFO06fRt0pl94zZ8Y
         AxtdlX0heYM5nbTOQvRzd0Z8PcDYY+LZCwtuPz7wGwiwJUw3xmc4tWQM8tPLCaXApzkQ
         nEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdzYzQPczOob4IO3pFuC56rrjAxpW/32RTAW6DZMbmw=;
        b=Mn1epLEDpogz2bUgrFvTENb4wgByhekxb5h4b4HALa1k7TY4nnzgDhAI3lt5+u9GPn
         nDB8a5GNEb2mhj5xFL+F/FJKq1adxRhQAlM7II5UBJR37Y+3Uw2VNKrVrdN9T0jaCRp0
         AZY+UDUvxVAtZzyHZP4kLHhDM4Ywy1mugtPTIicGZruktWg8iJy35kwXj9+3lkc6NXhX
         aiMcqze2xsv7O/LTZpmX2KY/ALe24r0kwPSqdXlvFRU4RWi/6MnpL/gKBoyxNKqoa34T
         k30gzknAp6grp/jenc6rg0+hiDznkW2gbqc5sHpWCsGk2frOS0kty15vIKFe33rB7Xr+
         A1AA==
X-Gm-Message-State: ACrzQf2lNK4lS2Ez8dpZuyZcjLhqJPcavOWhX2KckhqUu7+AORbtMx7I
	B8IT3bsOS2t3pUk0WDaiVOQ=
X-Google-Smtp-Source: AMsMyM72A/OQ5F+l11gRXWkiD/asNwXE5n0HCwpwa1VFlMvtIR/rNH0GO5v33NsnX6lqLOgY95iJVQ==
X-Received: by 2002:aa7:c40b:0:b0:45d:4492:a8cb with SMTP id j11-20020aa7c40b000000b0045d4492a8cbmr1575750edq.217.1665826195174;
        Sat, 15 Oct 2022 02:29:55 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709060b4500b0073d6093ac93sm2919033ejg.16.2022.10.15.02.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 02:29:54 -0700 (PDT)
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
Subject: [PATCH V3 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date: Sat, 15 Oct 2022 11:29:49 +0200
Message-Id: <20221015092950.27467-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_022957_145407_7C1B93EE 
X-CRM114-Status: GOOD (  15.07  )
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
eCB0eXBvIGluIGNvbW1pdDogcy9zYW1lL25hbWUvClYzOiBEcm9wIHF1b3RlcyBmcm9tICRyZWYK
ICAgIERlc2NyaWJlIGZsYXNoIHNwYWNlIGNvdmVyYWdlICYgcGFydGl0aW9ucyB0eXBlcyBpbiB0
aGUgYmluZGluZwogICAgU2VlIGNvbW1pdCBib2R5IG9mIFBBVENIIDIvMiBmb3IgcmVhbCBsaWZl
IGV4YW1wbGUKLS0tCiAuLi4vdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sICAgICAg
ICAgfCA0OSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy90cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
dHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3RwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMu
eWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjYzZTU5NmFhMGNh
MwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy90cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwKQEAgLTAsMCAr
MSw0OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sIworJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3Rp
dGxlOiBUUC1MaW5rIFNhZmVMb2FkZXIgcGFydGl0aW9ucworCitkZXNjcmlwdGlvbjogfAorICBU
UC1MaW5rIGhvbWUgcm91dGVycyBzdG9yZSB2YXJpb3VzIGRhdGEgb24gZmxhc2ggKGUuZy4gYm9v
dGxvYWRlciwKKyAgZmxhc2ggbGF5b3V0LCBmaXJtd2FyZSwgcHJvZHVjdCBpbmZvLCBjb25maWd1
cmF0aW9uLCBjYWxpYnJhdGlvbgorICBkYXRhKS4gVGhhdCByZXF1aXJlcyBmbGFzaCBwYXJ0aXRp
b25pbmcuCisKKyAgRmxhc2ggc3BhY2UgbGF5b3V0IG9mIFRQLUxpbmsgZGV2aWNlcyBpcyBzdG9y
ZWQgb24gZmxhc2ggaXRzZWxmIHVzaW5nCisgIGEgY3VzdG9tIEFTQ0lJLWJhc2VkIGZvcm1hdC4g
VGhhdCBmb3JtYXQgd2FzIGZpcnN0IGZvdW5kIGluIFRQLUxpbmsKKyAgZGV2aWNlcyB3aXRoIGEg
Y3VzdG9tIFNhZmVMb2FkZXIgYm9vdGxvYWRlci4gTGF0ZXIgaXQgd2FzIGFkYXB0ZWQgdG8KKyAg
Q0ZFIGFuZCBVLUJvb3QgYm9vdGxvYWRlcnMuCisKKyAgUGFydGl0aW9ucyBzcGVjaWZpZWQgaW4g
cGFydGl0aW9ucyB0YWJsZSBjb3ZlciB3aG9sZSBmbGFzaCBzcGFjZS4gU29tZQorICBjb250YWlu
IHN0YXRpYyBkYXRhIHRoYXQgc2hvdWxkbid0IGdldCBtb2RpZmllZCAoZGV2aWNlJ3MgTUFDIG9y
IFdpRmkKKyAgY2FsaWJyYXRpb24gZGF0YSkuIE90aGVycyBhcmUgc2VtaS1zdGF0aWMgKGxpa2Ug
a2VybmVsKS4gRmluYWxseSBzb21lCisgIHBhcnRpdGlvbnMgY29udGFpbiBmdWxseSBjaGFuZ2Vh
YmxlIGNvbnRlbnQgKGxpa2Ugcm9vdGZzKS4KKworICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVzIHBh
cnRpdGlvbmluZyBtZXRob2QgYW5kIGRlZmluZXMgb2Zmc2V0IG9mIEFTQ0lJCisgIGJhc2VkIHBh
cnRpdGlvbnMgdGFibGUuIFRoYXQgb2Zmc2V0IGlzIHBpY2tlZCBhdCBtYW51ZmFjdHVyaW5nIHBy
b2Nlc3MKKyAgYW5kIGRvZXNuJ3QgY2hhbmdlLgorCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIg
TWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6
CisgICAgY29uc3Q6IHRwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMKKworICBwYXJ0aXRpb25z
LXRhYmxlLW9mZnNldDoKKyAgICBkZXNjcmlwdGlvbjogRmxhc2ggb2Zmc2V0IG9mIHBhcnRpdGlv
bnMgdGFibGUKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
MzIKKworcmVxdWlyZWQ6CisgIC0gcGFydGl0aW9ucy10YWJsZS1vZmZzZXQKKworYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBwYXJ0aXRpb25zIHsK
KyAgICAgICAgY29tcGF0aWJsZSA9ICJ0cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zIjsKKyAg
ICAgICAgcGFydGl0aW9ucy10YWJsZS1vZmZzZXQgPSA8MHgxMDAwMDA+OworICAgIH07Ci0tIAoy
LjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
