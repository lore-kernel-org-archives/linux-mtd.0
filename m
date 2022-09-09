Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD60ECAAD3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 08:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8R9bhgAUU/InftfpNpNsUm6x2rVkicDLpSxgJMPmDM=; b=LFSaYE+8/jjR2q
	F2xyl+lFVXXl+2ldUJwrDT2VXEP5PqQZOhmgDdGnzx9WUoeqCUxSS5RtZOJfPRlLBqoY3kaEK58Tr
	BzwSVHVw2ragKbbgTWZIdJyTSpS9mO1pSXq1+UTgH/zUx1Kp6aEp6uY/Uu7yR2MYgzuwSvQa+tMWX
	GGvNVDdAAHNgKKRVpeuDX0YkcDLIb+VQunTKjL3WAw1YvPKo6wXLsdinPeviExQcYOzGPqeAJkL+G
	zy/RCO381fldHj/0Nq6vWkidiT5pvJRBDi9iIup65GXcyjFk8FXhlN32E9hIIOkykV774bXsWfxYo
	o4Vo0p10vjaVkq24LhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZ8G-00ET7u-F7; Fri, 09 Sep 2022 08:13:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZ8A-00ET6H-HS
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2022 08:12:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e16so1421792wrx.7
        for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2022 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=pZAEsbCH2NRVtB0Va/tyR0DqhYtH4yToN6sJwtAyPyc=;
        b=BBPJp8KmZvVNnfGbDDK5J/QhxG8NL4IV5p3jOI9oPGpUF1eDz8O4n487UGKgIbOnwh
         sTlp6HyXug7uTizn+wr0Gy6bBqj84cZSa/ISC2AdYxDCUpeLiUlhgmLXjQLxj1EFuZRV
         f5u68ivyeT1UqT1tNpjyZcgJQFzXiZSaDKip6BrtztDQBWRGoMdbvyPrZkpZE86oJsGE
         qD4Hee1Q4H44UUcEVdxKN/FOPHF9qSCTitgbiuLGztPxFDGm3OJklJEMTPYrb9VLNtrR
         6chaUZNDFRxuXrLSz1dvx7HbUXOtYzHxzdXiGWy6hLCAC441CfBIdWFQ5E1sm+bjy4Jk
         Brgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=pZAEsbCH2NRVtB0Va/tyR0DqhYtH4yToN6sJwtAyPyc=;
        b=GtaRl7K1NHQLJ47qRt+pdbSXtRMQnwICn/aa5FRf/PfGq8RuI5BhJhJ9xlBH4aXmsZ
         RoAcrd48qAKGLtYSz8mr02YdEYfP1lu+oWxqKmwbvARbC47WOy5KtBBxvZbJXrbfwHUE
         8bCGxqELV/MGPo68S0+SSVZSdakw6D+2bJ/j1QKNyNHXkcaECkmYeH8psMME9bZBMxHQ
         97Yxz2PZ1RbKocw+KsCl1Vs9mKK/81vnTBN+PsIbdajnTbXgkHapQJMDz3KPCAUZOcmZ
         x9fr2jx6qfM8bxhFwNTBWEFtbbiMeyITj2fbeJ9veaDgtwZu+neGeyzzSlKQQozg3bli
         ZouQ==
X-Gm-Message-State: ACgBeo1LIpVePrOtTM46gxV4KP001yk8+Cl/bBNQHyfseI1xKFimD/RO
	pe8r7BPfICDsVoRY1MZ1IG+xxg==
X-Google-Smtp-Source: AA6agR646Vsj3LapySOr+tE/u73kxjjd4Ase1LGIC+dmomAH0bSosMyMjkU387zhpmNcusrMuiL4mw==
X-Received: by 2002:adf:d1c2:0:b0:226:fa44:bab7 with SMTP id b2-20020adfd1c2000000b00226fa44bab7mr7213129wrd.195.1662711172215;
        Fri, 09 Sep 2022 01:12:52 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id r13-20020a056000014d00b00228dd80d78asm1223474wrx.86.2022.09.09.01.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:12:51 -0700 (PDT)
Message-ID: <546cb124-eb74-ff8d-e0df-12a074b50e1b@linaro.org>
Date: Fri, 9 Sep 2022 09:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/20] nvmem: core: add an index parameter to the cell
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-4-michael@walle.cc>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220901221857.2600340-4-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_011254_616357_C7611117 
X-CRM114-Status: UNSURE (   8.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01/09/2022 23:18, Michael Walle wrote:
> +	ret = of_parse_phandle_with_optional_args(np, "nvmem-cells",
> +						  "#nvmem-cell-cells",
> +						  index, &cell_spec);
where is the bindings for this new #nvmem-cell-cells property?


--srini

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
