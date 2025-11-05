Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E40ECCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=J9XF3h2wokdi+y
	uHGuxAo+ioHzMUuCk1ZW1X39fzQBhOxa2tPGXjKDIHjwnSB29ru3Pul3TQmkAff28HeEyHrQeYhkQ
	SSoGLWI6iFuKhxJ4T99uDgMnp9AcfkZ7j6emUhrbpzs6vABLKW6tMoGZMq1ZK82rf3ioE+Xd5+vn8
	xdagXZdzjMDEaxUeQNtLxd7/uzD6lw/2kbfSGGncHI5HuybTcVQS6dty49NQO+fkbY3qyGJdDj9S5
	LzqkFzzPRVnlZIk5Ike5IM9kXsPhx9YxEzN3DXYCQd5tnzIAaYCXOFHl/flPO3MgJm27KA/ELdbZ8
	wg+wYsElDCQ9HQDKZEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgZJ-0000000E5T3-3AlL;
	Wed, 05 Nov 2025 16:41:09 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgZG-0000000E5Rd-3gAf
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:41:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b726997b121so140432066b.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762360865; x=1762965665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=TcYkvV55x/BSpni+NZ/f27MbeI/Vp9b9pYWxJcdl3E9jYa06crfsgbVdbTRcVrROgA
         1Ue2ETHPQAHf9GVwp0OO0tODvG9dk5/hbF4ZGkbSZEFWC4dajQqR5hk+kWEc8I+jrnho
         YmDOfJlXZMEbZJ+DJx7zwix9CYcABmFuU+ye6J0yZslRuFf/FISqe0Ry6ijxSAa0Jml+
         r5oSuc0ZU1FpkEJT1ozDlz/e+/pRI7DF3p1ryGvyTAD91D9V56f36DybmGcHpUiax7h9
         MRN1NpybMSyWmHxrxk0AS/Mw4bkI5QVHY40w04rr4zHUQbUZwyEA6FWOwzkr0QbHL2vS
         UUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762360865; x=1762965665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=PRU1da7rQ4J9llyRMdmBkYvccH0/cF6sDMAMvgKzrKJV53AIR/Lm1Ym1uoo1u7ThRl
         qjtf7uVgBEK9Lo9Q6+J4zy/aby5Ag82F2O3S7mz5x5arFSpuKpah+yc6I5itdgdCOdSy
         nwxrcmMayM0MjKn+bhKZEYv1HGOEaAN41rHmj114fvtdzrOb4GQZGJhQj22/1k43etsF
         +4A2czEl2mXafxtUf8gbn/Oclb6dYsQjx8NE4nR2nZo4wP7l4ddQVvDx+l/ULsVyt2xV
         Fdq4Ilvt6V7a7RMF8ZUns59ui2EN3BrxjgVIP5BWtXPNLsTFuioD8pi7dodzct3xjXfN
         mDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPLIDVlhLXgrt6LUPb3tcSa4xfsO573+fjHePDsgSyvKerfE7hO1/F3Piejf9m9OEmGO5mrLiBRJk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQhLJmr70Hrim5LswrjVzJ6Ddff0WkmItUGP3VJtX0mbEe4/9f
	EhXOgEbpeyUkEKc42yI7RzlYDgMCPtnsXhIF6ZEDnb9KOVyluaUoyE8vjO7SylA2Kvc=
X-Gm-Gg: ASbGncu4LCOIdQqrzXI2Vte7ufSZJww1FmNpymfjB8zvkPcPsOhV3MofpZ4QbfAbLBe
	QkHevU40UavIbm9b0iqsJq8p8wJTAQlstYvGA7+CKaO6XU1wsAOCZOIztrX5cEuNV2KRwoUl/2f
	NcByqPWTg/GikOtLk56MVjsRguvcYjIcCRzjiez50zdLXewremC1xRGgt+l5BGLwbXxjAvD/VuO
	1Fcn1csw/CYavl747dLblMqZEliT/44dGDrS0sacj8RmO3RGRVlIHD7VJc4u6vkqaLJ2bYiPzfo
	lXD6A0iMoiPbrTtUXeWzXuCd9Ynr41FE8EOuY3aQ0zxUSpf7M0f8raxUUe6YuOGspq6kKsUc6in
	67TP7RrMhK+u1B+4RyVlzBuvon99LHg1eYjl/D8eO4LL/vA0xHv1Y1NsaeFzpHVW4Os/JnR4b9V
	7f9MUIoaFwCwZUEQ7u3kzOwYY=
X-Google-Smtp-Source: AGHT+IH2mUi79RN7exis38BOklTZsMNZ/FgOLFTlEt+kXnDPqwAEesKS5Bf1yq+oownV33g2WMoY3Q==
X-Received: by 2002:a17:907:9614:b0:b6d:6650:c3cd with SMTP id a640c23a62f3a-b72895a01bfmr1936866b.21.1762360864962;
        Wed, 05 Nov 2025 08:41:04 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728937d88csm1932166b.25.2025.11.05.08.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:41:04 -0800 (PST)
Message-ID: <b081a4bb-66bb-4825-b33b-52b55649cd36@linaro.org>
Date: Wed, 5 Nov 2025 17:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/28] mtd: spinand: winbond: Convert W35N specific
 operation to SPINAND_OP()
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-14-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-14-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_084106_916169_8BE90055 
X-CRM114-Status: UNSURE (   4.64  )
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
