Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8541C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 14:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A1060F6B
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 14:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70A1060F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q3foR/sYlXkGgq+K0D1LWZEaq8DA2O6fGill6orE0oY=; b=jDw3MwSPjWem8iEngpTmtEbtHV
	/3+CciQOsvMHwpnjv87Gkzdkvc+JWuw80+mQPALXACOmvrEpeyI9R2XQAAnzp61t0sOBIJeI3ua04
	T3Q/za2Qm0XlHhBjKv5Mjki5QlIIxQtJsI8Ru1eXExZTI2sPHi108jqITXRUN9GG8s34ZS3k9UUVD
	cFbdGENUwHk2ThhvRf50G1bufMX4kSypSrpMRTJaPm0N2CupY8XDVLsbEbl9OXSAhOJRjSATisyx2
	5ExcQC/uNIOgub5YUXcYPwTSPRXlgQjSaBwPWiAK64Tqbu+dvrtFZeRLnUuGLEoDGb1YsjqOwz8P8
	LYIVMvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZDlR-005j6Z-L2; Sat, 09 Oct 2021 14:55:53 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZDlP-005j5Y-Az
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 14:55:52 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9973E3FFD9
 for <linux-mtd@lists.infradead.org>; Sat,  9 Oct 2021 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633791349;
 bh=OR65H5NuMBUvU2gGs2fbaIk23M5ThHLMaMsBl/nMMeE=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=X8s5bP3dPwgnCYY8DcG2lpQWPZky70UyhHFcGncpP68I6axnQcdXH8LeL1hVSfO4S
 dd+O7WGAnxBUlcOTCuk+4HLEKYr3+G8qEYwXg3ccMfZ/BRFPRSOtCkWo5Y82nZDvHP
 bZrzcWPiWweA1goxXdQUr3qxu7oCGAmYGK9hTaJhvJXkInv6Vohudxg+1i9uNH/9af
 eZ2PekMvRuzBMR6KbfIw3qo0cA53mF/eLnPznmC7naZkWnkAY+N6hZ3RfHoN+g6rxY
 Bg4mpdjue4SaFaAeiUryyMlLXZnALUO+DsVnT408wBNnrlqrZAqsZymsjyQzYaX8dE
 UkwxBhtxV+S7w==
Received: by mail-ed1-f71.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so11774121edi.19
 for <linux-mtd@lists.infradead.org>; Sat, 09 Oct 2021 07:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OR65H5NuMBUvU2gGs2fbaIk23M5ThHLMaMsBl/nMMeE=;
 b=shf1VItwsce11bpATkTo3kPZeJRyFdRKfUbOAY1Y3wM1l0EUMeCnPcHitBrCkci8Ib
 tWVD+HPMOIYS4FdhB8wR6597/Pcl3gLqwbgrNEav/zU4Pgzcv1niKI3m1zuCtfXOjq2M
 oBTj8thDN5t4UZhkgNh1A13vGF4Uj8n0Y7uNgNHLb+CYB3birXyEM8Ghz9t5nRWevlY1
 PgN79cegaGcx/DckRejo/sMPJsU9SbB+aMFk1oGuWEbUoDIRuPbfqeejJmL1XysTy1wd
 9qvcGm0x3qfjpUYHG2JckcxZ3C5C+ighRjfbfNeqPNdoC521L3nV3Y5NDau5I0QY6JLR
 NnHw==
X-Gm-Message-State: AOAM530NNXB+NR6hJQ1T2wekCRVPT7//qP3ljOLOdnb7ov4H1jdi1Fvm
 HJw7vJ+EcVbHvknQ2NJdcdv18+XLXiCs7gooINbwLLq3ePqBdwP34KLc44AzkL4I1Yx5wfJxFmG
 o1XX1CgzZAmU5i/X1se2jYf007AiIjrLJfECxgLppxkQ=
X-Received: by 2002:a17:906:85d1:: with SMTP id
 i17mr12344761ejy.489.1633791349360; 
 Sat, 09 Oct 2021 07:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysZic929Uxw8JYpz7WzFewFmKc77x3gZ5rU/zJ0CZ4rD4WUO5T09DI1UO8d+VtTaHPd4U6Pw==
X-Received: by 2002:a17:906:85d1:: with SMTP id
 i17mr12344735ejy.489.1633791349134; 
 Sat, 09 Oct 2021 07:55:49 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id r19sm1303981edt.54.2021.10.09.07.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 07:55:48 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com, nsekhar@ti.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
Date: Sat, 9 Oct 2021 16:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_075551_544052_E6E273AB 
X-CRM114-Status: GOOD (  14.28  )
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

T24gMDgvMTAvMjAyMSAyMToxMCwgUm9nZXIgUXVhZHJvcyB3cm90ZToKPiBLcnp5c3p0b2YsCj4g
Cj4gT24gMDcvMTAvMjAyMSAyMDozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24g
MDcvMTAvMjAyMSAxNDowOCwgUm9nZXIgUXVhZHJvcyB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IFRo
aXMgc2VyaWVzIGNvbnZlcnRzIHRpLGdwbWMgbWVtb3J5IGNvbnRyb2xsZXIgYW5kIHRpLGdwbWMt
bmFuZCBhbmQKPj4+IHRpLGdwbWMtb25lbmFuZCBNVEQgY29udHJvbGxlciBiaW5kaW5ncyB0byB5
YW1sLgo+Pj4KPj4+IGNoZWVycywKPj4+IC1yb2dlcgo+Pj4KPj4KPj4gSGksCj4+Cj4+IEFsdGhv
dWdoIHlvdSBkaWQgbm90IG1lbnRpb24gaXQgaGVyZSwgaXQgbG9va3MgbGlrZSB5b3UgaGF2ZSBz
b21lCj4+IGRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZSBwYXRjaGVzLiBNYXliZSB0aGlzIHNoYWxs
IGdvIHNpbXBseSB2aWEgUm9iJ3MgdHJlZT8KPj4KPiAKPiBSb2IgaGFzIGFja2VkIGFsbCB0aGUg
RFQgYmluZGluZyBwYXRjaGVzLgo+IFNvIGl0IGlzIHVwdG8geW91IGFuZCBNaXF1w6hsIHRvIGRl
Y2lkZSB0aGUgYmVzdCB3YXkuIE1URCB0cmVlIG9yIE1lbW9yeSBjb250cm9sbGVyIHRyZWUKPiBm
b3IgdGhlIGR0LWJpbmRpbmdzIHBhdGNoZXMuCj4gCj4gVGhlIEFSTTogZHRzIGNoYW5nZXMgc2hv
dWxkIGdvIHZpYSBUb255J3MgT01BUCBTb0MgdHJlZS4KPiAKPiBPciBpZiBUb255IGlzIE9LIHdp
dGggaXQgdGhlbiBtYXliZSBhbGwgcGF0Y2hlcyBjYW4gZ28gdmlhIFRvbnkncyB0cmVlPyA6KQo+
IAoKCkkgcmV2aWV3ZWQgdGhlIHR3byBtZW1vcnktY29udHJvbGxlciBwYXRjaGVzLCBzbyBmZWVs
IGZyZWUgdG8gdGFrZSB0aGVtCnZpYSBNVEQgb3IgT01BUCBTb0MuCgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
