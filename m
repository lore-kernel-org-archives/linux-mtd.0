Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF49C0219D
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2025 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5tEvBvUbzfAir+Ou2GlQlC3RYE3+K69qTleNqe5OGY=; b=0phu1QGPusZv3B
	kr62ru+UDWJrwknY/ne+b/OkpRWTMO1MfNcN22gW0YaK2DptOutkUiBPJTgqBiYXt3Ju/hQXj9QGa
	lqpsMYsyuII0SpWGNNWeYh6meOk8b6F33SGxlcFD6/briC5sdvJjpKpne8H+LofUv8iu+7S0g9adU
	gGHAOQFMSXzytVjzDT15JNM5b9RQxCaH5VBEcFViC6RPJkFbX8FiegqYOgCwBhybh2tF287zzG4Yb
	rhsXTqLWCz0wZwnbNh9DKAPc83PEWfbQ4DraRt6pZv+IAqlqzaWHOy03qo/lEm6bvKDPlq/yhB5R+
	vb0ZVHqXI+hU153+iJHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUWQ-0000000AGLh-06aW;
	Thu, 13 Feb 2025 08:24:34 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUHv-0000000AE6G-0DVs
	for linux-mtd@lists.infradead.org;
	Thu, 13 Feb 2025 08:09:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ab7f2b3d563so119762766b.1
        for <linux-mtd@lists.infradead.org>; Thu, 13 Feb 2025 00:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739434173; x=1740038973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9p2EdSLawBp07To1/SqRoIMMbMu0DVH3zC5LF34z6os=;
        b=okYhrYtx2zz1ThLalFMnK88G3KCdm7/T+IkFK5zfJXD0qUiaYAS0ZsA9iLFa2yrNqJ
         FHc5bKXDKYvgsyveOP5D6TAwtagjglDf0R0PrRT03wHcKtSg+heJM7O/3HfQsHYjL66f
         kBeZc890NNTjhpL9Z/apBY7CayPd2x4+ghr9SkDIqamUgEXQAsN93gdkaqCcezgAKjlU
         NSMD9j16VEPrKu0HmPuHZ2dEZ8eWZxZwGLAYLmR9f0cGFgZbEXE2bJhmCuvjqWrdzYmA
         wLoW0cUZvJBKna8yWyoL3RSgtfZlxLgBSS8N2jTZat+D/iRJNjKyc6uwYRJ8Y1Rsxem/
         +55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434173; x=1740038973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9p2EdSLawBp07To1/SqRoIMMbMu0DVH3zC5LF34z6os=;
        b=X8haFNK1r7bi9CQBB+/cvnEaaDbty7ORWrL1i/hYfosr7WS1y5vPWyTLJx6cEQUqre
         eesrxN/2h6+UBCzaCVXxS3gmZHvM8gbrSzuc4LG2ARrceOsrWCRNmbhdg2aKpkEvDmTM
         h0potmJ9LcBcdGemy/Gsc4YvgcrOsYflzocmqYQ2T0NTTTukVfCVzldkCi6gi9khCGS4
         BIokUr7fYdz6LrFzr9LaSlR3SYKAojS9KVmoklFhcS1sPu71XmsOzOoQ5UQTqWTlwUak
         cPJ0YupyoEvRPF+PqXAAwprCXUXskJzKtw811hkU2cbvFoaYmdJWnlNtl4wyVaUQU8rV
         IJHg==
X-Forwarded-Encrypted: i=1; AJvYcCWu3kzYHmn16YzLwWUTiFPG/isLBEjnbfZxjL4X5DRqmMpiR1gLjzKSU5gKCpisPcD1VDA2dGc0+A4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcnvSUmkk6s/Yp+jOkzZQ0l8frGQqIDIGLa43oonaMT2HW28XS
	lY1OUfMwFxawtOQ++PieOqQU7lYiC26sG4XmSafTPXWDs2fJjZc4wKmZEnRqwqQ=
X-Gm-Gg: ASbGncv0wGWL5tIgCl2T9De241z99etFT7PwZnQDNv3qfwf/Yk/4sXj4SmawWcWqiey
	yhnnlexdo8luvAqjUyl8UcwUrGKDBO5yBQKZ87BuJkCzswrL4TIn7rdor5hqEhY2Mi0JD8pqPDM
	mdLxv81zDjT4tI7OCtaGpMhr3oQhZTt9svx/cNl4RYdWKAxnwPlop18CNhAOcGQg3OMPj8SoLhP
	cgYiymGBeLGIf0XY1Ac493zGaxLPa5j9dy365UDI4l8HUprGI9ZMx6Ts5W36QMBYBz44awMA2fi
	c27FYuGfbCttEgt8ChAvV/yE
X-Google-Smtp-Source: AGHT+IFXAe1RlTDoYSaewXRBP1aMKJwUgvN5cusB6JV7u4zgWuUJEGZYcIatFXAFsIHBo+3tUXIrIw==
X-Received: by 2002:a17:907:7d93:b0:ab7:e73a:f2c8 with SMTP id a640c23a62f3a-aba4ebfb50amr174402666b.26.1739434173068;
        Thu, 13 Feb 2025 00:09:33 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339d96dsm79105066b.153.2025.02.13.00.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 00:09:32 -0800 (PST)
