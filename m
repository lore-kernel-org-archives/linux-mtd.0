Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF66ACCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9NjUDUjGi66AGik/bBA0hV07DCFShmgiFIi6wb1mV0=; b=rupIIeLMxzZcLM
	IIDK0B+s55oUgBo6JjP9DyUnBe+gLtQ+eG1u8TYlXCl5cVHZNxjXo1p9b/410F8n0BADgTXQqsB3+
	pBCSHEHpOWm3+t6f2x5p1x6W7zrq9dlJPevECzKCg9l/ziEHPaNZN1niTd+O53Hwm8dWsnWzIm+MG
	EPY7FCH6txy3Zs8tIxOvMKSmwQWBdDsG6DqytwlnqgvAuk/xjn4h6eOUVMdyjhzK0rS/r4E/GPL6m
	w/Ixh4NyNnxu0ZDVmGLxNBIKpqS71ALW1u3ntXo0+4j/ByiEvA2fAcK5q/z2sg6Z4sWwD9BoqvlCS
	AJxytvU+qnMnWjBapq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDllS-0000000GCEh-0dtY;
	Tue, 28 Oct 2025 15:37:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDllQ-0000000GCDM-0jFW
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 15:37:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so36780025e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2025 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665854; x=1762270654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=;
        b=jo3eCfHsnuSX1g2WbwMhzajTvUPlwqmpI8owm49XSUoprYGXOZAJo11sRf8pV0P0gx
         hbwBB1+J7z1LFbXZJq7enRdJwsl7Ad+lNhE67BHFminjhuBS2+RWeqNSWr4cMBea7XWY
         z3TBK3cgGcZF+0LxoI9kxeiKnjFoMLyDpNu2zr/NEJyNnD3Stx8aQ6bpRQGPK7yGM1tO
         vKgtZGgakSNBCWfspAi4SCQKTDH5wAWYr/IsficCF7f7g6KjKeXNtJjZMRpu4dCczG2C
         EZ/5pHC1pA22ZpkVLP2EoJo547eC0SOgnd95nmrLA7cVX5bamV418RUxEiyq9sI4AsD2
         egAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665854; x=1762270654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq1rindzPoSv1LaOddPS8k5NKUTrYDUpuyisQ7twQKY=;
        b=L8f48+Nxz4W1bFeHU59eQ3ECI7WKr04PbjBHybuGOh6aw4dBlx4LRvLX7GAwdvsQuG
         NtGNlGlVo2PKv1KkovDjvDGdmM9wBveUQ0z/bv/zc/xYQ5OSQy4oeJyBMoPxnNZFXDi1
         3CEZnnMpNceLdstpoK8U+H3jmLgHtGFuBfaO/C6GR/iqC523QSUOHy5VbC14UA0qK8Pb
         UKR7voBZdTwam7rogxEBaUmuiZ6uwUfyQU5ZwgquEx/XOZ8akahrIoFSy5N2BQMWcZgS
         jsCMKE1rkWl/gE1mtozuTdruRuDG8rg2vBohXvCTEib4v0V+c40dHbst41NmqG/DrQPQ
         cXwA==
X-Forwarded-Encrypted: i=1; AJvYcCXRICmNLekbvar1FYOypFgIBrutXwOtLAFmObzCVa+MqtAUdZOZFJzOmMKk4liF3Cin9weWYNZopX8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZUYZc1/ZPBMBAhU2lhoe8xmU0NpHyfcAXJoAj+RR4N5kX/uzI
	PThlxpKY6R4YRhfbE8HGZbiKCHzY94qwy0gCk6Ht4UkI3jsqSvQL926Y
X-Gm-Gg: ASbGnctW13+MdFdna0MK01ggqCX4AWkZaNfEqxLsVNe6J2WB9nM5IBlK6SRDgiY0Erk
	e4T3ppu2KrIsLcwVK0aajjJ2YX4lNF1i/c0eYh2D8NXrgPABVjP3NxdRWNfcp6nschDDGJwju+G
	6URsT59K7Aoq4zBajOaPXZHAUD2XH5jSNhwlJCeQe0F+115mLwEmd7fdoqHJ5zUh6RSQf2W1ZNU
	G2aYlzzw4CcgTLAIwDrY+IiaQQUX9yRm0RlCOiN4zihvcUJ0rkhxKpQUmzKo0FszNR8WL75ezEF
	yAbWkojBhDGjptTfmzoqwNc1b37hNWtmVGHTYxVCF7iLJ8sL+tmk7ZAE+pJ+O8OSOih+Cd0qCST
	XRv/MDA8QhFUITSN3+CrdCg12d6EY4X6obIx93Y/FinxTHlfALjvYhusTWi7JHQC67DQlsvmdc+
	tq252wQiB/XVSLfV6I8oK1G1znYK0FzPRk4XNG2O15A/UqiNbrr+yoxxanlw==
X-Google-Smtp-Source: AGHT+IHXOTFO2WAIn1ZujBJa9U0PAXYA4glOCwdtcmQllsrumq7MYqoGH/iY7FhfpKKBj/R4vTdKSg==
X-Received: by 2002:a05:600c:848e:b0:476:84e9:b55d with SMTP id 5b1f17b1804b1-47717deef5dmr32584225e9.3.1761665853339;
        Tue, 28 Oct 2025 08:37:33 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm20581519f8f.35.2025.10.28.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:37:33 -0700 (PDT)
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
Subject: Re: [PATCH v4 06/16] mtd: rawnand: sunxi: introduce reg_user_data in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:37:31 +0100
Message-ID: <3656445.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20251028073534.526992-7-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-7-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_083736_221627_AB7D495A 
X-CRM114-Status: UNSURE (   7.95  )
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

RG5lIHRvcmVrLCAyOC4gb2t0b2JlciAyMDI1IG9iIDA4OjM0OjU5IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgSDYvSDYx
NiBVU0VSX0RBVEEgcmVnaXN0ZXIgaXMgbm90IGF0IHRoZSBzYW1lIG9mZnNldCBhcyB0aGUKPiBB
MTAvQTIzIG9uZSwgc28gbW92ZSBpdHMgb2Zmc2V0IGludG8gc3VueGlfbmZjX2NhcHMKPiAKPiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8
cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogSmVybmVqIFNrcmFiZWMg
PGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
