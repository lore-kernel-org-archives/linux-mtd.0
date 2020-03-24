Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9680AC41621
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 07:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D1EA20719
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 07:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qBAcFEbq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="SlgEcPRa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D1EA20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=14WuQ+od9bLQ2l/PkcAiwz3SWMmIOiVANT66m//CVfk=; b=qBAcFEbqcJ3Sv1UDn1tvh8nCX
	2tesBIeMGJGBR8vcl7wdqHBOoDl4SGzEBlqPSPaHRYotLCzzx4CyCzRhhhg+r6Th2KFqjBmDp20dJ
	P5rK1pftFJk0b9kT4n7144K3OQcAekG2/0odbEotUN7XbX89JqVjB9aSwnqneuRpAK2FWuQn8vmQ0
	IuAII7FLNAtTJbDKFFyHiaHiCzNquHnMteMhb2ZhDdzVxuzvPzC76qPB+o/2rQBFrI5wPcI/lkQXe
	UYKyTprcZHcqn04Sm4znXtYYRe5/vIJcAHKfioFJh79mOFIls5yI40SuS9uSGIGaDVh6qHwpYqw0z
	56GBHk6WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGe7l-0006Gb-3h; Tue, 24 Mar 2020 07:37:21 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGe7i-0006G8-1m
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 07:37:19 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O7WDpM005299; Tue, 24 Mar 2020 08:37:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=g7W4uE5VcxjxOWsb90aT0daB739c6IbaAC24AeX7vi8=;
 b=SlgEcPRad+1rytbJmKaI6MRzt+rUVRX2pcTVsM9vVxEI+w+5AE2jibLudzzPo4u0eKuQ
 U3xssMcRlSkHjeuYXt7Isep9BWehqVwK5d2TO9YSWJhLJ+w1OeLzmq0s6MXHbw9JAE1I
 TqmtvP0PGvuxKIAVBWqYHODzbVEhTEF4Ho6w8GYWyP+0h0g03CbJ/eJ4un6iz/dyzgP3
 YlioKTAVtRD7OTfUCuVJR7ncnaorMypPz23Us6w0LetP/qIhO4yj5rf02qbUMAKGaWn1
 TWjYKtA6q2IqmiTIdR775KuLVv1suXQXwWY8DJ5erHeTh7gOvUSPnrtj3F3/ZTUr60Q+ Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xdx5fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 08:37:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD8EB100034;
 Tue, 24 Mar 2020 08:36:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A32A32126C9;
 Tue, 24 Mar 2020 08:36:59 +0100 (CET)
Received: from [10.211.5.183] (10.75.127.48) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 08:36:58 +0100
Subject: Re: [00/12] add STM32 FMC2 controller drivers
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <466cf542-7575-d791-da81-da32c0919505@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <156b55b5-1b09-fa7e-e3bc-a0d5dea870db@st.com>
Date: Tue, 24 Mar 2020 08:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <466cf542-7575-d791-da81-da32c0919505@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_01:2020-03-23,
 2020-03-24 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_003718_561752_F0A1A9DD 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 3/24/20 1:37 AM, Marek Vasut wrote:
> On 3/23/20 3:58 PM, Christophe Kerello wrote:
>> The FMC2 functional block makes the interface with: synchronous and
>> asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
>> peripherals) and NAND flash memories.
>> Its main purposes are:
>>    - to translate AXI transactions into the appropriate external device
>>      protocol
>>    - to meet the access time requirements of the external devices
>> All external devices share the addresses, data and control signals with the
>> controller. Each external device is accessed by means of a unique Chip
>> Select. The FMC2 performs only one access at a time to an external device.
>>
>> Christophe Kerello (12):
>>    dt-bindings: mfd: stm32-fmc2: add STM32 FMC2 controller documentation
>>    mfd: stm32-fmc2: add STM32 FMC2 controller driver
>>    bus: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
>>    mtd: rawnand: stm32_fmc2: manage all errors cases at probe time
>>    mtd: rawnand: stm32_fmc2: remove useless inline comments
>>    mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS for timeouts
>>    mtd: rawnand: stm32_fmc2: cleanup
>>    mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros
>>    mtd: rawnand: stm32_fmc2: move all registers
>>    mtd: rawnand: stm32_fmc2: use regmap APIs
>>    mtd: rawnand: stm32_fmc2: use stm32_fmc2 structure in nfc controller
>>    mtd: rawnand: stm32_fmc2: add new MP1 compatible string
> 
> This doesn't apply to either next or 5.6-rc7, do you have a tree
> somewhere with those patches applied ?
> 

Hi Marek,

This implementation has been done on mtd/nand/next branch.

Regards,
Christophe Kerello.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
