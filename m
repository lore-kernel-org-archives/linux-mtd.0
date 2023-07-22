Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5885FEB64DC
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9yGzaQE2LFKWWlKwU8es8No8V15D7AcsjohIiBqgkk=; b=tP5bmX0pRzEhEL
	XT/AbkkE7rNXa8gGryRF75Sd77DfgdPa+myDkUpRusEfhR4HidMiyeXvtC3wq/XNGO0R8JUF5eeCx
	DZQZXnsNK7jB+p35xlN9EtDoBzv8W8WD9nksda0iuvBZz3CffkbiGlR8h6qimAxQ7yPFLWYy6Fr7W
	sX9RcdDk2K2iVo+LraZ9o+ymZ3aa1wbg5jjQLgoKmNJAzw3VzcsQ9CcZyUkJytW/R9HOkBAru+fbo
	aXLXDWtayRNboOt6gTWe7FqYC6gCxOxJUjf5VY74Q/u0NJ9xINJLt+JmJc89hvLatq97C1H/nx+D4
	cqZmZD7n2BLiKWXd0H6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN6SS-00Fz06-0B;
	Sat, 22 Jul 2023 06:51:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN6SO-00FyzW-3A
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 06:51:14 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-991fe70f21bso410727966b.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 23:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690008670; x=1690613470;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10ybA64aVsHqsnB/r+bVirxg7ZzCM4MxecRS90eFR4I=;
        b=UAd0hVVCFlrxyzn+zOsfdhYr1jVVLLJcAsuH+VuzKLoKeU2niUi0DqOqkFKHghGL7+
         58Cuh0dBm5SpXPnSzvs35ICoQdEUhu2G9dn1nvzrRzAUIqF79aYM1oLEHP5KQipAKkfa
         3tKk4pRrub/kkX4QUsxcEx9Er2HZOcWCpHLVu4RQoOG5nfKUt7CV1opoDJ+LbtRtHV1c
         S5Y7zxjgWEXYtnOl2sofV6rVNNbRh9w6+V+SpB6nlQmG15Y3bbze1Gt8YofQVzFD2jfl
         IeQH9glEQtIytxcSS+8YJkBjxW2Ec1m+4itmZt202OYen+wZ/YPkPqyPmlKZ/7fCt63k
         P+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690008670; x=1690613470;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10ybA64aVsHqsnB/r+bVirxg7ZzCM4MxecRS90eFR4I=;
        b=VoMr3hRHNA7RJ4ddTzl2lwIHyNHa9Ug4L77iGwi+8Cj1FWb924BFquwzaxkMCwCuYW
         zZs/GZUmyxqo+S0NUxPIiNC3iaUBVsa9IRPKLUxHSnMw6EzJI4pqoAYGj/dgiZ3/nEUq
         j65t1WtyQDcewNJY5gjGxwFoVdGSVZEg8muWupv8yivjxxQoGnJvlnY8H6KiBgnKfEWN
         gvE8Wxdb0sv6wFvuZ62mbnPiaW+Lq9H3wTqOdnKfKuOnUS1d+xSwUa3MxksZdi6UPEuF
         CrAK9d6HNRHL8zSnNWWSWthQvh7bzlInXSQiT/BkH/srOpX1NJT+1uWSSsacms7JUv0S
         aciA==
X-Gm-Message-State: ABy/qLbjV+c7E7dJsMRCyxHYXd4937u23HvbWe8woMxTXAZZTPaidSf4
	wHDb8OIJw/Bwz9LRSAxRv89S3YjDX9XU+0h+U3Q=
X-Google-Smtp-Source: APBJJlGkxRwJx2BgXj3jnEgkXiCiHHwUdBLT/g9zemirSvwuXeCV9Zu8r+ZuNa2t53EMInTQ0kMBfQ==
X-Received: by 2002:a17:906:292:b0:992:a838:a564 with SMTP id 18-20020a170906029200b00992a838a564mr3447973ejf.28.1690008669779;
        Fri, 21 Jul 2023 23:51:09 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id h19-20020a1709063c1300b009828e26e519sm3084417ejg.122.2023.07.21.23.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 23:50:48 -0700 (PDT)
