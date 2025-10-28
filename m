Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570AECCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smAYlcau+NuNg6gonKMrBvlXkstx3zJvMx0R1STThUM=; b=ch5otG2Ity11lc
	F92LFX7lgJqx9wDc4lnhrHytilabH3ROmisR1BTeupwF3dgI3/UFyttGdUdTgiuMw26kCoW4X540v
	7U3/vczodlU3n8KoIW7hhDo2lSzpaFOmXxRl2pQMB3jSH1f7yfwQ4PXH+nbLCrqvh2zvBHA8FkNPk
	s50qA/7I6ywoS8aH41n+L1dIIofuLXaN+YhAb3G/Mrx6eNklocC6/cKPFhX4IzM5EvWKh0HCFikkN
	E0vFzM6c26+hV4qif7YOEU5RkE2O5HXIg6MA3glW7fGVVVon8p7QpM2U4/EJDSJqJFPQvNYQACxRW
	7HvjpA3ae/drlfmamXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlix-0000000GBiT-3SyB;
	Tue, 28 Oct 2025 15:35:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDliv-0000000GBgj-0MuI
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:35:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ee12807d97so5657837f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665699; x=1762270499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=;
        b=IMgjqZ1NN1cqRTyMVWBquQdHxAgtRx26M9cbkYySpPX/B1cYhtT6nblxzBxM8YjCR0
         rSO05ePP2UZVrGm5c0x0i2p+76W/If9WcRNF56fAl8K+3ksiFgjH5goeACKPVoXStiyt
         vQIfc0/PShUNnBIeN6/SldLJsNlATguWQTrwgm+LiS24xfL8JZNnQ6+vXwWfBmyjjxTV
         SMV5nKiT4AG40yjH/ytBuP8J6sjA4hjbsKzONDHBpGV1JgApkbhdKWaU7yMPyS5X8FCY
         67L5nke16LMZFCi67rmffhBfQwMUcXuhB2oj1c/gXi/ghb3yz6xjcKUORNBOFD11Emqm
         Z8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665699; x=1762270499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zf/L6+BpO5HiQmCsVmEtAAefad0gqPlx28ytnkqVYY=;
        b=xS57buTH47DQzjZ/pzcqO2b6zGhywD4ZzImMSRCFP3VcZZe4zEcYTZqQuSvQxZ1KYT
         pqZp318u47LnIsSRU5J6YACNs7r39Szl3fQIbTNvByL/ACyNIHaSW9U7JpxHs/6NHEVj
         SO2VA2D2xm3KnmBhhlkvM+eDbyyyXhBGSsxISbo2BZ6Sm5bKKqt3C5GYUq9TqRfXsmx9
         lgrwfARsT6s3Tq4ZqlBndxZU7wcoAycpsSZ+VNfcp2oL9VOYP5HcenzR4n+YowgKE0tO
         jys3XntIxo45I5zEAMAP3K02W7zYiVHu0v1ejGFUTMqQn6IsE3TsqjDqNeJkvZjMtxbk
         mF4A==
X-Forwarded-Encrypted: i=1; AJvYcCV8QPyRVhUOvTVDbICKN+uxXnxLl470oQCv0PqGog+VIkpDyR4zBUgjflnxA+n/zqhRWocaaWj5Mmg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7cW+/63jWo5bmZa3evVmjlV+6BtyiTVrf0rKJQmLl00POrqhD
	WA7ecffeSeGcJGEAiH6aUiR91LTzSG2L7gq63VFTq2Fky0egoIyDy/6F
X-Gm-Gg: ASbGncsIzoESaOjgQFcFSs7hKmHr/QLg+rK7VzSXBi8sdkUdN0htSLO2rgh8kUhvv7U
	5jphAQtGiWJXr8yj+0S43y1+bdvZ4c87MeUtvRIosbOz8zlAeBfr3lhxizAHtARoE55mmldPNX/
	Rj9hFarr3+kmsbwdlyPOtlCSNxuKKd2k/HgBiMRR0kZ7iqKP0KZqmXejK00sMUW7J2g3UdeHFKg
	PED49u/UkNqDRvLDfxZRIj9nq9H9B2f2x0gkeDxU9RMkbjIF7qJ03mDUuQOJ6IUXsH82Mu/sH/y
	9l5cSlq79P+mzoBqFeqzTUhFOWXOJwF9pi4RuvXQYFHPAhtSP/KE3ecvaQhUKbadOqapbnspHcc
	OVe5eIYJVvqPiWjqLjRgcDucO0l31L+fniiNYsF/KxT8TG+BN9L3bAv5rO2jvuA9ACqHlv61XqE
	qH9kpa4i2ua9Nds/v0MbIQQ0KaPKEd28Jgdj+6DjE1/W3j7XKFXwQYrjn/2g==
X-Google-Smtp-Source: AGHT+IHQaqAyFKg0dIVlFNzHvuX0zpZSii67laWQ5yWofyqAlv0IPJ4MzzJSDYza6+cEoyhxJ1y+9w==
X-Received: by 2002:a5d:5c89:0:b0:428:3f7c:bcf3 with SMTP id ffacd0b85a97d-429a7e86b07mr3600391f8f.49.1761665698923;
        Tue, 28 Oct 2025 08:34:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm21334532f8f.6.2025.10.28.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:34:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH v4 03/16] mtd: rawnand: sunxi: Replace hard coded value by a
 define
Date: Tue, 28 Oct 2025 16:34:57 +0100
Message-ID: <2017172.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20251028073534.526992-4-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-4-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_083501_147840_D7B09EA3 
X-CRM114-Status: GOOD (  10.35  )
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM0OjU2IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgdXNlciBk
YXRhIGxlbmd0aCAoNCkgdXNlZCBhbGwgb3ZlciB0aGUgY29kZSBoYXJkIGNvZGVkLgo+IEFuZCBz
b21ldGltZXMsIGl0J3Mgbm90IHRoYXQgdHJpdmlhbCB0byBrbm93IHRoYXQgaXQncyB0aGUgdXNl
ciBkYXRhCj4gbGVuZ3RoIGFuZCBub3Qgc29tZXRoaW5nIGVsc2UuCj4gTW9yZW92ZXIsIGZvciB0
aGUgSDYvSDYxNiB0aGlzIHZhbHVlIGlzIG5vIG1vcmUgZml4ZWQgYnkgaGFyZHdhcmUsIGJ1dAo+
IGNvdWxkIGJlIG1vZGlmaWVkLgo+IAo+IFVzaW5nIGEgZGVmaW5lIGhlcmUgbWFrZXMgdGhlIGNv
ZGUgbW9yZSByZWFkYWJsZS4KPiAKPiBTdWdnZXN0ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJp
Y2hhcmQuZ2Vub3VkQGJvb3RsaW4uY29tPgoKQWNrZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJu
ZWouc2tyYWJlY0BnbWFpbC5jb20+CgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
