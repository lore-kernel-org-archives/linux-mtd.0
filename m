Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB334C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Oct 2022 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pmw9Z5mcSk3FTExD2JR2WtSUsls1SbCV+EVeSn7AbE=; b=NlQWkT42Ye/+uk
	f/TjwgMqJP0MlUCg1A9Aztl8rJFxBiNJ7ZzFC8mUKh2Og9jCiPI8pkFTmHxmvr856w/TVXEwQQfzi
	5+xPX1S7YRqw4J8CAW/iPd24gOrM7jfHrmx5yUNle6LeUTk5AyzDkx22eBmP1TqDtp39HergV2Mi0
	v6M5paEfl49V4LqRIvtWY6gGsXaUPp4E5hJhRpVMoIWQ6brrSugAiY/lSPPVFmmWF/dy+MBYMvGBF
	ok51rxorhjKTTjmpKpzmzubOq7ZCgQrB8g+bowTzalY3Uje2Ral/++GI1FgluCXznlGsPJTdBi+f+
	CvHbbLsKu2sPUvA+RNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC79-003wAa-AM; Tue, 11 Oct 2022 10:03:55 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiC74-003w93-Bw; Tue, 11 Oct 2022 10:03:52 +0000
Received: by mail-ed1-x535.google.com with SMTP id v12so1086924edc.6;
        Tue, 11 Oct 2022 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBTq8juooIuTyFEgcmEOyFqiiRaMLuXlIjzIJ8KmLsg=;
        b=aO0GB03LHXSuLYJGS55fnpkD2vkTt9JCLtPGOIoCVfhsLwESgpJ8TF392ivbhl1UN+
         ThHtE59bPTEM1CF8WTIjdMG/59+hWeoFpJlftp40fpQhKZc84ix5kiWAWLNY3UyXOKsW
         CHwh2C6PlDWk3xTLRQd+A0WIUwxiiVMoh4Ojg9qNMkxfYbBxdvWyFNNKYE6JtB+SGQKf
         35091AOyYmVzYX2i3F/OIlYt30uLedwCbEKgZSHHVefZC7GF0WQ8omDb1YnqfUICED4y
         IHXfqnjhf+Dnbikgl2la4mqKdpiV/1yCpz5RVqiw707zZIIbk3swbMJEbSo9sVGHI+Vv
         pTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBTq8juooIuTyFEgcmEOyFqiiRaMLuXlIjzIJ8KmLsg=;
        b=nhvRB+grCkTxBKzrDyOlwHBm/Hu4dZGLKXS2uDQ+FCZS1wVx0kIevmAoPR/5XypQtI
         339ITVD2jE17aRsDrO1tKaMnBnUOEwzL+vfMXNzgEZ+oO8Z9hbZsy3ZZdGRxxI5IBw1U
         4Nf+GA6tOO+O2/MSA4BgHVpaJ5wUl5FnGK3Y/mbi4zrG6iMiZYxMIud2fNfi1Y2NQuln
         MiXat9eR+1tMgQZhrz3f3SQW0zn3XK7NScBhCfEqbltjmcULB7QSmHznoHj7xnbRsBkW
         qql4Xlj3vHz06py61RvQgB+tHJuEQhlE9enXFUrke9g99CL/j2pk0j7mfH9a+L4v/7rF
         mbBQ==
X-Gm-Message-State: ACrzQf1GDsBpJWceQiSXXOVoYvI0RSSfWsi7TQSbbPUGZ0NI5qoAipd4
	rnHna0pQfb5ogUmSTcnCrPY=
X-Google-Smtp-Source: AMsMyM55d8xMOD3wN0672qkNZ4P9Yy7UfT7+bZky+xgDImbk2OZtM06DaBFO+uQYWYEX6NMLgQakVQ==
X-Received: by 2002:a05:6402:2146:b0:458:15d7:b99a with SMTP id bq6-20020a056402214600b0045815d7b99amr22290831edb.24.1665482626964;
        Tue, 11 Oct 2022 03:03:46 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o8-20020a170906768800b00780ab5a9116sm4597749ejm.211.2022.10.11.03.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:03:46 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: mtd: partitions: add TP-Link SafeLoader layout
