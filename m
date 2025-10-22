Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65999CCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYJE9bnrrbBo2wo2QcEuyOiHcS62VOhrjcyGOnYplPM=; b=2bToarCUOIbo0t
	esuEim+UlISswcG3wfKDeXYkJxwDCok/ZQEAXGUD26zZBgT9WErEmOLux3jxym9clSaQicmcp/6hp
	rVzvXp/MOoKTZveWFEdvSPs/XabGs6Jcn3OqJvaeV6NnBygntdHugIRPMKs8p/qrwHqTh13cmpkyk
	RdjheyyYauQM5MxB9BrmKjAaY0vPupJyae15bA3niIZt05ulblJJVO5UEPSue5zUoo8Iu+/iiQCZO
	4PkpZPDz+g8kzeGg8AGCznMnFRuIYMSiPTrIFS1JdZIPmH9wtfw+GZuZwwIHtZoxhJFR/Zsc9lFdx
	Zg0tzfvdqUYew1jk1i9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVqk-00000002QvH-1App;
	Wed, 22 Oct 2025 10:13:46 +0000
Received: from mail-qt1-f174.google.com ([209.85.160.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVqh-00000002Qsx-3287
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:13:44 +0000
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4e89c4ce3f9so9066261cf.2
        for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 03:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128022; x=1761732822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9nsZS9cf0Yesyto3hqsvaV4sJKL6LJk8tudSlukngM=;
        b=l/Dp1JbtfmUVC2SLysU+toURP5dhfii/OvyDHhiZsxKQglsBoA7wX+t63JVPM5jO/Z
         5vtXtLIpuNzmGxDQQJyX2mHJKLj6HH7fEvD1G06Ta8dc+uTUL/B50sximSACKOOdAgYQ
         FuVBxcamhPTDraHpQlHHBPAMe+zM7cQ8shO0G9IThLyoFODW2IusdgZddDcYSJ83SsMO
         yhxYZzYF7OFQq4S/b4sef65B+RB4iip0XtajYpA2PQZPgQIKcA9iUoDezqhXR3fGLYso
         AKqcHdCxbqbhe+YrnVQQjJL9wtRKYwPnUBcvw1vH0Fg2D8DQ1cJqsFgNnDDWQWbYoSCH
         d0FA==
X-Forwarded-Encrypted: i=1; AJvYcCWqjYm0oYC2ygZygdH7GrsdxIKQoiGMCpZiQ71Qb+NxW5O84bj8F3qx/gdgHfUqkqHwqGlk3XUP77w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4yP6V85QBQd+nDeUdVc0kyK02DDYWfjn7Q68Zwo3NnZqcDqQU
	r0YnYH6cpND/iwMCClxsU/NN6mGOJk3+HfFar+D01W+UBb+MzmHvd8T0bC5rTd+m
X-Gm-Gg: ASbGncvXui6mf+0HNEPwaZL6Dk+CQBgTWb19drn8lsL4bQgPHzQXkDu2EGg300gLEG+
	bqKvSFGVV9Z5+zWVUt5Rj2OHcWVCIgxPuzh82GF62mumLpJ/GqOE81454EADzNYlMi78yrX1d7l
	VXrEHFP3DX6j4SplKnGWZkukfysncUQ7wMvFtotY2V6I3942/evSWoKKiJDjkJxpY43i5L1nWH4
	kAfkViBlUK7GRrgrEnTB2/GkPhkxZRTromhqDX8HqbRHvjHBVke59EOWIZ393xW209QJbuDi5X0
	89v0hZxL5hUEQ3iU2gBsXy19wi+Rdf4/zyPAiYwefx8ZyShnK/0p2jbDVc8NbyotnE57zTtWXLw
	teUEMKLo4fJgwSolw90CQYjNCFIE6tNJDKq9Zf+nbOqExsAIxQnxUYz4i9XJm1QbsIvFIIeQPR7
	VJS1bMfI+hsRbbqdtNt1ZnsBeNb39kPOq2DPovPxrkDiP2VwmQKCDKaZpc8hud6Do=
X-Google-Smtp-Source: AGHT+IFkIKvwAXZkRxq0bw1n7p+QL6OHVoiqjG1c1p/rRPXrrjdifWh2Gslz4Rda3j2fXlI5mxNNww==
X-Received: by 2002:ac8:59cd:0:b0:4e8:a0d5:45a6 with SMTP id d75a77b69052e-4e8a0d5531emr253603841cf.44.1761128022143;
        Wed, 22 Oct 2025 03:13:42 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87cf51fd17esm85200846d6.2.2025.10.22.03.13.41
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:13:42 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-89048f76ec2so887372985a.1
        for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 03:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCkbLmysXFZnJa62iHSFrEK0BBAtYEyBriXgwH30aHQIapTYDDwLKkc7T+1PzWnNni8ks9Dqcsugs=@lists.infradead.org
X-Received: by 2002:a05:6102:32d3:b0:5d6:fcd:dc86 with SMTP id
 ada2fe7eead31-5d7dd568745mr5376089137.4.1761127531051; Wed, 22 Oct 2025
 03:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251020101311.256819-1-richard.genoud@bootlin.com> <20251020101311.256819-6-richard.genoud@bootlin.com>
In-Reply-To: <20251020101311.256819-6-richard.genoud@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 12:05:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVf2dgWqsfVt9HCytJmmRLYiCkhzSJVp3drZ6KDq0Wwg@mail.gmail.com>
X-Gm-Features: AS18NWDWB3ss9iz68cJvppf6RUhrU6v4v0GhpWefkhntn5szf5Osn3JvNoovQ3I
Message-ID: <CAMuHMdUVf2dgWqsfVt9HCytJmmRLYiCkhzSJVp3drZ6KDq0Wwg@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] mtd: rawnand: sunxi: rework pattern found registers
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_031343_759113_4C150DD2 
X-CRM114-Status: GOOD (  17.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Oct 2025 at 22:51, Richard Genoud <richard.genoud@bootlin.com> wrote:
> On H6/H616, the register ECC_PAT_FOUND is at its own address, and not
> part of ECC status register.
> So, introduce the pattern found register offset in sunxi_nfc_caps, along
> with its mask.
>
> Also, introduce a non compile-time field_get() because FIELD_GET() and
> u32_get_bits() don't work with non compile-time constant.
> https://lore.kernel.org/lkml/cover.1739540679.git.geert+renesas@glider.be/

FTR, v4 at
https://lore.kernel.org/all/cover.1760696560.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
