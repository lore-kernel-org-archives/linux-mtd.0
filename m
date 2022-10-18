Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581F9C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dzi6ogN0l14t3twJae2qUPL3Ndz/fW3SgtC9fSBo17c=; b=XaO7uAU5qlXx0w
	nnFgFjMb33/d4m4K9ZGz9b2IhS/CNtDc8bHHmMPTmEj0N7vD67aiSIyi5zPjBzPURDsr9cjcJ0GUG
	NNLE1eh1dicVwI8rDhefdrYD5Vgig6Y8c8UoynPvgsvJ1S3ipO4fwonRRu6ILMwPziJl6HfYqVGOq
	N91RNSIFwu+1cTfjUC77NeXI5EYRGmcf3Or9YTuNI77f6nzjYpVnoyx0oz/UwetxiUt2oGchMbITL
	EplC+lVksnp12FZ94CIgjqDXOBurWxS3m3Xn+GK4DDdXr0eLhboJGlmbhpirm7zVRY1+hmCRDPpT9
	cTOvHjoMh5CT+KPnhF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okojq-007r6T-9l; Tue, 18 Oct 2022 15:42:42 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okojJ-007qbp-6h; Tue, 18 Oct 2022 15:42:10 +0000
Received: by mail-ej1-x62c.google.com with SMTP id d26so33190174eje.10;
        Tue, 18 Oct 2022 08:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b56rtWITDRxSLrlOSl1k6NFsHhuMjl+yg3dnUWpYOLI=;
        b=Hsg3mAtjQpvoO0pLzprhW7xgoGOGI9zwrr5XD4snsU4F2F19updt3nOKcLraXbNufg
         6bi+WVZzw1OfNhBMm7czC2GVw6NQtKcSmH4HY4zHXL0ZxhAueBJOUTBxD50dEyLL3cp3
         4vgWY9G0/R2YvmWhUjhEUohttuigcFXKnhaa014/PoXwR2Kv+oqqYEF8t1s9rvQ++zk0
         6uEdLi8wSZnJXHHhkqm68CAEhVaphljOS6vR8l4GOGttnFCyREdcHlUVPDBPpIpFHevw
         A/SMRbUmPd674Kgf7FSdbZNDrSvOTBHItZwssZwhHj0e2L4byCwUgXx0kCLc+uXBYIgt
         SU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b56rtWITDRxSLrlOSl1k6NFsHhuMjl+yg3dnUWpYOLI=;
        b=Yci4qNQ2F43eg3olKB2ll1maw/g3c05CefkvHi5JlN+c1WphthDU+4AHnSbVp/8v9C
         MnejmYN6IysxsmwGHwTWDa5Ww2U4/XzAhjaYvHMUjrkeOCA34t2HmoTT7iRniMt6nHxf
         i5a4/Eiup6gDImPzww60OoK5v4kon9mO7agRQ6v2jeyGZkASYIFf6S+jPjdks3t0L2O9
         mkFHhYG0lezL3A0hP/r+EyLI0kA54OaupvxEvMvy4IahBcJrbDENKwY7tWK1lGkfHcFH
         LMlNXGOIstwO8A5wsXP8+LyKHE4Dd4ccccyVWFUDA7NKC3J4y4DHlj7UdsxaK9AgbJVC
         K+Ug==
X-Gm-Message-State: ACrzQf3vCMozuKDGB9nM4Wti41Yj/F1mrUEqe/3Fg+jhBsiGVQwwGnTY
	66cwmXKVJ9c5Ikr5kHNHk4A=
