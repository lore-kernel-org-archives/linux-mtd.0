Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40F7C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf8ykyL6H2jftbcOz27xZ1zGlz+SU2FRN7fuUzUfPYE=; b=PY4dOZ+EFHgZa4
	p856bgUHXgO0aMJu195yVqDuLIgjG9UJf6fumzqNI1wVRpWAKAZ3Zn5JAf4j164KN27Mad0ciCJLV
	R/uAaDHlBSq/3elyy47MFx4P3o7L+2kQWnxCmwmzEzeOtI4qTuPIdC3ZleMxvt9IL87kyqBD1LrTk
	HuaBg3N2g2cZ1qAUQ0sTTXp4H+pFj3oFM/S44jJuOpyeixRJfSrN7Ax+ycwyYEYcY3MZz+Fmg+2vr
	Q3aV1NaRjJ3Es2UJOGb5h0+UpSbHD5PPJZAH+qpsaww94DKQVlTxsqPxPdEz1XSvyGQtdOQeSmded
	/o7pwHEV9TuYPUDjgaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWjl-0000000EApJ-3MzQ;
	Fri, 07 Mar 2025 12:23:33 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWiG-0000000EAfc-1iqT
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 12:22:01 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54957f0c657so2051167e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 04:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741350118; x=1741954918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LSXN2s87KZIXIkPkPFgGyIKtJmmpgi3DyLUElVYvfM=;
        b=s9jmo6jAuOCnImCt4uNkwS/lsfL46KQe7ZfdP18yguYXguYoK1YhyVDkDIZxJYA3+V
         jLKvTEmNimCINQx2YzGLhgIrigJoU15vLjXMbCNrOcI6TS2riZ262VTo8+LI2zRDv5xM
         7pRRoA26TD5q6kh83GBlaoVzRfoLj8GhLfMNk7FQm/ijPO0cGnjvRlcIiluaP/UZPDWf
         Lm+PeN4fpVtjBksmfzqIorHniHRzq6YVRGIEhkagVfLmAFYr1Q+vWMg/WmF15Pb5vrpU
         CCTQEue9Ax72DZW1XWZbRgelxzW/FcRJuomyNQ3rQLPJZo9Sj+W1g/kZAgR26nSu5qpC
         eNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741350118; x=1741954918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LSXN2s87KZIXIkPkPFgGyIKtJmmpgi3DyLUElVYvfM=;
        b=oArgtaBhip0Zup0CtdLb1IDBmZYi1o1Z89XA79HczQRJybPwWKzAKj5HgqYHB/Jgaf
         Wiezn95bI6kADEUDFl0AddXc7maXBo8A0epfZDr7pIPM4PHG7KNQwlaXjM/woRJAgB6J
         8dYkPZNtiwG+gxqtaXdvVGp1GdrTjWblUKeVKLYfDkpuV64tt5K8Pcig6ULX1gf7EHsV
         B/jjLoiuvGiMrYKzZBKvp7KJFODB58tzequRS1owkmELvILI5VlLjNVsKea8W1/Dy4h2
         4EsOgWEHHO91jStbw1VhGzkfhvOrBAHShe6jlcIEY+HKgcQLtQpFaiL/GCyydoX0dSpo
         QT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUW8pW9M8R0yAL2zYS1cwt/OQjtS//FLhGEIBsAAlgfuTbCvxADHy4W/PpzZ+0j5onLVEYV7bgUfXI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZYIK8LZ03sqALZnBFX/nngOayNu5/LzGaEpkWw4yDZMUOkRfM
	qmLxvPFb4ZA3IvCJJB4MMw5+rj7V5m+jWbrKHnCcHJl7YDakKVT569vKscaa02mLMAzT82f2DEh
	R
X-Gm-Gg: ASbGncsbfLAR0LCtoEUedf4oQO46OPyhLp8SWq0/CBpGe/0dyT7r+7iKNBjPM9TD29x
	vWJTK9VMpCbIgFTfOzrCpMyIo/AR296+5NcW8GKXCj2N7tJhqqgQ14w5O6LRlrmut3AnF+/5j/9
	XcTLNkZPvFJ0mevQbFGZyPUCCu2f6JMxF6J/8L/qbHvjrEljg4LbVwxC0IBy3qfGYvgQOKpuJso
	zLAzOeaEvWxZi7iDYzeRK9BRIwpbuxy1fuGKolTyXKSnlGHs0mXbeOI/pJA+yqH3lxLNR7w/Ut9
	vAcBXyig7e9vftlS1gauTjLt5dt4f7bASixN/00ntLIfFglgwLHtTw==
X-Google-Smtp-Source: AGHT+IEkE7ifgMpdMezpZQNCnHBP1lZ6rxE+o6lKPh6Da3+fmM6emG5u6CXIK1LjuK/UverWoewG9g==
X-Received: by 2002:a05:6512:1242:b0:545:2a9a:aa02 with SMTP id 2adb3069b0e04-54990435209mr1307217e87.19.1741350118331;
        Fri, 07 Mar 2025 04:21:58 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae58093sm473524e87.57.2025.03.07.04.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 04:21:57 -0800 (PST)
Message-ID: <924c370e-2c42-4e29-b790-a1d16e7c1e24@linaro.org>
Date: Fri, 7 Mar 2025 12:21:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: explicitly include
 <linux/mod_devicetable.h>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
 <20250307-spi-nor-headers-cleanup-v1-2-c186a9511c1e@linaro.org>
 <875xkltfle.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <875xkltfle.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_042200_455020_C631B0DD 
X-CRM114-Status: GOOD (  10.62  )
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



On 3/7/25 8:22 AM, Miquel Raynal wrote:
> Hello Tudor,

Hi, Miquel!
> 
> On 07/03/2025 at 09:09:06 +02, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> The core driver is using 'struct of_device_id' and relies on implicit
>> inclusion of <linux/mod_devicetable.h>, which comes from
>> <linux/of_platform.h>.
> 
> It is actually included from of.h now (since patch 1) and I wonder
> whether there is a need for it to be included explicitly. As a user it
> feels like "of.h" should already include whatever is needed for us (and

Seems so. I'll drop this patch. Thanks!
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
