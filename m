Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1885ECCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KF73tKWdGInyLE3FGgkJ3QZnQbd48JQaUebjpP+tVc=; b=MB9n+ikS8QFxgF
	6LMSlkcsvxvO1oU4/nzLdbQUMIDiKji3MIHxEPp/JzKfpcr3wSanFu1/54NxvnZulo+PA9xIfmsIK
	mpLijZvg2ScLvPLJfgs0jeW7kGPna+Jd+X5cdIjhRtzA952pShoJaGFHXGL/Y8cVgBCPQyNQeG7pq
	jC/l1xbTqGpySy8o3R9TXPEBQ0Q+p20EfjPs3fE6vnfFv4Ho3xLmWkMxKUOJ4Mp8ykfnluOB/18+A
	pOxAMyD88TTORJxgZxufjrDVEqLzTiY/6M7RXk23ZXKSYc27Z5oLKOBLq30H1tzi5ZYbMS8Sx4e1f
	T6Bljp/tq7I6hckPtinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6jo-00000008Q8n-041S;
	Wed, 12 Nov 2025 09:02:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6jl-00000008Q8C-0qsc
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:01:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-471191ac79dso5395685e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762938115; x=1763542915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66JkoVBXRt3KXq4mIKfXgWIsRIseUDoE8lmCrVzLyy4=;
        b=iJzccmkvKHGICKxbnV/fy2s08e06JxFeY+H2I8jNywEZXbI726xLxEr8ndM7CyAs0B
         K+bEsC3qlVagSuEGKH5yosjgKhtX07H5leQOxfOwE7K28uuB+9mN5TwYVUXArs9/TjNx
         pNALIEDGPnSX3BTCYxZ+YtVlGR2K+ztK1UZqgZKonOnFSnK344/i8RCDyyShYXVWcT1U
         DJ/sF0j1j3PGZw4Q6ZbabbKVPubFJzTMI6KRnTSpymojZ3+Do8PYiUci0I8BS93yveVR
         e/7ViY7tJHQ8YzCMXpFLUMVTYwZrEq3T2PhHlBh6+eNjQhJ3tEwpHHommZvlVwXle429
         wCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762938115; x=1763542915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66JkoVBXRt3KXq4mIKfXgWIsRIseUDoE8lmCrVzLyy4=;
        b=Zp9Nq1oOw0UpLnAP7z9xJfB2a7jeePPhshM4mZkDWhGr0CIcgklMYTlhP4c5o5yUGW
         6ETiAIMxecEPOLoQClTrUjvweCymHAqXggO6OzKgUmnrSR/rPMDRS4ld/XgtdaxUphrB
         tsnQaXmpX3XV9hyq2Bo4RvHlQpt1MLR7OzvTCEQnIsdE2ESJWwZ0JS3pQbP8Hrx7egl0
         oi6HpElqgVq3dxN3PzUW0p76xO/Og5HRlLqMz9QHr9d0//5Nmv1+NYqVIZv1is5HGFYc
         CT0dIXmd+wkyHNEiCzK+/JhNSvb4qzAvBtdaQQ4KL+oOJgZadp7jUwdyRIL6Lz4Se/1K
         a2wg==
X-Gm-Message-State: AOJu0YwgX3WpgTLFBAhhjp01rsms7wvt9A88RLSZvJ7X3R4IxZgLAmwf
	wypa1J5okBRoUjZSt2+d7mT7bnMBmoPCrk7dPqJKY89mDDNvYCcE5euVbfcAuA8neaA=
X-Gm-Gg: ASbGncsqnxEwOsz9qUYdchdTTaI3OJd4IOBfK+Er/NckyYzfMlajrzD6ttf7Z0BvS4h
	nS0bnctxZkn30ZYNJX8nKF4U6Ek0sDnnlPkZ/FOJ+lCYZjm97WT6CYbJRrJgdium+rlChB6n5Mp
	628574ojVESOC9bDrp/HYFuxNST8v3BtNQdZgcJKMo1/FEfdoinrMy9XcgCWp7higfiJSk//vpK
	Qc3uV30neGRu/FMgCMt3LIGTBVQ0royMS93HUoj+UViiks9DQNrXQcogEBCJwMQqknA5gghP6s0
	cDu36NFk2J1kXgkD3p3X/+VWHD4vR1EPqTVeGZlgRw4mI3yx5gFPz29EW8gx75Fv/AfhNQSwxRK
	3MPWJhxcsp7v5HaTN+hIeTIbXrT44G0ijnLDQiIMLpylzJ4i7bvSJ32gm2Na/nx1o4IJa+eV+UH
	LlHJ+yJw==
X-Google-Smtp-Source: AGHT+IEl9hg1Kv37coDTdY5hfywj5TzhKzDMoQuXuH/tP7xQz/4t5TIbX/bOlblMbh1MgqEKT4WInw==
X-Received: by 2002:a05:600c:35ca:b0:477:7d94:9d05 with SMTP id 5b1f17b1804b1-477870b4610mr22199385e9.35.1762938115446;
        Wed, 12 Nov 2025 01:01:55 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e442c2sm25971505e9.7.2025.11.12.01.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:01:55 -0800 (PST)
Message-ID: <60625b83-aef6-442b-8b38-558c3751c4a6@linaro.org>
Date: Wed, 12 Nov 2025 11:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: micron-st: move set_octal_dtr to
 late_init()
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-2-20aaff727c7d@nxp.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251112-nor-v3-2-20aaff727c7d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_010157_337570_C0C3BF6A 
X-CRM114-Status: UNSURE (   6.79  )
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



On 11/12/25 8:48 AM, Haibo Chen wrote:
> Move params->set_octal_dtr from flash_info->fixups->default_init()
> to spi_nor_manufacturer-> fixups-> late_init(), this can cover
> all Micorn and ST chips without repeat in each chip's flash_info.
> 
> With this, we can also remove flash_info->size if chip has SFDP.

you could remove flash_info->size when chip has SFDP even before
your patch, as params->size is first initialized with
flash_info->size and then overwritten with the flash size read
from SFDP.

So this comment is misleading and has to be dropped. With that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