X-Google-Smtp-Source: AMsMyM57XmcuD6x6f8mMwGeCzHow4jOYB0F/F3dru7OTMGAvTwEL8rc+fx9SaF+nUXUGB7wEaLBR9Q==
X-Received: by 2002:a17:907:72d2:b0:78d:4c16:a68d with SMTP id du18-20020a17090772d200b0078d4c16a68dmr2949288ejc.401.1666107726858;
        Tue, 18 Oct 2022 08:42:06 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id c18-20020a170906925200b0078dd2f9357fsm7751636ejx.89.2022.10.18.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:42:06 -0700 (PDT)
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
Subject: [PATCH V3 1/2] dt-bindings: mtd: partitions: u-boot: allow dynamic subpartitions
Date: Tue, 18 Oct 2022 17:42:01 +0200
Message-Id: <20221018154202.4634-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_084209_315732_938DDFF2 
X-CRM114-Status: GOOD (  10.55  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVS1Cb290IHBhcnRpdGlv
biBtYXkgY29udGFpbiBzdWJwYXJ0aXRpb25zLiBGb3IgZXhhbXBsZSBCcm9hZGNvbQppbmNsdWRl
cyBlbnZpcm9ubWVudCBkYXRhIGJsb2NrIGluIHRoZSBtaWRkbGUgb2YgaXRzIFUtQm9vdCBwYXJ0
aXRpb24uCgpUaGlzIGFsbG93cyBkZXNjcmliaW5nIEJyb2FkY29tJ3MgVS1Cb290IGVudiBkYXRh
IGFuZCB3aWxsIGFsbG93CnJlZmVyZW5jaW5nIGl0cyBOVk1FTSBjZWxsIGluIHRoZSBmdXR1cmUu
CgpSZWc6IDExOGYzZmJlNTE3ZjQgKCJkdC1iaW5kaW5nczogbXRkOiBwYXJ0aXRpb25zOiBzdXBw
b3J0IGxhYmVsL25hbWUgb25seSBwYXJ0aXRpb24iKQpSZWY6IGRkNjM4MjAyZGZiNjUgKCJkdC1i
aW5kaW5nczogbXRkOiBwYXJ0aXRpb25zOiBhZGQgYWRkaXRpb25hbCBleGFtcGxlIGZvciBxY29t
LHNtZW0tcGFydCIpClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KLS0tClYzOiBBZGQgdGhpcyBwYXRjaCBhcyBwcmUtcmVxdWlyZW1lbnQgZm9yIHUtYm9v
dCxlbnYueWFtbCAmIGJyY20sZW52Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvdS1ib290LnlhbWwgICAgICAgICB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy91LWJvb3QueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91LWJvb3QueWFtbAppbmRleCA4YTg4ZTdkMTY1
MjQuLjNjNTZlZmU0OGVmZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL3UtYm9vdC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91LWJvb3QueWFtbApAQCAtMjcsNiArMjcs
MTAgQEAgcHJvcGVydGllczoKICAgICAgICAgICBCcm9hZGNvbSBzdG9yZXMgZW52aXJvbm1lbnQg
dmFyaWFibGVzIGluc2lkZSBhIFUtQm9vdCBwYXJ0aXRpb24uIFRoZXkKICAgICAgICAgICBjYW4g
YmUgaWRlbnRpZmllZCBieSBhIGN1c3RvbSBoZWFkZXIgd2l0aCBtYWdpYyB2YWx1ZS4KIAorcGF0
dGVyblByb3BlcnRpZXM6CisgICJecGFydGl0aW9uLS4qJCI6CisgICAgJHJlZjogcGFydGl0aW9u
LnlhbWwjCisKIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKIAogZXhhbXBsZXM6CkBAIC00
MCw2ICs0NCw5IEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJicmNtLHUt
Ym9vdCI7CiAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MTAwMDAwPjsKICAgICAgICAgICAgIGxh
YmVsID0gInUtYm9vdCI7CisKKyAgICAgICAgICAgIHBhcnRpdGlvbi11LWJvb3QtZW52IHsKKyAg
ICAgICAgICAgIH07CiAgICAgICAgIH07CiAKICAgICAgICAgcGFydGl0aW9uQDEwMDAwMCB7Ci0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
