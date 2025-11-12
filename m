Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79ABCCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 12:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/L9hM6/Mqt/hP2M3jsN0SrjcwLvt6naNaQ1YW75UR4=; b=jxV8wmVopiaCoh
	89n9gU9jDQ/nCE/5+W70j2Bkp1tb2IAVxgHXi6RbYAiOeX18Da7GudUxxiO9anIm5THDkD4e047xz
	xql0hEQyBG/VZyIak79q+ZC29NPw/GZp4Vf5bZtZ5zQsB2XiiQ1Pss9cZnOnCz3Qj8OdxndCKLNAf
	SBkewCJH8s7vVLaiZpK24nk4CgXdmr6xvE8nt5YcqUwJlMjv3S3eqbPaS108ZEVrS0MObffk61bFE
	qQTZbnFh2CJMK+1BoJjuWHECEmV2ptTfPBS1JQGkYm3kjn/ckoqK1fffGmeZLaH+0PdsTGYIGT/n9
	ZX4CtFWIeQQi7riMVoiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9jt-00000008l6V-1Ri8;
	Wed, 12 Nov 2025 12:14:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ9jq-00000008l6A-1X8M
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 12:14:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477632d45c9so5566765e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 04:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762949652; x=1763554452; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7uPcYg2lVHFfpp+yzhBu7ox/Uy6wawl4Hrvj0i9hYfk=;
        b=f39WNT782VJzEk4YtDl3WYihRQNd7r4lwQt38rcnMJU47oV4dfwVTAtAP5ZleqRIDc
         luHIzg0rmKJG5dVB4dZnTS5SFW6vBsbIgNl5Ne736DdrM4XZJ1y+5h+vewsie0pzY7Ga
         u9KHep8p4KMdtgbqeY+0u9OPuW68/lk2wlNIHwheW3t3/FFDIB7a9cdLHmPaHqzXheVW
         fapJF88K0XcyX9784TBn2Fia5xyMf4GHwgh9mCNit3ZK+R5Z4QwORsH5BZ+euXqNMj7o
         E1Rp5D/1VM92JRK8qMD7775RXXezOwEq4ae7fvM71McqlVfb9EeJSLra5eDrD8QadvVS
         YBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762949652; x=1763554452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uPcYg2lVHFfpp+yzhBu7ox/Uy6wawl4Hrvj0i9hYfk=;
        b=lqJO4bUDJb3+a32AVwEYf6kzPo+48m5mL+addW358D9wonLS1Ue02kP2T6D7czzR0O
         ajcraBz/bob9trMkPVjVHUcuU4cRkkC5akDEAMYqE7bKl3HZIjEr/Yq5l95aMv2lQGqc
         a/YS08DgC6vQGHW/+/mPvGkoYVu0tWHAH01ZHvrAmvlxY6u4Hv2sF4gtrIUZ2theJK+C
         1AcBoAGvYQx9x+eotsHRVPcQih3PJfUjZsUumSlxHu4Tggbx/2vRHf89gEsKvQykMC55
         OzbMdSxVXf/P0L7GAfCjkoGSeMvxEdk75/Zrco0Le0G+shZark21z+UFpVg+5k9IN/uN
         t32g==
X-Gm-Message-State: AOJu0YwjZZciWr7hBAJw9n8pRv5WuksQoFCmfdd7f2jatNhSE2rMPa0O
	seE1DCMw23Sg8tKMRgWpAqimHt2Nk6rzqtZ85hzuP3mNIHX9hEaz6w52K+Oofh/vn/ruW09/zD/
	hDXzcih8=
X-Gm-Gg: ASbGnct9pyi6krHtyNGxL3QWpaf1xSCwaGbvRHzc+1khlFCiViTKR/tMGXYVUPYRkjq
	wre8I77NTG9UVYn5Dns7USJSBQcaO8GXODFwcgrUMxDQlP1s9LNjeTCZ5JgeVoDlAOmyzFQA0Gv
	YTni84C24I3Su2btxQ6GdHWf2kiDJjA8WeG6e+iUXG8rrYSvvLxGYK5XUnjlmv/ttgVQGFePyCp
	1VQ+foFRjir+Q+RsQLFDiU4+xYbtfm4kLwLZlfA8KHVHTK/Gv/VLtf6BC7TMN2am1s8DySoDcLu
	9vCGm4wFk7Lo8i0ZLXMVvTzdm8oqLKN0wdn8FUhnrEi9gEwBEKPXtjtRYup4PfiUNDMQwBG/3np
	gLYVxXhRwyxExyLwQjmLm0tCTQ/b92XE5W+V3QTyznNwpKV/fBOsKIaxEzSBWfPqOVX3X+ho85S
	eEsPVX7Q==
X-Google-Smtp-Source: AGHT+IHE9gQcKzRZRfVJPwal2CO92YTTNKWhjd3PMe37ZiWw8lo0M7TWEe/XDmM7RYwtcvi4g7le8w==
X-Received: by 2002:a05:600c:3511:b0:477:54cd:2021 with SMTP id 5b1f17b1804b1-47787041346mr27268155e9.8.1762949652523;
        Wed, 12 Nov 2025 04:14:12 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8f3d6sm31531675e9.16.2025.11.12.04.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 04:14:12 -0800 (PST)
Message-ID: <984524c4-e51b-45af-a775-477977df2695@linaro.org>
Date: Wed, 12 Nov 2025 14:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] mtd: spi-nor: micron-st: add mt35xu01gbba support
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
 <20251112-nor-v4-4-e4637be82a0a@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v4-4-e4637be82a0a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_041414_443970_2AAD7E8E 
X-CRM114-Status: UNSURE (   3.69  )
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

Super!
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
