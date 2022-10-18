Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7D6C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO7eGWlXrqXssMpwF2U1H1TDh8CJXSpjpohcXysG6HQ=; b=Qd8Cqrq+v+3Crx
	WGYRVOWH3hceHyXlK+YLe+6urWLr6PqW+dpZXdbZSFPSnavX+OY8qiQbcT2Dj4LR4E7Qt8DB4cAet
	ZiUqNhTIgCt4tq4gWtJwMG5WaxWvLnaV6M4itZxWOrr+YeBGr6q7BCC4DFF6vYx2ZY9A6+5Tiddei
	ZP7yyJYdSzWA0bEtEi1oUyAoBN/D0m5C/A0s8VQ0EpaizxDNEjCjdmDQhVu1FjnEvZDuGM9YCtRgI
	n1fa6Dk25AgVoQcEfx5VH1XYZ+b69SJvp6t0AtOCBuGHSO2g0/VJfgE7pGhmt9UDqBKv817dEc7R3
	lK/vJqkg2vF6D1z/4N+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okolM-007sat-1O; Tue, 18 Oct 2022 15:44:16 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okojO-007qfj-13; Tue, 18 Oct 2022 15:42:15 +0000
Received: by mail-ej1-x62b.google.com with SMTP id d26so33190617eje.10;
        Tue, 18 Oct 2022 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6V4GGutCgqH9SAAugBYUbePwRzXguzjtNw602xA/gE=;
        b=mHm+3pWbcBXYNzpH81/lPhpNc0B5kdPfe11TzAwKplI3MeDt+vueDt94EyEvU1Sp/9
         FG7s+qK49MByuxF/6qySYFNkRnj6YmVQQEE8HHmga3zOcvsVUPoRbh5/mWw2A8h+CosA
         443JPbvEAxAPNq/5WHvZnMihOiVz1OULEPw6NGmo6iRZMTZVReFpSbtdIE/2luLroH3l
         7acYUGPBANPm+bneNLEmYehFT74EjsE/BD5l0SplQu2yBTl0Otb6yxygQGBfyJww9O47
         siGdsYoNyCv6f7moBSe45FPQAvagtdUYy1gQ6hueJSaHwvMavITll5AvKH7uzXQC3EX0
         U8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6V4GGutCgqH9SAAugBYUbePwRzXguzjtNw602xA/gE=;
        b=a2dyZEvtpAoblOUJniGoUq8oeGVVQSk/usOY40+0kpTEvngI8fKAbPJ6VBNEKtE3pn
         ViT5oIrOyLypcV1wS4K6EABS3H4NbQJ6lWY71br4e97DhLIgYpPWeJSPapIBB5HeaOmM
         Bj5Fx287V9wSSKWaLHlLo9OcdL7pFLHGy/YErYrfHDS3ZRjhseqYoh6gIvIBIQ7SI7q3
         3FPuS3Nh3Us+zz8nwqcbekAeb4prQoVefsPPtLXCXynEX7dRyRbstOinKNn3IgybBUFV
         H5dI2pP2aO+2w/JSbc7yV9YeljLTjmH8sUAGZKkSTnr6EiUnmlHtqplqeLSvmA2UvUjj
         UR0w==
X-Gm-Message-State: ACrzQf1yP+iMdDNQXOG1ImQze0jGmdoOZDV7/WclIjm/EFHxI0TmrCuf
	wPT+0fAoaHgwlOrRssDPkW8=
X-Google-Smtp-Source: AMsMyM4aQBhuScJ+Q7RqBmH9Vm86c4qsX+AsD4/jD1J/4RjZSwYFXEPfljnNUP0uP4wvnYZSMzZ1OQ==
X-Received: by 2002:a17:906:9c82:b0:781:5752:4f2b with SMTP id fj2-20020a1709069c8200b0078157524f2bmr2842003ejc.561.1666107730031;
        Tue, 18 Oct 2022 08:42:10 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id c18-20020a170906925200b0078dd2f9357fsm7751636ejx.89.2022.10.18.08.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:42:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tom Rini <trini@konsulko.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Joel Peshkin <joel.peshkin@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	u-boot@lists.denx.de,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 2/2] dt-bindings: nvmem: u-boot,env: add Broadcom's variant binding
