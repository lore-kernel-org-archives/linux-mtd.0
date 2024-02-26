Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF21C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUnhiIEb3/CAR8qpJA87eJhPOjDcItNUbQ7bIXUIaQg=; b=wC0G24/KMDcIvm
	ndoet1rHyaxBXQ7WteSrgdUtC1ylrth0QgQYR6Syzwqmwip5I3kfYdno2SJ3x3wWkemMbGHpfAeAq
	ONvvs5jx1Z84EJSuI+gjf8R/dUkmH6ArJtyYtTvkhq69SzUztlxxPZqX21dk8hEWLDZmhPNdHXZxG
	rLFk6WEjlO/L2r8UkedkRwFdtlj8tncTfgOjewm2Ua6b3V4LnGleTqWN/myhn4iFMCvDpJ+38Wg67
	YZ3I5p/pZs1WfsCMI/E3DgYG86QNS/lBe7pNwJGZ2kXWswrKF++P2m+7b8UYy61yHaagd/9WGuE12
	XcP1w0QrmsRQtW0M903g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXou-0000000HWIp-1jaN;
	Mon, 26 Feb 2024 10:02:48 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXoq-0000000HWGT-23jL
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:02:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a3e85a76fa8so252588866b.1
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 02:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708941763; x=1709546563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsfybu/J7fq2BKb3fyxEbQKzNC70FxEDrNxyD6UJV2w=;
        b=n4sKlSdm6Wyo6qEJIMZDDvfwUbIfA9TpdD9iLXw5i+aW5rep3+SPBYJa2paebSl5nm
         Md9bgT3ymgqOLRKL8EfZJNeIqya5W5ZRqzKrkdt236Rd+UxFlxnCzx+2N3MmtBNIZIaF
         YRpKayjotSptztbfIeRMF2ceynAWTdFPIcGE0qPi6bzhAhgTkhbuYieFJDwb7UFuBqHE
         MXV9Ow9Nck7VZ/CvATMpeohIktME1phms/bWxMkD/Sof8KLhMo1fuMmFZ4Oj6yXf3Oeb
         UEmw1kOh65UTy0poKLKHROQyT4+pPDdHGtqJvYphIOX0qp0fXrg3Plv/xnxIUaV2/ft7
         xz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708941763; x=1709546563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsfybu/J7fq2BKb3fyxEbQKzNC70FxEDrNxyD6UJV2w=;
        b=nggitOsV1DX0suW3Kqpjw5GpMQ5RRjdsUdO23rk4p0aLD7nBnx7qDn4lYAMHMu2enC
         kuD3bCLIIhVsCsNLAac/XKsVRF4aM5THQp8a8aXjbJ6Zm5smOZ97dz8eN48oCOMw5BhH
         ntsyCvaJRzo7jcnV+hMY8403chvSokRjC2dEXM/eGnYVVoM3WeyMRJ8dxFCwVqlyhz0H
         BUj1LW4YaSt1MsayHLHNAKEHZemySPtZ30Uz1E9o3/mFOkhSANvdoCTEFCMTm6I+JFxb
         kpjPqGN9yDwrUiIqrlrrBJ2X1XmDdKYxSuYivTGPdUiqJ+n2PQkHA9SIp93jdm0dBBPR
         JILA==
X-Forwarded-Encrypted: i=1; AJvYcCVRFGXotCrAHJmGYBEagqaznFCfk9lT5bCQIwWZbqENgtnEi5w26PyEaIrMkBBg4D6VtVY5GAmXZLCcj3LjF5jW2Wn9G+g+vQzLfK4s4A==
X-Gm-Message-State: AOJu0Yy/ozXIT0vzCXWLSGA1DXExN+IkgJcH4Qnhc066/PicBazVvlSg
	FW0WEvNgPdcRLyrMc+tXBOMbR0Y9aks91BAYCdJ8dOzRYTnHNSGoCL/PgDIQG68=
X-Google-Smtp-Source: AGHT+IF5ob2nxmdMYoXYiTfxoywwvzuSWhSgCcUYqYf7yAuMkb9+/iKNXTtfGae++7reeSVA5ElfRw==
X-Received: by 2002:a17:906:4f95:b0:a3f:52dc:6a21 with SMTP id o21-20020a1709064f9500b00a3f52dc6a21mr4306694eju.14.1708941762699;
        Mon, 26 Feb 2024 02:02:42 -0800 (PST)
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id jx20-20020a170906ca5400b00a3d777aa8fesm2258764ejb.69.2024.02.26.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:02:42 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Josua Mayer <josua@solid-run.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mtd: spi-nor: add optional interrupts property
Date: Mon, 26 Feb 2024 12:02:37 +0200
Message-Id: <170894175149.30146.3207560853406450700.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
References: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=590; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=FMXE677AO8wWequWg/647kFxLIZ8WzSQjNdPcXIe84c=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBl3GG7RxwRnOerZC5wsNaIk5lFzF4BjDuzFg+Dj BY7/tk64LSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZdxhuwAKCRBLVU9HpY0U 6Z7+CACw4HgtlaW+WJ9I5b9WPhh6l/AMqhDc+vLlwQrd57Yfz7D54Pxvh1e3LRlJNTUU2Sf4PYy KUbirTSAaVvrBrPHXkMwr2dIN6aF42j1s1xZBz5Cvykcs2m6sEXnSKQlHyONVnV5cP7zw4w6YPZ 2wE6EyoxLkfpvZSAHIMjpOXkVDcETLwtdHGpctE1ORRSHksUc52TyMWs+6WWuYqGnt2q2Nff4m5 /NoZB38BMW38A01SCil6lc0uV+E/tXvO/sPSS8eEVBSsQkreIAevUNpus5Ltg/x7X5UuTG9DVwt eDg6FGQxEjDwPmZGYGEX+ctOOocmWo4OkSp2pyalupIBcbKi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_020244_550782_3785CF76 
X-CRM114-Status: UNSURE (   9.24  )
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

On Mon, 19 Feb 2024 15:41:19 +0100, Josua Mayer wrote:
> Some spi flash memories have an interrupt signal which can be used for
> signalling on-chip events such as busy status or ecc errors to the host.
> 
> Add binding for "interrupts" property so that boards wiring this signal
> may describe the connection.
> 
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] dt-bindings: mtd: spi-nor: add optional interrupts property
      (no commit info)

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
