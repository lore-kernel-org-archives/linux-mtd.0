Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3253EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AetTwA5DZZD69XKDfOoNB0t7vmDA0llCCqHkrNBCUM=; b=bUTNeBi8U9Tfpx
	SjsV5nf0Nv8T5Lg0M5NWcDGG9H+/IbJ2uHDzoZ2QNTLx5JHdO3axlEaj9wv5geJng4WsUKUf6Lqh3
	ogS4b85Am/Q5RtWs8Q7cFFyOZapw3MTH/bktQcfZoOn/sNBbJ36fRFH6iW7Rw+OWcL+lqu9vtXvWr
	ghMKIVhULm/ZN1xa35YzoDU5Mpw9fhwhtwEZ0vt2MWngQ68SJFTcFQPd7RwRvzoJJJU/bw9v8qIEs
	eoUkKW7WQ8/wDsB4jPjWjN+9F0t/H0gX0yHF7/7G1dCUuV6841nLrofps0YFH5NoL2YgNCVqQTMdd
	vuV5BfApyjTZJVvyhi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qycJo-00A4dm-28;
	Thu, 02 Nov 2023 18:21:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qycJj-00A4cN-0W
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 18:21:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9d216597f64so191528466b.3
        for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2023 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698949277; x=1699554077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9wJ9mKNCGTABRDXQJ9GgfNOH/re14k1Stj2ZcCX5Xk=;
        b=F6xHXHiRuQ3/VNTWclEJo2U2fOPwKnuRRQv3FpEtGhEy9uzqc+zOboR0c2KdtTjcbi
         +g1+P7aYLjSuvR9wiKVcU+6UP8iNIjSlMgosP4SWqKkRO2ZmRX/1I7lUBV/WKwWKgFVN
         IWO0VkyKYIPO//SkpwA/q0lOJqs8vKL5J2xnot0s5Y1xrscpfMiZazHxy+CN0mraYKIW
         91yUPOKFvfGgDGNoJE9Dv9Y7Ao+KCqGPWrsFJ9Iy8Vc+Q9QBFzkMzvD1CGf5YStdhGYj
         ZrIcC6QkgOB88Uh2qOka/4i9MAINQPXPvKUdb7FmW1W9UpzcOBtlzQ5SEFpjvyP9YRO+
         CiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698949277; x=1699554077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9wJ9mKNCGTABRDXQJ9GgfNOH/re14k1Stj2ZcCX5Xk=;
        b=iGuyi0palqTnfcxH1K1jcBRmLgsr7OJrAdnxR/LJBQH0LL+y+cj6FP3HiF60kMP9he
         ZntpJ8XwOX6LBN4yoWcPqtpHn+FEKbmr1zZV3FT+dmC0lZj9G5IQGuUVlxGrvzHW6cBZ
         yip1Spx+nEbmycRkRmtlB/mWBF0IWF89uqKgASJjkBQYIZYcLME1K+cs67GYsOVnwPdx
         dvdtlS1xByQ7YIDC+rVkLwGCXO4UmkUXzBxZhFr7+bv9AqmdjBei7eyDeurpUo4cvSRv
         acqkaSzQ7bC1gj4frKYqyzh3CgpVgPJxL8VNrW3GzVfBAqDDr/riEaQfXfpeHU6YbxW7
         tOHQ==
X-Gm-Message-State: AOJu0Yx5xEMBCFYPapTZthu7fTROr5B1xBMYtJdH3pv0uT4RK/xpkvzC
	lrNaYrR516V0nWeJI32BK/0ENA==
X-Google-Smtp-Source: AGHT+IEqD0Zs81Z7qlXJeIdrsQwsZ5zfFVMNja8nxt1At6n/PS7v9ZqkkyAXCVRn9tdccV9NIbZm1A==
X-Received: by 2002:a17:907:a03:b0:9c7:dc4e:1a22 with SMTP id bb3-20020a1709070a0300b009c7dc4e1a22mr4901498ejc.48.1698949276934;
        Thu, 02 Nov 2023 11:21:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id z20-20020a1709060ad400b0099c53c4407dsm15390ejf.78.2023.11.02.11.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 11:21:16 -0700 (PDT)
Message-ID: <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
Date: Thu, 2 Nov 2023 18:21:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <968ba4c249926e986b02440ad0421e98@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_112119_226112_B1EC98B0 
X-CRM114-Status: GOOD (  12.79  )
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



On 11/2/23 18:01, Fabio Estevam wrote:
> On 02/11/2023 14:59, Tudor Ambarus wrote:
>> On 11/2/23 17:54, Tudor Ambarus wrote:
>>> Does this help?
>>>
>>
>> I guess not, because you used the full flash erase in the first place,
>> but still a bug. Ok, I'll add some prints.
> 
> Yes, it did not help:


Let's see what gets to the SPI controller. Which SPI controller do you use?

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index af8f3fc30256..5584bf9cbfd1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1067,7 +1067,7 @@ static int spi_nor_read_sr2(struct spi_nor *nor,
u8 *sr2)
  */
 static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t
die_size)
 {
-       bool multi_die = nor->mtd.size == die_size;
+       bool multi_die = nor->mtd.size != die_size;
        int ret;

        dev_dbg(nor->dev, " %lldKiB\n", (long long)(die_size >> 10));
@@ -1079,6 +1079,23 @@ static int spi_nor_erase_die(struct spi_nor *nor,
loff_t addr, size_t die_size)

                spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);

+               dev_info(nor->dev, "***** nor->reg_proto = 0x%08x \n",
nor->reg_proto);
+               dev_info(nor->dev, "*****\n");
+               dev_info(nor->dev, "***** op.cmd.nbytes = 0x%02x \n",
op.cmd.nbytes);
+               dev_info(nor->dev, "***** op.cmd.buswidth = 0x%02x \n",
op.cmd.buswidth);
+               dev_info(nor->dev, "***** op.cmd.opcode = 0x%02x \n",
(u8) op.cmd.opcode);
+               dev_info(nor->dev, "*****\n");
+               dev_info(nor->dev, "***** op.addr.nbytes = 0x%02x \n",
op.addr.nbytes);
+               dev_info(nor->dev, "***** op.addr.buswidth = 0x%02x \n",
op.addr.buswidth);
+               dev_info(nor->dev, "***** op.addr.buswidth = 0x%llx \n",
op.addr.val);
+               dev_info(nor->dev, "*****\n");
+               dev_info(nor->dev, "***** op.dummy.nbytes = 0x%02x \n",
op.dummy.nbytes);
+               dev_info(nor->dev, "***** op.dummy.buswidth = 0x%02x
\n", op.dummy.buswidth);
+               dev_info(nor->dev, "*****\n");
+               dev_info(nor->dev, "***** op.data.buswidth = 0x%02x \n",
op.data.buswidth);
+               dev_info(nor->dev, "***** op.data.nbytes = %d \n",
op.data.nbytes);
+
+
                ret = spi_mem_exec_op(nor->spimem, &op);
        } else {
                if (multi_die)
@@ -1870,7 +1887,7 @@ static int spi_nor_erase(struct mtd_info *mtd,
struct erase_info *instr)

        if (n_dice) {
                die_size = div_u64(mtd->size, n_dice);
-               if (len == die_size && (addr & (die_size - 1)))
+               if (!(len & (die_size - 1)) && !(addr & (die_size - 1)))
                        multi_die_erase = true;
        } else {
                die_size = mtd->size;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
