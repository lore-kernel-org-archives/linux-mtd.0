Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DCCC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UipZsbUT1PPras5VplCnSEotJRIpeD2brIA4KWR+/6o=; b=MYRtDUChpQXel7
	ZckS6dYX3cdC1/vuOZfwnYaV4hxotPvOyF6tfX50LXPdeg3PfyS4SPXX6mehOnN3Yg5Wwq7E/allq
	ZqgyFr3QHJC9QnCXwUkb64A5wT+GixLC1AMwiwSgmH1SRWNFiJSZogRsrLNCdyOCYq9dLZ8RJJI5X
	qsHkvLkm0kQsd1CkzRM79iDJl5gCVAqhFGdHZ//ehIMspZEa1qYtal7KFvBsZznLPZtBGNeMGhc24
	zAXxAjNyrJJThV4cbS7lttkB5N4wydJqt/VPFbHw8M1gu8o9j05RN4hzyg2GeFmf81GAkI1D961vD
	ida6zBLHV1cFabl/Uipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFAEn-00ERA9-KT; Wed, 02 Feb 2022 07:39:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFAEi-00ER9H-4R
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 07:39:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id v74so18092149pfc.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Feb 2022 23:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rbB+SJ/Wt2z9R7hW8AgHSfLAxiFYS+YVflxfblJbdIU=;
 b=orOjkdN8/wCoYPzEVzn2yTi3BvP0TlSQwsWvbMagt+zc4YGw2azz5vF7bUnXZU3o1n
 T4Qx1M7Z3I0MlwASfpYmYwTWw1RleRGalK8WlS55g/znDV8L++rFYatNiHI2jwjCRq88
 C9n6+rZG9nygSjqdEPGNMXtM171QCyopn9M7AOmMqq6y6vYtfKSbPE2p/wjnxcKXxBN6
 b3qQgowwHkDZ52gKvonQmfR+CKGzGNWMWG2LtmUxbQtoRdaWV1IrTkR3ztfffu8cX2bE
 SgiR+pDwamauy+tbRkx/IFj8yFLHcarvfZo7ultTL4huqlK/ZUQqE+uhIw2JsDya5lkI
 aDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rbB+SJ/Wt2z9R7hW8AgHSfLAxiFYS+YVflxfblJbdIU=;
 b=bxo5weewBOfyYxt2CVI4KitfEBOIj72fAu7+C6viHALUHTmKGl/LK3iI4zwqX2ggdh
 bgMvs7Efu3n1SPK76LCXe72bMP8+l9QYm+YVeyl6vXFvZ55T1XNIBAqw1WTnb4Ri7zfd
 /z0AXvjTdMzP2+52+PDryRUP0Lrx/esnT6T/+jU1rDlZM4AjRuLIcXF8BBGmWDmTXiAO
 LdqeouVUcAM/rOI4YM78bc7e03sj1TDrY8d2Hf3OZt0mgPOBIj3JEhXUQhakukRr/BQV
 HVktXUMqmqkJb9KEpbuJYChWAKcyYkiBG0XB1rNQg6aoxuQ1QwQLicTeGWqih8lsVFly
 PYYg==
X-Gm-Message-State: AOAM532mTdv1hGwwmGjKzf+HXwbFF3WANyD2DAehW2bKss+5FqjwN76h
 A1oWKVUJR37Cs4JF6aCuuDYbaSCBQ0w=
X-Google-Smtp-Source: ABdhPJxoNxp0rBJ5tTl+U7UcpaD9EmnINGSYNkzOeuO3lUZESpWuUcii6bFCMajNdq3hflKztLwv9Q==
X-Received: by 2002:a62:1813:: with SMTP id 19mr28210029pfy.14.1643787566788; 
 Tue, 01 Feb 2022 23:39:26 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 mi11sm5229690pjb.37.2022.02.01.23.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 23:39:26 -0800 (PST)
Message-ID: <5a508c29-fdca-ba27-182c-b0df9e5be565@gmail.com>
Date: Wed, 2 Feb 2022 16:39:23 +0900
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
 <a3ee02b7-370a-db90-bc1d-49c988cf21d3@gmail.com>
 <9acd8baf-9dba-40ac-992d-2f5cf62203b8@microchip.com>
 <f057b134-cf1a-747f-d750-f12d6872f56b@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <f057b134-cf1a-747f-d750-f12d6872f56b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_233928_240477_15682B89 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Tudor,

Thank you for your suggestions.
I will revise the series

Best Regards,
Takahiro

