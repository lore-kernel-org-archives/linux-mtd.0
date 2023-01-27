Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549DAC61DA4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pwkgJJVUg2/cwtU3h4ci6noLbRHAv0AjFe6ImPvasKI=; b=w4Z8WeaqtH9eAB
	r7arTMM14sZw89H9yPwACwAXC7PhUJ4oz6O6h805Nqyg2az3f4a6NGgUN1tbvvQKPn2OmKIYhekq6
	xvv6isv3cstsjDJnPpL4nbA1F4I9VHNBOicZeB2wqfVafZ/xfObsFhoaKLmO5a+mQlS1sFI4WUdpU
	xtMbfVn6gC7GEmYwz3X8AkRrzF9ftY9AjB1bB3eoAKctzymD8Ktg5OYSQf0S/4MNFV/aqy1S1/T9K
	CYaK3018Px03tJNeXZM//z7ZYT30bqt4exEH7JwXWNnJ0aQ8KUUixz2gxZRcjNgPyYWxFCH8ngFu8
	VF4oxUX7kD8cDEkDMSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLSzv-00FxjM-HJ; Fri, 27 Jan 2023 17:58:47 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLSzr-00Fxi6-T1; Fri, 27 Jan 2023 17:58:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id m2so15350905ejb.8;
        Fri, 27 Jan 2023 09:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AkTXtXZvSlyW7dhrOhtl54a2x6aLLDzgCZF3MBO2yT4=;
        b=D45urjwlLOqJ5oEWUBgdQkmsYbSjvXmkD1jToywten5PtNhUD9c8awHO3NHAzmQl46
         2Ay7kmFQRTQ8cZlB/KTtUw4eoj7fQiY6CGXuax+YXRwNWSVSiw4757N6Bzx17MKeSu01
         k0IehkZHiqWzWobRDv3JZXtZ9P1YJv/2yildPxCacxYjqdIGstP2wDmIpbjXyE9fpa5s
         nWgSHzL5YwOsqCngAEOjpzySj8hclwm0nOaStOt0f2qt9S/Lo7ONKJyFSQxx8nap4w29
         /WrsHxbyuxSN7wYTpEZKcbmqp9cceq8uzA+byVq4aZffRa2Q/oB/VixxOTb4yuoN/UrI
         kkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkTXtXZvSlyW7dhrOhtl54a2x6aLLDzgCZF3MBO2yT4=;
        b=Tiv6RW4apF7OhdQ7CFhLxkPjg96QfvZ7worE2Et5S1Lv98Dccw9t/iHnxo4/4SKwon
         uEvYu3ON/TUtVyO7z3hAfdJzH0eN0noydpx9Wgj8/8QO7evwKFboL3sZiIj8GBzPSdVn
         cEsHE/YyYY/eZFUTomjMtXiyXUHWOL+baJqSOlUT1/0rKY3QtLtDWSu2BOJHotT0uzYG
         ET7aN5aBRxzO8hR1ZUWyPOsINFmkx70btzhtvTqBqXi2BDl7iroNY6Of3af7IkGhfEZd
         fIe3wYMniE/IWsXAv+aQWvKPeemldv8P5aVXDN81p5afItY1w+NBqgoAyXXLOJJ67hlr
         06+Q==
X-Gm-Message-State: AO0yUKUYEOoF27ogEyKgBKyTbtzbcsIKTTA9y9eVeeIv12l/sb3KTBNS
	jUWx0JDm9lBjWcoyk/8YSyo=
X-Google-Smtp-Source: AK7set9YFRj0WFfdzKw45ndnfLNVXHirfZXQPMiwuSaPd2a9SuM0Yn0MHy2+hb2rKxYyINLcUmX2FA==
X-Received: by 2002:a17:907:c26:b0:878:53a5:70a1 with SMTP id ga38-20020a1709070c2600b0087853a570a1mr10777796ejc.50.1674842321108;
        Fri, 27 Jan 2023 09:58:41 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709067e5600b0087276f66c6asm2600508ejr.115.2023.01.27.09.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 09:58:40 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Walle <michael@walle.cc>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: nvmem: io: new binding for IO accessible NVMEM devices
Date: Fri, 27 Jan 2023 18:58:30 +0100
Message-Id: <20230127175831.26753-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_095843_978097_EF7CA721 
X-CRM114-Status: GOOD (  13.44  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKV2l0aCB0aGUgTlZNRU0g
bGF5b3V0cyBiaW5kaW5nIGluIHBsYWNlIHdlIHNob3VsZCBub3cgdXNlOgoxLiBOVk1FTSBkZXZp
Y2UgYWNjZXNzIGJpbmRpbmdzCjIuIE5WTUVNIGNvbnRlbnQgZGVzY3JpcHRpb24gYmluZGluZ3MK
ClRoaXMgYmluZGluZyBhbGxvd3MgZGVzY3JpYmluZyBOVk1FTSBkZXZpY2VzIHRoYXQgY2FuIGJl
IGFjY2Vzc2VkIHVzaW5nCklPIG1hcHBpbmdzLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVt
L2lvLnlhbWwgICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzNyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL2lvLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vaW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udm1lbS9pby55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uNjdlMGFhZTljZDk0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2lvLnlhbWwKQEAgLTAsMCArMSwzNyBAQAorIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCisl
WUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9udm1lbS9p
by55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCisKK3RpdGxlOiBJTyBhY2Nlc3MgYmFzZWQgTlZNRU0KKworZGVzY3JpcHRpb246IHwK
KyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJlcyBzaW1wbGUgTlZNRU0gZGV2aWNlcyB0aGF0IGNhbiBi
ZSBhY2Nlc3NlZCBieSBzaW1wbHkKKyAgbWFwcGluZyBhIHByZWRlZmluZWQgSU8gYWRkcmVzcy4K
KworICBJdCdzIGEgZ2VuZXJpYyBzb2x1dGlvbiBmb3IgcHJvdmlkaW5nIE5WTUVNIGNvbnRlbnQg
YWNjZXNzLiBUaGUgd2F5IG9mCisgIGhhbmRsaW5nIGFjdHVhbCBjb250ZW50IG1heSBiZSBkZXZp
Y2Ugc3BlY2lmaWMgYW5kIGNhbiBiZSBkZXNjcmliZWQgdXNpbmcgYQorICBwcm9wZXIgbGF5b3V0
LgorCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
CisKK2FsbE9mOgorICAtICRyZWY6IG52bWVtLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBh
dGlibGU6CisgICAgY29uc3Q6IGlvLW52bWVtCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisK
K3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgIG52
bWVtQDEwMDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJpby1udm1lbSI7CisgICAgICAgIHJl
ZyA9IDwweDEwMDAwMDAwIDB4MTAwMDA+OworICAgIH07Ci0tIAoyLjM0LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