Message-ID: <33f061a1-490e-4378-bd99-89f1af249e78@linaro.org>
Date: Thu, 13 Feb 2025 08:09:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: sst: Fix SST write failure
To: Pratyush Yadav <pratyush@kernel.org>,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, csokas.bence@prolan.hu, linux-mtd@lists.infradead.org,
 git@amd.com, amitrkcian2002@gmail.com
References: <20250213054546.2078121-1-amit.kumar-mahapatra@amd.com>
 <mafs0lduaxp3o.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0lduaxp3o.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_000935_127834_8FBDF210 
X-CRM114-Status: GOOD (  20.86  )
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



On 2/13/25 7:47 AM, Pratyush Yadav wrote:
> Hi Amit,
> 
> On Thu, Feb 13 2025, Amit Kumar Mahapatra wrote:
> 
>> 'commit 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write operation
>> to `sst_nor_write_data()`")' introduced a bug where only one byte of data
>> is written, regardless of the number of bytes passed to
>> sst_nor_write_data(), causing a kernel crash during the write operation.
> 
> Does it crash or only cause a warning? This comes from a WARN() so it
> should not crash the kernel unless you set panic_on_warn.
> 
>> Ensure the correct number of bytes are written as passed to
>> sst_nor_write_data().
>>
>> Call trace:
>> [   57.400180] ------------[ cut here ]------------
>> [   57.404842] While writing 2 byte written 1 bytes
>> [   57.409493] WARNING: CPU: 0 PID: 737 at drivers/mtd/spi-nor/sst.c:187 sst_nor_write_data+0x6c/0x74
>> [   57.418464] Modules linked in:
>> [   57.421517] CPU: 0 UID: 0 PID: 737 Comm: mtd_debug Not tainted 6.12.0-g5ad04afd91f9 #30
>> [   57.429517] Hardware name: Xilinx Versal A2197 Processor board revA - x-prc-02 revA (DT)
>> [   57.437600] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   57.444557] pc : sst_nor_write_data+0x6c/0x74
>> [   57.448911] lr : sst_nor_write_data+0x6c/0x74
>> [   57.453264] sp : ffff80008232bb40
>> [   57.456570] x29: ffff80008232bb40 x28: 0000000000010000 x27: 0000000000000001
>> [   57.463708] x26: 000000000000ffff x25: 0000000000000000 x24: 0000000000000000
>> [   57.470843] x23: 0000000000010000 x22: ffff80008232bbf0 x21: ffff000816230000
>> [   57.477978] x20: ffff0008056c0080 x19: 0000000000000002 x18: 0000000000000006
>> [   57.485112] x17: 0000000000000000 x16: 0000000000000000 x15: ffff80008232b580
>> [   57.492246] x14: 0000000000000000 x13: ffff8000816d1530 x12: 00000000000004a4
>> [   57.499380] x11: 000000000000018c x10: ffff8000816fd530 x9 : ffff8000816d1530
>> [   57.506515] x8 : 00000000fffff7ff x7 : ffff8000816fd530 x6 : 0000000000000001
>> [   57.513649] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>> [   57.520782] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008049b0000
>> [   57.527916] Call trace:
>> [   57.530354]  sst_nor_write_data+0x6c/0x74
>> [   57.534361]  sst_nor_write+0xb4/0x18c
>> [   57.538019]  mtd_write_oob_std+0x7c/0x88
>> [   57.541941]  mtd_write_oob+0x70/0xbc
>> [   57.545511]  mtd_write+0x68/0xa8
>> [   57.548733]  mtdchar_write+0x10c/0x290
>> [   57.552477]  vfs_write+0xb4/0x3a8
>> [   57.555791]  ksys_write+0x74/0x10c
>> [   57.559189]  __arm64_sys_write+0x1c/0x28
>> [   57.563109]  invoke_syscall+0x54/0x11c
>> [   57.566856]  el0_svc_common.constprop.0+0xc0/0xe0
>> [   57.571557]  do_el0_svc+0x1c/0x28
>> [   57.574868]  el0_svc+0x30/0xcc
>> [   57.577921]  el0t_64_sync_handler+0x120/0x12c
>> [   57.582276]  el0t_64_sync+0x190/0x194
>> [   57.585933] ---[ end trace 0000000000000000 ]---
>>
>> Fixes: 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write operation to `sst_nor_write_data()`")
>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
>> ---
>> BRANCH: mtd/next
>> ---
>>  drivers/mtd/spi-nor/sst.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
>> index b5ad7118c49a..175211fe6a5e 100644
>> --- a/drivers/mtd/spi-nor/sst.c
>> +++ b/drivers/mtd/spi-nor/sst.c
>> @@ -174,7 +174,7 @@ static int sst_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>>  	int ret;
>>  
>>  	nor->program_opcode = op;
>> -	ret = spi_nor_write_data(nor, to, 1, buf);
>> +	ret = spi_nor_write_data(nor, to, len, buf);
> 
> What a silly bug! Thanks for fixing it. I will let the patch sit on the
> list for a couple days to get some eyes on it and then will apply it.

Looks good. Needs Cc to stable, it was introduced in v6.12, and we can
get it as fixes for v6.14. With cc to stable:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> 
>>  	if (ret < 0)
>>  		return ret;
>>  	WARN(ret != len, "While writing %zu byte written %i bytes\n", len, ret);
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
