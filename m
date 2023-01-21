Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E507C004D4
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Jan 2023 05:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYIgf/Mtb9HHlxbP6Zn70N0Y/Wby1vld2HwYurFfZQA=; b=EVrRsRhD1GZGLw
	P6oxlwp9URZo7O3XjqygvvD2T8Q4sM8h8P9x493UUTsFJUAYQ+1sGc4X9SB0hhKb/ER+HuWovbWcH
	ldF/8lpCBzdkKOPjGvTbal8bUZrGoLQ6sERujF91y9nipG5bKLksi7SJFYtDuXPYsTaIV6i42TBqo
	B+MrE66bA+PrMB+kgD92JfJbfzIrpeQdPpJAFoCAX/68h9JfZbYdN6Ygu3M/AU0PnFu5rFGHwdw2z
	bs669hZTmRCHsqR8Xdv9PEGjep5HvB3cBnGZ+sATQl8xMgy6ox6ugzBMjUchz9ITzahlhoxEfcaIR
	oloqGPhvOoHv+QGGlzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJ693-00DIQU-Hk; Sat, 21 Jan 2023 05:10:25 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJ68s-00DIPm-Et
	for linux-mtd@lists.infradead.org; Sat, 21 Jan 2023 05:10:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30L59vDa068254;
	Fri, 20 Jan 2023 23:09:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674277797;
	bh=GRALvZ1/s09JXcu+MfUwyisGifXl6ED/LK1oOMDHrF4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LEZRaYTvGHAexOujqnqLKCQxTNKS5neQccpZT9fMFaEXmqqqhW6jXG3iMw2k9+PZw
	 Vn2CsLnUeoeUz5qA9UT5U2APJOgknLCyA7OfGnMq+bpqhjfKwfIgKYm7YKyFkDNAG+
	 mJGVi5F/8gZkn5srcr5u7Riz+v9slPQeMK59E/uU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30L59v6K115078
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jan 2023 23:09:57 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 20
 Jan 2023 23:09:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 20 Jan 2023 23:09:57 -0600
Received: from [10.250.234.171] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30L59rPJ003598;
	Fri, 20 Jan 2023 23:09:54 -0600
Message-ID: <4b83bbef-7481-77be-03a2-3efde086cf60@ti.com>
Date: Sat, 21 Jan 2023 10:39:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: mtd: partitions: Fix partition node name
 pattern
To: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20230120020454.3225796-1-robh@kernel.org>
Content-Language: en-US
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <20230120020454.3225796-1-robh@kernel.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_211014_697648_69D8B1FD 
X-CRM114-Status: GOOD (  14.36  )
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



On 20/01/23 07:34, Rob Herring wrote:
> The 'partition' node name pattern is missing start and end anchors, so
> anything is allowed before or after the regex pattern. There's no in tree
> users needing that, so add anchors to the pattern.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>



>   .../devicetree/bindings/mtd/partitions/partitions.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> index 9aca4e6c6047..2edc65e0e361 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> @@ -32,7 +32,7 @@ properties:
>       enum: [1, 2]
>   
>   patternProperties:
> -  "partition(-.+|@[0-9a-f]+)":
> +  "^partition(-.+|@[0-9a-f]+)$":
>       $ref: partition.yaml
>   
>   required:

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
