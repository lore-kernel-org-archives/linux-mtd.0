Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2EECCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJug2O+Fsbr4k6oyrN6WZpQw3C+/pTiNN3kW8hcLbC0=; b=FP7CJN5YMXArTU
	mjg/zYdYkRzOsZmtk3Vn7kbargl70Z9LabpOIkA1ybraQfYQ13hXutUB0sUYE9GvG3OGi/H1lVDld
	9CjFUh2S5AQdf9248PGhvRgB3jWYUONULAmAljsm9sfmvCG1N1Um+KFPZRdSMdKswiFZUbQB+m4x5
	NryHgEZ6TcJMUWNreSDP5dmS9CtQ6pucV4Dw4KWp0WLy8Rxg2eILZ85i5YN6QCpMsVeJ+yNQxLgcr
	ZEdL/yJ0atHaB/bm/DsF9r+0GjWceWHPzi+iTIjbTQCvRKu9mnGnqAN1NbWhUvtdIVHcdWHKSFSHZ
	XcnZ29nvNH9ADFDMB+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDltj-0000000GDxB-25X0;
	Tue, 28 Oct 2025 15:46:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlth-0000000GDvQ-2GRk
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:46:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so4486806f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666368; x=1762271168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=;
        b=ctDld48xxiWBrZfv1yIOL5QGZXQKZJIj+KCKWKgDtg/P64bmSVqWXcrzq4R8wY2has
         RDoHxMI0VTsMZKuXrFjpLQgSrg+C+LoxGVDsw5u3coJ+6KhUsal3twzo47ayRYHBvK+E
         cQu4HrgzwSb700/417xQwuLTG7RyWDTEsL+ElnmoF8IN8lzg8o83Us9AEVo/OxppRlij
         Ozmkau02dq4N/tuxb20SdXDMd5A8yrp3RJrm6ic7Z29ReGsfIfLC/WHWhHI8ir0DPhNc
         jVgKhEWk6dPa9BusO82qL9Ri2wEaX+oO+DnBQ+gtGC/srK3nmzhDb4Qnq24q464YzGY+
         o6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666368; x=1762271168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C67F/J05mAe+rfgJ6AOhDZKKwYuaYMQaqkEjs240jaM=;
        b=UonbJqwAF5W9Euj/KkCW4mUQtN2Fse6UQbU0zOw6wkGO2wBuq3TZiNRF3CpTjtEaVX
         PbZXRrMIYRP17GlmRFgFx8a1LA8kbs11u4s9CDxm/w3AGZtTgymDF2MtSH3Pyvza5SZG
         fBdzgZ4fVkZx1BxmWBvJl7HsV1+1oXzIzFbDJDz0imx+7T+ibAvcjAbarefuCEIV8DNx
         evGSwtOY77fEEDS12eYdtjpLGV5D7Vffm8IvP/91qeokqJZcdnkc4cReyTijgGt9vHev
         47T+LAa3RrPpN8FnS552cHZjjpQMy/tS+Kdmt7v7VaSEVw7Y21B7SNqmHSN9RNGChXag
         10eA==
X-Forwarded-Encrypted: i=1; AJvYcCWi3IYTZCLt5Z1kK72rsSp2CsCbXoVodbdu8sIM/vW58H4GMaedS+wGXsRWinjJ55PwCHyHUD+BMKs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9vvs/LctIjtu7XpgjB9f3/x0ISEZMIFHOBu6LheTisDq27T8E
	n2b4s2Xkh/6jfi+0iuh8urnVT/NxLZUnxWaM9fbf262uYoawpma56w0m
X-Gm-Gg: ASbGncteSu1NbXW7bNrchdt0hrm0JH5YH1P6WvQ+L2fi6hf/KQBcXa7vg8wMUc3F8Je
	VBOuvrP6mU3FlDmZ90s5xJMWdfxTu2GMhrzhwQ8MH2xwn/pv9vgaJO7RgDxjUc9Nr+AtmkkDtaW
	A3RhppMflARGA25RO/0vykHrcxYi6H0yxSLYU5wXEmjFHSYGcCtfZT9RSWpa6kgvfPAoCMsEO0V
	zq88hYkeJHY0bYqwuDBAZChAHlppFQFEJqCO4RGdsUFwtQG9swhFv34NoiAQW9eqG7v342hnDj3
	N9dGDnRhLoAOtekG7s9tQlsNlJQwspOyJYde9s87wSbujfdSS2Zu/wU7jiReXAYXVW8/0S7dN85
	JvG0P5cc1Z/XcK4yywsd10S2/aahlEnGIYHosoZi8Iz26nzPQhXsteR9yLyMp/r1j7zWgAzjDFs
	saW2VuJ1vVffVGJZPArhJY7RGKmwjQL2+xQT3NIWK2P5xrOlzPZgOSSod42+epu+PnHOM/
X-Google-Smtp-Source: AGHT+IHosnjBq+7lnXCkpH/VCvR/dfjIj3WsAxDBH3sVvdzDiErsKruO/jAMqh6ugeSBky6z5EKP1g==
X-Received: by 2002:a05:6000:144e:b0:429:7693:884f with SMTP id ffacd0b85a97d-429a7e35c26mr4283497f8f.5.1761666367549;
        Tue, 28 Oct 2025 08:46:07 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbb20sm20964431f8f.18.2025.10.28.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:46:07 -0700 (PDT)
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
Subject: Re: [PATCH v4 14/16] mtd: rawnand: sunxi: introduce sram_size in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:46:05 +0100
Message-ID: <4461451.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20251028073534.526992-15-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-15-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084609_584076_9B94F3C2 
X-CRM114-Status: UNSURE (   7.16  )
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM1OjA3IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgSDYvSDYx
NiB0aGUgU1JBTSBpcyBiaWdnZXIgdGhhbiB0aGUgQTEwL0EyMyBvbmUsIHNvIG1vdmUgaXRzIHNp
emUKPiBpbnRvIHN1bnhpX25mY19jYXBzLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlCj4gCj4g
U2lnbmVkLW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vub3VkQGJvb3RsaW4uY29t
PgoKUmV2aWV3ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+
CgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
