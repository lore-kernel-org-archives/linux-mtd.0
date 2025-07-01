Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9D8C8303C
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 19:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIBFwqQfjtCv6/ypZ2mOf43wIbfXyER39CDb4q6pHFI=; b=e7xSOZgX4LC1FJ
	/QnAaH3m/i2UPuAbjGgI5QrDGv87Xetsrem/vw2JfDUB9s/uDJfXfSU0jkCyIk+5QrdzmaVnLAjNN
	y4IdettQTcYDYhkQY7/luPcrnYG5J6Znuc2MNe7jILSJpc9tHp6Mh0Njzbdpah6U+lnThu2SPmwQb
	Hh44EIUYty6ZOnDAiO3o/bf6GG0Gfp4LjFjQjiVECGISwk1nrl9Dy54NGv2ts4wGCICCLTC3w0itC
	sbp4zOXswBt1X8gn7F4v0z4lF4Vh9gMaiL22c54WOpweH12qtUMux5mXms/8r9OlLmLuyJCQR2YIq
	xulzKSfidGkudju3ZRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgt7-00000006Ulc-126k;
	Tue, 01 Jul 2025 19:43:29 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfLA-00000006INf-2AmQ
	for linux-mtd@lists.infradead.org;
	Tue, 01 Jul 2025 18:04:21 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-32b5226e6beso32382501fa.2
        for <linux-mtd@lists.infradead.org>; Tue, 01 Jul 2025 11:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hifiphile-com.20230601.gappssmtp.com; s=20230601; t=1751393058; x=1751997858; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=;
        b=W5eFdF1mxszPXdI9wGtbPFeWXbBGyiHP2X9AM5QifAnBDrdMukqmmNa72VmXL+txPZ
         QLO1ePNb8+seTsu9xNHwAOmHD9Nr6THj7hQIekr+irQlaU4/U0O9XD2Kb6zXvUtv++6o
         z+9Jz9jqIZ637ZtiA4qpEfvaPj3Fhv9ulm0aOjuMDfk/sccwrUjvmoVcJoGgcE8S5tnp
         UvTNf4Oo4UZHNVQwP/Gi4N/ApzbMt8IvjQ0guIz3ZTFj7aKYRaCzH+HKplrR7XIU58eX
         XPXQSlAWY1BoWs75VkXv5w+SK8ZAJu8AxcUZkSD3M4H6YQO97B3mUU3ckOAwiV9L3T7j
         JFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393058; x=1751997858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZd53S9/hYXg0lSakaTI6z3l/FmVI9v+j6PYAZZJc5E=;
        b=Q3FeLInEKTdhRu9zoooPb9l51ehuEZyGZ9tTxgK3fg0Edwic3HMp8P2MXWTULVWyVG
         qfRIamRww7soXpmqUYNfT81bSH2/WLHSiQcJFm6SvJS4mSeKcB1RX/9gxuIdZf0taFPC
         qM/EXJtyFUaDLOo4pBmKK12qAig8i3bGexCPer7/VCKsfw6MEXxogszFKSLrrxT4ncz1
         5v2oGOGlqXAqgnWmfF4QP2p3xKPv+p07ivHzhIrn4ejCccdlA3pOFVyCP5hxBrRjHxVl
         QHd0R7raY+u/V44BZKJmIuZimS7HZJ2xHYiOTr0IHwlhZekAKD7Jfq7+JPPqGMQLehkd
         WaJw==
X-Forwarded-Encrypted: i=1; AJvYcCX6WjD34T7KmHH6ZsJslEmq/LClw5m5MOh4JubAUfqFMRPVXBo2YyCytPv1RQf0NlCAw9ac41Kly5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YznlZH1VHfLBRf8GX4K+ffWwBNX14j2iDPmP3gcMsst8a0x+FmP
	LPRmUhrWTzydPlc+o26FUf34bJsLUTmkltRJAmYti2EA7/HcpKAURDmE+mE2W8jxPOdIQ1AbIqS
	gJC8RzN9ZonGHWycb/sbWWdMxtfbx5zRdlhf7DpRJTw==
X-Gm-Gg: ASbGncvwRGDneuM/JM+PcI6bgkCT2CrxQzHkKSggsX4cpUdxhz3VYpdu9m+MIN/vUGr
	ydjc9RCM+XieL9k/PdsVu7iawe4F75d31yP5pMpe5YEo2gg13nOwE6sh/A9PVCc8btg+l2exd01
	opo7ooVhGm7bT4t9umaMHQYxGlnruCxC6i0F8T+EyZDTIiKYNQEUZ/IlnYo5qWX1TsVH7VXpvXa
	n4lMg==