Date: Tue, 18 Oct 2022 17:42:02 +0200
Message-Id: <20221018154202.4634-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018154202.4634-1-zajec5@gmail.com>
References: <20221018154202.4634-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_084214_138027_C4DDE143 
X-CRM114-Status: GOOD (  12.26  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQnJvYWRjb20gdXNlcyBV
LUJvb3QgZm9yIGEgbG90IG9mIHRoZWlyIGJjbWJjYSBmYW1pbGl5IGNoaXBzZXRzLiBVLUJvb3QK
c3RvcmVzIGl0cyBjb25maWd1cmF0aW9uIGluIGFuIGVudmlyb25tZW50IGRhdGEgYmxvY2suCgpT
dWNoIGJsb2NrcyBhcmUgdXN1YWxseSBzdG9yZWQgb24gZmxhc2ggYXMgYSBzZXBhcmF0ZWQgcGFy
dGl0aW9uIGF0CmhhcmRjb2RlZCBhZGRyZXNzLiBCcm9hZGNvbSBob3dldmVyIGRlY2lkZWQgdG86
CjEuIFN0b3JlIGVudiBkYXRhIGJsb2NrIGluc2lkZSBVLUJvb3QgcGFydGl0aW9uCjIuIEF2b2lk
IHN0aWNraW5nIHRvIGhhcmRjb2RlZCBvZmZzZXRzCjMuIFVzZSBjdXN0b20gaGVhZGVyIHdpdGgg
InVFbnYiIG1hZ2ljIGFuZCBlbnYgZGF0YSBsZW5ndGgKCkV4YW1wbGUgKGxlbmd0aCAweDQwMDAp
OgokIGhleGR1bXAgLW4gMzIgLUMgLXMgMHg0MDAwMCAvZGV2L210ZGJsb2NrMAowMDA0MDAwMCAg
NzYgNmUgNDUgNzUgMDAgNDAgMDAgMDAgIDM0IDg5IDdhIDgyIDQ5IDRkIDQxIDQ3ICB8dm5FdS5A
Li40LnouSU1BR3wKMDAwNDAwMTAgIDQ1IDNkIDRlIDQxIDRlIDQ0IDNhIDMxICA0ZCAyYyAzMSAz
MCAzMiAzNCA0ZCAwMCAgfEU9TkFORDoxTSwxMDI0TS58CigweDQwMDAwIG9mZnNldCBpcyB1bml0
IHNwZWNpZmljIGFuZCBjYW4gY2hhbmdlKQoKU3RhcnRpbmcgd2l0aCB0aGUgY29tbWl0IDExOGYz
ZmJlNTE3ZjQgKCJkdC1iaW5kaW5nczogbXRkOiBwYXJ0aXRpb25zOgpzdXBwb3J0IGxhYmVsL25h
bWUgb25seSBwYXJ0aXRpb24iKSBEVCBjYW4gZGVzY3JpYmUgcGFydGl0aW9ucyBtYXRjaGluZwp0
aGVtIGJ5IGEgbmFtZSAod2l0aG91dCBzcGVjaWZ5aW5nIGFjdHVhbCBhZGRyZXNzKS4gV2l0aCB0
aGF0IGZlYXR1cmUKYW5kIHRoaXMgYmluZGluZyBjaGFuZ2UgaXQncyBwb3NzaWJsZSB0bzoKMS4g
U3BlY2lmeSBEVCBub2RlIGZvciBCcm9hZGNvbSdzIFUtQm9vdCBlbnYgZGF0YSBzdWJwYXJ0aXRp
b24KMi4gQWRkIG5vZGVzIGZvciBzcGVjaWZpYyBlbnZpcm9ubWVudCBkYXRhIHZhcmlhYmxlcwoz
LiBSZWZlcmVuY2UgdGhlbSBhcyBOVk1FTSBjZWxscwoKVGhpcyBiaW5kaW5nIGlzIHVubGlrZWx5
IHRvIGhlbHAgQnJvYWRjb20ncyBVLUJvb3QuIFUtQm9vdCBTUEwgbmVlZHMgdG8KZmluZCBlbnZp
cm9ubWVudCBkYXRhIGVhcmx5IChiZWZvcmUgaXQgYWNjZXNzZXMgRFRCKSBhbmQgaXQgZG9lcyB0
aGF0IGJ5Cmxvb2tpbmcgZm9yIGFuICJ1RW52IiBtYWdpYy4gRGlydHkgd2F5LgoKVGhpcyBiaW5k
aW5nIGNhbiBob3dldmVyIGJlIHVzZWQgYnkgb3BlcmF0aW5nIHN5c3RlbXMuIEl0IGFsbG93cwpk
ZXNjcmliaW5nIGNsZWFubHkgVS1Cb290LCBpdHMgZW52IGRhdGEgYW5kIHZhcmlhYmxlcy4gSXQg
dGVsbHMKb3BlcmF0aW5nIHN5c3RlbSBhYm91dCBCcm9hZGNvbS1zcGVjaWZpYyBlbnYgZGF0YSBz
byBpdCBjYW4gcGFyc2UgaXQuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFs
QG1pbGVja2kucGw+Ci0tLQpWMjogV29yayBvbiBiZXR0ZXIgY29tbWl0IGJvZHkgJiBhZGQgZXhh
bXBsZQpWMzogQXZvaWQgZHVwbGljYXRlZCAibWFjIiBsYWJlbAotLS0KIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCB8IDIxICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKaW5kZXggZTk2
YmNhOTlmMmQ5Li5jYmM1YzY5ZmQ0MDUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbApAQCAtMzgsNiArMzgsOCBA
QCBwcm9wZXJ0aWVzOgogICAgICAgICBjb25zdDogdS1ib290LGVudi1yZWR1bmRhbnQtYm9vbAog
ICAgICAgLSBkZXNjcmlwdGlvbjogVHdvIHJlZHVuZGFudCBibG9ja3Mgd2l0aCBhY3RpdmUgaGF2
aW5nIGhpZ2hlciBjb3VudGVyCiAgICAgICAgIGNvbnN0OiB1LWJvb3QsZW52LXJlZHVuZGFudC1j
b3VudAorICAgICAgLSBkZXNjcmlwdGlvbjogQnJvYWRjb20ncyB2YXJpYW50IHdpdGggY3VzdG9t
IGhlYWRlcgorICAgICAgICBjb25zdDogYnJjbSxlbnYKIAogICByZWc6CiAgICAgbWF4SXRlbXM6
IDEKQEAgLTczLDMgKzc1LDIyIEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgfTsKICAgICAgICAg
fTsKICAgICB9OworICAtIHwKKyAgICBwYXJ0aXRpb25zIHsKKyAgICAgICAgY29tcGF0aWJsZSA9
ICJmaXhlZC1wYXJ0aXRpb25zIjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAg
ICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHBhcnRpdGlvbkAwIHsKKyAgICAgICAg
ICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+OworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNt
LHUtYm9vdCI7CisgICAgICAgICAgICBsYWJlbCA9ICJ1LWJvb3QiOworCisgICAgICAgICAgICBw
YXJ0aXRpb24tdS1ib290LWVudiB7CisgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNt
LGVudiI7CisKKyAgICAgICAgICAgICAgICBldGhhZGRyIHsKKyAgICAgICAgICAgICAgICB9Owor
ICAgICAgICAgICAgfTsKKyAgICAgICAgfTsKKyAgICB9OwotLSAKMi4zNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