On 2/1/2022 4:40 PM, Tudor.Ambarus@microchip.com wrote:
> On 2/1/22 09:37, Tudor Ambarus - M18064 wrote:
>> On 1/31/22 13:10, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 1/31/2022 4:50 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 1/28/22 18:20, Pratyush Yadav wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 28/01/22 09:43AM, Tudor.Ambarus@microchip.com wrote:
>>>>>> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>
>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>
>>>>>>> Some of Spansion/Cypress chips support Read/Write Any Register commands.
>>>>>>> These commands are mainly used to write volatile registers.
>>>>>>>
>>>>>>> The Read Any Register instruction (65h) is followed by register address
>>>>>>> and dummy cycles, then the selected register byte is returned.
>>>>>>>
>>>>>>> The Write Any Register instruction (71h) is followed by register address
>>>>>>> and register byte to write.
>>>>>>>
>>>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>> ---
>>>>>>> Changes in v7:
>>>>>>>   - No change
>>>>>>>
>>>>>>> Changes in v6:
>>>>>>>   - Add helper functions for controller_ops
>>>>>>>   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
>>>>>>>   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
>>>>>>>     function header comment
>>>>>>>
>>>>>>> Changes in v5:
>>>>>>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>>>>>>
>>>>>>> Changes in v4:
>>>>>>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>>>>>>   - Modify comment for spansion_write_any_reg()
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>>   - Cleanup implementation
>>>>>>>
>>>>>>>  drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
>>>>>>>  1 file changed, 142 insertions(+)
>>>>>>>
>>>>>>> +/**
>>>>>>> + * spansion_read_any_reg() - Read Any Register.
>>>>>>> + * @nor:               pointer to a 'struct spi_nor'
>>>>>>> + * @reg_addr:          register address
>>>>>>> + * @reg_addr_width:    number of address bytes
>>>>>>> + * @reg_dummy:         number of dummy cycles for register read
>>>>>>> + * @reg_val:           pointer to a buffer where the register value is copied
>>>>>>> + *
>>>>>>> + * Return: 0 on success, -errno otherwise.
>>>>>>> + */
>>>>>>> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
>>>>>>> +                                u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)
>>>>>>
>>>>>> how about making this a generic core method? I'm sure there are other SPI NOR
>>>>>> vendors that use registers indexed by address. How about introducing:
>>>>>>
>>>>>> struct spi_nor_reg {
>>>>>>       u32 addr;
>>>>>>       u8 addr_width;
>>>>>>       u8 dummy;
>>>>>>       u8 opcode;
>>>>>>       u8 val;
>>>>>> };
>>>>>>
>>>>>> and passing a pointer to this struct as argument.
>>>>>
>>>>> Wouldn't it be simpler if they fill it in a struct spi_mem_op, and then
>>>>> just pass that in as a "template"?
>>>>>
>>>> sure, sounds fine. I would like a generic method with less function parameters,
>>>> if possible. Let's see what Takahiro will propose.
>>>
>>> So, I would propose...
>>> In core, spi_nor_spimem_{read,write}_reg(struct spi_nor *, struct spi_mem_op *)
>>> that calls spi_nor_spimem_setup() and spi_mem_exec_op().
>>> In vendor specific, spi_mem_op is filled and passed to the core method.
>>>
>>
>> how about the following?
>>
>> static ssize_t spi_nor_spimem_read_reg(struct spi_nor *nor, struct spi_mem_op *op)                    
>> {                                                                                  
>>         bool usebouncebuf;                                                      
>>         ssize_t nbytes;                                                         
>>         int error;      
> s/error/ret
>                                                         
>>                                                                                 
>>         spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
> s/&op/op
>                     
>>                                                                                 
>>         /* convert the dummy cycles to the number of bytes */                   
>>         op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;   
> 
> op->dummy.nbytes and op->dummy.buswidth
>          
>>         if (spi_nor_protocol_is_dtr(nor->read_proto))                           
>>                 op.dummy.nbytes *= 2;   
> op->dummy.nbytes
>                                         
>>                                                                                 
>>         usebouncebuf = spi_nor_spimem_bounce(nor, &op); 
> s/&op/op
>                         
>>                                                                                                                                           
>>         ret = spi_nor_spimem_exec_op(nor, &op);    
> s/&op/op
>                    
>>         if (ret)                                                      
>>                return ret;                                           
>>         nbytes = op.data.nbytes;
> op->data.nbytes
>                                                                                                 
>>                                                                                
>>         if (usebouncebuf && nbytes > 0)                                         
>>                 memcpy(buf, op.data.buf.in, nbytes);    
> op->data.buf.in
>                         
>>                                                                                 
>>         return nbytes;                                                          
>> }  
>>
>> ssize_t spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op)
>> {                                                                               
>>         if (nor->spimem)                                                        
>>                 return spi_nor_spimem_read_reg(nor, from, len, buf);           
>>                                                                                 
>>         return -EOPNOTSUPP;                  
>> } 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
