Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290C8C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2024 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkwYC58tFdGbPUvgR2YetMQ92dsbc3nk+R6cEJUMrT8=; b=CVresKjLbQYEwU
	I7GcLr6mI/iFxMBw5ujoUxJrKLbwPFYNAPOstLKeXLPgJVjE13SS9vojetWSnVbm+/PvQig2ThFw4
	P1bLlJCIdyTXIFZmqPvoBy1KTY3N096tNELFxvmmTJaROqzT3oUzFhB55ZwoUgmkEOsj5EUZrjlGC
	Gof/5oLZVOc5H61CHOD9WfP9qMzezMr2AYEb+bcfvd+6MsMHoPc+EDHb7W8J7kkRr6qNdr2ljO4bU
	j/nXRGZy2hkj7VylMGBnzeuxOBEdYnvmG8B+uP7p5nNtcvaFFQ7LWnYnSdl5mQGZ6QQJCtgtL9gan
	snUGkxeYCPbLQlUdx+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqek-0000000D6OD-3y4D;
	Mon, 22 Apr 2024 10:12:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqei-0000000D6NM-0PU5
	for linux-mtd@lists.infradead.org;
	Mon, 22 Apr 2024 10:12:13 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-418c2bf2f55so27996115e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 22 Apr 2024 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780727; x=1714385527; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15JM2M/xqlCzHoodyQ630yrxmvJgVvqpmySiVd+V/Fk=;
        b=xqIaPI5GQkJf9Vo7oO6pKQgOVuU6lnRXaK2Mpi8CEdZCsytslq1mgYSXD3ETOAawnl
         JF4OJVvOZ0O5BANsY6QUSlj6tsb8bSBbfwChPb/RcdAKpxFw6dbQdpDVKTCGziTnYhrD
         FUMS+A0HBWmByPFBABDXxy4mCHjr+4z0/F1Mhq4319A7O3dQbiR2DMrEpWwqT+H3ThBf
         +wbRlbsLJzZcdnx1GD4TgaBTObOSdW5qU+GQVbJl+yHn6A93fps5QM8NugRxjCc5ZGL3
         AnNxgp1E1JT1a3YaejTOCr52cc3yEg15KE4P+Ct7K4dcZY8SHTCEMa8Bgr4m7UV9O92y
         D08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780727; x=1714385527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15JM2M/xqlCzHoodyQ630yrxmvJgVvqpmySiVd+V/Fk=;
        b=M3arGd7H0z3JDAH248ia0k8eVhUqr04re3LQV/8drsKcRz2Nnxmhen6d9S7V8zhhCj
         A0HQy9uQyMYjvgLDIci7c8Ziz/XKvQgHN6DNjDApwgaCDq65Gr69qBDs4jfhSghBnBtY
         vOVAWEXu4eRmM48hNtT6sLHl5n82JZ1CXjmnNF9rtpk5VqaVu3KoHCHsu8EKviwMKjpT
         ZA+wlSiWZOwNZL0llEF5wk9UJNXobY9xGqwdZNJ0DvimjhV5s0SRO/7LmVUCj2nvBpEo
         EFNZJCStY41gemkk4kuUL7xLTQRl1KwYvwJe2Z068D9yBU3xB57/QdSnrTuorz+RHYpy
         shTA==
X-Forwarded-Encrypted: i=1; AJvYcCXZakQuVfWVuUhnVdeu+8TiUPtb+2KW8UpPUQtJfcObJbhZaVdWVEeZnkGlkPdOcScDpBK2/iVuBnLh9WNPyUfNH8KW6MoYWKGSlIEPAw==
X-Gm-Message-State: AOJu0YwOyVipP6uJ32930MAirBKnM0yxveifJk+7dW/rYm3ng1M5ETJI
	QaFLnT/eqV2FHY25EjyhuF3a+vzhks5t5MZ9LyNUz3W/mXlgkJhrTRmxTAMu0cbgXjaSGEdITyA
	Y
X-Google-Smtp-Source: AGHT+IGlxfUD/9upZ3EyuURAuTDTjlpfJAidPtl7Th74AJneff1eN1nJHe3LNgaT13H4lkg1l1pYqA==
X-Received: by 2002:a05:600c:3d16:b0:41a:3407:78e5 with SMTP id bh22-20020a05600c3d1600b0041a340778e5mr2410887wmb.12.1713780727484;
        Mon, 22 Apr 2024 03:12:07 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.100])
        by smtp.gmail.com with ESMTPSA id fj3-20020a05600c0c8300b00416b2cbad06sm20011653wmb.41.2024.04.22.03.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 03:12:07 -0700 (PDT)
Message-ID: <f3e8b15f-bc39-4fc9-81d4-fbebef74c145@linaro.org>
Date: Mon, 22 Apr 2024 11:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] mtd: spi-nor: simplify spi_nor_get_flash_info()
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20240419141249.609534-1-mwalle@kernel.org>
 <20240419141249.609534-6-mwalle@kernel.org>
 <ea3b32a8-7a1c-4a32-beb5-acc6f6435954@linaro.org>
 <D0QK66M6GGD7.2ESAAEDMDOUUO@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D0QK66M6GGD7.2ESAAEDMDOUUO@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_031212_238029_32550B32 
X-CRM114-Status: UNSURE (   7.69  )
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



On 4/22/24 10:53, Michael Walle wrote:
> Hi,
> 
>> 	if (name)
>> 		info = spi_nor_match_name(nor, name);
>>
>> 	if (!info || info->id) {

here

>> 		jinfo = spi_nor_detect(nor);
>> 		if (IS_ERR(jinfo))
>> 			return jinfo;
>> 		
>> 		if (jinfo != info)
> 
> info could be NULL here. So "info &&", apart from that looks good.

it can't be NULL, the parent if indicated above assures info isn't NULL

> 
>> 			dev_warn(();
>> 		info = jinfo;
>> 	}
> 
> Pratyush, should I'll drop your Rb tag then.
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
