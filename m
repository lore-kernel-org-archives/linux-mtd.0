Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87122C4707B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jan 2024 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pU2E/AxBJVY12RFpsT5P1+rtz4uaFjhxHcCUaUXFUp8=; b=VGlc9PlKDpaK20
	t73noUN5oUBjyOHnIgzdUCVID61IBR4zJK5GLXTfyOfrKnNHTyVi6g/rEyIUkp5xtrU9eK8lgrh+f
	3dKA9BYM0YNCpZdYKVTkqdrFoxKmQl3Di4yneIYpFIyXWPfccsqayQvIChfNZPUXciE9NMc16X5Bp
	3rUnXWJ7wYZoDmEweT01HQV51JaBVQ5gSYfXJ8Uq27Z7uUkr1ljqiiWD7vCojlZpVz0Y+TIjXIqMT
	O7C7sP2FMVIWOQHPMnsIOqJD6Yp0ZBAYmqjJ5gZoEoCi8oRPoefCJBNxfzyrLac05YIsbNptxBeXQ
	WQfo1B3A1iIpff9vlsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNu9N-0001uP-0D;
	Thu, 11 Jan 2024 12:27:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNu9J-0001ts-35
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jan 2024 12:27:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5572a9b3420so10702820a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2024 04:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704976020; x=1705580820; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcsS30oLNF+15HonMizYeXd7X0XQ7B9Q4Oyta+50u+k=;
        b=Gz/KktD64SM0/vhXh3oFjAIDqTw/HfdiDvodkc/+wWoHUFsDFH4R9z4M5O27cglO6I
         Uu5qJOWIR0qwc/J5DZb2ZWyQ8fS8xliETNueNb8d1gBfTpKSvGnec3DT9VyhNFGT3L+/
         jXMYEIg1nmINUYQKC4+Gqpq2u4zJVAo+8b+J/IKUCqsCYLsGDhC9G434VYoq/7fkccWi
         /y/T5R1EJfTDXjDohx8R1y0P1lvmUADH3a2ywqoykXsTRF6ovpgePvsJzLUaZYd81cdk
         SshwocQqB6XEpYzZMN67os/MhEPSMvWxynCgsBzjVI/LYbTnb5kppat4dqyhkb/iyat6
         EWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704976020; x=1705580820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcsS30oLNF+15HonMizYeXd7X0XQ7B9Q4Oyta+50u+k=;
        b=mpSY5ngXhu07YHWcMBpokD/1/Siy2tzYpbeJO83wdoWTW3C7XJZAlwxHlsTOQyDUVb
         dCt8pe09UV3AgfMDIxEIkOh4R8vao1HZ5DrYSCJAboF3U8IW0D1UEeSMa7zjK3s3kyWN
         nw8yr9jGfP62nrVmaNWO/nCcSlAMDMxzn5XsFnoyc/nCHCu71vYhBr1AIR23XtM2PchV
         vonRpunC4pN3E99oXy+kn5nS5cPWZRpzo6gpyR4HkF2nI4k743JaL0OnxHOfptoG0zL3
         U6dB/XFu6R18qQYXOON/isG9UE6toYv9+vbdfs9aCOiY5d+K/ZtOIqlRa3yd46ONuRbW
         hpCw==
X-Gm-Message-State: AOJu0YwSPqWKXYZc//WbJeR/j+wSTBVgwKaMKSiXwklA25dpsvDOqPzx
	fzVpXgvjI7CMp/lUyzulBdU=
X-Google-Smtp-Source: AGHT+IErfTC0KKSKgyzGQNzugPo9s7gpZFwlhHDqDTeAhAgqO7SVNL84UAAMThS0PCKWyYCLKcO6ow==
X-Received: by 2002:a17:906:fb05:b0:a2a:e479:3fc with SMTP id lz5-20020a170906fb0500b00a2ae47903fcmr788447ejb.45.1704976019880;
        Thu, 11 Jan 2024 04:26:59 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id y20-20020a170906471400b00a29430458efsm527531ejq.65.2024.01.11.04.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 04:26:58 -0800 (PST)
Message-ID: <cbb1a43b-bda7-4c84-8e08-df02130b2812@gmail.com>
Date: Thu, 11 Jan 2024 13:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: partitions: make partition an NVMEM
 provider
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240111121940.15628-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240111121940.15628-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_042706_015917_D4F766EF 
X-CRM114-Status: GOOD (  14.94  )
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

Q2MgU3JpbmkgJiBHcmVnIChwbGVhc2Uga2VlcCB0aGVtIGluIGxvb3AgaW4gY2FzZSBvciByZXBs
aWVzKQoKT24gMTEuMDEuMjAyNCAxMzoxOSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBNVEQgcGFydGl0aW9uIHBy
b3ZpZGVzIGZsYXNoIGRldmljZSBkYXRhIGFuZCBjYW4gYmUgdXNlZCBhcyBOVk1FTQo+IGRldmlj
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gLS0tCj4gICAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgICAg
ICAgfCAxNiArKysrKysrKystLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKPiBp
bmRleCAxZWJlOWUyMzQ3ZWEuLjdiMWQ4NGNlNWVmNSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFy
dGl0aW9uLnlhbWwKPiBAQCAtNTcsMTMgKzU3LDE1IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICB1
c2VyIHNwYWNlIGZyb20KPiAgICAgICB0eXBlOiBib29sZWFuCj4gICAKPiAtaWY6Cj4gLSAgbm90
Ogo+IC0gICAgcmVxdWlyZWQ6IFsgcmVnIF0KPiAtdGhlbjoKPiAtICBwcm9wZXJ0aWVzOgo+IC0g
ICAgJG5vZGVuYW1lOgo+IC0gICAgICBwYXR0ZXJuOiAnXnBhcnRpdGlvbi0uKiQnCj4gK2FsbE9m
Ogo+ICsgIC0gJHJlZjogL3NjaGVtYXMvbnZtZW0vbnZtZW0ueWFtbAo+ICsgIC0gaWY6Cj4gKyAg
ICAgIG5vdDoKPiArICAgICAgICByZXF1aXJlZDogWyByZWcgXQo+ICsgICAgdGhlbjoKPiArICAg
ICAgcHJvcGVydGllczoKPiArICAgICAgICAkbm9kZW5hbWU6Cj4gKyAgICAgICAgICBwYXR0ZXJu
OiAnXnBhcnRpdGlvbi0uKiQnCj4gICAKPiAgICMgVGhpcyBpcyBhIGdlbmVyaWMgZmlsZSBvdGhl
ciBiaW5kaW5nIGluaGVyaXQgZnJvbSBhbmQgZXh0ZW5kCj4gICBhZGRpdGlvbmFsUHJvcGVydGll
czogdHJ1ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
