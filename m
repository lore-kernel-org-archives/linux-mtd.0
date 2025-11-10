Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD50CCFA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8O5TWOC98Mv7c2YXIhO2HOJ9p0Qnnu/o8gk0fJJjUXM=; b=x8lkk2GCcT04Az
	pL1fSWnevyClytcdIhl7rcIw7B5wK3GynFGk1pgaJiO6uMMim1AEOoNWQ8nZTI3drxBycCby2+Pxg
	tvgx/8QHrGvewb9Kdpzx7E/VbfF6jK1wsZd200AJV2bSa8rXXS+KAPWS46JrQdOdjbvVv/amyYC8E
	e9K0wOGwkYtLsdiMEGf3TZBlLqJJoXOeP3FR/76QuNBpVfnI1G/UhTd79jevbQco69XdBNwhIF8pd
	WyKEMVNtQYDow8/2la7kh2KSmP1mEQKRezQXs9yboXe4ITh0edb08zgk17bf0oAlK5e/fdR+cIYKr
	rRe/cqyXrakgE7j72Auw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIM0c-00000004sPB-21d9;
	Mon, 10 Nov 2025 07:08:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIM0a-00000004sOo-1dtn
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 07:08:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b3108f41fso684333f8f.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Nov 2025 23:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762758490; x=1763363290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afi+lGH86ZvrucXscTjEx1ykkeQtiCdeX71RXwxok+s=;
        b=PxdkOTxjZWUAOCX5NsAPc3citgavkZW3ENz9tPfc8FlfOGH+ZFXksY6Z8QtSw9OsHd
         dEvgr8cdcSzkfJ+B2fL2PPHFJm08vhlUK0dVF+jOtONWy/7j4KHBHTgCVxjlLVZHQF4Y
         TELE+0bzoy1X4+ZcUYD9bdaoOE1JDTkHc1oTbHvLVW/EMenD0fW3DIsvWmzzDVRRECLl
         zL2sXl//LfSsqW5W0Xy7ET07Q0NYEHuGTe6dT14Az4ohKqDr6ln8tvfkbaI72AhEdsIb
         HKPGXy7AOH12cXB8CVlu3fNOOWgcB11AIfav+lm9iJLcNsci+8/tYrdX4WWi44dLYZ+9
         h+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758490; x=1763363290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afi+lGH86ZvrucXscTjEx1ykkeQtiCdeX71RXwxok+s=;
        b=sReOIDbO8cPD4eeIoI906oleIxWRP4g5YJnrxH8KhonIhVcG3fSveGMR1d/kn3rFDV
         mSPRh/xdk6E6hYG20+oRClA2QDNuL7Jq1UIYwmvncA8P9aavB9u/V33AjescIDMI5zRO
         gTNcVSIX2cO/i68BaLN/uSNiZAJGOb4x4LqLV8vACivZMjB3wDFH54HH4r4UhqIH7Ly4
         FVgnzmcWcI8Zbhe/nkdM1AvlSquI6/RuNMaY+DDZkR9PneiypLgUaS9u2VCUEDRd3RG3
         laGywuV/vjW8+Y00WpxB/DFsVAo86E3HdFqG5aW9XBeiEF9mhdOBtYIUrfabWlHbYJ+Z
         grEw==
X-Forwarded-Encrypted: i=1; AJvYcCVGGqVgAMF/YLemIcm2gjeLqZW+FrOrl+ooDs3YI5eXg+TrJqwPkGLyMDVPZJGhFu1laYt924c0IgI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ2tWF93DwImKMcswVdVbM0JiCtMdxnBwjcTJ0l3EMc9Pv7F8S
	Qwrab7Juqakt7Fz/WEKpJvkm+CelFtW2i9eZ+cPSgt8TfFEmobrfqPkPorVD6lqiDfY=
X-Gm-Gg: ASbGnctuPr6cJSWjguVkNyD2xhDvqFxuPag/JOEN+HLb6Kf3aMb5wLrwmm5fsI4F8fu
	QOLCFp0mCtU5vH3cHIsEeXqftx+ONSyRjL/HQhiTTrVxsjZCmf+5YgHg06L2/yfmRLAeYUKPxQM
	b77YWJ11akY7vxKXrNnVrWXZvgJHakWyXwjpHDe6vBZyP6UBfF4Fj3SW9SSnt02qgDaNNbyhFWt
	W2is2C4qptrr7BJBLaQCGE7e0iwtcNBpoRw40JnEhxXO+EEtD827uSXxGKoyoMLgperwbkrOMZg
	A9ccLNHNqE8XUJUWpQLjjYhamTHKyNy3JkaG032F50qvGCSMhJ3kh1up0tejCTd2SHh+9dkR0X0
	Fw89UeV84pdWx4N9AJ7uLoH6k/J2Pal7u3a5G9algZMIBNuPGINQBh3C5OF0lORdeoG9cyYi2XV
	i5cwT5vA==
X-Google-Smtp-Source: AGHT+IHnAG4TZtrzMcLkmLviBSjBeyVLT+MgLusc2bIAKEnPg4/mFzUaOQPWdmNrnp7GpHFAe9AMrw==
X-Received: by 2002:a05:6000:280b:b0:429:dde3:659d with SMTP id ffacd0b85a97d-42b2dc4a8c2mr3814529f8f.47.1762758490571;
        Sun, 09 Nov 2025 23:08:10 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b316775f2sm10639770f8f.16.2025.11.09.23.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 23:08:10 -0800 (PST)
Message-ID: <31d01667-e80e-423c-bdab-8d05831d575d@linaro.org>
Date: Mon, 10 Nov 2025 09:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Sean Anderson <sean.anderson@linux.dev>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
 <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
 <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
 <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_230812_479902_5C0E4D27 
X-CRM114-Status: UNSURE (   5.37  )
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


The locking tests look fine to me:

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Sean, if you care you can extend the documentation on how to test locking.
Also, you may drop the non SFDP data from the flash's static definition as
a follow up patch.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
