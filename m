Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6CDC43464
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 11:50:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B512100A
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 11:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdHRWMUq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="knwDHDCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B512100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5kE05m3avsxFjxnenqhTEgUB1zfUrrIFnpFa/NXBLHQ=; b=pdHRWMUqH7xCarU9nODIbSB6y
	yqlJEe18s+2oXqGBFTOpwPTQ95GAeJsp6PVAN0X2LpKx9RaGRkgnEL7uphUfQA007y7n5cSudGf5n
	r9OJQ5Nk+fYggq4nNWq6qeiDAYcvZ70sR0uP6JQhVWksS/zJ+duh8yXpvrHABoTm7Q45xEhK6DaZY
	4Jrr1gxtOfh6nHzDGTahe3dz/qd8Wp1MQTTh+SNBSAUtqkbqXyuoy8cVlyE4qR5T1t07t8a7HbZ3n
	H8hUovy+KQZi2+5TJTlF0MLf/D3LllXZtesxwgpVSv275GHld4UUMU3hoPfRvKLpkl+r6maniGSk9
	jt8UAOkIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJbMK-000538-Q3; Sat, 19 Sep 2020 11:48:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJbMI-000528-Ah
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 11:48:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id d4so7656968wmd.5
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 04:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wqfVNx3hhEhUsnViEg4Q3DfHCFM9fuSUQF+oW2vIHtc=;
 b=knwDHDCT0dgHd5iowBldBQNOWvFeAysrLCHH0maY7muKugQgRbnbz1P8vnCw6DaSpJ
 ciXUjDTQVZmD9PoH6MGDfHQ4jHBZCg6PAgD9ujI56sjJoNElITaY8F5buRZTNFK6BnEt
 Mco3caQQnX+JEnrDckrMAU6j3wd7mrdtr3gHl40FDE2T3/xPdvwHx1FGlj3Fn/CuVCZx
 fQIIL7+WDALe+bkd1YRUCQttMbHbNVGkHjsv9bzNkdfbbpm59zYQNFLfC50/f+8HoyA6
 U5GwXFvICRvQGaZcnl+YCXd60MnrdaqhBTZ7xA7e3YyULNvpepBEfbUKgtFNYCVdekW8
 ddGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wqfVNx3hhEhUsnViEg4Q3DfHCFM9fuSUQF+oW2vIHtc=;
 b=TqQChUyrElbjX376gnKaKmExQ7XVT7ZXgZkw9h2syivlQJPZ+oViJIZjGOv2JeWIVL
 sQz96/DPOFzbtlKzIeykjvHtSoyv0TYw38udGSFX42qU7wiBxWaiypaoLmpVfmTwL4Ck
 rK+cf2mbNTuoCJNiHiilehRqtZe0UXZ6DdZuyPTocVJWUvbdY5WanHysCmOG5yoDwJ3p
 a6bCOUXvt+htYSlq1cweDk3OYPYgSLQB/q+j2AXRefQyLB/PRplkeOmbFksqtI7zfXDd
 rsfdWa3GiUo88eyJGRI9BUHVsqZId7kV117NekAJmGvbnG6y7vb6RvddW7UOmRbIJqEB
 9orw==
X-Gm-Message-State: AOAM533UPukUbPwnfSsCdHscrjJ5ofPXG4TTOtJ2YWzfQOnUTjNOa9X/
 elKssomP5CjM9u4kDM/mxDawzw==
X-Google-Smtp-Source: ABdhPJyHe040jXDZbspHnU3tY6SFVLZqfiVYrksVkx0hl6AeqxBHjwI6XAXEGClfvHTNjsJJN7YyuA==
X-Received: by 2002:a1c:c383:: with SMTP id t125mr2830251wmf.13.1600516127445; 
 Sat, 19 Sep 2020 04:48:47 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9142:20e7:201d:cd11?
 ([2a01:e34:ed2f:f020:9142:20e7:201d:cd11])
 by smtp.googlemail.com with ESMTPSA id y2sm9766752wmg.23.2020.09.19.04.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 04:48:46 -0700 (PDT)
