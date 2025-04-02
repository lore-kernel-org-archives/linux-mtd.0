Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7B5C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E36RFp0p2jRGl3TtfBIKesezQ69XBL2H37p3hXkWAFM=; b=xFkNVRrf1zrusr
	ipttVeIv6gCh49j8Wz+u4d6tdqq17pvRb5v/j0CWMbWD//oltddp1dR14WQ/QXD3bB5SonPvDyGDE
	LrqucmLRsmVx8H4BR9P/6Q51VU3ILFoFsTdEpcWKcCGRth6oax0B5wFRaYcc2R3r3QfNUIkm8GykY
	Z2TQ27dK8KBsa75UOdsTEOF2dK8x2LPPehrMbkpI4s2tCU/+zI9p0LR8P2nfzWeJDM8ZHU0XQ9Ued
	/tO7SvzzBQKhyCFGpfJQkY/mCX0W3JtnBKNaD15QISH9dF0c0Y3DzVSFzTNmfB88e/LfJzlTL2686
	r+ygB1Q60BtygDnsk+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzn1-00000006U8l-39VM;
	Wed, 02 Apr 2025 15:14:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzmz-00000006U8C-1yMD
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:14:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43690d4605dso47372935e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606840; x=1744211640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=biLsquueEDizZanYoFXJrrc8v2qmwc3tQTGu8QpjHcG57T3L5foCBt/gAeD/rFNUdc
         JOYYTiBMGEDkbdNPYJ5mJiU3ur2//U23hTVDWtMhOuEkiG3HvLLoJHkeu4cMfA4AGi7U
         tR20JTossPxH9voXbohxuK2+JPkA8pPoElVmdxsFfYH8dWQDoKuLhIUGtPxfUyd5pzHH
         he0cFEA7QQPe/ZGInw5PiMf2CSpvr+cMbA1R+QIiR/8Uqf9imunfqm2n02ds3GrwP8x6
         Yk3dfktQJmHznajIPVFTe3nYR4AnbmO6LAk5mXXli36fQDy+9zFazbplX+nSB0n9SdMm
         yuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606840; x=1744211640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=RKdMm9H3DowI6+yyi5dZea6arCI/4XjOIIXmQDKoxOONElM4WH6BZNM2cFydy39X97
         S+5/IUVCFKwRpo7A+TL4P2TJfPf2Go9VCVp7sqVJ1ftDy7gue+GumIMda3kb3QlFtAly
         rqcpusXWRUWH4Pmp+D4ghW1jmEphdZMBw0LzssdGRrSQ7If/Oh+4+Snp5Z7UoPtvvfjs
         BTaarmZNpFN33rsCxvsIC5myCGqWNy4iLpXATHV2sBmjqzKYsgpqb1kiXw+eYIvRIcw7
         q9ncq4leOhEQap1kla2PeZWQYKDwx+eUrJHh9vhIJmTrovdhcidBzwlo7iFxgruCVVO3
         nLIg==
X-Forwarded-Encrypted: i=1; AJvYcCW+D26DEZQL3IvU/6Xa+yGh337JG9KXfBMKJCG8SPzxZ40+pViLvb8My3iWjr/7U4oiwsmN029Y+Wg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyP9R/ZTRLSAo6f2bNiqso8U20y7F0N9TenV/YsfjKdzfOTr2Dy
	Av1E+KztnPVY75tGnG5oT3NNC1FCg+lkxNimHp5zd0F38ueFPiou8fa2VqcuQf0=
X-Gm-Gg: ASbGncsmNWI2pgxti2FHwSTFKuLuC1Zzvg2w3Z7LITnzf3ijAtqOtGHZhn384C4OFTj
	El/T8qX8Tm273sWIkhn4xrSb4DkA2QASWt1eN5Mpa35VtqkwjxZgXo9JC9P8W0YvLOJfhVkV9HG
	6+UqAjbq33DBfqke0IYQIe5y7lKRGk95zqEwHP1fGBmBZORdpyYMG6JTQcOCvha7F6cCBNCDycp
	yehJDFC1Zh3jhchK/iLsJDzoHrJTQ6RpWOO7LB4W+7kzD8P4FbBhLJAkdLAAa91130KUUnVsFv+
	AP85I7pyEqyS2Y8SihjP++2OwhQYXS2FyGc1rVYAuuU4ePX9wkp2OA==
X-Google-Smtp-Source: AGHT+IG6p3UHT9VfN8elbbIcomUrX8igQSBx7GXK+qu6zBuYsACWtZ6EtMj3y0kC69/t3Mx0577lqA==
X-Received: by 2002:a05:600c:4e87:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43db61d5fd2mr142290465e9.5.1743606839846;
        Wed, 02 Apr 2025 08:13:59 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ec915sm23620405e9.28.2025.04.02.08.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:13:59 -0700 (PDT)
Message-ID: <da84d300-0af5-4ee0-a6ca-4bad3df39eb9@linaro.org>
Date: Wed, 2 Apr 2025 16:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] mtd: spinand: Use more specific naming for the
 (quad) program load op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-14-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-14-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081401_501279_7CB9E27E 
X-CRM114-Status: UNSURE (   5.23  )
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

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
