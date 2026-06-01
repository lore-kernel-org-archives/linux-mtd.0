Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0DFCD6E4C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzjFXg5/QqhAtq6a7YP5+1fCSW1/skI7nqXdZAqxl6s=; b=frIRNDubvei1Vd
	8ZYGsTtf1bU/2026Vja70AxanhDD371tU4PBW7lqlEkmN5gTL7mu6DlPPcSiT/QF3Dhe9t71dr1Y3
	7UdLZKOuvGAOpa72mmY4KiFhR4SpH4ZngvnoDlrl8/m/ZZPaf2BnL2ElPfWRpiw+q46I53xVGclkM
	2vzkjRS2hxKwHJo3jPqddkIrShi1vJkPIfpuvCq+d4msQD9mbaFA6wHo8utk3Joq1FXRggkpyxwV6
	9WBgsL0VrmpFMkhZuznWf5hSPobFlfb+L0BqgawSZOng9zv5xRK2EbEnmAuCqBBf9zZDM4yevCet9
	rBY4r9nVcbyWgSGPIKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxMG-0000000AJke-0HDE;
	Mon, 01 Jun 2026 07:46:48 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxMC-0000000AJjv-1PaQ
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 07:46:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlH6SamW5ehTXqxTGfc0nW2lQJYFnRA6AQZ4QeCO/JljhNBJ+cc6zgl9/EwU1yoXaqehQxkWfE0G+Di6XTjRIiBmd8WZa3EYRW2tMj9zddBpx9MtUh0TJhqjOZ5vEn0VtoR8mlN6dDwHIjtk7vnDAFlu6lvFs8mSCj/+2H5g+jADaK0mmvku13Jg+tnyJfnxx7RV/HD73/whRCEuOMlsfFhMG4W199b7HY9bEuMhtkMrJ55KTZ1rMpmtsFjSz0PJADCjiiA08q6RkZl8pLDgAhusmaXj/QkjpXF2PXP1w8FU/TqYzMKdp2b+axkYlkvhy6x/J/87rxCwrWOrw/egIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK7GFxdeRTJjDOd07KC0oBhbTytIdQbsHUgR8YYeNZA=;
 b=RlOq4pOKokl+oqBfrgZrFB4ulOGHHHaUWuRJ8OmCNqt+x/4VJm6UDNYhv2wRCEvplRzgg7X2vlCt2VcU1oFHFJ3gx/OV+tLr6K5EmZe7k/i+v2ah0uk09wiyS0K3tL2tNlZY8uYTgg4H306mZxBsHE6p4SbaKaS1CCOk/cZ1sGoHl4wUGk/i/i9S1z0WGd7oXMGNhL/fir5LVJOj1bkBHXjgvdOm8GSMqq4arGrM197Vik8GaMsSGYfphUpqUNmCRCjFisVYiba2NAx1JFXaqaHZb4w56DrK2OnVX7D6d9jceBIsH3pwpi5VG13XUWUfCksrzanpxxYK5rv7+9yQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK7GFxdeRTJjDOd07KC0oBhbTytIdQbsHUgR8YYeNZA=;
 b=vf8YJMzYp6YM8Hkwyln8o2JAvTz+HmaYWlxvp/Rd2CbSi1N3ZNEefyomx1L+baM3VkbP2mTAqesEgl1JN6Bb372vwRidz98hrRDpyA3rwroinYaabsiSWaQg5zHyrjWPDnT2/CEDykMSEpT02ib+vhLjoetAs24WSJDtdHweMOI=
