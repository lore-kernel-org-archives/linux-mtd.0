Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2914FC4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3gSy3GZ1ExkJAwVJcZwtk1dAh0Cuw8peCbPvzFqhjU=; b=U/R3CpmB9HBJm9
	qE4D/Mb4X7Yi4jA3N2R4O2/TDAKYhNLeumMv1aPA6BKk1+/oiQlFdJ7sUtNluqB4rxmaz3KPWoUBi
	YCcJ6lV2iV6yohhUHlV7eI9cvt/REFfGT7DZyeaLt9ROsO3mCzC0tUdVYEfbFNR+8jsFwlw+KL3WJ
	TkMWLGTj6Co2Smos1Kcb/dh2DnAy/zYGH6aF/C0UAXQt1hQffgdq3xXaiLC1rCM9OpfL408sJWG7R
	Q+IuFit1lJ1Nesu0O/ULS55tQJOLue/TUrwJEbNK/wS9q1/PI8BB2gjNWUJpmtQoppjhSfeO1c/4+
	qDhvSXUaOrMMIz+xiSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCx2-002D99-19;
	Fri, 12 Jan 2024 08:31:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOCwz-002D8Q-0K
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 08:31:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40e54f233abso31015195e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 00:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705048293; x=1705653093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NLc8a0VF0LHJY+Z2vGVbXBiVHAW/Br+RJN+WCKMjqf8=;
        b=VoBSi6CaC2GedM4XGsFEzfrRcolLa3FzIOFXX6qg90ku8ZmiQvKLkodI80DFKwBbVp
         e2OwILQmtSPsH/hqcISLJPPA4Ju0tBXJuV/FsYTX9XXdEPT44up5TRHwS+yK0VXuwAs6
         Ar85w7imqc9EVOmky+JT0M2nNLm+PMgYbU+r5/743V/Zmr0xMnTNXhElXXc5Tk+Sv/zy
         PpeJL4cAHgFj1C+NrLKRAtlCfLiSbFzIf9Pxh+gCh0Es6Sa+mH4M69CTUitSA0XLcuni
         v/P113dNA2LcvWqZMkmsOszbx4ID2uruY8Garz58YtyQICPiIfAOC5/6EScBjqWa/eaM
         LfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705048293; x=1705653093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NLc8a0VF0LHJY+Z2vGVbXBiVHAW/Br+RJN+WCKMjqf8=;
        b=tlnZSfTwsfIFixp3qus9LZceiwV+pzCq6y8Mq8zrC169BXp5NEdBdIwbJ4/o5Fvm1o
         A9vrHtha+u0lIYUO4cgb3D0sXk8cqGH254HYN1Phs+FgY7gq78lnRZkoN8uMNpEtYqY9
         XeqHwZXrCbrltFc5mTla0OPU2NnbSQ8eOyNc74v2eiavLo1Qtzw0byrrPGaCUqd9inv+
         KRtNzTe/fAzL56QQw9m0h5up/8cj+0b2lmYgwPGdyRfaKOkTdK15bSJrZUnLI9CE25ou
         1wPLO/D6djbO/ykQ+y01M8ozOl4rYnpsk5/Ldz0ZaNytnyClhEzdm2V0+ILSQst0At9R
         MBbQ==
X-Gm-Message-State: AOJu0Yz+EI3NueA5VTLoU1i0nkW+h9yAa3xt2guOI4jQ50fbuD+HXMuz
	15VSYeL79+OrkNUcIsZRjD8aoNwkvxDbjfl+hx2oXQour2s=
X-Google-Smtp-Source: AGHT+IH7GNVY0lGdFYqS2I05szEc5OBY31Q5riYWo7glY4Pl1MNPD1Z0Zvmp95RHOqPN4PdM7dZsUg==
X-Received: by 2002:a7b:cd93:0:b0:40e:44c2:a3ed with SMTP id y19-20020a7bcd93000000b0040e44c2a3edmr582012wmj.61.1705048292949;
        Fri, 12 Jan 2024 00:31:32 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600c4e0e00b0040d3276ba19sm4994503wmq.25.2024.01.12.00.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:31:32 -0800 (PST)
Message-ID: <f748b556-df2d-453e-b380-ac426269fbf6@linaro.org>
Date: Fri, 12 Jan 2024 08:31:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] mtd: spi-nor: core: Allow specifying the byte
 order in DTR mode
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-4-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231221090702.103027-4-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_003137_149923_D147049B 
X-CRM114-Status: UNSURE (   4.83  )
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



On 12/21/23 09:06, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>

Please keep my authorship, as the patch does not differ from what I've
sent at
https://patchwork.ozlabs.org/project/linux-mtd/patch/20220311080147.453483-3-tudor.ambarus@microchip.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
