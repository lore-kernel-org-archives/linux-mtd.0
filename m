Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516A7C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C93bvNVturLExvnobtIP1yAQf1tAE0O3joL5fPabnbY=; b=kDJ9bGfCRmoFPZ
	Jy447IMtj2WJ70ScXYfiHMgGEcjXjD9oA8jxLqXiIf2e2xT/DjVOgsxZiy6vGVuWmrCSCDQ0XruK5
	E/7P9DtID76tnj8R6QGMvALvFyxsVtKmc6avaBf8dNWcRaBbWhqb0EtqFe1PxkwQrXEivtG52XpcN
	N32whLCW2zNXVrhy6ynpTQ6kW0OjbOop8gBgJiVe1yC7xV0DvP9gwiFLI7sL7PsJsPd4U2GBurJeT
	9C0wD4PqkGrV3Ip6F9UJSb5ZYU7DUeMzjT6AHH85YXD+4VIXmxSWdd45h48xwVTu+MUblsJkTa1hV
	j95/IwTcVRL9YXsrcOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRLM-0000000DKsj-1hle;
	Fri, 07 Mar 2025 06:38:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRLJ-0000000DKs9-2Utj
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 06:37:58 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e5b572e45cso2540278a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 22:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741329476; x=1741934276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvkljfI5OM0sWl9hPIx96BIVm+ybsghHFKQXnESRZdc=;
        b=Jg9Cr+Cq4+FYPQ1j7sS+opg2Wm5kKaqPGZY2ALbufQ3SYo3lwsOT6kx5WpYZlIAT2w
         WIphdWLVf664IWtZUoBhc9GKEU9YD66D2t4AkX/JxTsPXdeUcTYHYfiNoWS/eqvNBLt9
         4E4x7H7tygloiEK85E+jmnXYoQheVusj+LMq/AGCmK/kMTBMi/x5eVLjE5LxUAAHElVH
         5k5Ee6DDfMPggTzd+RNtUpZV+lNOolibDCsfmuhKv1vetUI5vIAuLnNOsl1523jbajv8
         qNRikmww7QKATctUGGT4dE72xitfetND3v1KVES07PbnlmsZ3LN9GL5H2C252mM7B42C
         DVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741329476; x=1741934276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvkljfI5OM0sWl9hPIx96BIVm+ybsghHFKQXnESRZdc=;
        b=kugVOsUjKWBj7sgRmPTkWDAaupqcM25XVu5wnCzOWLFATVECYd9FQyqsn/M/IEm55V
         0LVtGzVo0uG/fziLAJAdsdtK/Np4bRxcBfC9CTCwN/Mi4B6BRf/f0Lv3poNNxH/H8hE4
         B3z+1N6rnnyXKsVIrTtpmEo5GFz6tT6WQYnEcjRZ74MKYxXaimkhA1rnY1RyC5L8lZ7K
         pSIc9nIHLkr/KTDWHpgrCDZpbJxSDMWjMWu/vFrhPl4xi3U9am/LH/aiRjB2ep1Q2xvn
         p9o0TudW5+H1r8xgOhfWUCPm4zpJrTnTTUiDuuRloUrT7HaYE4tushtghTFNOVjqRgu7
         5JYA==
X-Gm-Message-State: AOJu0Yxn1twsXLbQnAcX5vuAFJg+i+bJ7lEvmcxpx2FSEVdzi3XuHAv1
	SohCw4pGp+fugQiVNhBvFh6Oe4xyvn2fiusvrNfgVxA5AdlY1CLCZ/CMRlcJu6x7q2LnqhCKbIx
	u
X-Gm-Gg: ASbGncvE+hzjZ/qQPGnAjrU/HRiMsP3YI4808CWqpno4+1sYJM1ZXVGNgnxkbyuJ6/U
	/FHWX+GMiwY7BCv/wKLti87B9nOhrqs0z+mlUswzlw/Xaiujoa5yaXmUOvCEx9IJ1jEowmqHMJi
	Hp49Rydb47vYKsu+vfICEwtinQkYymJf7lgLZNMrK1NUFGhCmM7lryuv25744fht7TTxSHD5tc8
	h8KCM2dzBEaZ/9NZoyzqefinTFkg5azO2IM2vVnhif5b3AGSNLuWdddpvsLmzwrYZ6u/ZAYnmel
	6600olCV4wYCArCLo6kMcKhnFswwclERcEXQpiA=
X-Google-Smtp-Source: AGHT+IGAzarraGWkhYKF2aTj2OCEKg2OAAe1utyZfoIrSzcKIpARDi+wNx+p/X90R1xILbhUDICHyQ==
X-Received: by 2002:a17:906:c18b:b0:abf:614a:3e48 with SMTP id a640c23a62f3a-ac252ed5fc0mr176511166b.50.1741329475752;
        Thu, 06 Mar 2025 22:37:55 -0800 (PST)
Received: from 1.. ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239482f51sm225778266b.57.2025.03.06.22.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 22:37:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: explicitly include <linux/math64.h>
Date: Fri,  7 Mar 2025 08:37:49 +0200
Message-Id: <174132945851.15531.6338270338581445804.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223-snor-math64-v2-1-6f0313eea331@linaro.org>
References: <20250223-snor-math64-v2-1-6f0313eea331@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=565; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=q3zzBEY1XijB7r0+7n9D3yoMpNzHtPWPJDqzNUhAJtM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnypQ85Vv9iFmzI5fD5akMsgw/nvBAKM+8Bhnb8 x2tnGiypiiJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZ8qUPAAKCRBLVU9HpY0U 6VPxB/9tWJF4xjammgHjVF+J0hBs8mkEpcKwI2q3mYER74YmDPqBoVLHKYHvZKxifAe4mmCah1i +MaWFN9c97J9sS/FOo6dTGWPD/I+m2N+qt5a4nDLRDZl2F+hAAu4E26a0QtmJ52bhNjtch7T6gD t5puPwLqMJ2IkB4NadKgYjIA7+gwThifZ1qsV+KNKiIWm4BeL0n/FVuvx8eTc5DBvSLJ5jDiLs0 /OCwOJgQ2qH0SUcmGkcNAOpOQJgHryEOirJ9NsP/2DQtBwcNmLoyi73vYbSMofS4tWnAwGusHH/ tYbp7OznTA8/hNQDsc9zC+DIsauWqOBIQKViF0ii7vw+uQ13
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_223757_635652_F544C7F5 
X-CRM114-Status: UNSURE (   8.54  )
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


On Sun, 23 Feb 2025 06:51:10 +0000, Tudor Ambarus wrote:
> swp and otp drivers use div_u64 and div64_u64 and rely on implicit
> inclusion of <linux/math64.h>.
> 
> It is good practice to directly include all headers used, it avoids
> implicit dependencies and spurious breakage if someone rearranges
> headers and causes the implicit include to vanish.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: explicitly include <linux/math64.h>
      https://git.kernel.org/mtd/c/93020292fea7

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