Subject: Re: [PATCH v3 07/14] dt-bindings: thermal: imx8mm-thermal: Add i.MX
 8M Nano compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20200904152404.20636-1-krzk@kernel.org>
 <20200904152404.20636-8-krzk@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <81a8248f-0d02-5646-36b2-5d4c3a7c4211@linaro.org>
Date: Sat, 19 Sep 2020 13:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904152404.20636-8-krzk@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_074850_495395_3D4B3EC9 
X-CRM114-Status: GOOD (  19.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDQvMDkvMjAyMCAxNzoyMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBEVFNlcyB3
aXRoIG5ldyBpLk1YIDhNIFNvQ3MgaW50cm9kdWNlIHRoZWlyIG93biBjb21wYXRpYmxlcyBzbyBh
ZGQgdGhlbQo+IHRvIGZpeCBkdGJzX2NoZWNrIHdhcm5pbmdzIGxpa2U6Cj4gCj4gICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW4tZXZrLmR0LnlhbWw6IHRtdUAzMDI2MDAwMDoK
PiAgICAgY29tcGF0aWJsZTowOiAnZnNsLGlteDhtbi10bXUnIGlzIG5vdCBvbmUgb2YgWydmc2ws
aW14OG1tLXRtdScsICdmc2wsaW14OG1wLXRtdSddCj4gICAgIEZyb20gc2NoZW1hOiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9pbXg4bW0tdGhlcm1hbC55YW1sCj4g
Cj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW4tZXZrLmR0LnlhbWw6IHRt
dUAzMDI2MDAwMDoKPiAgICAgY29tcGF0aWJsZTogWydmc2wsaW14OG1uLXRtdScsICdmc2wsaW14
OG1tLXRtdSddIGlzIHRvbyBsb25nCj4gCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bW4tZXZrLmR0LnlhbWw6IHRtdUAzMDI2MDAwMDoKPiAgICAgY29tcGF0aWJsZTogQWRk
aXRpb25hbCBpdGVtcyBhcmUgbm90IGFsbG93ZWQgKCdmc2wsaW14OG1tLXRtdScgd2FzIHVuZXhw
ZWN0ZWQpCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0t
LQoKU2hhbGwgSSBwaWNrIHRoaXMgcGF0Y2ggc2VwYXJhdGVseSBvciBkaWQgeW91IG1lcmdlIHRo
ZSBlbnRpcmUgc2VyaWVzID8KCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvaW14
OG1tLXRoZXJtYWwueWFtbCAgICB8IDEwICsrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvaW14OG1tLXRoZXJtYWwueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2lteDhtbS10aGVybWFsLnlh
bWwKPiBpbmRleCAzODg1Mjg3N2I4ZTMuLjg5YzU0ZTA4ZWU2MSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9pbXg4bW0tdGhlcm1hbC55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvaW14OG1t
LXRoZXJtYWwueWFtbAo+IEBAIC0xOCw5ICsxOCwxMyBAQCBkZXNjcmlwdGlvbjogfAo+ICAKPiAg
cHJvcGVydGllczoKPiAgICBjb21wYXRpYmxlOgo+IC0gICAgZW51bToKPiAtICAgICAgLSBmc2ws
aW14OG1tLXRtdQo+IC0gICAgICAtIGZzbCxpbXg4bXAtdG11Cj4gKyAgICBvbmVPZjoKPiArICAg
ICAgLSBlbnVtOgo+ICsgICAgICAgICAgLSBmc2wsaW14OG1tLXRtdQo+ICsgICAgICAgICAgLSBm
c2wsaW14OG1wLXRtdQo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBjb25zdDogZnNs
LGlteDhtbi10bXUKPiArICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXg4bW0tdG11Cj4gIAo+ICAg
IHJlZzoKPiAgICAgIG1heEl0ZW1zOiAxCj4gCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcv
PiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxv
dyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9v
ayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93
d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