Date: Tue, 11 Oct 2022 12:03:32 +0200
Message-Id: <20221011100333.32536-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_030350_433179_922A6CF3 
X-CRM114-Status: GOOD (  14.46  )
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
c2FtZSBzdGlja2VkLgoKQWRkIGJpbmRpbmcgZm9yIGRlc2NyaWJpbmcgZmxhc2hlcyB3aXRoIFNh
ZmVMb2FkZXIgcGFydGl0aW9ucyB0YWJsZS4gSXQKYWxsb3dzIG9wZXJhdGluZyBzeXN0ZW1zIHRv
IHBhcnNlIGl0IHByb3Blcmx5IGFuZCByZWdpc3RlciBwcm9wZXIgZmxhc2gKbGF5b3V0LgoKU2ln
bmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIC4uLi90
cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwgICAgICAgICB8IDQ0ICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3Rw
bGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy90cGxpbmssc2FmZWxvYWRlci1w
YXJ0aXRpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTM4YWFlYTVhYTExCi0tLSAvZGV2L251bGwKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3RwbGlu
ayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMueWFtbApAQCAtMCwwICsxLDQ0IEBACisjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIK
Ky0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvcGFydGl0aW9ucy90
cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFRQLUxpbmsgU2FmZUxv
YWRlciBwYXJ0aXRpb25zCisKK2Rlc2NyaXB0aW9uOiB8CisgIFRQLUxpbmsgaG9tZSByb3V0ZXJz
IHN0b3JlIHZhcmlvdXMgZGF0YSBvbiBmbGFzaCAoZS5nLiBib290bG9hZGVyLAorICBmbGFzaCBs
YXlvdXQsIGZpcm13YXJlLCBwcm9kdWN0IGluZm8sIGNvbmZpZ3VyYXRpb24sIGNhbGlicmF0aW9u
CisgIGRhdGEpLiBUaGF0IHJlcXVpcmVzIGZsYXNoIHBhcnRpdGlvbmluZy4KKworICBGbGFzaCBz
cGFjZSBsYXlvdXQgb2YgVFAtTGluayBkZXZpY2VzIGlzIHN0b3JlZCBvbiBmbGFzaCBpdHNlbGYg
dXNpbmcKKyAgYSBjdXN0b20gQVNDSUktYmFzZWQgZm9ybWF0LiBUaGF0IGZvcm1hdCB3YXMgZmly
c3QgZm91bmQgaW4gVFAtTGluaworICBkZXZpY2VzIHdpdGggYSBjdXN0b20gU2FmZUxvYWRlciBi
b290bG9hZGVyLiBMYXRlciBpdCB3YXMgYWRhcHRlZCB0bworICBDRkUgYW5kIFUtQm9vdCBib290
bG9hZGVycy4KKworICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVzIHBhcnRpdGlvbmluZyBtZXRob2Qg
YW5kIGRlZmluZXMgb2Zmc2V0IG9mIEFTQ0lJCisgIGJhc2VkIHBhcnRpdGlvbnMgdGFibGUuIFRo
YXQgb2Zmc2V0IGlzIHBpY2tlZCBhdCBtYW51ZmFjdHVyaW5nIHByb2Nlc3MKKyAgYW5kIGRvZXNu
J3QgY2hhbmdlLgorCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IHRwbGlu
ayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMKKworICBwYXJ0aXRpb25zLXRhYmxlLW9mZnNldDoKKyAg
ICBkZXNjcmlwdGlvbjogRmxhc2ggb2Zmc2V0IG9mIHBhcnRpdGlvbnMgdGFibGUKKyAgICAkcmVm
OiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyIgorCityZXF1aXJlZDoK
KyAgLSBwYXJ0aXRpb25zLXRhYmxlLW9mZnNldAorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIHBhcnRpdGlvbnMgeworICAgICAgICBjb21wYXRp
YmxlID0gInRwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMiOworICAgICAgICBwYXJ0aXRpb25z
LXRhYmxlLW9mZnNldCA9IDwweDEwMDAwMD47CisgICAgfTsKLS0gCjIuMzQuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
