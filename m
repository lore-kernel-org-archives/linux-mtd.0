Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCAED41D5F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HU4qOn3Adww9JiiPXXNlj/MzeTUcBcubAvwiXVIdWgw=; b=xxHq2jlxLi/jKb
	bmEzbTeLamRMtOZzK3mp+mYlWkK3cBMhf6fiXOBlZBlcCa+bb4I82DSgmBLt4/2MVPeikRnVA1i95
	TNa+jmh/8aJuBboqq6yRNRmkEANSN33RptXBaDQ6R4ECHjOQ4WqrKNZDJZbUKY1GKr0wJMHSo0tvW
	MvwxEJWHLCxrBTazAqDX9WVY6QnwZxU5hnH1K7kTgJWRX4GjBuJ9zBAERi+uGxk3ci9KjAeQhmpwW
	KwRrMUTPWasn6GDpWs+WNqhh0XJpF0AizdSccNSCb1U0dEfIf950Ff6vskTtnaZb+obl/sqkVYqyS
	ExzfM6nuTawYusf7lDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkzQ-00000002PkH-3VCs;
	Tue, 12 Nov 2024 07:07:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAktw-00000002Ojq-2Poz
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 07:01:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37ed7eb07a4so3489735f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 23:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731394882; x=1731999682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e90Eas/uN+CMCjttr3SXpKE5ydwUVfeG05npd83rlog=;
        b=S3qp/WfNxeAo14FDjVX2mdMT/1cCFf7/C+dvC7pPhcq7BDKrBGVdJn+v3UvrMdcOxt
         E+pbyZtcsfPy6igJwAlYHycySpeRryV89JMEtx5EuKdJnd2yV+3dA8aenhnsVGgv7UwV
         dS0vdXSiz7SiadqCrWJnRo3OyTfb+Vt3z22EWD9VlfzkaseybuPt0UaBY7MwswEcZkQJ
         C+FvT/CczxvuZzA6ujNowcxZXkoVYa4vtieqr6znZUSS5rDP7WOeLX2AxbiinAVpT6Vi
         9xGa24a9mENVBFsWmpK7zG6EGCuVRRNKB92YMFLJEdmXnDpB8Olx9IDHAynCuKgcSkPC
         WO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731394882; x=1731999682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e90Eas/uN+CMCjttr3SXpKE5ydwUVfeG05npd83rlog=;
        b=i32D4xsTasy0zvQAyXJQikyhJQTboRzqPtPKTBTg6JjY+CXOSShJzivlC2I4Ag4WY9
         ClP0aHTRdVh1a+87NDF8V9E9RCbDGLQ7wR1ypC+kh6UzzFzWJ8zYZKn9essQiRVW/ny0
         GIaeSEB8PbErged736tkBY4r/QtzB6RrKZoi+AFfamhaaoRHzg2U0GtvKFenfo5Uz1FT
         4zthoSb9M3DuXSOaYknC4eVXqB+1wfp2I015r2VhrZMiJQe5cpPNL8xaId92o9i+1Nx/
         XjnRn26h7KzhXnqWV5mosbF/rVEVGuSpcbJFI5zZfeujTOf2Ld7u/Bg3HtXRkNU3sg7F
         h4hg==
X-Forwarded-Encrypted: i=1; AJvYcCXbpidFfV+1R10vJRd7uZ9ZPBYzJvYKgDq7Pug4oKKL8yGoXtb2MTBvKT3TPY3J/3renZE9O3EbAT4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5kjVt3QWGBvAlNRb1sE4olTF+HBX0nMMmx/ruF09SlD14BqXo
	gkMUqqg1PxljHS4KF8IpA4BAxGLheFg1Bn81/jkHApI07L+qZ9vWi3/eUdHrkw4=
X-Google-Smtp-Source: AGHT+IGzjqCewg7v6LJsuluGeAw1t5n9E9T4ICaCzkpdT98/eoBBrmLzKDxDD8P1qsH+agtyBhgBiQ==
X-Received: by 2002:a05:6000:1ace:b0:37c:d11f:c591 with SMTP id ffacd0b85a97d-381f172a8d1mr13824302f8f.17.1731394882338;
        Mon, 11 Nov 2024 23:01:22 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9f8dfbsm14807593f8f.73.2024.11.11.23.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 23:01:21 -0800 (PST)
Message-ID: <7d5dcd4e-967c-4627-92d5-86232492c7e3@linaro.org>
Date: Tue, 12 Nov 2024 07:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 2/2] mtd: spi-nor: support vcc-supply regulator
To: Pratyush Yadav <pratyush@kernel.org>
Cc: peng.fan@oss.nxp.com, m.felsch@pengutronix.de, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
References: <20241029102238.44673-1-tudor.ambarus@linaro.org>
 <20241029102238.44673-2-tudor.ambarus@linaro.org>
 <mafs0zfm57tsy.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0zfm57tsy.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_230124_660202_0CF13197 
X-CRM114-Status: UNSURE (   9.90  )
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



On 11/11/24 2:02 PM, Pratyush Yadav wrote:
> On Tue, Oct 29 2024, Tudor Ambarus wrote:
> 
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> SPI NOR flashes needs power supply to work properly. The power supply
>> maybe software controllable per board design. So add the support
>> for an vcc-supply regulator.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>> [ta: move devm_regulator_get_enable() to spi_nor_probe(). Add local dev
>> variable to avoid dereferences.]
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> 

thanks, Pratyush. I sent a v5 here, where I introduce the temporary
variable to struct device in its dedicated patch. Would you mind adding
the R-b tag there?
https://lore.kernel.org/linux-mtd/20241111111946.9048-1-tudor.ambarus@linaro.org/

btw, I try to keep patchwork in sync, so you can see the status of
patches there as well:

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=&state=&q=spi-nor&archive=&delegate=

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