Message-ID: <9ec542b7-3db0-09df-f64f-ac07a32a7d11@linaro.org>
Date: Sat, 22 Jul 2023 09:50:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: spansion: switch set_octal_dtr
 method to use vreg_offset
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
 <5c2fbc72d94c4f88bb4599c00c45fbaaf714b909.1689836066.git.Takahiro.Kuwano@infineon.com>
 <3bfbc316-2348-fb58-4026-4f38e8845264@linaro.org>
 <df6159a0-0ae0-f6f9-9159-196a1a3b3694@linaro.org>
 <7628bec5-d956-4b66-2d34-3367f4a6bc43@linaro.org>
In-Reply-To: <7628bec5-d956-4b66-2d34-3367f4a6bc43@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_235113_087760_4168E170 
X-CRM114-Status: GOOD (  15.43  )
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



On 22.07.2023 08:25, Tudor Ambarus wrote:
> 
> 
> On 21.07.2023 19:49, Tudor Ambarus wrote:
>>
>>>>  static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
>>>>  {
>>> const struct spi_nor_flash_parameter *params = nor->params;
>>>
>>>> +	if (!nor->params->vreg_offset) {
>>>
>>> wouldn't hurt to check for params->n_dice as well, even though one
>>> implies the other. In the next patch you have a loop with n-dice being
>>> the max number of elements. If n-dice becomes zero sometime, the loop is
>>> skipped. Thus:
>>>
>>> 	if (params->n_dice && !nor->params->vreg_offset)
>>>
>> 	if (!params->n_dice || !params->vreg_offset)
> 
> and this sanity check should be moved to s28hx_t_late_init(), this way
> we do it once, as it's needed when setting
> cypress_nor_sr_ready_and_clear() too.

and we shall switch s25hx_t flashes to use vreg_offset as well,
something like:

commit 0830e89c312ff5941dc1a7e0d251eb608c51c729 (HEAD -> spi-nor/next)
Author: Tudor Ambarus <tudor.ambarus@linaro.org>
Date:   Sat Jul 22 09:36:22 2023 +0300

    mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset

    All s25hx_t flashes retrieve n_dice and vreg_offset from SFDP. Switch
    s25hx_t to always use vreg_offset in order to use the same code base
    for both single and multi chip package flashes.

    Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 413573cdb4fc..4027f0038ce5 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -350,10 +350,6 @@ static int cypress_nor_quad_enable_volatile(struct
spi_nor *nor)
        u8 i;
        int ret;

-       if (!params->n_dice)
-               return cypress_nor_quad_enable_volatile_reg(nor,
-                                               SPINOR_REG_CYPRESS_CFR1V);
-
        for (i = 0; i < params->n_dice; i++) {
                addr = params->vreg_offset[i] + SPINOR_REG_CYPRESS_CFR1;
                ret = cypress_nor_quad_enable_volatile_reg(nor, addr);
@@ -659,15 +655,17 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 {
        struct spi_nor_flash_parameter *params = nor->params;

+       if (!params->n_dice || !params->vreg_offset) {
+               dev_err(nor->dev, "%s failed. The volatile register
offset could not be retrieved from SFDP.\n",
+                       __func__);
+               return -EOPNOTSUPP;
+       }
+
        /* Fast Read 4B requires mode cycles */
        params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
-
+       params->ready = cypress_nor_sr_ready_and_clear;
        cypress_nor_ecc_init(nor);

-       /* Replace ready() with multi die version */
-       if (params->n_dice)
-               params->ready = cypress_nor_sr_ready_and_clear;
-
        return 0;
 }

I'll send a v3 with all changes, it's easier this way.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
