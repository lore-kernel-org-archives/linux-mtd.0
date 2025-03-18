Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2302FC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZOKXAp6bx9uu1FJjTT/iqmr454vPTrmgeDMe2rYUqk=; b=JiX6i9Jv2qJeDk
	L53esUwu1dulvPNatlyGf1kSmSuVEqxzfZUMV4xpa+IQyXeeZftUIMjXA5b7iuIrpGwwD6h3/TLpO
	XojJKfbXauptlsND2N2fmTFib8+ljpHJB5SjxdzC5LvIlqxRvVnT7kJ0HitrqnpFpSmNWyaiLM+p4
	BeB+ZU/qqtYljdUlfEWQa99SXV6mHG69l4S5Dw57DXx/mfCNEBmO/vc9zI9TwEr5ErsD7s8E23bhW
	izLW1e/jdUkm7ZCr/wGYzpPAXygEFnN11MtSDeH1fEbWBmHfjx7o3THQnIESQqovX3gY/c0W6GedC
	KnFNw2kLA2z02SWHMAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRa8-00000004yXR-0Iyt;
	Tue, 18 Mar 2025 07:41:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRa5-00000004yWT-3ZBE
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 07:41:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2239c066347so109550845ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 00:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283705; x=1742888505; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVZR04S+QbsB8ngo9JOY80Ix4bk7+hFvRXCVeHlbQmA=;
        b=Jhyyvp+EoiJuwSUIfCVaBI5g4Od7s28YatybM5wzP48cNwMtgBjGmatGhq2QDc+9hJ
         wxHb8V8oZR46jSnd4UPbWscTihYMKgEpayRFj/x6HPVMrCQ7gmRuNTAWFLrbaGTpJQYR
         5kwEr9G9ARrF6hle2sJKq3laPe6vkFZAine35Dts8iFLL/pkrJI0TOlaVd/se165ng5R
         d0GJ5IQk3AAm2lQq7l8WgmEbdiPETES5pHn6OJgq4kTeYLz8DpuxKfiZ8UkPDSPQ0ari
         0SKLVBjS45Vom7lJN+4mmoxThwJrTmkePEzPq04/K5BLqKdnzE1JBgZOjApHEBGxcb7e
         Spww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283705; x=1742888505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVZR04S+QbsB8ngo9JOY80Ix4bk7+hFvRXCVeHlbQmA=;
        b=DynDnug4ayiw1S2c5WMZCsWkZgiHoihIyvCPkg+tgHNwsFnWzt4JpYvTyZFnBCcBvj
         H2VbpZ7aZ/SVHJ/wsDv8qcdee01cuCTKPowRjyG2z5TH1AqL15Toydg1trfE4obP7Msi
         Qfk7PWMFr0DQhoJ3UsASNPRYrAJ00/tQOdUisF/y+008AzmxBCyBn72UxBQUlJItRIcj
         /y7VkN3AGoV7f+1olsPdEyi79sdVg8+C7/4qpw2GEG8X1HDxZMal0I6GJzlaWGHItCA2
         RLh3xUVGyDZWT80i6KGLwFghrEZNAMtz2+e7C34ieNmedCDzYDNw8+JkDz3MQwOwMp7N
         1ixg==
X-Forwarded-Encrypted: i=1; AJvYcCVyfUKfPliVwOcQUkEZC+lmsZZc0Il8fT/V0N/LdYloW4hVguAfmTPn3WNtNq+eR4XViTBU8l8aaNg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzH/pJ9iM0hIKYclaAn6j47d9aSOuYDxtjg1xTt7dqRH9xeUnG
	hcnM/QclqxF1dA22QEkqbaJz2YwgEM0fDuXd6hy6QWImWhGxqJg8EINXUxNcGg==
X-Gm-Gg: ASbGncsCRGI6ya2A0etmxhblkwMoV7a3JbQoJHYpdNkGnBVvstn4McXXJ7X7+VkxLMV
	lHkKugwlutzKlci4QRxn3tlx3WQ50H8RxjjXnfHnXTiIDMLkn2toldOJnklabZBToJv6vMukfMW
	JcWOYqoX8mUz8GD/v5g+zlpE51MxXXPXo3pmHNTJ462M0AXstAFl6wjThubBh9+kGH41vw5BVUm
	Og/aCcG2Q5CuSvegUIA6p8Ft9cgL/dlrlZKapSLex8S+yya2ciw0PcfpPOauGQ2jezW477yiI2E
	RV8q1v3j9JA6lEqQEmg6agzmcDc4fMC0f3x7eb52n8rf5JtXo7Qe2984
X-Google-Smtp-Source: AGHT+IFyXEOBiMlUSN5i5N/Hw/HWhnWZVCQ3Gx+hf6RlAak5McTqA6i5CzSdroh1zfVKpZgEjUe7mA==
X-Received: by 2002:a05:6a00:4f82:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-737223b8ee6mr19051900b3a.14.1742283704908;
        Tue, 18 Mar 2025 00:41:44 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm151481b3a.99.2025.03.18.00.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:41:44 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:11:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 0/4] QPIC v2 fixes for SDX75
Message-ID: <20250318074140.yujrwgq743oqx5du@thinkpad>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_004145_898294_D806D175 
X-CRM114-Status: UNSURE (   7.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMDU6Mzk6MDJQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKCk5vdGhpbmcgaW4gdGhlIGNvdmVyIGxldHRlciB0byBkZXNjcmliZSB0aGUgc2VyaWVz
IG90aGVyIHRoYW4gdGhlIGNoYW5nZWxvZz8KCkJ0dywgdGhlIGRyaXZlciBoYXMgYmVlbiBicm9r
ZW4gZm9yIGFsbW9zdCA5IHJlbGVhc2VzIGFuZCB0aGUgZml4IHNlcmllcyBpcwpwZW5kaW5nIGZv
ciA0IG1vbnRocy4gVGhpcyB0ZWxscyBhIGxvdCBhYm91dCB0aGUgY29tbWl0bWVudCB0byBmaXgg
dGhlIGJ1Z3MgOi8KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprg
rqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
