Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1F3C52D7C
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2024 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kfw1aFO0SsIYDrMDXQCGEsMaMkYpkuJbLUOFtlDvhQ0=; b=PxEPFI9zpsOIlz
	n82MPJLEKFh6IxoufHDy5g/R2X9S9tB5X6tTAylSa6gJ5yVqpZLhGcATdKBai+slm0PHSkHVCizSZ
	8ToDZEHdUS5GLpC0gSXmW3mMbKWAl9Q5onOefmURxkuKpqDik/4L1s5uuArXyYpcXEwwTjLBQyhiv
	vnQnA7pusVi38V+OB7E9PACdTdNFCkpLxzxkaLhyCt6sRpB4qmlP35HF+kZi5SDVzljD7w2VrXmjn
	X3q1NxeYyHyWlA5nuy7tSQQriwWGhf3bDftY44DVyaXMv4pTLTu5dEnabvq+vI+xdY0KMe7GYERek
	Pw6yy6mCmiVyXSF3PeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scTdY-0000000C6U7-1eU8;
	Fri, 09 Aug 2024 17:42:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scTcy-0000000C6Ln-2XT7
	for linux-mtd@lists.infradead.org;
	Fri, 09 Aug 2024 17:42:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso17099175e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2024 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723225330; x=1723830130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VamUtaKsdnMO3Xj/IeNiDDarpPSNzAwlcfOY5Y0XulA=;
        b=smWLZLfI4pUuQf0mLllki6LEgYy6Q95LejrQlFLquTQztABTAKtFWQQvRzO4afrCGM
         ApT6VaxLl8QJ1BF1DzkWV8k9P0g3WO1tYU7poTHUdWKqcd6xidYIDk0eiDpEyDdTBBhA
         bmfFB8TI9tXRUu0egrcFFRvTeW0wS1x4MJYeAIK/EFkrUgeusyqOxahyZ5qeTV2QkIlO
         Wz1tvfP/skaJ79LnFKyDjhLVu1gHxktd0RNkjm+NQVHET3MtqKfZBejVQZH2h0A35Wwu
         owmXfYxuB98SZRGq82XV1nULFjyWGLocYhtfkYibjxGmNv8Ic/sg5FOpoa2NlQ6zpiZg
         xmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723225330; x=1723830130;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VamUtaKsdnMO3Xj/IeNiDDarpPSNzAwlcfOY5Y0XulA=;
        b=E0HS3aJLc5WkzlUpTqiHIzod/BJG19Q0zn559P1usplTBcjfAHFbJ9AKSjTHRo3J1s
         Wh2ueC/jQocaAqCteBhlZA1BzjV9crPJvemi8UMAupMq8n2T37OQaWycYSUfzR4tho0o
         NRhO/xO5GqIC82dkYBsjh9Zv6Emk/r1n9CzrRc2lZqEZNApPVYakUV50PQ/j2pC3IIXF
         95O5J5eeCupGFEr+OZ7kRgVg9Rsu0K2fLmw+rkrLn7bvRKxePqMyw2c8Ms9hShFoQZcD
         MFuTbwJk3JwTk5a86+eby7B54DBR3V7wK7C4dt5mcUXl28Sy9rguSFaggvUTt6GvQfAL
         TUfg==
X-Forwarded-Encrypted: i=1; AJvYcCUpTQQNwZqi0s8y5Uh0GEkRpW1nOSGzsNlCvaadyuivs8B3sODB5K2airDehjwXHT/ul0Ie37mai10=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1eUfhIFxjwrjaG6Ea/Vb/mRgaoDu2TdFgJQRjGgYPWzja0Tkl
	lGfUx6SeEigRxyKYVDPkJQZ64q5CDm6JHdHoASekdkzdQVe3exnErywNGNoV50Q=
X-Google-Smtp-Source: AGHT+IGx9DDT4b4iSnts3ZE5LnnsizuK3egrq2q0nfjCRLIg7gJH+YoQ/HeD8f5UDBhmZse6UJatjQ==
X-Received: by 2002:a05:600c:3b89:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-429c3a18df4mr16561655e9.2.1723225330233;
        Fri, 09 Aug 2024 10:42:10 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750ec0bsm1080765e9.15.2024.08.09.10.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 10:42:09 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, u-boot@lists.denx.de, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240808055710.19292-1-zajec5@gmail.com>
References: <20240808055710.19292-1-zajec5@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update path for U-Boot environment
 variables YAML
Message-Id: <172322532687.402259.7753078917073034445.b4-ty@linaro.org>
Date: Fri, 09 Aug 2024 18:42:06 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_104212_650164_98D24319 
X-CRM114-Status: UNSURE (   6.53  )
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

Ck9uIFRodSwgMDggQXVnIDIwMjQgMDc6NTc6MTAgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBUaGlzIGZpbGUgd2FzIG1vdmVkIHRvIHRoZSBsYXlvdXRzLyBzdWJkaXJlY3RvcnkuCj4g
Cj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8xXSBNQUlOVEFJTkVSUzogVXBkYXRlIHBhdGggZm9y
IFUtQm9vdCBlbnZpcm9ubWVudCB2YXJpYWJsZXMgWUFNTAogICAgICBjb21taXQ6IGY2ZDFjZGRk
NzZiMmRhMTkwNDYyZDg0NTQ2ZTUyMDJkM2IyYWE5MmIKCkJlc3QgcmVnYXJkcywKLS0gClNyaW5p
dmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
