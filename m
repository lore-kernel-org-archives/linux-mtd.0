Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842BFCCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mafnWpbJjS6FrjJb4+p6rCzi7IDoquEHmdTNHOm8uQY=; b=YJni71SqttFuQg
	5ivHDVUA2btx55bcRzklHhvc9Ys4/Jhq6pJSJcxltRzdF6Y0AFDm+HpVxYoFUSUtETaLYwe8HHfky
	TxHlVy9CxtZQO2D4R8QxLEw4musnUHMh20sf2RqtYC9+mdu2Sobr9Xm0Gt50caS4TwHZqNLE+YwBR
	GaK61GaPbbmmT1C9n0kb32xuzW22lWQM/0S/xezlnmpJXfEBOoyFslc8BtBrn3CvuhzBS5KzdeWJ9
	Xjs93zHpHxQCJP1kXCFIAuTyiTIEb7kOYpcUCTjHGR8MDjYvARKEcg1JCk1DFNDY0ozvU7GbMBTgw
	Mb46S4NK4xU8vMz0/1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlsl-0000000GDb4-45rm;
	Tue, 28 Oct 2025 15:45:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDlsi-0000000GDa4-2Ygm
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:45:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47112a73785so39426615e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761666307; x=1762271107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=;
        b=g8anmHndyjs8TMmNijCJ32627T/kZbyHPm/eopB+gt5C58mwyf+wqSWKBbcKiHvtJe
         9GageQaiTgavdtCVasiXVKdp0HCQpkUYxrKEDE+zRjqSelekjXxT67RcPLJMJ3e6VBMr
         5SoeuRHKOwtHq1Wxw8mo8fnbgNKXCAwNLd1RzlDWk87qUsejGFHARWeSNABY42eu2k3b
         EgjcdzmLKGo8Sxof7IswxhFrUkqxrplByrRt4fl0qlA3B9sDvddnE1j7cOt5EybrnYMi
         tZNuSWfu4tF3qZXE3VcokIYLhm4IwSR2bF/cGvvh6eN8CLFhsnJ42JW6r2GE0SVOmDzq
         rEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666307; x=1762271107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAqSgVsTThU3vtmlukZG8xLx1H3wk+zWeretWdrZ53k=;
        b=oivCu8Xs4s4GLcDHMTpwUldTbdfwS50JZQMc1GeR8lBAldkh9R5L5Q6sYTeUavzS9x
         HqZRO+I4M4dgtN+en08cspK5k5gnHpYa1DHhFKQQrM3qQHLiWC+pe7NPX6arcNELTEOb
         UiaIuzFOv0e6fVeqrEH8X/h5VVCTOiJ1xFMgBpFu0UuQkTobb6O4U/LwwJWjvzhOX8CQ
         r47IH1cKAhOm2Vm3HGpt0i0WoFpm5+Rwvu7Ve0S+FpOGd2jCzDTO6xGAyG/tXiiYsunL
         KlOJzAvRHaboJ2rgYF8taIrPllNfhUQD4CqX/sMROdVvgiYub86iNeNmD/hHe++2hSY1
         KBuA==
X-Forwarded-Encrypted: i=1; AJvYcCVS0jKUUtLAJUoj7sHBCbisAFQoTzBxMbGVX8HRQ8VC0HEGdh2jVd+GsmSmaEFMNKADFHNYXhapp54=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9cY9CxwWmwoztXP4XQCN1780J1Ioz3jXmkDlMNAtalRsyy+IV
	ZLx4P61WTU7BzvkHChlUQZutTB6I4B4eEG2f8l5nhwu9QJhy/ibCRSFM
X-Gm-Gg: ASbGncvaHgaHsPvf46pnhKAXgvlq1EMyxJVf1ivm6VCYE8HMRTCoPzt/vQ5hgyY64uE
	i2t85s3IjAytUKRk3tkJIao4g+8+WbLW7kBsDmhWyMq29krNKSTULiTF89qlpjvVaRv+UrZQ7U1
	4hTV3vYcOztLzHRsrRL74BvMnlhnlJsN2dcDjFl2Wao2wSDPrnV3WJ5NAG6eZSxz1u1QFRoO6EC
	CT9a871OK4ARkiKkrIkueViByRrF2EAMBtLQOtaXlH6pGvrVClGnuKJEMHNb0ZVV98kP+kCLmz7
	w3CzTX2LgdKE+qRjSUoVT12IZK1HAdChVH2MjRRhiyZdwmsghYKvI5SEupJwOAdgXFI4rChkocy
	HFNTyhtYjBliSIhkOCGiI4jFbjIQRya5grEqw9rWmvLH0RTf0/mGIYRANnWl3ivMYRoPRWZc423
	9BhmDr3nfODa+FDZn+ikb/DSw3IiTXOnBk7YGWVzkPiaYzy3az0PJRKDpgkw==
X-Google-Smtp-Source: AGHT+IHar4ykqVMzVnQnpMNRdCULBt0TW79PeUZzYouW3L2ifb97HosTgMs4SMM16AylRCMZ0rMIQA==
X-Received: by 2002:a05:6000:1862:b0:428:3ef4:9a10 with SMTP id ffacd0b85a97d-429a7e8500cmr3696482f8f.54.1761666306579;
        Tue, 28 Oct 2025 08:45:06 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca569sm20562147f8f.12.2025.10.28.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:45:06 -0700 (PDT)
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
Subject: Re: [PATCH v4 11/16] mtd: rawnand: sunxi: introduce reg_pat_id in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:45:04 +0100
Message-ID: <3574896.QJadu78ljV@jernej-laptop>
In-Reply-To: <20251028073534.526992-12-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-12-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_084508_647943_207C3011 
X-CRM114-Status: UNSURE (   7.91  )
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM1OjA0IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgSDYvSDYx
NiBwYXR0ZXJuIElEIHJlZ2lzdGVyIGlzIG5vdCBhdCB0aGUgc2FtZSBvZmZzZXQgYXMgdGhlCj4g
QTEwL0EyMyBvbmUsIHNvIG1vdmUgaXRzIG9mZnNldCBpbnRvIHN1bnhpX25mY19jYXBzLgo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3Vk
IDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJl
YyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
