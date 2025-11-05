Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A52ECCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Tp7q52YEgo0uga5yAbrXyxcvSphExwLHT8/swi6AO4=; b=EILy0ana/xD26S
	KDuGpYi7dbFUxhrMkMKJMORgaHfiW5zgOxTUePwhlXkjycMhRlW8SHTcHNpMURA4WkD9id8IUVXUL
	QYP07JKOUJg+pH7XnmM3UEgIBIRTAfRHyxjFJst5RK2scMcfZ6aVmvXh7SCjM+sDOvrtyWeUK+SEV
	BgPuGt9cvPfAF/Im3XhdFGxoW2agp1ARdh2hRClrMif0FBVW2kh2Mwfj0piEp5kGvroKrhe97xgSW
	HhlWRV74vdM+2aE7Av897zIxEVD3Q4AgGTn7jU201yUcgO8JJ0vHWEqa0D808OxBbu2QvqkiEJYFB
	LGtq7LqJMlxEsFy2K7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgCm-0000000E3Ag-2rYi;
	Wed, 05 Nov 2025 16:17:52 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgCl-0000000E3AC-04Mb
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 16:17:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so9381943a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 08:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762359469; x=1762964269; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhBGQ6nFBF+atfYcqmQvtOjXbckgxH+TUDCypzrRKAI=;
        b=YWp9fz4XNpEmHGujegtrDh4pekVt1E7wYI2ee4QaRjXcnD2S1heibP4dHpS1nDOWVS
         qaIGXeTXeKkcRIm6XTIN6bmt5LUMA/AYPp6dJzcha+NROvVgeaNszy7cYIEedzAJ5za2
         AvHPqivRCx5mDCAJk6C2GCgrhx87jrxGrv9vGEzaOniWxHgIvdUpkoDwai/62G7FLNLd
         69N6FSSN0jA27eSG9MbXMRf1uo7lalUJ9o8ZXc1cw399/POxYH+6mUxVtl00soydpeDj
         NHTDpcDKXjMDszPwzeuTuEyPJigfjcpemKWT0UKI3NLb8W3qJoWGA2viJd3cY9bzsrT9
         a0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359469; x=1762964269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhBGQ6nFBF+atfYcqmQvtOjXbckgxH+TUDCypzrRKAI=;
        b=IsOHAKXwd2AsX6q+WYUFFyyIXaORKwqHkrbSU1vMTqXwdMqx7Lv1sIDem2U55UNcbg
         dr/Pbk/bJ6pBGcvZZ6iYmtdvQZ4oQow7c0T3B0lGzPDSKew5feaJFzeKAj1iWIf1ySMA
         zhuEJwclSELwZHyIgT5RP2ZZCYcjGVh+970EFehixlHRaLwt6XztiFc6PX7gJrIjv+Jx
         NwfGpeujg6L/67YeaiMxc4uIQHvUzqaGxSE6Km6CnFtKgjVHwzjWAyfqjsVaYGUarP4e
         SDKCYwOe7ZZRu+AT9i24x2dWnAqu0ECfiG0HFIIe/GX3rFb29zkCeZKiIT88+Hj0K+n7
         UPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV7g2iUninw6BWIl0YgqRELEun6CrfNvXS5tn73htLm4rt1Ip87mMj8KBNnT9VyJk4T+bbop2WFxA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUT4DPsMHfWunr0DiDzF4f2ST1ryxi9/JJiwwxLQEhaDtTCBDN
	Yi+yN9/q6XtviVHzNFTzvWEC1zbYnUTv8JE2JOyYabFz4zUrv+HMpm9btJ8oqZ5+E1E=
X-Gm-Gg: ASbGncu5dr4r6oWl6ytAZ2PZmrn2aBCJEESStUqYB42wIg6v7hZr6J8sHZ8CT+W2XOr
	NvQGDi4iCru8KEMiyJSXY1CQG2zgvac9QukOYrmeGs4lX3NNn/ugOZcbkH44Es8zjcTeSDuWqVz
	eUoQm3Fd78bDUM9VhS7694a2SjDOwunjwN2T3SrmljBonr4Jrnl/wuXPJakRd8owA3AOeTd9KWj
	LGI6tWDfk2AWQpmXfhMHi33wkupJZMOg/q39K0K76O62RWCepmV7W5Hz8ASYcxiquwO791swuio
	96lkzSG784YthUrYQtZvqJZplTY+4CJDHaIHJwdQASHIByLc+jx0U3lcMBH72DYDlq4bKP8j0xl
	mOvWSt5+khRbNmT9v5kgnwJiXRDD2x45zHgf5MT58hXWoy5RVkcDkLKPdB0c4v/UbxtKtXda2Jo
	6DHULOECb8OH+1Fzg25XsWM5g=
X-Google-Smtp-Source: AGHT+IFe9VgZeBsm/n9mopNlUCpQdXSC+eyg2Nz3OAP18FTVxYUDNKqmICDXSKw1lMgKMLixqXfVow==
X-Received: by 2002:a05:6402:51d1:b0:640:c3c4:45f3 with SMTP id 4fb4d7f45d1cf-6410588dba0mr3398799a12.6.1762359469142;
        Wed, 05 Nov 2025 08:17:49 -0800 (PST)
Received: from [172.20.148.132] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a5cd09sm4921331a12.20.2025.11.05.08.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 08:17:48 -0800 (PST)
Message-ID: <7b10d3f9-40fe-402e-996e-81c6684c20a0@linaro.org>
Date: Wed, 5 Nov 2025 17:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/28] mtd: spinand: Create an array of operation
 templates
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-9-be42de23ebf1@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-9-be42de23ebf1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081751_077078_4A08E657 
X-CRM114-Status: UNSURE (   4.50  )
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

I like it!

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