Received: from SJ0PR13CA0103.namprd13.prod.outlook.com (2603:10b6:a03:2c5::18)
 by MW4PR10MB6370.namprd10.prod.outlook.com (2603:10b6:303:1eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 07:46:38 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::14) by SJ0PR13CA0103.outlook.office365.com
 (2603:10b6:a03:2c5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Mon, 1
 Jun 2026 07:46:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 07:46:36 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 02:46:05 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 02:46:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 02:46:04 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6517jxbR551539;
	Mon, 1 Jun 2026 02:46:00 -0500
Message-ID: <eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
Date: Mon, 1 Jun 2026 13:15:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
To: Conor Dooley <conor@kernel.org>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <praneeth@ti.com>, <u-kumar1@ti.com>,
	<a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-2-s-k6@ti.com>
 <20260528-clergyman-kindling-20971775ba78@spud>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <20260528-clergyman-kindling-20971775ba78@spud>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|MW4PR10MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d10dfd2-fef1-40c1-4815-08debfb1e8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|376014|36860700016|1800799024|56012099006|3023799007|5023799004|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iP6k9iRMh0pmjfAnC/s5uRBAY0a0wcEa2Su1lIOOREnltYGn5i7jJAwjN6WCSOBxgs8gYGAv2T8Rrm1DjklGSAIfZSW/VVogaPJAAZfyREMg+uQ115MWmi1DbCSgGk6TFj+VjDhLKqHCdUwMLz1QtWSotK75uEX7STUI+hn4t18VHkRfhq3P9B6RnPNNcJSj06qCH7irujlQxZNhJ2fZjRyAgHk12fSNJILG8xytjgle8spcuVZTzvg2TlpBt4Vxxp71tBEzQ6IBQuR4jt8EBBgEowxUx5SEv8lEPASDHu1Aa1X0rIjgFFIsCxgQ3tDKRIXrPBTUoh8XECpVnijFlTvUFb+A/xfSIUwAV43X0d3zC19mzeP8zVtxEjc1xdzKgJNYvTAxtejD2XozqxyH9NzHp3MIvaUoSBzkwSZj96Xfb1z4iZxtq7JqQQPA8T50TDQbF7k7uImQyG60TgNXbpm54h9DDD/15nj39OhbfKR67KE7G5ASLz3Z1ShhN0bqmRHs9yL8vIa1gujaouraWzATid99NWjhnE71fbnzhlPsoHlk9mZlO62APkE1Yg/DxrPdBKfpRNTVuQBvond5jQkZ5SO3+IDfDuvtnuubbM+wnsgqyYZRc0Ako2TOH/2tvQu9G0y5PP0O1xSAgRLYnd1XbRc+285kqhB2DbdgONv+cgW2CZzRVNo7Fpg9Xk4fBcoFSg5FsUau4XDXdESZnPdn3EVmfiYa8z8nOyTf9UA=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700016)(1800799024)(56012099006)(3023799007)(5023799004)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9v3Mi3gpbBIiTR9x4JrIZ38omjeR/mh8u03ibPGX23W/wENzK8hM/cQ9/eo0VHn359Iadsyi9qCGHyT7efEmd4mgNrUnj6aBJOAG+5+DCEDBHRV8HfP9I5Fk3q2+ex+A7E1DnBFzDyj1JIJPCZuzRVKCW7cHx6VQ9Y5mp5tXUdCtT2je2KCErIKn6EdG/WWkLzn+r1DVVJrRI0EOW/FEVokL8an0OFukLef0afXfwBbc5qhXFe8h6ZfJlK31S/tzrBGOX70s4QpeTvsvhGefsX7Urn4Vkv2O0+PLMXMdvGoOzI4pttlRO3BXzYh9QV6+tAV7aEUDUPGgQlxmlPVqp0rQneOysDwu76mpwHZCMbL68xFVm1SA5AqgkU6RzGWipO7ITtFbRY83vOnVTYDksqSmEZ5a7due9EM8/2r1/VHgCJQmNq4mHsMjigAMi60q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:46:36.7214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d10dfd2-fef1-40c1-4815-08debfb1e8c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_004644_412732_B5AE394E 
X-CRM114-Status: GOOD (  25.77  )
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

Hello Conor,

On 28/05/26 23:06, Conor Dooley wrote:
> On Wed, May 27, 2026 at 11:25:15PM +0530, Santhosh Kumar K wrote:
>> Some SPI controllers support high-speed operating modes that require
>> controller-side configuration before the device can be driven at its
>> rated maximum frequency. In these cases two frequencies are relevant:
>> a conservative speed usable without any such configuration, and the
>> maximum speed achievable once the controller is set up accordingly.
>>
>> The existing spi-max-frequency property accepts only a single u32,
>> which cannot express this distinction. Extend it to accept either a
>> single value (retaining full backward compatibility) or a two-element
>> array [base-frequency, max-frequency], where base-frequency is the
>> conservative operating speed and max-frequency is the highest speed
>> the device supports after controller-side configuration.
>>
>> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
>> ---
>>   .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> Pretty sure this hasn't been tested, dt_binding_check cannot even build
> processed-schema.json with this applied because there are multiple
> definitions of spi-max-frequency with it applied.
> 
> The sashiko makes the point that this breaks every binding that uses
> minimum/maximum to set constraints too, because these properties do not
> apply to arrays unless applied per item.

Thanks for catching this. I missed dtbs_check before posting, my bad!

I understand the issue here, once the property type is changed to an
array, the minimum and maximum constraints are meaningless as they're
item-level constraints.

> 
> I also don't get the point of this property, why can't you just set the
> max that the device can do and if the controller can configure itself to
> be fast enough it will do so, and if it can't then it'll pick whatever
> the fastest it can actually do instead?
> Seems like you're abusing a peripheral property to encode information
> about the controller.

The controller-side approach you mentioned is similar to what I had in
v2, where a compatible-specific base_freq is used for non-PHY ops.

Miquel,

I think we should revert to the v2 approach.

The non-PHY frequency is a controller limitation/capability rather than
a flash characteristic, so it seems more appropriate to keep it in the
controller driver as Conor suggested.

Regards,
Santhosh.

> 
> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> index 880a9f624566..c88f6f3a1801 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> @@ -41,9 +41,15 @@ properties:
>>         The device requires the LSB first mode.
>>   
>>     spi-max-frequency:
>> -    $ref: /schemas/types.yaml#/definitions/uint32
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 2
>>       description:
>> -      Maximum SPI clocking speed of the device in Hz.
>> +      SPI clocking speed of the device in Hz. Either a single maximum
>> +      frequency, or two values [base-frequency, max-frequency] where
>> +      base-frequency is the conservative speed and max-frequency is the
>> +      highest speed the device supports after controller-side configurations
>> +      such as data training.
>>   
>>     spi-cs-setup-delay-ns:
>>       description:
>> -- 
>> 2.34.1
>>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
