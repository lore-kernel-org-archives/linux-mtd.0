Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47075C48BF8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPCTGpN2L0+aGNrnp2T6Q3em33Z6ftt/i878oEmxCtg=; b=Q1bmJVREtE6OSj
	cPYQ2oxF6LmQ+8ocGid80tIXt5ugKYoZykmD6ESYGcQWy25bEAjFSD23URFuBLur/leD1MhmFmciO
	6X81yTdqa95aU+O5o4E6i79TyO8v7r0TcgHKFiOjATTBGWIy9BiU2oSopzshYWc0C5P3kAbP75gR1
	CK64JwMmMlE+SLJanJwrDr6vk2gQjCABZRDEt7N3yfUcVVl2HYFgtm2VZGnSBOD0GOvrlmrqOWtKG
	XIYB5pAHWFuobSKezI0MXNdLL2InPJPDvLs4/ecRxdHx17poO+2JBOdt2yes4PaOiyfx5Vz20dYaE
	t1UYidXqSbWBPtuyb3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5C1-00000004CEc-1h7h;
	Thu, 22 Feb 2024 09:16:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5By-00000004CD2-21nn
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 09:16:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a3d484a58f6so213982766b.3
        for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 01:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708593392; x=1709198192; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKC7Il8b1oyV+oNDEp38tjmSeRJe+TR1zKY2Fatcllw=;
        b=ZncUkFTW6HYBtl/9ak1EqhYx8bZaNuS5AUc5P/LfCsGhwzzT5qonjjWqI+oi9WsfVn
         g9INhoctq20npQKZKzLzvdrEPc7uWXPQLCvvS1hLxOK/rzrOGc5P2DRff+qsOqwpqrGf
         64XBNm/Qm9Myn2AZLJXaqf+E9hGrI3PFON9SGsYJrKtzP07Sk/7rBIF2Dr4SRXrXLTvm
         Ng7tmLpOfNHCvPd8bmzbS9rc1XGXiLKPMn+4CtTiv20H5sBOltTBTAvKCdxwAVK1f3WH
         DiZ87bK1cpfNeHnefYKBA3th/RnRh33P2ISsvKLIPYzRL9qrUBWr1X0ZmJVUtlPoBGcm
         94/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708593392; x=1709198192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKC7Il8b1oyV+oNDEp38tjmSeRJe+TR1zKY2Fatcllw=;
        b=NNZxE14edesOZnFLwBgnxqGRPiUIToxO/PMRUsi3FhOpdQOjXXsv8eaIefD2om5TXD
         p6XY9LXY08AFeVlEp4vFZESfg/qwzMFjty2WINgdX7Bzn4pIrCeZ/4DWXfHzjW9Qx08/
         os7bOZ2Unskz+8iBMF7Q5s+w26LJcq/Xzu8mC8HpbzQcbul6B8YO9phftzN+AZPN3m64
         YBMArE4IzOdOsNd52FVGuDPjgBu990a0Q1qJqqa/EXDj4G/NI/r3qn7NE7JfWC70i9TU
         oxoLggznVraaZo/gEtX8DKIS4H32ugm9BU24R+w9kSicgBFw+scmhqGPzDxvvmQwYcdW
         70Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU3trPGpoTskDKDzDnOV3sKWg+aJjkSxRD1wE8b6QwJ0CKh0aJ2EZ08HtVugMGTVMvRyyKmwubSTzcxsjX09jpmYClpbVhnt5OFPyjOhg==
X-Gm-Message-State: AOJu0YzPcrkmXnxuawWKl0zZ1VbmQYe5cp568z+1gO9T8gxHl1UnTLFD
	ML0qpKfZDYqKsAgFHGSIOTZeFt0edWwT9E66ZTCWDD5JIb5B/XhBjuwM2c3LcY4=
X-Google-Smtp-Source: AGHT+IHurcoZo5K0JwHVgAkKm7hPXRukaQEP17fWHTT4J3toQ8Qx0XhGggn3S0bGy1q1fN2bAmWIgw==
X-Received: by 2002:a17:906:1c5a:b0:a3e:9def:5ed5 with SMTP id l26-20020a1709061c5a00b00a3e9def5ed5mr7265080ejg.33.1708593391743;
        Thu, 22 Feb 2024 01:16:31 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id tz3-20020a170907c78300b00a3ee67806fasm2665347ejc.152.2024.02.22.01.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 01:16:31 -0800 (PST)
Message-ID: <242f1bbd-a9f8-4781-b553-681385f1489d@linaro.org>
Date: Thu, 22 Feb 2024 09:16:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] mtd: spi-nor: core: set mtd->eraseregions for
 non-uniform erase map
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_011634_561344_BF88946A 
X-CRM114-Status: UNSURE (   5.17  )
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

Hi, Takahiro,

I'll try to review this today or tomorrow and queue it if I'll find it
fine. Please let us know if you tested the series and on which flash.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
