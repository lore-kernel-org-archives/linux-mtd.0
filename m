Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8437DF8FA6A
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2026 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2C5K7y+w82TPuhxoE0eCiQ9BrD97DHEfSA3kKyNiks=; b=CKrONlsN0XWp/S
	pUrMXFM/Xt0vJcNhrjPzL9jW6ZYwxQAGC724RCuMU9lO6URRabD2vwT12VKqXZ/B5j8gHcc7j2Deu
	QuYTVRDlizLltVKwAErOXYMyUA+Gb9stpDbZKMs4A25uuYrI2aW9lnNM+WP6z0ZIixPJduqrGx2nd
	fYG77QNWpUT1Pd2YrPnFNbdiF1RRjtcS6KW+tQ08l/75nAHiNnoa8l0bmcdBbtQ4VLbIaDBlB2Vst
	v34sRHBB3M/HzN6tefTlR1USBiNwCueWetOnRLsFsH3zNYxGOmzV5LLfedwi9w8ZLS+SIU97VGycD
	YCNJQqr36eoUOgjC3eng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAFm-00000008aa7-2if4;
	Tue, 21 Apr 2026 12:30:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAFj-00000008aZk-34KG
	for linux-mtd@lists.infradead.org;
	Tue, 21 Apr 2026 12:30:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso26627435e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 21 Apr 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776774653; x=1777379453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwOo9xRWLW6tG6sZmBXLKlDtnsoM7zgsn7Qwt0pNS28=;
        b=Y44upiEOY1E9A72D1JIecqi94xzpOsnk+Vd5ex5wIKL3r03hNvCgDbeK7pDCyi7q3M
         sPlpsPvENG1pFXoia6UMNvTHkMuc679nTAI6Q4JCxhmzytl5rsj2KKv5eFNKwe5Z1MoX
         GSnffK09KjBXv7YGZBemcrazklFFD7k8IRA+Ps75pPpLGVUyU/b5boIsyO+Kg88GL1af
         gztx/JIVrAcur2jVC1LKU3NTJdkbHB3EWx31KLjGYyweEzWSw9074rpiTbb1LCWqX/uC
         c/j0qQn4uXot2K/kVLjnVCfPirlyNHKO0xTYvrfvgagRpNUb4dVMSN4m2qu/W+MM+PO0
         Agpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774653; x=1777379453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwOo9xRWLW6tG6sZmBXLKlDtnsoM7zgsn7Qwt0pNS28=;
        b=rtwFZkxrAtrD7TGztnEZUWoS8+dDC79jSLTDkOxtkVQLxsGhDCn0OqtZELfEDSJA2B
         DcruBsaMs2byUxFbrstJuLwmrTmIRmUjC5UfRd5Or0cp/9yHNjFDS0Qs8z9cTqMvHvH5
         Syp5qcX4Bcw6RIQkR6Rfa1BAlyaqJ+k/y0e9wwf52muxw0CV6GVir0w/suZEDwMrbtjv
         GVSJpC5XFqbbLZcFzll3QG4ovwtQB//8+Qav0HgmsfxLDxuzqGleZI9WhfUsa0hSRqy5
         VXQX1WbHy8Eoopeh6FhkKKphYJvVSDVHe3iDjXOhNUun4nM1d7BeOO7tZnc3X4DXoUHO
         TVeg==
X-Forwarded-Encrypted: i=1; AFNElJ+RqlwXv78MRAGMl4xvVcJr25NE5+CK2t15T+Uuor+1JGJOxPffxA6Oh/6LMPy6gCMK5Yksj3ZPKjM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9qI7FTZasxZIb37zCI3Lpmkxx9P4Th2IhSKSXnp498VoB3dTO
	A7Cr59QNBPeUnynqjwoPiXJMxEusmywnphUNmcA6eGTjJ3O5l8g0LcSPziWW49bzSJw=
X-Gm-Gg: AeBDiev9QkkZ8bmqKQidSrqMym/+K/HCgQNU9qfEOc/F/o2624eFjnoqPPP7WXxBb3B
	s/EH1wCAh+h9kVWK5jogacXs36wbG82+qoR9kP1+y4tRzwLIHG26Epr4stn42+HQjLmQK49E8vM
	8WyUpZss7cTjg2X/w5MMKRT3LYHcrK6OYr7sduICsu5C20woDGPZC4FoQJaiG11IpfikiEUG7NN
	MXmXzm7HHsRhCFQz1/RypVr6gLKlByRsLZpK5eJfC+iO/B+s3/6MDuQi65SgyjgZ5+Kpd31jKV4
	9SHOfxHh19DeNFlPt0WHmyTayNYpkdi2x6oiJyjed12ZTN2xrM42dMxKah/+CLK33XPwLEDlest
	SCUfDsPAXBJYsWhvBaY8k9MR7vjARiILTJocbvYMTd5fBTjBFUCqHd95yePHUMXTz5RAvYq+1Xb
	PqQm7mW0tvw8bjhVqgG3xqFaVhMVekzqb9Y1usArD9pNQ=
X-Received: by 2002:a05:600c:350e:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-488fb788231mr265072705e9.25.1776774652851;
        Tue, 21 Apr 2026 05:30:52 -0700 (PDT)
Received: from [10.11.12.108] ([86.127.43.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm179118705e9.13.2026.04.21.05.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:30:52 -0700 (PDT)
Message-ID: <ef1cc3d7-a710-4b90-9ff9-bbc27bb28bbd@linaro.org>
Date: Tue, 21 Apr 2026 15:30:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
 <87jyu07olj.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87jyu07olj.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_053055_953672_49AC595B 
X-CRM114-Status: UNSURE (   6.62  )
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



On 4/21/26 10:35 AM, Miquel Raynal wrote:
>> We shall assign a CVE to this. I'll look into how next week.
> They are assigned automatically to every fix, no?

Indeed, it seems there's a dedicated team assigning CVEs to
security bugs, I didn't know:
https://docs.kernel.org/process/cve.html

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
