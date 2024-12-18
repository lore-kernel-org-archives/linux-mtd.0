Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7305E77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkehTlfl0XwDEZBf0LujchXXk67+z+EMlCnnPBPy0C4=; b=1U3MXiygQQvLSF
	GKn/s05+aJxxIELDbROr4LqIIPmAvpEpHbb5zXrSeMTIGBwP965JueJ56nLdRoiX0fBEH7F6+HPT4
	xbeXo9hWcaJSAJOkzK74wST1iKO3HusIhYgB4tUTwAUv7i8VXRL5umeusEhdxUohWYhE3N4+XVga5
	LvfmlJbXhgmo61MF36khFC7SjfXKaJFyTuPUZ1xkrFS0UGMabLyG9IPC1stKGc1fCQAhPcn4gsqOs
	N7UsYZjrPRYVskdmJRfvj8rp62Z/IvpVVWFSFeCWCE+o68Z6lTlnksCygWyEovGtJepdwwasThNG3
	Pu7fWYUhgiR6fu3V+yoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqtp-0000000GCET-3SnD;
	Wed, 18 Dec 2024 10:03:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqtm-0000000GCDu-03zF
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 10:03:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso60822945e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 02:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734516200; x=1735121000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKzI7riGbEMm6mOJZXoMF57L8yBnnT/XbsePOEHKtAc=;
        b=xG8LVZzk3ZHX+Lf7ZyQbn2FKJ8rZwmNa+Qoa9Jzh5EeTgFKYzCW9Pz+b0Nc96FdOy+
         azOkWMQdtB8bNPnquZREi/VT7edxNBW2xoCsS6EKHKYq/jjP2bu2fIMwQmECwqSoqVTS
         NZAsoMx141Ahi6aNZZySDfY3P6RqqNytgvL6Uq4FJ7a0j4yMAFyac1VA8QIk9VMOUhI/
         0qzLV4mWtLLhvPZCp3R/PVy/LgQ+R48QIYHa5MGYderSWP334sE5aVPyEHCQ61nYba8h
         c3KiETiJcAODAvR9O/6ed814GXd0n2VJao7g/0rRmQhhzGfqu9yvzXpoB+VEV5aZ5WcG
         fo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734516200; x=1735121000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKzI7riGbEMm6mOJZXoMF57L8yBnnT/XbsePOEHKtAc=;
        b=m+5eHvQRC8hRfCVcfeQAuKfXx6GEAg/i663P3AKZOW0TVgU3xSHO+1BzmaOFxlcVOx
         CGrdzp3Yhm6Vdn6yw2Q0alnYo23QuQbA+ByFVRIzVlimulUXJkW1tlxVTEL02p7pdS+E
         HIR9xS/hCugQeQ2U3b7fhmeO2TbBLNo5c8GH4G84GzkUNeudiaCDcr5mUh2soxWblgUF
         bOtKb2EQB7x7MGWRdZkP2RN29M5wt7MNAOZyV0elz/SMPv6tpaOvI6fm3FZ2ga8CGS0t
         dOOPjhSNRqQqt2+HNUnHy4i9pNIRg4BcBE0/5piw6DcpbjdMW/kDz2sn137zQ9nb3xxH
         OetA==
X-Forwarded-Encrypted: i=1; AJvYcCXnSTnkG2j015HrC6cElrJAhh7aJHCBYDg5GJw6Jbdco6g29582zNKdTgQMBFPsGPhZX+rWdTxS0Jc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHH4nbXslYb7cGr7+JFOibTYg9lPWIUFs6Oex859d3tARaY7sE
	yMDbKPXcJZ3JMVpXoMjCVTAyw62E8izJTI+msja92bd2eMkWXtF4XMpkwododEU=
X-Gm-Gg: ASbGncvElvUrINYl+8pYon/ipgu3AI21dtz31qZIEO6sGTDm2NJLxMXvYkA8CZclbyQ
	o4k7rEhZZp03TdBVfJJsxbUpUjAhYjGDzWMzJ2kdZ5JBPFZ0Z+cAHI95K/6Mm/TUSMxG6/GiR1U
	84h9Blx16BnFs5FqsjJtPKvAhfc63P/TZKBMmHMyC+2dHVyvdMdNiXVEVnLGwhbRz1aPPV55FSW
	IBoDT+uUI3zBnnb75tpYPayZKMu9tgg28JmGLMSs6ohCvrALRJ1BPWGo7C0HBd0
