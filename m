Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7251CD2E9F0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=PJVe9iA/uN5zrm
	WrCeLybp4zSa43rIvfVreHtOhK3ehZIuEv2JFlFUwLx7cGVxqcocq5yZSrRSqf/LMNj19WRPOhzDn
	1hNx3as9B+xjFpCdWrUSBGAPWz7ycZPrk7tb7tWflDSt325VJNS0tir8Y8nrtpOJvLfJht+vNp1rw
	FbKRgdsaNL/KO8E15JHxCIz8K3Uw+YlVTDjB0Gp13SE4d3k3iwaoE1Kwt1UZoM8/5/LUnibX1MTOc
	naoz1VcM68Q5Eacm0hvJvjBQC+kVvYjSjAFPblwKRGZQYIHhQM4R0aBiw3mDuttau0G+nv/l0UHnm
	28N4/Z4TxSaHv9V8mhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVFG-00000000IMw-0wa5;
	Mon, 11 Nov 2024 14:18:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVBa-00000000Hn5-00FH
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 14:14:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so40229295e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 06:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731334472; x=1731939272; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=aHeUtsliAN8E2DMTwQIHY4bCqV0o/hBSwlwZE6ZobzeOok8ACcip7m8TelkBq6h88k
         qA8ZdHYuG6XVwfKLm2dxdsKVKdwJrMVh4TOw1IjuOjrFHVCaNd3UAvTXSZxG1NGx+U46
         G4ulMOJT3UHTQ289Vo7FYfbOU8yYIPy4bVJaXGMqaRAIvJy7RxWf30esX4jn9UMgnO6e
         NQhtxkp6TUkqOEtPhlPFUTLvCDAEQqPTlGfgZRxyx+nhSpeDUI/Em9ROkoSJvksK3fTD
         OwZHuO0hnqceOIoMNv1cE76IFXOz+z4JpeMX5/Cyk5n4B+gvaPK8Jbr+rJj7II8W1ler
         JkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731334472; x=1731939272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=K5qgHcQLBlgD582W+yN0Tkndg0Tb8Cd3lz2WTU3WDzXBLnRznk01+SzyEMaZNZ4Aep
         BsTzzfVQRSUpJfBncw5BoyJwNaTvBOu0Y3dpHwQMElMsIDO6Une37oyCwLnc2sEAikwO
         yeeJ9lIeMJkhjsUV1IdLZyg4p+N+aiZ6pLi74Ls/t8rnPULmuz/bQcPtOCpbSIr2yb08
         0cCpcqBwC8OFfEyGRcFeAnHaw/0+CXgoD5J1QNR4w0SRDEg9pYQTjydVyiLGLAtPPbfY
         6XZr41IZj2oQeBb5QkPT5TVJ3SbNoXbYqRYG3492Q/wJK88prN2TiuJLGuMl3dq/WVhI
         Oqdw==
X-Forwarded-Encrypted: i=1; AJvYcCWFDWs4gUUv4vBevzLQ2SFdGlgcwjgnlgRTd/vXRto9xiXg8n4HWeR4mWS1iiTzknRqIeq8MTRvTSM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkwdAyUijzCMGWffp0d5Nk3sY35GC3OckM2B0svGCL/ZjmF2U/
	97NWy/T8yMyLP+uJNxy/LTzU/mH/A3INz+bkjsdyhBHeeZwedhj97B2ClGnetcE=
X-Google-Smtp-Source: AGHT+IEjxpaN42IB5iXA9LD/vdpXn6jKpzUv89sH3e/tLG/BKIRbSkuW83EVZx1SLvAlFImY7Yn7dQ==
X-Received: by 2002:a05:600c:46c4:b0:431:5aea:969 with SMTP id 5b1f17b1804b1-432b7502702mr108986925e9.8.1731334472027;
        Mon, 11 Nov 2024 06:14:32 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bc4f67casm79446165e9.1.2024.11.11.06.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 06:14:31 -0800 (PST)
Message-ID: <a187503c-a7a4-411d-8d45-d684efeebac3@linaro.org>
Date: Mon, 11 Nov 2024 14:14:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] mtd: spinand: Create distinct fast and slow read
 from cache variants
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-18-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-18-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_061434_087821_D233CB8C 
X-CRM114-Status: UNSURE (   5.04  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
