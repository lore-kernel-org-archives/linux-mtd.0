Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DCBC46CD8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grsKtFi6c9rLhIVk/zRWYOBWnGaQcB3LX/Ht/50qWNI=; b=uErW5LdbRtulLQ
	vzeNbjIHzPCbjsu93eGlG9ca+TGZkk2Jdz8Dkox9aarmdPtTrgWb6tyRh/yUSp9ouNN2ILfWdyPY8
	T9aOY5Ctx4aQREcGfGioC1UgH3rjth8XPwvlkweHqTwaXSpd5SMhcTZdVF604zjBr09JupIGVqprI
	SRYExzjrYaFTmAw2DbnZCIInzgzfJNUJcPlarUIDc5S5i5D2FBOvUvkSaCq4Ucp+VT2inWHbzIWVR
	xwETn1r4x2WB34ZrAWF1D1landgPFqeuYXIY63NGhShx8onk0RPmtizRRu9q89TtVgA9T9gN0cblC
	i+t9PMniD1YzUXTfpUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwO-003g2E-2q;
	Thu, 21 Dec 2023 17:34:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGMwL-003fzJ-24;
	Thu, 21 Dec 2023 17:34:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a2339262835so118136066b.3;
        Thu, 21 Dec 2023 09:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703180070; x=1703784870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUAvVSVhxfpG8xQnwKnlglz0LVM7Vn2JPxTl2XGCxyQ=;
        b=m6M2Q2uSKNNGKU9yn05ky6pD9L7oQo8MRW4tmFhL5Lya6zG1Q1BkKUycsVhx8aTLEw
         zO3PEGc/pxK/CjiFkoItFj6lb/IoLFUVyTRJc7oXVUIkxD2NJQIjnJiB4xyZfe6iDdI1
         W1clnhb6KNMdnfPtddQ3WDpsEVFcWn2N8rGWVtmdnzvIbX851fnAF3DIDOjpZdgxpMdm
         ypuw0YU5nD0QES0z8NY47BtN7XZFF4WZ8ZoiShjyFeX1bakM3Dc4CmUF4ctKAkxKtNj1
         xqvojMoLuiAowOl/ZZVgON7k/BRzCHXu6WUxpGDPjd6S25386YNvMPxx7fML/+Fh6PJG
         dLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703180070; x=1703784870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUAvVSVhxfpG8xQnwKnlglz0LVM7Vn2JPxTl2XGCxyQ=;
        b=V+o4LDTqOU9bsmwdPOMoXhfTAGhO4VWuzl8bxdnnpC35mA98Ryp0RoxvjcurGOVdAe
         dtdtw6ot59bShcJxvLJfymwnPuC0aQ/pgmJAEmfCeX9nGJ+aY+ELEyoncjztDo4HTVXv
         JLnGW69Aqb8b981AEQh/5847RwjLGCwW6dA+9FrLV2Ux8loy5kK1E4Hj163y77wZVLV3
         A1EckyrQRywK9mYXb7Wzol8e2uAegb98rHhrUax/N6JEiX8pyBNOhPR3TZuCPeT8XRX7
         cV5pvrjqM3JjpuGvyHKEV7ZLf2lZCz4oXy49DDhzy+bBvHAZQCPNw1XMcqiAkJVBBaG+
         hTKQ==
X-Gm-Message-State: AOJu0Yw0Nix+Jwf1dpA5FtUjkWtjuErNzjlF8d0psVieH+RWuM6PZIoS
	Hdq6GA9aKckPp7tN/jpUbR8=
