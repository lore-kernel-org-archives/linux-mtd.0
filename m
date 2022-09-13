Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DF4C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djCK/i7SEtjCJEnrUy/gPj+XnNSJKPeJnMJ3rUA4Fwg=; b=CuW6oW1/cSTYEZ
	EhJXWwJzX8OLwKg62XXcia6qL0p5X3L9ITxOyTCQsFSSkoHbuLJJ2cNyxJpnmLf/jG670BxwjbvJN
	BDbLg0w01kgwW7xI/aOkPtzelfSnFrStKnSDrT+ii4y/R96KPWfiGz7YVlCIhrYSJv3ypm0L2kZWm
	fUIQwo4MSX2L70GmMVzyC7QoIl7q1sdH7UBzbaKzB8ItA9hTPw4N2F1FWkhaJ6S6n8odNaA6BiUuB
	U/v/6XQu5naX1+DURXdk+Cmuw+AYn6JRV5A1EA7gNYSAyIbT4jesjPghV+JIIy9JZFdywLKEuLbbF
	ladugxsUbd7xYp7nUDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Hm-005GeR-D2; Tue, 13 Sep 2022 09:32:54 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Hd-005GWZ-HK
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2022 09:32:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id fs14so10676075pjb.5
        for <linux-mtd@lists.infradead.org>; Tue, 13 Sep 2022 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xpz1H8iUf1uMiSMfNCsVLntEz5yfEB3+0GGLQyV4VZE=;
        b=FHYgQ1aggm4Dg8vFAuSEr3y7/GoelW9P+JjxNA5Yi1PWTokVgumF8uGLAv3k3/YQ6K
         oFZmCYe2GrWyZ/cZpSiJHG2cszku6Pf2IJeL/qXXAeWJcQ8Hoih/toCzLFJw/TePPXnO
         psFAbi69k/bHRWEz/BAYmnS6zZ+LZ33tgzh384N5sP+EdNtxB/W5WK0ST871zZw0JoF6
         LT8N3EBCkJjPnVYxWOgNNnCIvRn86RIF9tKCwDNDAFgJvGrM4bwuNrUw+0mcpygmr4q+
         NvPgzlVjOqNfGiqZ677g8j43D8vc01PrqkAhXSR3++Oe/ffRkFDNa6uABFz276UySuVF
         cjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xpz1H8iUf1uMiSMfNCsVLntEz5yfEB3+0GGLQyV4VZE=;
        b=FzCF/Ub1l2XVW2RFiugKSAzEqPDF18KSjmN4NBxrbtG1tq5HXTLEvZuS1LfKBi94ni
         pRMe5lEAMh3ZFBYPAwgkZgr9gY3nwTvpa9kTvAHCKepAqtJRCPk9CX/MTP6alsjc3OdY
         cxn/43sQBjWvkgm/7maO3bxfIMoGVQ+VYHwrxzg2oK0BftkCqmwb3/ieSR6Haf69MowX
         DfSZbExoYdN9nam8dF9NU0UfiLs1TEdfB7G+CwwLGWDftsGb/Yvb6Db2rnD6rPBtYj2e
         H2ZFMTqpKS36aAo02Gfpf1sLmrgiTfiY6YmqQQ8S8jaduD4j5GkqNvPUzmYSJjs9N1xW
         VWhA==
X-Gm-Message-State: ACgBeo3E6DnbNcEu/NAxagX8cK2/k+zBpHMICLh0jyI65zCiJNukkNT0
	fAQWOix3MWdVFeMPrxTjU9I=
X-Google-Smtp-Source: AA6agR4HNBLgxcVMsbYCaWxHm1hGZWg6sQNdJ1jhP+9iZ2cLtc+EFK/Bkx1s2rK/1iPLMkyGO1zamQ==
X-Received: by 2002:a17:90a:203:b0:200:8df6:84c with SMTP id c3-20020a17090a020300b002008df6084cmr2983907pjc.24.1663061561069;
        Tue, 13 Sep 2022 02:32:41 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id b8-20020a1709027e0800b0015e8d4eb1f7sm7862130plm.65.2022.09.13.02.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 02:32:40 -0700 (PDT)
Message-ID: <39889f16-1ebc-991c-bb61-f0434087efe5@gmail.com>
Date: Tue, 13 Sep 2022 18:32:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] Discover current address mode by CRC
Content-Language: en-US
To: tudor.ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_023245_897706_0802C306 
X-CRM114-Status: GOOD (  12.96  )
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

Have you had a chance to take a look?

Thanks,
Takahiro

On 8/12/2022 5:06 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Hello,
> 
> I introduced this series based on the discussion [0].
> 
> Patch#1 is needed to use READ_4B(13h) for offline CRC calculation. This
> can replace spi_nor_read_raw() in SFDP, if it is OK.
> 
> Path#2 implements address mode discovery by:
>   - determine factory default from BFPT DWORD16
>   - read 4 bytes from address 0 by 13h opcode
>   - calculate CRC from 4 byte data by offline
>   - perform data integrity CRC op
>   - read data integrity CRC register by Read Any Reg with 3- and/or 4-byte
>     address bytes to determine the current address mode
> 
> [0] https://patchwork.ozlabs.org/project/linux-mtd/patch/e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com/
> 
> Takahiro Kuwano (2):
>   mtd: spi-nor: core: Add a helper to read with alternative method
>   mtd: spi-nor: spansion: Discover current address mode by CRC
> 
>  drivers/mtd/spi-nor/core.c     |  48 ++++++++++++
>  drivers/mtd/spi-nor/core.h     |   2 +
>  drivers/mtd/spi-nor/sfdp.h     |   1 +
>  drivers/mtd/spi-nor/spansion.c | 130 +++++++++++++++++++++++++++++++++
>  4 files changed, 181 insertions(+)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
