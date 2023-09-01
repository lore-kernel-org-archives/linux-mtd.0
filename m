Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2925FCA0FE1
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JguZXnHvx3VxigkNzjnAx8ghygYnEo08BrOYevTYC5A=; b=WnAqZ8GYPV3PGW
	A+mkUXppbgIVWSfRmBKBpf/1+rXhsIC1pI8jTtWD8x9vbFis9XSw6j0cbXaxpdsECZA0+xsoBZp6Z
	Ghzzc/bfvbuZXD6v9+GzYs4GsmSmMz7z4IMaCaP7aykY6otKyVbKWdQU3bjNbQAGe9c59X/rjc0Ds
	ZtGLEEVFSnsVEXJ5M/893gmanqBEsKIO2Ip11RgzEUSZ0m605c+hkpWZ7fMYFTlIHDZh4BzsfZxHB
	ZtQM8WhQX2SRbIMgFNOiDCG2aOFIe5TaYF5wPGSBkPWlZ07z+6nhSL5W3inmFJCPF4LuJDq23NFZd
	koUFhzCTpRUMdcLgyXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1Ih-00Gp9u-2S;
	Fri, 01 Sep 2023 10:22:51 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1Id-00Gp9W-2T
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 10:22:49 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a2185bd83cso224933966b.0
        for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2023 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693563765; x=1694168565; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6NEE6w5Khz9pMcJ2ntMBm3Akit5J8QlqovxZsNqUhdM=;
        b=UJmw52XD9zLIVCHm7AdTF6JGdFCQOysQvu58wpqhdhju1vw2CGE//DTexwOO56vPpl
         gUOgMr12hxb3qOWfIZyvRjE2rN4zhW14UaninDV2Djb6FKXBw3WYxuQariyoU67xz5dU
         v4T2F7oeuE2g3KlPOXB0c0jb1oE4si0mhMHA3D/mci2sxKHGa0Wr7eAo2Vh/QDKJPj9q
         fPhDjag8cpFdC5k6cUaXtkX/LObO/CxXM29WoJfaaxMdpg/9zJBxJkbVeZX/0M8GRvDn
         QUE2BLkm2LVcfTslXhEH409bT5e5a6iJ62fX/z0dON2uEc/OVoqMPCoGYWuklBty6nQq
         15GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693563765; x=1694168565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NEE6w5Khz9pMcJ2ntMBm3Akit5J8QlqovxZsNqUhdM=;
        b=F5QHXEMLgzCnrcBuCHyr1OxMUwFWOfNAfmxbQgEB8DioEpPtg2CwTewi3SgvGZ74tI
         2/UpJafH9vmizCpUGW2u6kkQ9+E7LswRRBa+QoRip5HqTfmR3r34x6Rtj+TA14/b4AAt
         G4VsaLQiVDxX0xLTt5Uv/aA78SieaBanGqgp0A7aVOhOhz8BF7Yv8F4ugVegGI3Q//FQ
         VTQrFhZEvhGatn7zYuD0i7UZ12kOSTj5OmjCIN1JN0Lsy77YH3n0K09vkmEc4vvopl9V
         qvwgHV8U03X49CJ0QKSKKSCbz1+1iMEjLJvy2bPjqIes0RKQtuFc387xtJjaQV5VD5u+
         +1dQ==
X-Gm-Message-State: AOJu0Yxamu0H5uVFv+E7WCglbSz8/gdd9ahaYXb2aHd7HQhru1tMDO0c
	R90r2pmX4snpls1qFC45/5OrOA==
X-Google-Smtp-Source: AGHT+IEpELZdLimfSwS/n1W2ptKg4KR8MuBPt/ZgCNwNnhG8VSVRXamKiFj/q8PuVTo/uqxVq9/IHA==
X-Received: by 2002:a17:906:224a:b0:9a1:bf00:ae52 with SMTP id 10-20020a170906224a00b009a1bf00ae52mr1640885ejr.62.1693563765289;
        Fri, 01 Sep 2023 03:22:45 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.10])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709061c1700b00992b71d8f19sm1796121ejg.133.2023.09.01.03.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 03:22:44 -0700 (PDT)
Message-ID: <76dad787-26f8-4998-a0c0-63c98199d340@linaro.org>
Date: Fri, 1 Sep 2023 11:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubi: Reject device with erasesize 0
Content-Language: en-US
To: Jan Kara <jack@suse.cz>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Zhihao Cheng <chengzhihao1@huawei.com>, Yu Hao <yhao016@ucr.edu>
References: <20230831111100.26862-1-jack@suse.cz>
 <26cd7b8f-abcc-410f-a7c7-e691999f4e3b@linaro.org>
 <20230901093726.zamwwjkk4k7oambc@quack3>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230901093726.zamwwjkk4k7oambc@quack3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_032247_873445_98D3F086 
X-CRM114-Status: GOOD (  15.63  )
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



On 9/1/23 10:37, Jan Kara wrote:
> On Fri 01-09-23 10:25:11, Tudor Ambarus wrote:
>> Hi, Richard,
>>
>> On 8/31/23 12:11, Jan Kara wrote:
>>> In principle MTD device with erasesize 0 can exist and it is possible to create them e.g. via KVM. If that happens UBI layer currently crashes
>>
>> mtd devices are organized in erase blocks, having a mtd with erase
>> size zero looks suspicious to me. Do you know if there are any mtd
>> devices with erasesize of zero?
> 
> Please see the discussion I've referenced from the patch. I agree such
> devices are strange but apparently devices reporting erasesize==0 do exist
> and can be created in virtualized environment. IMO we don't need to work
> with them but we shouldn't crash a kernel if they are attached...
> 
> 								Honza
> 

Thanks, Jan. I agree we shouldn't crash the kernel. I was wondering
whether on the long term we should aim to not allow the creation of
mtd devices with erasesize zero, or/and to not accept devices with
erasesize of zero under mtd. Was curious about the why, I don't have
anything against the patch. I guess I'll answer my questions myself
if I ever stumble on this.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
