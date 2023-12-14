Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5929C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 15:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+E4CNLZX73tn+odrMBo3Ut0QjHRTezUxNRQ44QCoQg=; b=Fqxj6FUGbc1jkS
	vGLdmdSK7j+E1lWKW4ohgjVhZvGegHh+3g/Om1y9NhY6h7D709pYQsNftx1oypO2V+usoCKXV2m5l
	iSKrfq+qP4keKkYpRJTFIJTH9Nx37ksn3VKILAmCQy4MOlyLVhXXU3+FqiewA2IqbPnALJwy976Va
	9PyATo4CkvCHasl+ZiwYOQ/6M7jeTBP8rvWw3hcbHAVA5GACdeiX32XKn0uKrjtBx7GJ8VeWHpuV8
	VOaBQl7nAjwIdntQBnFGDQVJ08DUjLrFOGstVW36xs65AuONmjlWHPmMn19r/6O619uCPLFPbnoG6
	kEZ7ueKKFHOS0jj2vPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDnlJ-000gls-3A;
	Thu, 14 Dec 2023 15:36:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDnlH-000gku-0j;
	Thu, 14 Dec 2023 15:36:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-551d5cd1c5fso1525115a12.0;
        Thu, 14 Dec 2023 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702568187; x=1703172987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7aoTw4OzsLC4RfHyhEqd9IMSyhLj1y7UIdS2DuMa/Jw=;
        b=B9tCwqByBChQ5jROW6U324bkqykJKk+V4JQcnLkx1J6fngWbAC3GDprEzuQNuDmdLD
         JfsH2Qk9kfl+RGeKFIMAe0PPuEMWAj1qLvT2CVh2uPSlJoozBfBmRIXKunEXhpGifkN1
         rYjf7FJldjyoYCoYaqCmJdd8R9Fe6W4AmQPlZfFN+DBrYOA2Dxf2mda8UmZdpTRS6aFy
         JcPSSRgAqUqOWlaU81FuVtPTbqJcD0r4pyCso0rfeBqYynZQlKz3BzzjYzkNIGLe23SV
         FUrKOOvQOx28wu/Mn8ywW50q5Wz0XCWoRDvfcegNN70HIcl7elcytrLdj0QhTQ/C5TB5
         PtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568187; x=1703172987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aoTw4OzsLC4RfHyhEqd9IMSyhLj1y7UIdS2DuMa/Jw=;
        b=WRVh/IuebzkHg7+Fg1w0gRL24RbxmB7by0ml5LJpyw3/TJ3mvYkFMEbfN1ROagk8LX
         7pOao3Gk1kOoJBdG+u2PzyEf/2TZFF84oFL3BaSEtoFJIutQqqHllsK6dVr6+QLiH93B
         umq1XjNz7o50FZetfnQ2TDb6tKwfYMxYMggXux17Cv4L+KkEmr8CgPPcMfohfW4AXc/Q
         sojIi1FXCNB3Ysq8hdijcu+9LYhKt7o3ASuERBC0IZsue2pXwQ06nEuiZoycpQU+VjEh
         rO1Cqg1bGY30Ls9IlU8dMFfyLs8Pf5T0XwcXwaDDdw4rJJ6AHYOXhc42zaP7OC06t8nH
         wFYg==
X-Gm-Message-State: AOJu0YzXD7fevDJUwnKOFyWa+RTQDgACe7ot5ipCBy0Ym5nlVlV1bAu3
	r0fgANgk/Wseu9mH4w/kKORm06LHYEg=
X-Google-Smtp-Source: AGHT+IGpJEjbt5Kw87AvVHEmj7Sqpfrh6cn5IZWW6q5OWiB43w0Gdk/CJyr7aaNhgpvuSEwj4xh7tw==
X-Received: by 2002:a50:9f4e:0:b0:551:c796:78d0 with SMTP id b72-20020a509f4e000000b00551c79678d0mr3884602edf.27.1702568187199;
        Thu, 14 Dec 2023 07:36:27 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id fd1-20020a056402388100b0055265d5f3c6sm910575edb.24.2023.12.14.07.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:36:26 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC] dt-bindings: nvmem: u-boot,env: add any-name MAC cells compatible
