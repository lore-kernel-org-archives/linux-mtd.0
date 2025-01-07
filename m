Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05545E77188
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jan 2025 00:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmWmeurFYCgpSsua7sCyI/s4l3K6LeglnlzoL+jB1kU=; b=oGjh9VfM+ci0DZ
	OnrEiFjtMecR6X+S2fUWrSXt3m679reFBxaJLFho46dmIX8jPdnwNjLB9o3VWiYVLA0wrQpUCzM4/
	S0NNRAOMuq97wrfXnX1jneQfIxqwL9clsVTHfmxyUjwmUBAuig4ltNRfc3rUuR5I8z9iBhAQPOUja
	chVIqpIlDci0n6vi7N474usb7MQDFOPPpkTgiscNhIzHqMLOZfCa/tsbeyB5ucLpQu24muyE+BeFs
	0/TSqR8CJC0MGB5NZ5BAtoD5HWSrArSO1SNK8iNTPcXV4EJSUgjNRb/9b1BD/e3TjPN66211g8RC7
	Yn+v8eb2LXG/OlYwIx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxXE-0000000332u-1KXX;
	Tue, 07 Jan 2025 00:33:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxUy-000000032kT-1jIG;
	Tue, 07 Jan 2025 00:31:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436249df846so103628095e9.3;
        Mon, 06 Jan 2025 16:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736209866; x=1736814666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13VUHaFiuc4bXuLa2863YA1rYhMMosunQcKMEn7ZyfQ=;
        b=TvEpb2KRvIZgY1UhM7oXhK5d0KjpRvp2LHFjUAg5PlLFn4WYj9+gCG/t/Y0sNbbE7q
         eSnZ2wJUp0/vSklihvBeXM4hzk4AfvKXUye8CW3SyU6YKL6obWpYKoluYMS7WHNifZor
         reDstMiAo3qXEvr3bC6Hqn/Sv0cWw+ugXKkTr24dE6bPL4rIKJ424tgvBggXgwP3TQJ+
         KfYdo5aoj9gRmUeFpIdwlm68l9380RUrPuy+wXc1BX6UARmTFtBUz4Xk2DRCsOLt5k6x
         K9HS6Twt9puoRVGaQuA7IvNY6bmAxLtd3WyQvbmzoPCykksrE/otnhTHKHr9PUVm67FL
         gj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736209866; x=1736814666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13VUHaFiuc4bXuLa2863YA1rYhMMosunQcKMEn7ZyfQ=;
        b=rcjW14O8DqBjO8wF+TCaMiS95pMYZvRtP5i5QaYSCWio2nOwaoFvNl1zEA27o7xGh4
         KE97YP0qYLBvwWi7+0sNz9om77g4e4jwYVYirNHK6EgPvE45abJZdo+4toKSiuyI3EFe
         ssr2kWl6Ti39YYMM/KkhVxVqUrWTlBB4ltEg0t5hDL/zVJUzomxd31ey5d+qCebmavfZ
         FrBt0PkSpsi4+KBw8bIfBEtMDr/OOKv36Es17Ygd44HAzbxBvrNn3SinBTyXy0kIRxVi
         15DbMfZ8Wi+ytZTAHQUVnmNbhW8lA7mr6U+W3aHbBjrqRRR99vgJhQcjgczYgtYSj+F1
         umwA==
X-Forwarded-Encrypted: i=1; AJvYcCWMyNSZBB1xGeRrY4Q3h3AybPJfxqhyGoB1JXCHR4erJCjLWztCs1vrvwfv7FdG+NSRx6VHZrIEvkny@lists.infradead.org, AJvYcCXa+8lZTcCgw2Urpz5PscKO8ZH4HJwU1rmo0/SbqJCLU/bTlXMFQkl7cw1DFUgbJFFw4j6mNSss1hwsft+kkA72@lists.infradead.org
X-Gm-Message-State: AOJu0YwOdSTpPlfrC0CV33h7KflbvmCO1aM5zOQ2DpP3s+hJe+3fLxyC
	3C+3enRB4HIvsv2Gz7R0INJFUHSqpIjw+gkQAVJqCD1TR8rUwmo1
