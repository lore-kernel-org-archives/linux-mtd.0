Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14E5C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 13:25:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E0B61920
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 13:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E0B61920
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVJd4cWf9FzlXzfFreqjJYy27IpPMpfq4G3hFyQe7gk=; b=etjHjx7QcjIzYNqMYAD6wyaOr
	f75p+5T0U0WZeYpl/7UZMEZ3xW5KKRJVsJoNY6kPGYpdMjumHAqG8YDkzETBB9Ocpba4uwnzL3Jkk
	zVhBgUBTS9CFh02R6+Hf2alJMiK2uL6Q+i1namF/IlUfu/ac4IgjChRxg88GcOVtVB8CQ8EsW1TUg
	baa813I0/qDM5xo4mBCXMEgQ0VHFtJ1QLbsNx6YA63bQAxFhiCTAuOuyrHD1kn99aw4fSpe/VkeoQ
	9O9WMCdoqJB61DzxpwXsTUDItOnTn42f3PQxgENcHKL1TFWquYQlZB6hG9MnUuE7EgyjOjqbskD7k
	BsvCme9mQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOKXV-00BhIH-IZ; Mon, 22 Mar 2021 13:24:13 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOKTv-00Bgex-12
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 13:22:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12MDKScU111557;
 Mon, 22 Mar 2021 08:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1616419228;
 bh=26DPjYQQRL+10iBnOu2PfjSw1h9HtqmQpGx0mKS6rfc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=X1qtgf3E6OtWvC74sm9vBiyMIKB8KkHDLR26uraWd4kzAJg4cX+yZ58v2jnguNrQF
 SE8MJz+4mLoiflb4ve9bUdtgY4xu4lsc4vh42a27i0U2VAddUv383tdkDGp4vMzgjK
 gD0xXheAIufthqa7WfJqm6HvrJfXc1EGE9JUM72Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12MDKRVA120742
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Mar 2021 08:20:27 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 22
 Mar 2021 08:20:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 22 Mar 2021 08:20:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12MDK7dk112900;
 Mon, 22 Mar 2021 08:20:08 -0500
Date: Mon, 22 Mar 2021 18:50:06 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Kuldeep Singh <kuldeep.singh@nxp.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: spi: Convert Freescale DSPI to json schema
Message-ID: <20210322132004.n4r2thznsm7poq74@ti.com>
References: <20210315121518.3710171-1-kuldeep.singh@nxp.com>
 <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315183051.ugvmz4zqrvuo6iqq@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_132231_519558_8DDC643A 
X-CRM114-Status: GOOD (  17.87  )
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

On 16/03/21 12:00AM, Pratyush Yadav wrote:
> +Cc mtd list
> 
> Hi,
> 
> On 15/03/21 05:45PM, Kuldeep Singh wrote:
> > Convert the Freescale DSPI binding to DT schema format using json-schema.
> > 
> > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > ---
> > Hi Rob,
> > This patch is checked with following commands with no warnings observed.
> > make distclean; make allmodconfig;
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/fsl,spi-fsl-dspi.yaml;
> > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/fsl,spi-fsl-dspi.yaml
> 
> When I add the "fsl,spi-cs-sck-delay" property under the flash@0 node in 
> the example and run dt_binding_check, I see the below error:
> 
>   /home/pratyush/src/linux/Documentation/devicetree/bindings/spi/fsl,spi-fsl-dspi.example.dt.yaml: flash@0: 'fsl,spi-cs-sck-delay' does not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
>      From schema: /home/pratyush/src/lin/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> 
> I am trying to solve a similar problem for the Cadence QSPI controller 
> binding and I wonder what the best solution for this is. The obvious one 
> would be to add these properties to jedec,spi-nor.yaml. I haven't 
> managed to come up with any other solution to this problem.
> 
> Rob, all, any suggestions on how to best model this?

Ping. Any ideas?

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
