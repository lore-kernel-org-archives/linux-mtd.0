Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A85FC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 11:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1Vxp3+0nmzQ80BHjpqXc6KMxiv2Lsbbzffu5enQe2w=; b=PYPgvd154u/zR5
	/ofLv9/BJnfuoslrEteq+Js+WB16vDF+on8drluxqrXxnf3/cBwzSP+QUcgZ64Sy+VN8jmZxzXUmy
	k9CsHrQHXVlQyThjrP/tK1Nbdb38YBfXWYNrUeA6TQNsYBeI67nEPErOwmON2Wq3CG47aFR7vSGmo
	ahu6bLvFhVcqu75lbzgBDwn+72BJC50xSLwksCKPuzs2o0ahEEPIscmaJI24gK0WkkZyDo13PlSES
	ASiJB6ZFIGpYOu0noQ9rDKumHlkK/zLkkjJ7VZ8L9bQYTKNsHj+r1LgDEbshOZx0ldZ8cSEPqmu0J
	5cvvNSl15wS7pctu8qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUZp-0093k8-KT; Mon, 31 Jan 2022 11:10:29 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUZl-0093i6-8v
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 11:10:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso18040969pjv.1
 for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2022 03:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V98Y2/TfgWmsh23XyT90HjueUmfvQyculae63C1upXk=;
 b=F1+FAhipzLcb+NA9yJhbXasNc0G6izZkVeBln3zAcC9NxdMMFiF3UktS/0I7POww4V
 SfGr9/ATxggEDi6k/GvRVqEcXMecHx3NLfLHwijDk+Z6mK0HD7LjYqiG4gTk+oeNkaq6
 e4iXBBu8ZT+IKEN8LRhr3Zw+VaGGPzW26r1Bpqgo6CiqCJw78iANMV5UY49icnucAEbR
 EDuNppxW8Cv2sqNioviaqNasyNRObUBZcSa/X/rpavELgZ8NKAOny8LzwfW7tWbD7iSc
 WvMIkIZUSNPLNrNUwjd3KS9S4n5cAmOAGYpuvEwPInNgasT0zZMsq1iGzHGX6oRIVnIC
 4ARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V98Y2/TfgWmsh23XyT90HjueUmfvQyculae63C1upXk=;
 b=yz+ZfxcznV81KGTZq7aC1TKjOI6Sz5TgnYt0PHv4ZN0d/bhvFSYUkMjsLltwLLdLj5
 zr4L5MK7yhenNeX94O/oVRytbQVIxp2kL1y9ugANdz3AZz7u3XHVj3zYMHq6Mng0o93v
 qSQt2iHKft6tcrhmrhT6o4Hr+Yd7AxRYTY2uQvCp3kjYMqHNlzXbs9qUjJhNolV/N0h5
 UhWWrfWLjNOHREzNE0nQfDB+2ZdOq1hKtYh0DCGriK0phZmhMeBFOAEgutJdnihP7gCk
 j0yLx1oVdDk2Uy889OXcj8smXNWkmgdWNy8OEdubekBUND5ZrjdVPGKdpZUUakBsVGsd
 6djg==
X-Gm-Message-State: AOAM530EYGOroDXgTHlBoEM0NTUJxfmdxWwgYVjiqLr9hcGRMNhYQoI5
 SFZLWKqmo5OmJ3LuVLAb20Y=
X-Google-Smtp-Source: ABdhPJzVVvy0+nwDo3ABR30gJg+mzPuHtH03w1aboh8Ms1Ez8KUgYLrQmAQzjbttD6Pl+8sZ3oteDw==
X-Received: by 2002:a17:902:da87:: with SMTP id
 j7mr19627841plx.57.1643627422024; 
 Mon, 31 Jan 2022 03:10:22 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 d20sm18080871pfu.72.2022.01.31.03.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 03:10:21 -0800 (PST)
Message-ID: <a3ee02b7-370a-db90-bc1d-49c988cf21d3@gmail.com>
Date: Mon, 31 Jan 2022 20:10:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
 <4800bc7e-6558-8707-7390-2b21618215c6@microchip.com>
 <20220128162056.vwxhlz5psdxzz3tf@ti.com>
 <57909d3f-64fd-a9f3-ef13-55a5e571d853@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <57909d3f-64fd-a9f3-ef13-55a5e571d853@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_031025_377196_451038EA 
X-CRM114-Status: GOOD (  12.22  )
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

On 1/31/2022 4:50 PM, Tudor.Ambarus@microchip.com wrote:
> On 1/28/22 18:20, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 28/01/22 09:43AM, Tudor.Ambarus@microchip.com wrote:
>>> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>
>>>> Some of Spansion/Cypress chips support Read/Write Any Register commands.
>>>> These commands are mainly used to write volatile registers.
>>>>
>>>> The Read Any Register instruction (65h) is followed by register address
>>>> and dummy cycles, then the selected register byte is returned.
>>>>
>>>> The Write Any Register instruction (71h) is followed by register address
>>>> and register byte to write.
>>>>
>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>> ---
>>>> Changes in v7:
>>>>   - No change
>>>>
>>>> Changes in v6:
>>>>   - Add helper functions for controller_ops
>>>>   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
>>>>   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
>>>>     function header comment
>>>>
>>>> Changes in v5:
>>>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>>>
>>>> Changes in v4:
>>>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>>>   - Modify comment for spansion_write_any_reg()
>>>>
>>>> Changes in v3:
>>>>   - Cleanup implementation
>>>>
>>>>  drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
>>>>  1 file changed, 142 insertions(+)
>>>>
>>>> +/**
>>>> + * spansion_read_any_reg() - Read Any Register.
>>>> + * @nor:               pointer to a 'struct spi_nor'
>>>> + * @reg_addr:          register address
>>>> + * @reg_addr_width:    number of address bytes
>>>> + * @reg_dummy:         number of dummy cycles for register read
>>>> + * @reg_val:           pointer to a buffer where the register value is copied
>>>> + *
>>>> + * Return: 0 on success, -errno otherwise.
>>>> + */
>>>> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
>>>> +                                u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)
>>>
>>> how about making this a generic core method? I'm sure there are other SPI NOR
>>> vendors that use registers indexed by address. How about introducing:
>>>
>>> struct spi_nor_reg {
>>>       u32 addr;
>>>       u8 addr_width;
>>>       u8 dummy;
>>>       u8 opcode;
>>>       u8 val;
>>> };
>>>
>>> and passing a pointer to this struct as argument.
>>
>> Wouldn't it be simpler if they fill it in a struct spi_mem_op, and then
>> just pass that in as a "template"?
>>
> sure, sounds fine. I would like a generic method with less function parameters,
> if possible. Let's see what Takahiro will propose.

So, I would propose...
In core, spi_nor_spimem_{read,write}_reg(struct spi_nor *, struct spi_mem_op *)
that calls spi_nor_spimem_setup() and spi_mem_exec_op().
In vendor specific, spi_mem_op is filled and passed to the core method.

Thank you for your comments,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