X-Gm-Gg: ASbGncuMtrx8hFT4zM7urinf8UC3qfZntWs7znYKHbw0AxSbokNiDMBXZUKhLl9DnBW
	SfJ+HW0jrQQxDNRdq3dIxvuuyYhhFKJ6DLEFV8mrmgeYqxPkNgVDB3QlA4buTowOOmqbuSOLCUu
	hYN5cGbgAgz0LkBHGpfv0u/6Jll/wiEQA6BJdRy2Zv8F+9BebD/WBP3Qr09x6AGl/e3oQTbFzmH
	x5i/NyBWd1EZY1vdcql30eZa20g3IXxCoqYV2RvJGsZ579DTsXCWGaOOAfDOVsJULppDUI/vCwO
	O8p7d+5afuxo8CJrWC+FQq4Acw==
X-Google-Smtp-Source: AGHT+IEjONcU9x6JlzHrNOCRfapdijI2K0K3jjBIXQvsC6vlMArfJXHA/sc0RSHKNgKkvauw85ENXQ==
X-Received: by 2002:a5d:6da1:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-38a2220039fmr49166964f8f.27.1736209865801;
        Mon, 06 Jan 2025 16:31:05 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8471dcsm49320901f8f.48.2025.01.06.16.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 16:31:05 -0800 (PST)
Message-ID: <810af0b9-aa21-4f11-9708-92c870615cc8@gmail.com>
Date: Tue, 7 Jan 2025 01:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
To: Mark Brown <broonie@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-spi@vger.kernel.org
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
 <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <eec9caa0-0029-4774-842e-af1d1290ad97@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_163108_450176_0559692F 
X-CRM114-Status: GOOD (  11.78  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpMZSAwNi8wMS8yMDI1IMOgIDE0OjA4LCBNYXJrIEJyb3duIGEgw6ljcml0wqA6Cj4gT24gU3Vu
LCBEZWMgMjksIDIwMjQgYXQgMTI6MzI6MzlBTSArMDEwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3
cm90ZToKPj4gUHJldmVudCB0aGUgdXNlIG9mIG1hY3JvcywgYW5kIHJlbHkgaW5zdGVhZCBvbiBr
ZXJuZWwgY29uZmlndXJhdGlvbiBmb3IKPj4gcG93ZXIgbWFuYWdlbWVudC4KPj4KPj4gVGhpcyBz
ZXJpZXMgbWFrZXMgdGhlIHNhbWUgY2hhbmdlIG92ZXIgc2l4IGRpZmZlcmVudCBkcml2ZXJzOgo+
PiB1c2Itc3QtZHdjMywgc2RoY2ktc3QsIHN0LXNwaS1mc20sIGFoY2lfc3QsIHN0aS1kd21hYywg
c3BpLXN0Lgo+IAo+IElzIHRoZXJlIGFueSBhY3R1YWwgaW50ZXJhY3Rpb24gYmV0d2VlbiB0aGVz
ZSBjaGFuZ2VzPyAgSW4gZ2VuZXJhbCB5b3UKPiBzaG91bGRuJ3QgY29tYmluZSBwYXRjaGVzIGZv
ciBtdWx0aXBsZSBzdWJzeXN0ZW1zIGludG8gYSBzaW5nbGUgc2VyaWVzCj4gdW5sZXNzIHRoZXJl
J3Mgc29tZSBkZXBlbmRlbmN5IG9yIG90aGVyIGludGVyYWN0aW9uIHNpbmNlIGl0IGp1c3QKPiBj
b21wbGljYXRlcyBtYW5hZ2VtZW50IG9mIHRoZSBwYXRjaGVzLgoKSGksCgpObywgdGhlcmUgaXNu
J3QgYXBhcnQgZnJvbSB0aGUgZmFjdCB0aGF0IHRob3NlIGFyZSBzdG0zMiBkcml2ZXJzLiBBcyAK
TWlxdWVsIGFsc28gc3RhdGVkIGEgZmV3IGRheXMgYWdvLCBpcyB3YXMgd3JvbmcgZm9yIG1lIHRv
IHNlbnQgYWxsIG9mIAp0aGlzIGluIGEgd2hvbGUgc2VyaWUuIEkgd2lsbCBqdXN0IHJlc2VuZCB0
aGVtIHNlcGFyYXRlbHkgYXMgYSB2MiwgCnRha2luZyBpbnRvIGFjY291bnQgTWlxdWVsJ3MgcmV2
aWV3WzFdIGFuZCB0aGUga2VybmVsIHJvYm90LgoKUmVnYXJkcywKUmFwaGHDq2wKCgpbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC84NzdjN2hhNzduLmZzZkBib290bGluLmNvbS8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