Date: Thu, 14 Dec 2023 16:36:20 +0100
Message-Id: <20231214153620.23998-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_073631_269694_A56F6C4A 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKU28gZmFyIHdlIGhhZCBh
IHByb3BlcnR5IGZvciAiZXRoYWRkciIgTlZNRU0gY2VsbCBjb250YWluaW5nIGJhc2UKRXRoZXJu
ZXQgTUFDIGFkZHJlc3MuIFRoZSBwcm9ibGVtIGlzIHZlbmRvcnMgb2Z0ZW4gcGljayBub24tc3Rh
bmRhcmQKbmFtZXMgZm9yIHN0b3JpbmcgTUFDKHMpIChvdGhlciB0aGFuICJldGhhZGRyIikuIEEg
ZmV3IG5hbWVzIHdlcmUKbm90aWNlZCBvdmVyIHllYXJzOgoxLiAid2FuYWRkciIgKEVkaW1heCwg
RUxFQ09NLCBFbkdlbml1cywgSS1PIERBVEEsIFNpdGVjb20pCjIuICJldDFtYWNhZGRyIiAoQVNV
UykKMy4gImV0aDFhZGRyIiAoQnVmZmFsbykKNC4gImF0aGFkZHIiIChFbkdlbml1cykKNS4gImJh
c2VNQUMiIChOZXRnZWFyKQo2LiAibWFjIiAoTmV0Z2VhcikKNy4gIm1hY19hZGRyIiAoTW94YSkK
YW5kIG1vcmUgKCJIV19MQU5fTUFDIiwgIkhXX1dBTl9NQUMiLCAiSU5JQ19NQUNfQUREUiIsICJM
QU5fTUFDX0FERFIiLAoiUkFESU9BRERSMCIsICJSQURJT0FERFIxIiwgIldBTl9NQUNfQUREUiIs
ICJsYW4xX21hY19hZGRyIiwgIndhbm1hYyIsCiJ3bWFjMSIsICJ3bWFjMiIpLgoKSXQgZG9lc24n
dCBtYWtlIHNlbnNlIHRvIGFkZCBwcm9wZXJ0eSBmb3IgZXZlcnkgcG9zc2libGUgTUFDIGNlbGwg
bmFtZS4KSW5zdGVhZCBhbGxvdyBzcGVjaWZ5aW5nIGNlbGxzIHdpdGggIm1hYyIgY29tcGF0aWJs
ZS4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0t
Ckxpc3Qgb2YgZGV2aWNlcyBhbmQgdGhlaXIgVS1Cb290IE1BQyB2YXJpYWJsZXM6CmFscGhhbmV0
d29ya3MsYXNsNTYwMjYpIHdhbm1hYwphc3VzLHJ0LWFjNjVwKSBldDFtYWNhZGRyCmFzdXMscnQt
YWM4NXApIGV0MW1hY2FkZHIKYmVsa2luLGY5azExMDl2MSkgSFdfV0FOX01BQyArIEhXX0xBTl9N
QUMgCmJ1ZmZhbG8sbHMyMjBkZSkgZXRoMWFkZHIKYnVmZmFsbyxsczQyMWRlKSBldGgxYWRkcgpj
aGVja3BvaW50LGwtNTApIGxhbjFfbWFjX2FkZHIKZG92YWRvLHRpbnktYWMpIElOSUNfTUFDX0FE
RFIKZG92YWRvLHRpbnktYWMpIExBTl9NQUNfQUREUiArIFdBTl9NQUNfQUREUgplZGltYXgscmEy
MXMpIHdhbmFkZHIKZWRpbWF4LHJnMjFzKSB3YW5hZGRyCmVsZWNvbSx3cmMtMjUzM2doYmstaSkg
d2FuYWRkcgplbGVjb20sd3JjLTI1MzNnaGJrMi10KSB3YW5hZGRyCmVuZ2VuaXVzLGVjYjEyMDAp
IGF0aGFkZHIKZW5nZW5pdXMsZWNiMTc1MCkgYXRoYWRkcgplbmdlbml1cyxlcGc1MDAwKSB3YW5h
ZGRyCmVuZ2VuaXVzLGVwZzYwMCkgd2FuYWRkcgplbmdlbml1cyxlc3IxMjAwKSB3YW5hZGRyCmVu
Z2VuaXVzLGVzcjE3NTApIHdhbmFkZHIKZW5nZW5pdXMsZXNyNjAwKSB3YW5hZGRyCmVuZ2VuaXVz
LGVzcjYwMGgpIHdhbmFkZHIKZW5nZW5pdXMsZXNyOTAwKSB3YW5hZGRyCmVudGVyYXN5cyx3cy1h
cDM3MDVpKSBSQURJT0FERFIwICsgUkFESU9BRERSMQppb2RhdGEsd24tYWMxMTY3ZGdyKSB3YW5h
ZGRyCmlvZGF0YSx3bi1hYzExNjdncikgd2FuYWRkcgppb2RhdGEsd24tYWMxNjAwZGdyKSB3YW5h
ZGRyCmlvZGF0YSx3bi1hYzE2MDBkZ3IyKSB3YW5hZGRyCmlvZGF0YSx3bi1hYzczM2dyMykgd2Fu
YWRkcgppb2RhdGEsd24tYWczMDBkZ3IpIHdhbmFkZHIKaW9kYXRhLHducHIyNjAwZykgd2FuYWRk
cgptb3hhLGF3ay0xMTM3YykgbWFjX2FkZHIKbmV0Z2Vhcix3YXgyMjApIG1hYwpuZXRnZWFyLHdu
ZGFwNjIwKSBiYXNlTUFDCm5ldGdlYXIsd25kYXA2NjApIGJhc2VNQUMKb2NlZG8scGFuZGEpIHdt
YWMxICsgd21hYzIKc2l0ZWNvbSx3bHItNzEwMCkgd2FuYWRkcgpzaXRlY29tLHdsci04MTAwKSB3
YW5hZGRyCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sIHwg
MzMgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1i
b290LGVudi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3Ut
Ym9vdCxlbnYueWFtbAppbmRleCAwMDA2ZjAyMmQwYWYuLjY4MjE0Yjk2ZjVjOSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFt
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVu
di55YW1sCkBAIC02Nyw2ICs2NywzNCBAQCBwcm9wZXJ0aWVzOgogICAgICAgICBkZXNjcmlwdGlv
bjogVGhlIGZpcnN0IGFyZ3VtZW50IGlzIGEgTUFDIGFkZHJlc3Mgb2Zmc2V0LgogICAgICAgICBj
b25zdDogMQogCitwYXR0ZXJuUHJvcGVydGllczoKKyAgIi4qIjoKKyAgICBhbGxPZjoKKyAgICAg
IC0gaWY6CisgICAgICAgICAgdHlwZTogb2JqZWN0CisgICAgICAgIHRoZW46CisgICAgICAgICAg
cHJvcGVydGllczoKKyAgICAgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgICAgIGVudW06
CisgICAgICAgICAgICAgICAgLSBtYWMKKyAgICAgIC0gaWY6CisgICAgICAgICAgcHJvcGVydGll
czoKKyAgICAgICAgICAgIGNvbXBhdGlibGU6CisgICAgICAgICAgICAgIGNvbnRhaW5zOgorICAg
ICAgICAgICAgICAgIGNvbnN0OiBtYWMKKyAgICAgICAgdGhlbjoKKyAgICAgICAgICBkZXNjcmlw
dGlvbjoKKyAgICAgICAgICAgIEV0aGVybmV0IGludGVyZmFjZXMgYmFzZSBNQUMgYWRkcmVzcy4K
KworICAgICAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICAgICBjb21wYXRpYmxlOiB0cnVlCisK
KyAgICAgICAgICAgICIjbnZtZW0tY2VsbC1jZWxscyI6CisgICAgICAgICAgICAgIGRlc2NyaXB0
aW9uOiBUaGUgZmlyc3QgYXJndW1lbnQgaXMgYSBNQUMgYWRkcmVzcyBvZmZzZXQuCisgICAgICAg
ICAgICAgIGNvbnN0OiAxCisKKyAgICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UK
KwogYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgpAQCAtOTAsNiArMTE4
LDExIEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgbWFjOiBldGhhZGRyIHsKICAgICAgICAgICAg
ICAgICAjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKICAgICAgICAgICAgIH07CisKKyAgICAgICAg
ICAgIHdhbmFkZHIgeworICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWFjIjsKKyAgICAg
ICAgICAgICAgICAjbnZtZW0tY2VsbC1jZWxscyA9IDwxPjsKKyAgICAgICAgICAgIH07CiAgICAg
ICAgIH07CiAgICAgfTsKICAgLSB8Ci0tIAoyLjM1LjMKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
