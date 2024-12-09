Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7159DE7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNJqIqzXU1lBYRR7vGT41CaznObbrF+ULk+uHfWl2HU=; b=I6CmHS7EPl3yQW
	3GE/bvHDY+8NeUCPLZfSSCkUA/n7Qn+/KKAXlAO1Ix6ktbyCEqX1NMyVv11DDX4r3dd59R3rs+SgG
	jrUsOx0ltLDWA1QRWeDSVFGJHWJ8hQnTBvg+KIZ722zxU8Ma7ZGzePQ221fBh0hjmuN103e34E68T
	L0pxG5ITr+H3f9FB5aDgkYc3MupZMsWSZX9z5mXyXKQIshNaihBu0Wy2yIgZcOk8wjrtp7S0TGvpA
	g8U3mJ59rAHU9L8X4S6Jjtx3OzrgHVfcUl+fhkIYnC/ObY1jV+ligimAWHwNAI3ykCjCvBwykM0EB
	YsnI8aXPT4QvKuKbwX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjcv-000000094z9-2WtQ;
	Mon, 09 Dec 2024 19:41:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjct-000000094yi-1qMt
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 19:41:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434e9e22a99so1490975e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2024 11:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733773261; x=1734378061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeUV7ATPGzq8ARMGli9TBeGlG7WubOrXx2cbt2C9Y74=;
        b=Mp+rsy3/lpNun93n6yE7go5Nedjj5cPY7UbfoNOYK7dgJsJinNHMJTqkStNjsCeqVm
         OqiR+M9NFc3xoi5YAuYak6MkZLd9c3YNBKo7s3zmPJbxEGTXFh6V1uir4U3qm4GfhGth
         dhmKrx5osG+e4m2GbKal1j/II7jgArtzunlh81eS7OlhRk9ui0OlGsCc7wJvCqlqGXUG
         igx7VQ/IPpel3nXO2a/cX12lP0ADRTN0TTiiN47oaoIK78QqjOY9zO3kLHeoPiio3xaR
         xz0MUqoC3s1Gq4enyzpHcAr/PH75g9pEP00b7Z6sWvV7Ew+Wy6vR1lHRQOmdNUCwhRuq
         A1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733773261; x=1734378061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeUV7ATPGzq8ARMGli9TBeGlG7WubOrXx2cbt2C9Y74=;
        b=EFmi6Epvwm5FCNR2KE1/OfL3g/EbJY/yuO9mwT84KO7Qm4zLKAUnaz1MYYujVN6hu8
         3Xh0TqKCQVLfXjA8GDB447Zm2qcKn3MUKjVb84AL0EOounb6mnu9n/xMzV+nmjzXhzCe
         uQ1Nre1RXGRB0owaT2oWh2Q30VzG8kD8q6YFJLMV5zbqV6bUpw2Nn7Og0T6AxA4ko0I1
         NCykndO+QBLQdJByVeEumpzCUgdYLlB8cR34nQ8acJR+mhi+3fmIzoRC7JxAZnO9ZW3r
         YZOQ7r73h0500nhYsdTmN4dRemKV1umbgnMx4bDFQW74nsg7usG70g6MtJ1QPDQ4TKLo
         oLvg==
X-Forwarded-Encrypted: i=1; AJvYcCWtzl7KHXaVetUR9xuQ7z1xEJlAFefSRKxRwR4JA3tybX9SnGsvMbVs46FAraj4+onwP8JhpXphlUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwD+tNhl9//rUotyUq4TskmUjAhwGIcMkdTdSPSxShmJ+U0lCbR
	dIC0s2C3jAicD8Lt+yrh0OhbZhsD6DUjhqSVuBXQ9a47DgD2e9eFGEwBT/Sh8r4=
X-Gm-Gg: ASbGncshzWPKgugSLoCAHbkr2a3vE2DsDbQFhRpC7jbRTxr8HTQ21iFd/yLrsLumJKp
	O5jz7e+ThhzOeFQsqtyhQiJ+E8KO4xekyPIn/BM1SKWh927wfpeZuzCX/vk9JAsQyr5l2lL4/DU
	b+ttDYTHZ10xBBP4EwUTgdk0BbzQM2rLjOvYNRoe//UiW+5bGKwc3kzNfgWB4NGWkh5uMcfGDss
	1mc3nJTG7Rur2H+VRtO7rOWTddnl8NtG9VUxkY/puvWpMHRuPquRbCHBxsNu9mM
X-Google-Smtp-Source: AGHT+IH3wYRFE09ZMScev5P6t8HEEvM5cQ4HvJNjFYxwWecu/5OqRvvW9SX6tcv2+5NXUE7IyZwIiQ==
X-Received: by 2002:a05:6000:1565:b0:382:4e5c:5c96 with SMTP id ffacd0b85a97d-3862b3aa8bemr3627505f8f.8.1733773261434;
        Mon, 09 Dec 2024 11:41:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386367f7c71sm8273964f8f.41.2024.12.09.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 11:41:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: (subset) [PATCH v5 0/9] Implement setup_interface() in the DaVinci NAND controller
Date: Mon,  9 Dec 2024 20:40:56 +0100
Message-ID: <173377318397.159219.10800117213949308208.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_114103_490036_7A3C3D16 
X-CRM114-Status: UNSURE (   8.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On Wed, 04 Dec 2024 10:43:10 +0100, Bastien Curutchet wrote:
> This patch series aims to implement the setup_interface() operation in
> the DaVinci NAND controller to enable the use of all ONFI modes and
> improve the NAND access speed.
> 
> PATCH 6 depends on PATCH 1-2-3-4-5
> PATCH 9 depends on PATCH 6-8
> 
> [...]

Applied, thanks!

[1/9] memory: ti-aemif: Store timings parameter in number of cycles - 1
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1ec0fa90070c9468d22b3c3ea5f4bd6c27810907
[2/9] memory: ti-aemif: Remove unnecessary local variables
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b3d57e179607106d5b08a635c49b338c409357d4
[3/9] memory: ti-aemif: Wrap CS timings into a struct
      https://git.kernel.org/krzk/linux-mem-ctrl/c/30b4da67655469bf8d4b8ba7c001096a1e10c7bf
[4/9] memory: ti-aemif: Create aemif_check_cs_timings()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2c7b585d19cc1a7185a3a0b58cb643d28fd19cc1
[5/9] memory: ti-aemif: Create aemif_set_cs_timings()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a6d60e3376065752137ec23d103f7d039c363e41
[6/9] memory: ti-aemif: Export aemif_*_cs_timings()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/df8e78607d4795806b59564ba7a3e2e125d119fc


I'll wait till it hit next and got build reports and provide these as stable
tag/branch.


Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
