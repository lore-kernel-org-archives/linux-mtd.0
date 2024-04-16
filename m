Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1083BC4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2024 04:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ozyIv/fqVcpYorOROVUnb20lLbzt36MyBINGZbSZFU=; b=drao2oPsFH8yGd
	ABCbqIIuh0+fLY/sFy2qwRTfrRwR/mWf+2EVIcIFm8B5PMoLeg/laG0N8IY8Y/9UlxJNkTNGtafUv
	/2SereqOoW6I3e1Ocmv0raZCg+cMnEEkrfJaNSSJk3uLMo4U1pQsHys4npmDiRgl3NgzSmD5jeaWd
	EFAr1wIctFSSygiTknGQqQj2Vyvl0j42wMwgzVCdBCPh8f6VcJ3SAOGHHcWnlB5027KmhZKmNMIvH
	uRE/ej9o9Ee1yM9Jo6/A97IW6CM1V71LtUjJ70JT6VIaQ2tLNlgYNfECSs02mhWRXZNxmSkaZFyaI
	eUeyavqy8H6jRaaE7p2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwahn-0000000Aqzp-0Ryz;
	Tue, 16 Apr 2024 04:46:03 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwahj-0000000AqzF-2c8z
	for linux-mtd@lists.infradead.org;
	Tue, 16 Apr 2024 04:46:01 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so49053441fa.2
        for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2024 21:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713242755; x=1713847555; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKB+fts9+FSOSdB9lddQnPbhqERI/yOafNkOO10c0Jc=;
        b=UcWpF5YRxqi1aOchV+B5QZiysrwcNhyvxX6PpesKyW43X8g7kGZh72lGEr3+bSSv/x
         SdG2Vxe8RX527s/yj11dJCEtEBqvr86L/1NMBdCg3Jgfh817N6iBFRIsRfKv1lID/w2l
         lF7KoDoG9yEEuicqpXsKR6BDS6gURXrpeMiiO201is9dUmV6SEjxRATDIvCZD8wCM0xB
         fWoRrp8lxcvLKQivgGd+AjRWXgdcGmmdy1CL0NQoGuJO+1KEnYv1oTGJa6F2peCyBjTP
         k1XFfftlSkdjyjDOEf/QHtweba6+jm/sl+h925IVz5+GIhqS6yqNcRbrcAalcKtB0LNW
         I1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242755; x=1713847555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKB+fts9+FSOSdB9lddQnPbhqERI/yOafNkOO10c0Jc=;
        b=RoW85KcWMKNxklodn4a7m8NhOBkblXnMYtNOVDcytqDJU9rdQOoW6LVCwibLVqYhg0
         dvWNyQorg/oe4pICW2/dhLPDROiX59ScpytqhNMBkOpNPeTPcUnIVQI/djHQI+TSkQzL
         yVf0d/GtTja/NPPc5mAX/0qF+8CmLgvPzZ1iBTwHjY7E/ypNZOnV0oFzR7LChC212+2K
         NRptRBc4Zoxq3/0FMM+n9ZUQan2O2yEYlUrxTVeqzqXxwOsuiifCOswisx5ZUdBKvVxf
         4N6YZSbnfN3LDU2o6pVJihtDlXOjQlxXJfNNzFECaj5FV5DUv+TkTt0U0qSC7GcQbIWa
         UMOA==
X-Forwarded-Encrypted: i=1; AJvYcCVsfjtY/DqUzy1AJId9TCp2vHdob80MIGJjvUNrkF2IGhgG7w3jKn5sVg5erfq4iC5nCg2v/+y5Jez9HoWHJPRBo1xzty+6cNAbDNVmCA==
X-Gm-Message-State: AOJu0YxRN4+AKcBS3LiqOJuiPFojnViruIZY/SiuEY6JC9sA1U+cNEwS
	4QLbXDrPJ3kElcGVIXESkDwPY7ARJxVWnieR41cTZTa1xccKIj7cJTJnNtQgIcY=
X-Google-Smtp-Source: AGHT+IGVCkk+bcdkhwjYIyaGOu3n5uDE8fKeovKRVpv0oYfV/HU33/rsUXCy5MMVPlmhCYZr+JWPPg==
X-Received: by 2002:a05:651c:546:b0:2d8:9537:6d37 with SMTP id q6-20020a05651c054600b002d895376d37mr9825139ljp.21.1713242755412;
        Mon, 15 Apr 2024 21:45:55 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id he8-20020a05600c540800b00416a08788a5sm21697294wmb.27.2024.04.15.21.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 21:45:55 -0700 (PDT)
Message-ID: <e3c9352a-a770-4952-b15f-bd307aa284c5@linaro.org>
Date: Tue, 16 Apr 2024 05:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] mtd: spi-nor: Remove support for Xilinx S3AN
 flashes
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-2-mwalle@kernel.org>
 <7b2fc5cb-d1ab-4e9d-b955-b88698322057@linaro.org>
 <D0I76PPKBWF9.X2XFZAO5OE7S@kernel.org> <mafs0a5lu8x5y.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0a5lu8x5y.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_214559_892301_AFE663A4 
X-CRM114-Status: UNSURE (   9.48  )
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



On 4/15/24 16:26, Pratyush Yadav wrote:
> Also, I think we should let this patch cook in linux-next for some time
> before merging to give people a chance to complain if we break
> something. Since now there isn't much time left until the SPI NOR pull
> request goes out (around 2 weeks I reckon), it would probably make sense
> to merge it in the next cycle.

sounds good to me!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
