Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FFFC369D1
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Apr 2025 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RU+eIS7MDFI5k6KaHT0go76+RYTGsTuOgadAAF55wpc=; b=12EnUqWU42gogr
	pcGBDQsejv/TryAgf+GndyAsJP/Vw5tLqSiAtcZzMIXH40VytsaaWdZUCKhfQobeesD6JdWKpa7zY
	iGY+4Wul6oTnv+Pxdgw6PGwHXinxL9zuaRFjb5GgmV0TG8GS2l7tN7QvRJAP4ggmrLnLfYYk8XXzF
	/5YWo/7mFwcXbhjU+GtgKrurWLV3OPJ9lNnX8j4Ort2xXTu9z2bVN08L58GPKvH4V6Aat7ZIO3jU2
	TwUAYtkb0nuNlOfFUnOqWeG9R499JkGJw4J1hLv/fgshjLmoNAlIhmcA8aalF7EpTpM6Hdk8TgSTg
	DhfrH+VMbK9yrwZuU8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qjK-0000000D64T-06wV;
	Thu, 24 Apr 2025 07:10:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qa5-0000000D4bf-2On4
	for linux-mtd@lists.infradead.org;
	Thu, 24 Apr 2025 07:01:10 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso1173940a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 24 Apr 2025 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478067; x=1746082867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd6KF7qnJBjEfDBLcMQiy13vHf6l7mQMuJsOH543KwE=;
        b=anpAr940qIyrN93b7kgyjSRCuTpS/AmnouT+sgNSkqeluFadd7kBlwLmmD36unAkN9
         ArhyQbSD5q7Jrv8UizszZURmx/8B4+xqKo25JIvrrRcmp2NFREMppe7o6/vPdd9OB3xv
         /CkKAddIGaR3JGonxHuJ3W2OVPexwH5GJM673UPf35uwr70bgtbZOk0O6InBa1azeKiA
         Pamdy23M2Iz0Stotu5EwJR4duQoWSQBjw49pOkAIUeMfCEKasqj4rzyrGmAwn2O31j/b
         4oCw/zanFJMemZXX/Dx7tNSyKnAaaVJkUc02jsNVtn1qwvW1PSLk11A7VJMUsXaxL65B
         TFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478067; x=1746082867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd6KF7qnJBjEfDBLcMQiy13vHf6l7mQMuJsOH543KwE=;
        b=J8mLH9rhLA14Q6ydSmyDDRD131ahu24yMNC0XzfiRE/bOXEkiuEXzl+DYMvkqLvw0W
         jGCrKQ3hQuDS8ZzIhGQwzX1cKAu+O0PK3aWKZ9phd5qrYu6tR90q/sm+uo+9ppwhiLPN
         5mEpjRyIV8VduzKqbDyUa4qLDjKJa6sddOo2gfkgnXsAI3pBvdsjbA2fc1Nn16Zu6qDI
         W489nHxApseMgKiG3UM3YWBNBloUh/r5qIkRN8L73TpNGoZCl9LuV4XTfT9XYTGi0I1c
         BhUAgKjItQSeSLZJEnP4o12/xpbVnDYHTJnbo0CX9UIDKfsB+fIHhaimOXZOPZ8T27Gl
         IGVg==
X-Forwarded-Encrypted: i=1; AJvYcCW4/4s6z4DaV7811Cf69uTY4WgcrdVojoi823tFMAp82pEgJpPsWiCWBpJceQdBTrAdsOiikiFuHe0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNHw5HxE10hIaxXk8qBRMgZ4zwooD/M3esGk4IdSX6yIrsIOH8
	O/MUU8qkrWWl08TMxf0NSJep+a7pPKa+1DBiKdd6vwumpcQyWMiPxkAl0NnbtbkWi1nOhH6eSj4
	b
X-Gm-Gg: ASbGncusSvJD6WlJV5cMecCu6E7j2K/PFH9WhvsEhvANS+vC2zMFL9xyUrFSrqprdBB
	Z+TABnpder7E2nH1XcRqTqxnrvFNNL37vU7IRqAHghD2QjK3YBC2wobArxKoAcAnOThchAGpfXe
	sVp7HK8lyHI/TZAi8DHRBIcwpNAJgtR1BJOZaSUSIDK/G2KJZDH0DlHxpQx/GN/8KmfJZTTo2XV
	k1iBIX4RAHcTsFYY3syBCflAix1mgSk5KkOsNrsDryoCH0/IyBdsKTd9Z3UWOXMo7k8UvJuRUhg
	0ELQVWdhOHXKHHpmw3X2paiNpB6ZXRd+8xn7KQ==
X-Google-Smtp-Source: AGHT+IGwr/WuZPUfvax9eIsb96aaCta/8FzIuwMP4WW4Ar2s0sxwfKKsr5uKtNR7HMl6jcdgRdFKDA==
X-Received: by 2002:a17:906:44e:b0:aca:a204:5df2 with SMTP id a640c23a62f3a-ace573a6ec3mr96658366b.49.1745478056074;
        Thu, 24 Apr 2025 00:00:56 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830fe7sm59240666b.13.2025.04.24.00.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:00:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:00:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>, linux-spi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic-snand: propagate errors from
 qcom_spi_block_erase()
Message-ID: <aAnhpVaVzn/G8TR3@linaro.org>
References: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_000109_617551_0073A705 
X-CRM114-Status: UNSURE (   8.17  )
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

On 25-04-23 21:31:57, Gabor Juhos wrote:
> The qcom_spi_block_erase() function returns with error in case of
> failure. Change the qcom_spi_send_cmdaddr() function to propagate
> these errors to the callers instead of returning with success.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
