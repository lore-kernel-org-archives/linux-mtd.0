Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D02BCD5BB0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=luQAD2GwIT6505
	flEulLHNH8GI0cuH1TlueCPrBaiiaZoLJChJI2Cgt2IprJiOgNDjrUpiPrdJT2xwtKtJm/Wdkwdbf
	TDWe3CAF0Hjp6bZFQJ7gpvLb0po1r7InJSB2XKxxf5W7QUR5vsRWmjQfOWTpx83cqR9eW7gM0O9DR
	mr0u4u9PVwsrah7f94FlNWa0UDTU4GE8NHqZwNlPoFck3K0AWfMBfvTDenjsMe6Mq6jmpTfJ/ZnSw
	ZILU0s8NCjoRo6CIlPW82DJbNVkfDGe4ORnNEtVrvKGc7eWI3IFZUnUzDTE0Vg4Q81hNc8rbA5hvq
	29qBt8m5NyAOKqJZmxYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLsN-0000000AHM1-0HWm;
	Fri, 22 May 2026 09:09:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLsK-0000000AHLV-3bBt
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:09:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso36947245e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779440939; x=1780045739; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=nEhTkuiZitMAhNaMG34M1j8WrkQBbp79SVO7k3JdHdPGXF0HDqdMLkPAXGRLNUIBFV
         mnGQssiiBVZF4b3m8GUTomyBkUXjZLOQPIDRyHBExC3ubXgzjrQMOqrkFl6+685lsMeY
         X0fQtyANh/eThsxC4w8JJqsFc7J9GrSqHxZ6l7gzbv/M/ZJ+sHlFiIHgrLoBE9BRmN8G
         lgyLCSz9FN0yN7B2t1vYGEAoMrN1SBw5nfxwCTTdj6ZyyrV2oBAE30LL9IiIIXOjPanV
         UkcIFPCVkaNIDBQwQCx7EYTwiAncdLuy2i97vYU/KxeHJKHAwk+51lQPdf9jeS9cT072
         5BRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779440939; x=1780045739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=FDysjWfMpxRuuD7kAjypqdwVwWUai3BzbQhN//OWlj3LAUznwYLI6yNcbftuYTUQUt
         +EpNj9MJosTkfa59RaIM4h+UObdou2m0Pvg4A23e0bDUIky97NjlH9c5okL0lySdCeEr
         2zabfmwCsLqgcTn/fReA0WDOY9CdAMtQoBvNrfXX9S525x4psRihXLq5ZmFrvQuph44r
         xA6r7BL/lFRmE70kdYAY1uV9d4eRlQN7BNUqqz0kzIf1/LNjYeFTVEcxQ1QN9ecwa2tT
         jD3AERUXn4K6UgC8ipn34ijMjd+JAqZWAsgDLzQbio3cZKxubRaqQPF97sokDr+eoW6j
         Pfmg==
X-Gm-Message-State: AOJu0Yw1XZHx5cO//HSM7k8HUkk6bKs06OSnSKZKgQ7J9eFQJ8zEwG/s
	P8jGlCD3FNbt3bkALexwqjoqnZu0uxO4XHsIQc0JMrw+vVHcdXJ1tilH0UG5YaNQ1jw=
X-Gm-Gg: Acq92OHndx2+6UVu2s7YsZZeU4TO/wkpARi2XY9tphq3Z2mXhKT22PF23k74AlbUkt6
	2m370dIEjrXgkAP4eiG+2FmNd7XFV9Tpnb+Ef4h4GaCKbMMEauO56n66jkdnjGfQAI0DYhal5xy
	QYXZ+mG675mTS6s2izNwlg+4UKDGropeF+5Sy0u/8mTGYNbqyzJODmR0rAPdjzCuX/ZvV6Gx6X/
	DLyi2PCIxbg4GFmvLMWPZ9Z+OThHmTbamzkBH0UpA1Q3fkFOiuuTx+Oxq0ky2ITVEWwKTbpNijj
	ZXl7rS03dUFgtaIXbTaKlPz7FS9aJE5QN0kvc2zMS84JTFAJdlQ3aW/+Hjd/4yj1bqKMXhm1PPF
	v/M9Gphwws7AF3x8c/Adm/PuFnmJ28QOxSabJTnoj9FouTWbL4p74EGmPjPu9by2qM1F+BHaVnF
	h0JCLTwowu5NYTkv9nkbrS8NBYUccazU4PMJquPnkLMQ==
X-Received: by 2002:a05:600c:4ecc:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490426d1ea7mr32633515e9.24.1779440938972;
        Fri, 22 May 2026 02:08:58 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm36037245e9.10.2026.05.22.02.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:08:58 -0700 (PDT)
Message-ID: <a1d915bd-cfe3-4074-b860-d01d281dda64@linaro.org>
Date: Fri, 22 May 2026 12:08:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] mtd: spi-nor: spansion: use die erase for
 multi-die devices only
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, stable@kernel.org
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
 <20260522-die-erase-fix-v1-1-733ac8967df1@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260522-die-erase-fix-v1-1-733ac8967df1@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020900_907112_915C355A 
X-CRM114-Status: UNSURE (   3.14  )
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