X-Google-Smtp-Source: AGHT+IE6y9R8uLja1br0fCyfzE0jDMNUQXyj9K5jFieZgPvJ9HnnxDlqVbdU3xGPBSrKWNmGMVpDlPgjkWqfN3nYZzk=
X-Received: by 2002:a05:651c:41d4:b0:32b:9e00:1237 with SMTP id
 38308e7fff4ca-32e00075d6amr326841fa.32.1751393057890; Tue, 01 Jul 2025
 11:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
 <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
In-Reply-To: <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
From: Zixun LI <admin@hifiphile.com>
Date: Tue, 1 Jul 2025 20:04:06 +0200
X-Gm-Features: Ac12FXzHRMRJLOOItsRIrxYGyHt7wf3A5-pMjsV73wxTRtwvTIExDU1XymzmqNg
Message-ID: <CA+GyqebFpav_ixDyp84-XA2WcQdrm_t6nfaKckm98tt5MpM2EA@mail.gmail.com>
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"SoC support'" <linux-arm-kernel@lists.infradead.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_110420_660763_B85811DF 
X-CRM114-Status: GOOD (  13.46  )
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCA1OjQ54oCvUE0gQWRhIENvdXByaWUgRGlheiA8YWRhLmNv
dXByaWVkaWF6QGFybS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBJJ3ZlIHdyaXR0ZW4gYSBzbWFs
bCBwYXRjaCBiZWxvdyB0aGF0IEkgdGhpbmsgc2hvdWxkIGZpeCB0aGUgaXNzdWUsIGJ1dCBhZ2Fp
bgo+IEkgZG9uJ3Qga25vdyBpZiB0aGF0J3MgdXBzdHJlYW1hYmxlIGFzLWlzLgo+Cj4gPiBCZXN0
IHJlZ2FyZHMsCj4gPiBaaXh1biBMSQo+ID4KPiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi8xOTU4M2NhNTg0ZDZmNTc0Mzg0ZTE3ZmU3NjEzZGZhZWFkY2RjNGE2
L2RyaXZlcnMvbXRkL25hbmQvYXRtZWxfbmFuZC5jI0wxMDU4Cj4gPiBbMl0gaHR0cHM6Ly9naXRo
dWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvZmZjMjUzMjYzYTEzNzVhNjVmYTZjOWY2MmE4OTNl
OTc2N2ZiZWJmYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9wbWVjYy5jI0w3NzIKPiA+Cj4g
SG9wZWZ1bGx5IHRoYXQgY2FuIGhlbHAgIQo+IEJlc3QgcmVnYXJkcywKPiBBZGEKPgoKSGkgQWRh
LApUaGFuayB5b3UgZm9yIGxvb2tpbmcgaW50byB0aGlzLiBJbnRlcm5hbGx5IEkndmUgd3JpdHRl
biB0aGUgc2FtZSBwYXRjaCBhcwp5b3VycyBhbmQgaXQgd29ya3MgZmluZS4KCldoYXQncyBtb3Jl
IGludGVyZXN0aW5nIGlzIHRoZSBpc3N1ZSBoYXBwZW5zIGRlcGVuZGluZyBvbiBjaGlwIGluZGl2
aWR1YWwKZGlmZmVyZW5jZSBvciBhZ2luZy4gQW1vbmcgMyBjaGlwcyB0ZXN0ZWQsIHR3byB3aXRo
IGRhdGUgY29kZSBvZiAxOTMzIGFuZApvbmUgd2l0aCAyMjIzLiBUaGUgMXN0IG9uZSBoYXMgbWFu
eSBFQ0MgZXJyb3JzIGFzIGluIHRoZSBtYWlsLCAybmQgb25lCmhhcyBsZXNzIGVycm9ycywgd2hp
bGUgdGhlIDNyZCBvbmUgcGFzc2VkIHRoZSBuYW5kdGVzdCB3aXRob3V0IGVycm9yLgpNYXliZSB0
aGF0J3Mgd2h5IHRoaXMgaXNzdWUgaXMgb3Zlcmxvb2tlZC4KCkJlc3QgcmVnYXJkcywKWml4dW4g
TEkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
