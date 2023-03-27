Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A2CC7619A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKJ2G48S8MQe7Lf1NvnQ9Wqm55KaI61FN4Ch8pguya0=; b=0D584JYMGzQsep
	OBcFU/fcUpdiLlY2haDst9b138KS54kvn0N5jESWSatHMITJ5k50IZ1iCfYObboCXEk6B7zoL1xW4
	MpMg+7VGN3Q8eqoTRJ0tcNqYJgYjH+lDu3oGUZrZ7olHql2YeSSMe3H9YDjxzkOiSq44z69P8AdhH
	OfxAXfycOOro+sRAPdIJRxqfpn8lYl9rEgz4wxKgfVSbEzE8dZZWA846fqJPn97rF1R1n3fTgWHJV
	q3B4JRLcsWcfkzqIxOOPi8uXu2bo0LM0yuZbIsAh1gREfMDv6o9XUq5vdpZA+HOzmH8FDk/stoe1C
	vvimERTyb15bFcJ1DtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjmv-00AaZ8-0g;
	Mon, 27 Mar 2023 10:09:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjms-00AaXy-1o
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 10:09:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so6628394wmq.2
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679911752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hw+/RHBhs6qoBuvjwE715wDDIv45tvIt89aqUEaXIH8=;
        b=N3Hr5w5nCaDfzUSpQRCDtPx/Qvsd4Gm+6qfGW2UtaaQSsKN9Pw4QMjzMKwhgZsTn7y
         XhwI5vliTtQdo1E44Wo9dntl87Mv4rcyPrvjrNiZ5mDoElXrOFwYoPjUzEu1nRBQGqOv
         sNNZusonmNapXEyqUqPiMo2jCD3FScrrSEy+7rAEsVVmrQPgj/yGYqmyNZ/RERs3fQTg
         rv8qYaB7igo9EHXclRaHWjlr870TAu9AyDdaRaAaJ7Lh8JznpTVyenVDu5/xiVqZ2gUd
         LU0JgrEPhleHqQkP17BRPq52yP3rRYrVS6N7xwTFrZxYQc5I1Oida6MgeEZmWGkbBlDy
         yL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hw+/RHBhs6qoBuvjwE715wDDIv45tvIt89aqUEaXIH8=;
        b=TYea6f/LZptoUp8h59Efkdq+5N+EUAwUQ2q8NALf/uRhgV251YtiQVIw4gqLxSrIJW
         wHOQH8tUEMn5jhhurjsfoUlbX2G4kPElYZupT3bBM6cfI5CHLAfHjwclK76omf0PC0xH
         Pva/wmqFahNMOhwYyaIHEdsf0mICkjQ3qPsksc6bTyOdERL0H7ixLeQSbvPd6iM1GUTG
         A4z+UVwUpgE9cRBT5vo3Y50bS3yBFiLfyqFffMlXn0cL0vZ6J06q9VvcCM/FoHifoqXN
         Dpl7PH1rbfRIvm0boe1wlQbtt+yF3RJiZ0/nn/CaNN8AE1gl9qtjhPxIBUcBXD2L4cM2
         mwOg==
X-Gm-Message-State: AAQBX9evqVSlFJReK/jzgmlTtWycXVDTSy9WbxS+POkzQCygqB1imvoN
	LMUMrkCsj/s5iV0+1OyqR6lz2Q==
X-Google-Smtp-Source: AKy350bAklOYTUxUxdr7ZG0/oisXLxeuAEwoOFvEmh6uLNgFLQqBGEXCgbCn+KqQuOwgQXmm7IdKFQ==
X-Received: by 2002:a7b:c009:0:b0:3ef:62c6:9930 with SMTP id c9-20020a7bc009000000b003ef62c69930mr5425149wmb.3.1679911752085;
        Mon, 27 Mar 2023 03:09:12 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c350700b003dd1bd0b915sm8402995wmq.22.2023.03.27.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:09:11 -0700 (PDT)
Message-ID: <5a72f14d-636d-8328-fc56-23be11c6737c@linaro.org>
Date: Mon, 27 Mar 2023 11:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/2] mtd: rawnand: stm32_fmc2: do not support EDO mode
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327094742.38856-1-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_030914_598580_10217651 
X-CRM114-Status: GOOD (  15.79  )
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



On 3/27/23 10:47, Christophe Kerello wrote:

Hi!

> The first patch removes EDO mode support from FMC2 driver as the controller
> does not support the feature and has to be applied on Kernel LTS. The second
> patch uses timings.mode instead of checking tRC_min timing for Kernel next.
> 

Would have been good if you specified that the fix is needed for v5.4+
and that the timings.mode was introduced in v5.8, it would have spared
readers of checking if two patches are really needed. No need to resubmit.

> Changes in v2:
>  - second patch added for Kernel next
> 
> Christophe Kerello (2):
>   mtd: rawnand: stm32_fmc2: do not support EDO mode
>   mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min
> 
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