X-Google-Smtp-Source: AGHT+IFgSZnSfBoewe1UVvXyC66jjcSa1rlW+n+CvSPPGczGxny8+Gx87jTbercBXIIuR0+kNeYvHA==
X-Received: by 2002:a05:600c:4587:b0:435:fa90:f19f with SMTP id 5b1f17b1804b1-4365535b6eemr18452215e9.12.1734516200119;
        Wed, 18 Dec 2024 02:03:20 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656afc103sm15144885e9.7.2024.12.18.02.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 02:03:19 -0800 (PST)
Message-ID: <d12cc014-1e59-455e-8ee4-202997ddf846@linaro.org>
Date: Wed, 18 Dec 2024 10:03:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-2-miquel.raynal@bootlin.com>
 <e76ff30b-342e-4e4c-aa84-40312c3ffc72@linaro.org>
 <87jzc3oo6g.fsf@bootlin.com>
 <01f1bddd-7aee-4c90-9fa0-3b94c87eb469@linaro.org>
 <878qsde3i4.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <878qsde3i4.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_020322_102713_0FA8C905 
X-CRM114-Status: GOOD (  20.75  )
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



On 12/18/24 9:37 AM, Miquel Raynal wrote:
> On 18/12/2024 at 08:07:24 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 12/13/24 10:46 AM, Miquel Raynal wrote:
>>> Hello Tudor,
>>>
>>
>> Hi!
>>
>>> On 11/11/2024 at 13:07:09 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>
>>>> On 10/25/24 5:14 PM, Miquel Raynal wrote:
>>>>
>>>> cut
>>>>
>>>>>
>>>>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>>>>> index 17b8baf749e6..ab650ae953bb 100644
>>>>> --- a/drivers/spi/spi-mem.c
>>>>> +++ b/drivers/spi/spi-mem.c
>>
>> cut
>>
>>>>> +	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>>>>> +		((struct spi_mem_op *)op)->max_freq = mem->spi->max_speed_hz;
>>>>
>>>> not a big fan of casting the const out. How about introducing a
>>>> spi_mem_adjust_op_freq()? The upper layers will use that were needed,
>>>> and you'll still be able to pass a const op to spi_mem_exec_op()
>>>
>>> I know it is not ideal so to follow your idea I drafted the use of
>>> spi_mem_adjust_op_freq(). In order to avoid the cast, we actually need
>>> to call this function everywhere in the core and the drivers to make
>>> sure we never get out of bounds, but here is the problem:
>>>
>>>     $ git grep -w spi_mem_exec_op -- drivers/ | wc -l
>>>     42
>>>
>>> This approach requires to add a call to spi_mem_adjust_op_freq() before
>>> *every* spi_mem_exec_op(). Yes I can do that but that means to be very
>>> attentive to the fact that these two functions are always called
>>> together. I am not sure it is a good idea.
>>>
>>> What about doing the following once in spi_mem_exec_op() instead?
>>>
>>>     spi_mem_adjust_op_freq(desc->mem, (struct spi_mem_op *)op);
>>>
>>> I know we still have a cast, but it feels more acceptable than the one I
>>> initially proposed and covers all cases. I would not accept that in a
>>> driver, but here we are in the core, so that sounds acceptable.
>>>
>>> Another possibility otherwise would be to drop the const from the
>>> spi_mem_op structure entirely. But I prefer the above function call.
>>
>> How about introducing a spi_nand_spimem_exec_op() where you call
>> spi_mem_adjust_op_freq() and spi_mem_exec_op()?
> 
> That would work to make the cast disappear but TBH would not be totally
> relevant as adjusting the frequency is typically something that would
> benefit to spi-nor as well (maybe in the future) and therefore would

Right, SPI NOR will benefit of this too.

> fully apply to spi memories as a whole, not just spi-nand. We can think
> about another naming maybe, but I find like spi_mem_exec_op() is the
> right location to do this.
> 

It's not the first time that we adjust spi_mem_op parameters, see:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/drivers/mtd/spi-nor/core.c?h=spi-nor/next#n153

Does SPI NAND need to call spi_mem_adjust_op_size as well? I see it
calls it when using dirmap, but not with a plain spi_mem_exec_op().



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