X-Google-Smtp-Source: AGHT+IFhvgdzoX/pSzYG9L+mNveigbIiVGhQYxcEzlqMYOH+0jGOj+DcvcKDRwemDM4HbX3utBRWiA==
X-Received: by 2002:a17:906:1db:b0:a26:8c3a:5133 with SMTP id 27-20020a17090601db00b00a268c3a5133mr61852ejj.99.1703180069801;
        Thu, 21 Dec 2023 09:34:29 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709060ad900b00a23499f1d7dsm1176118ejf.209.2023.12.21.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 09:34:29 -0800 (PST)
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
Subject: [PATCH V3 1/6] dt-bindings: nvmem: layouts: add U-Boot environment variables layout
Date: Thu, 21 Dec 2023 18:34:16 +0100
Message-Id: <20231221173421.13737-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_093433_690751_0975DF0D 
X-CRM114-Status: GOOD (  16.71  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVS1Cb290IGVudiBkYXRh
IGlzIGEgd2F5IG9mIHN0b3JpbmcgZmlybXdhcmUgdmFyaWFibGVzLiBJdCdzIGEgZm9ybWF0CnRo
YXQgY2FuIGJlIHVzZWQgb2YgdG9wIG9mIHZhcmlvdXMgc3RvcmFnZSBkZXZpY2VzLiBJdHMgYmlu
ZGluZyBzaG91bGQKYmUgYW4gTlZNRU0gbGF5b3V0IGluc3RlYWQgb2YgYSBzdGFuZGFsb25lIGRl
dmljZS4KClRoaXMgcGF0Y2ggYWRkcyBsYXlvdXQgYmluZGluZyB3aGljaCBhbGxvd3MgdXNpbmcg
aXQgb24gdG9wIG9mIE1URCBOVk1FTQpkZXZpY2UgYXMgd2VsbCBhcyBhbnkgb3RoZXIuIEF0IHRo
ZSBzYW1lIHRpbWUgaXQgZGVwcmVjYXRlcyB0aGUgb2xkCmNvbWJpbmVkIGJpbmRpbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQpWMjogQWRk
ICItbGF5b3V0IiBzdWZmaXggdG8gY29tcGF0aWJsZXMgdG8gYXZvaWQgY29uZmxpY3QKCiAuLi4v
bnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LWxheW91dC55YW1sICAgICAgfCA1NSArKysrKysrKysr
KysrKysrKysrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwg
fCAgNiArKwogMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2xheW91dHMvdS1i
b290LGVudi1sYXlvdXQueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9sYXlvdXRzL3UtYm9vdCxlbnYtbGF5b3V0LnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbGF5b3V0cy91LWJvb3QsZW52LWxheW91
dC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uM2I0ZDhmMmE0
NGUxCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L252bWVtL2xheW91dHMvdS1ib290LGVudi1sYXlvdXQueWFtbApAQCAtMCwwICsxLDU1IEBACisj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZQorJVlBTUwg
MS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vbGF5b3V0
cy91LWJvb3QsZW52LWxheW91dC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBOVk1FTSBsYXlvdXQgb2YgVS1Cb290
IGVudmlyb25tZW50IHZhcmlhYmxlcworCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+CisKK2Rlc2NyaXB0aW9uOgorICBVLUJvb3QgdXNlcyBlbnZp
cm9ubWVudCB2YXJpYWJsZXMgdG8gc3RvcmUgZGV2aWNlIHBhcmFtZXRlcnMgYW5kCisgIGNvbmZp
Z3VyYXRpb24uIFRoZXkgbWF5IGJlIHVzZWQgZm9yIGJvb3RpbmcgcHJvY2Vzcywgc2V0dXAgb3Ig
a2VlcGluZyBlbmQgdXNlcgorICBpbmZvLgorCisgIERhdGEgaXMgc3RvcmVkIHVzaW5nIFUtQm9v
dCBzcGVjaWZpYyBmb3JtYXRzICh2YXJpYW50IHNwZWNpZmljIGhlYWRlciBhbmQgTlVMCisgIHNl
cGFyYXRlZCBrZXktdmFsdWUgcGFpcnMpLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgor
ICAgIG9uZU9mOgorICAgICAgLSBkZXNjcmlwdGlvbjogQSBzdGFuZGFsb25lIGVudiBkYXRhIGJs
b2NrCisgICAgICAgIGNvbnN0OiB1LWJvb3QsZW52LWxheW91dAorICAgICAgLSBkZXNjcmlwdGlv
bjogVHdvIHJlZHVuZGFudCBibG9ja3Mgd2l0aCBhY3RpdmUgb25lIGZsYWdnZWQKKyAgICAgICAg
Y29uc3Q6IHUtYm9vdCxlbnYtcmVkdW5kYW50LWJvb2wtbGF5b3V0CisgICAgICAtIGRlc2NyaXB0
aW9uOiBUd28gcmVkdW5kYW50IGJsb2NrcyB3aXRoIGFjdGl2ZSBoYXZpbmcgaGlnaGVyIGNvdW50
ZXIKKyAgICAgICAgY29uc3Q6IHUtYm9vdCxlbnYtcmVkdW5kYW50LWNvdW50LWxheW91dAorICAg
ICAgLSBkZXNjcmlwdGlvbjogQnJvYWRjb20ncyB2YXJpYW50IHdpdGggY3VzdG9tIGhlYWRlcgor
ICAgICAgICBjb25zdDogYnJjbSxlbnYtbGF5b3V0CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgcGFydGl0aW9ucyB7CisgICAgICAgIGNvbXBh
dGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKKworICAgICAgICBwYXJ0aXRpb25AMCB7Cisg
ICAgICAgICAgICByZWcgPSA8MHgwIDB4NDAwMDA+OworICAgICAgICAgICAgbGFiZWwgPSAidS1i
b290IjsKKyAgICAgICAgICAgIHJlYWQtb25seTsKKyAgICAgICAgfTsKKworICAgICAgICBwYXJ0
aXRpb25ANDAwMDAgeworICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAgMHgxMDAwMD47CisgICAg
ICAgICAgICBsYWJlbCA9ICJ1LWJvb3QtZW52IjsKKworICAgICAgICAgICAgbnZtZW0tbGF5b3V0
IHsKKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxlbnYtbGF5b3V0IjsKKyAg
ICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCmluZGV4IDljMzZh
ZmM3MDg0Yi4uNmMyYTNjYTVmMDUxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKQEAgLTI2LDkgKzI2LDE1IEBA
IGRlc2NyaXB0aW9uOiB8CiAKICAgVmFyaWFibGVzIGNhbiBiZSBkZWZpbmVkIGFzIE5WTUVNIGRl
dmljZSBzdWJub2Rlcy4KIAorICBJbnRyb2R1Y3Rpb24gb2YgTlZNRU0gbGF5b3V0cyBleHBvc2Vk
IGEgbGltaXRhdGlvbiBvZiB0aGlzIGJpbmRpbmcgZGVzaWduLgorICBEZXNjcmlwdGlvbiBvZiBO
Vk1FTSBkYXRhIGNvbnRlbnQgc2hvdWxkIGJlIHNlcGFyYXRlZCBmcm9tIE5WTUVNIGRldmljZXMu
CisgIFNpbmNlIHRoZSBpbnRyb2R1Y3Rpb24gb2YgVS1Cb290IGVudiBkYXRhIGxheW91dCB0aGlz
IGJpbmRpbmcgaXMgZGVwcmVjYXRlZC4KKwogbWFpbnRhaW5lcnM6CiAgIC0gUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgogCitkZXByZWNhdGVkOiB0cnVlCisKIHByb3BlcnRpZXM6
CiAgIGNvbXBhdGlibGU6CiAgICAgb25lT2Y6Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
