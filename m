Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C404ECAAD5
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Sep 2022 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qHMe1Gv5tQfQftdnPBNNShsRjy6w2UykYZOOq6P5k4=; b=2tuzZeRNWNjWfu
	VuMIiqKEPPJFh+cWMrP0yZe4bOwFGZwhfXyV40SkmVfk+d3+x/P0utO2n2cvrY380mPLnY/3v0CC+
	QxGwe+hNUXZ1YEcTxhbmpqdSsU6gsaH/v6YWivimoSubMah4JUkoNKuP6FbcpX9U8+iqGR8ntfEco
	hISbrMIOUKQZ3bTLMTOJ+y7sctRaugeYr09WlXcvQ6/+8ldaijN/XkuKvPYzHLvZHxxPMCC99BG6A
	EmxcULRGAWi5H3BD3w237YyHzuQP2TXLeW8OBRpuay8PAurUsutnKg5Olq32Fs1OSHe0aTFtS06LN
	bCAghN5wItdTEgyI/Cqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUY5y-00Fya1-Pk; Sat, 03 Sep 2022 18:42:18 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUY5t-00FyUo-3F
	for linux-mtd@lists.infradead.org; Sat, 03 Sep 2022 18:42:15 +0000
Received: by mail-qt1-x82d.google.com with SMTP id j17so3737171qtp.12
        for <linux-mtd@lists.infradead.org>; Sat, 03 Sep 2022 11:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=J6XE1O2ZWCpY/clzvoN88TJg9PZ0eb26xbhiVvKP4lo=;
        b=ZLRqn/c0+rzTsE0ll2clObgAAimBVEPP9MBpfugRmWtY5mYL5FNjYMzFbDhaVOvk4T
         ee4RwcJLQ0DN4yFn7iFLl+BZZyGL0FQizewfH+HGkeRu7msjQCNQ98DgC4h8tNwX1em/
         KQw6LehBXLAFtmcDQUNJ+iX0dD2D3QBGbzpgbjXmmiJxZbhh+2GsXq2aYwIN3/UZQvIX
         y0Nl8CMK1TEXvQ/QsnQgPP6Iw3XZW1clbatqKuGfdHIQUEznNwz+JGDcMlqKOCxNgxbm
         jH6k1U6aRneVWVKg3nLs7TJlwG7WAv3PtJUdRA/KGJmmHvoBtFmitCqAZv4KkJjjD/DB
         prcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=J6XE1O2ZWCpY/clzvoN88TJg9PZ0eb26xbhiVvKP4lo=;
        b=K07M1IcleDVojWVSq4J0jqdliGq6C29q7LIdbuNSPGH09p49SvFasyWrtpoyEK8MKI
         xMFhBjQyoVNaMY25PBbw9OJvtDEzU95WevnER89KNOrpjOlybM/eWxvlrSTx0kJwg8Fr
         SdzI+mftWi8BtKRolRBGKkMUm//ecoujBIBAJIynf5IrEwLzPHBDSrq9mMqB/xFIgTFj
         3VZ1rrGIdzR8Knl/dKWg18e4Vf7KVFI56Hs8fuXTny30Pdw7t9KA4urfNrlVrbr9bC+E
         GvCQiFzrfpwevG4Bx2IjGpGkCy61UVyPMm3fS+DEBxZnL9AxdWUaJTvobOIDSYhOd9Fs
         bEgg==
X-Gm-Message-State: ACgBeo2Bq4hX+PQ5EBRfrMVbA1B1QfGYdOXbVjk1Br3ZpGuOHYLeVKnZ
	9Kk1h0XwoCBL/Y6up1B3H7A=
X-Google-Smtp-Source: AA6agR7HxzIwTJ9RWwG3gXmLje2tPCj6V0jw/52dT39Mb7QmN934e3u3R0eV3Zbu5KvY9JGCDDU+hQ==
X-Received: by 2002:a05:622a:1a01:b0:343:310d:fedf with SMTP id f1-20020a05622a1a0100b00343310dfedfmr34464267qtb.622.1662230531251;
        Sat, 03 Sep 2022 11:42:11 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id o12-20020ac841cc000000b003430589dd34sm3390388qtm.57.2022.09.03.11.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 11:42:10 -0700 (PDT)
Message-ID: <cdde4e0a-dfd7-51d7-0800-7ac124c34ff7@gmail.com>
Date: Sat, 3 Sep 2022 11:42:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/2] mtd: rawnand: brcmnand: Glue driver Kconfig entries
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Roger Quadros <rogerq@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 William Zhang <william.zhang@broadcom.com>
References: <20220711222323.4048197-1-f.fainelli@gmail.com>
 <6008ef46-ccdb-ea01-f9fb-4f8fceed2d29@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <6008ef46-ccdb-ea01-f9fb-4f8fceed2d29@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_114214_615953_7DD2230A 
X-CRM114-Status: GOOD (  10.91  )
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



On 8/4/2022 10:55 AM, Florian Fainelli wrote:
> On 7/11/22 15:23, Florian Fainelli wrote:
>> Hi all,
>>
>> This patch series allows for a finer control over the BRCMNAND driver
>> glue driver selection such that it defaults to the various platforms
>> enabled in the configuration file.
> 
> Miquel are you able to review and apply those patches if satisfactory? Thanks!

Ping?
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
