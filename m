Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8960C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+W6IV5Cj+HCGJ2ddEGATHMP8nFDyAANfoTk92IH4nI=; b=BPO+nySG1ObHCR
	V20RiNe8b0Zbg1nKeEmLYneFisJyFNM+bKBDggnmRgJe8XdchNdV2zKflU7rDbEevAI38wxreka8J
	Hyd9SsnOJNZouwCtiBxQzJ+FR/61YmSE5Zvy47mxeQQhsMWt7RIcnyvs6pb+I4XpSLWyvst5owVS1
	us7Q0Z7aJ38tH/gH5EG4urJ4mLnklsBzUIxM4jjJftjQ/RRsXztDAL8reiArwRseeZLo8DmhHjXEw
	THkt+KgMK9Cv5t5qcX4JEslB8WmgginmrJqC6EMQoEOc9w9aNC/ebsuseKBIiPdFINPNxt5KEiLot
	ijWFQu0Ui9wJiaCAz4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poiRj-001cjN-2S;
	Tue, 18 Apr 2023 10:20:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poiRh-001chV-08
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 10:20:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f0a80b686eso14478255e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2023 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681813217; x=1684405217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFy5WUTawpPS84CigK11q6oOeCpJyryq3ERZuBnJrUs=;
        b=a8LydxlGHrJWMKU50xI/W3Xk81UmwhEGdJkB7+kg+gujJh8c/k4LtoPzNi7Dz5RCTo
         oIzXMqOPqjpkxOQJJoX3KFBFhelQQPbIwGYwuS9TvRFjpmI8xYMLeJ7L86rUVQjNACyB
         S1huQyE1S0CHqJZ7qIv41zfQC4EAFiSKagbiQRJlMj5hzVDLDZFBQnnoG0I4VxhSK2db
         uhNEYmsrd5j1a7blk3MC//6c7OHRYcaXqBKemIpfUWuwJ9uAL6kr/Cz+5JZz2ksuPGCm
         khZzjOqUNvKcUWAVNioWyxL87OkKXTlaOfQYoeDRtHB1ENAuAnEzmGk3FwRLYQ7BKk5o
         s98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681813217; x=1684405217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JFy5WUTawpPS84CigK11q6oOeCpJyryq3ERZuBnJrUs=;
        b=iEbM5b45gVJ3NXHtpELjny+iBy23pizme9b2IEEr27XihIaUh66e3sl2lFPX2ApArM
         UokqgKLuRHxIcKxs/3BA7oLDFl5TjexmUPGKPCTITrSokHgmfkeBq88u+H3hrIEqXHz8
         Jju5Bb9jeRkn9IyICeHk4HNjf6URFXRvP24e8HWaC+Gr/F7x9I2ban9jaYqoT00FdpGE
         zOB0iqLGD8PSeeBiUXYEQQURVSly/MI12jxsgwb67NBTalXWc7e8C/ocUiB+VpvEia+S
         qDo6ca3sZgNUtxBTDNgdBmLzdjMj/3dMc4yE0e4coGiuqWCqynA4INrU6NKbO7/1F2St
         vJNQ==
X-Gm-Message-State: AAQBX9dQuaglK07DSHXKVyZPxOr+aiyeWyHyDzW4Ccm5coDB2gRQCBLE
	FnXFqkwyfeUH1wRiRUkxc0Umjw==
X-Google-Smtp-Source: AKy350YlowlrrTynudc7nk7kkuzgJxvGxXqG3PfUaCRPYgnOyUgGJQMw+X4Nu7m24+QGZeVut8vhWQ==
X-Received: by 2002:a5d:4089:0:b0:2f7:363e:7f5 with SMTP id o9-20020a5d4089000000b002f7363e07f5mr1464835wrp.24.1681813216802;
        Tue, 18 Apr 2023 03:20:16 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id d14-20020a5d538e000000b002f81b4227cesm8810291wrv.19.2023.04.18.03.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:20:16 -0700 (PDT)
Message-ID: <61926f94-a4ad-92c7-f2b0-036f76080968@linaro.org>
Date: Tue, 18 Apr 2023 11:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] mtd: spi-nor: Allow post_sfdp hook to return errors
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com, pratyush@kernel.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230405062106.49594-1-tudor.ambarus@linaro.org>
 <ce297db930bab7ed3d72637dc911436a@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ce297db930bab7ed3d72637dc911436a@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_032021_083249_A47CD3D5 
X-CRM114-Status: UNSURE (   9.97  )
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



On 4/18/23 10:25, Michael Walle wrote:
> Am 2023-04-05 08:21, schrieb Tudor Ambarus:
>> Multi die flashes like s25hl02gt need to determine the page_size at
>> run-time by querying a configuration register for each die. Since the
>> number of dice is determined in an optional SFDP table, SCCR MC, the
>> page size configuration must be done in the post_sfdp hook. Allow
>> post_sfdp to return errors, as reading the configuration register might
>> return errors.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> Reviewed-by: Michael Walle <michael@walle.cc>

thanks, but I already applied the patch as part of:
https://lore.kernel.org/linux-mtd/168093614108.51189.3153773628255664983.b4-ty@linaro.org/

You can find patches that require action at:
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=&state=&q=spi-nor&archive=&delegate=

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
