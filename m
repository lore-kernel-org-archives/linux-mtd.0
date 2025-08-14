Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9FBCA0EE8
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Aug 2025 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bidGjyp53+eFfZ5WkRnE/hJzh16PPESAqbX6qOuEVmo=; b=IiKcydJ6BeB/Hl
	4UK52Z64pE99D3+XxDkpISlTl62t4AvQgpgm8h9+O7amyqEulU4DV1I/Mxe6cYqaF8RbDROMlxHnk
	f2RlTL3mQ4wVX0rS01nVwLvKqd5aiTWzSBrqgjNx5ELiQwrkK5aLV5S07cIM54kMDkk+Hx5ulNVFI
	b1RomNrybf83yK5D9Hum/09VNyOIL+LexhsrkJfI8dJtavpcWvrX6M4HoGeZtJzr4nAeYAMLetm5d
	+gxkhRumK3kxUKeZtrZqdlky9ii6Ky+CPbitBugRYXqCponmv3uhh1QzEW0ExxdaTeRueyoDU30ac
	dIg2UYjIZCh8S9DcuDqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYzN-0000000HGX8-0gRO;
	Thu, 14 Aug 2025 14:31:33 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWEJ-0000000Gkoo-2k84
	for linux-mtd@lists.infradead.org;
	Thu, 14 Aug 2025 11:34:48 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EBYdtT1922781;
	Thu, 14 Aug 2025 06:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755171279;
	bh=7LbU+yv2+Y6jnYq61nIb7SKpWsz0Z9nUrQStSnTQjvg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iicrYriFr/xt9We9t8/o/L9I1Wxtp+0cnkPfNnoE9Jgh3U33Uhcu0k6a3pWYfE/Y4
	 eiDza8w56ia5wKHqjjk4IeNZHmP8hhLjj9p9AXK0ew2EpB4/642IRTPkJz4mcIFvwZ
	 X+K+6OaD17VSnvwbZDPu9MQ52FO8rfEuFQASjBv4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EBYdEl1118411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 06:34:39 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 06:34:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 06:34:38 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EBYY1g3540111;
	Thu, 14 Aug 2025 06:34:34 -0500
Message-ID: <20487e7f-33dd-4b65-b1a8-5bb8a06ef859@ti.com>
Date: Thu, 14 Aug 2025 17:04:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
To: Mark Brown <broonie@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <p-mantena@ti.com>, <linux-spi@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <a-dutta@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>, <s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com>
 <6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_043447_788393_BA0BAC5D 
X-CRM114-Status: GOOD (  13.97  )
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

Hello Mark,

On 14/08/25 01:56, Mark Brown wrote:
> On Tue, Aug 12, 2025 at 01:02:10AM +0530, Santhosh Kumar K wrote:
>> From: Pratyush Yadav <pratyush@kernel.org>
>>
>> Some controllers like the Cadence OSPI controller need to perform a
>> tuning sequence to operate at high data rates. Tuning is needs to happen
>> once the device is switched to appropriate mode (say 8S-8S-8S or
>> 8D-8D-8D). Add a hook that spi-mem client devices can call in order to tune
>> the controller to operate in a given mode and data rate.
>>
>> This is somewhat similar to eMMC/SD tuning for higher speed modes like
>> HS200, but there isn't a standard specification around the same though.
> 
> Should we have something that blocks these tuning required modes without
> the appropriate tuning, and/or allows discovery of which modes require
> this tuning?  This all feels very landmineish - client drivers just have
> to know when tuning is required.

The flash's maximum operating frequency determines whether PHY tuning is 
required, as we need tuning in case of Cadence controller for 
frequencies over 50 MHz.

And we do check for this condition - see Patch 07/10,
cqspi_phy_op_eligible_sdr(), which currently verifies the flash 
frequency against 166 MHz. This logic can be improved by implementing 
both min and max frequency checks, will update in the following version.

Thanks,
Santhosh.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
