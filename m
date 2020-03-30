Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73CAC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 09:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A2920716
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 09:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pfRY4peQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="wCho9PLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60A2920716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZZST+wXSFZqCwoTyujpoIP6PASIjR4WneIMeo8XXUqI=; b=pfRY4peQ1lMkdN+bTCft58LKs
	Omf1Paj3G6D6YX+ajQjKyke1wrFs4gs3hKpzBq615D4pnHGTGndkbLdtK9er587j6ESy/zXghKy5T
	LTFdhB/luTslqAViKcBnRIkP+rgcOA26rvHENKIu5Kx2ZmpKWNYtESUFsdu7gKpKmhTOQ85uLW5dN
	QJHhg4s7dZ7xxXe7h8GUgQILfzldesgz13tGugI1zxdBQQayq4BeB8H92HLd2zQKBMZ+PQooH8wkx
	yLEhnYkpG9Cwoyb9DhrhPMWd3Lzu16C3C4Qi6nZ4/PKPPXEXXAnE8sWNvkN/bokt6rS5z5PmDqzFa
	qtzy3gnuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIqZb-0000MZ-2g; Mon, 30 Mar 2020 09:19:11 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIqZX-0000Lu-5Q
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 09:19:08 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U9Idm5014377; Mon, 30 Mar 2020 11:18:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Ub38GwQsQKqIBSKsE+gjD8+CY2Fdv+1zkRWPPsQFePE=;
 b=wCho9PLMdX7pbE8u/OS2MBsRIhfy+mSq0mMnjW98WzaA8Q+zLt1eBYwlWY7lCBgR1Nfs
 q+M+aHB3kEGWhc/VOohy8S2dCRIDmqtS1cVzNhK7816mKY5xim+cAk+0v9ppAbEMZAbS
 GvCir6YnbUt9xzUV3eXcpuWFqxv+YKS42Yhgk+2qgElkN9hrX/GGuDWqv9+TnAJdRkqX
 ifLPd3TI6k8+jEW+A5gWgJM4mrIj18V26jSPnMMMTH8xtrNq5Ss3rv7j/0IkpzJqBFx1
 IlUNp1ERF9yCPH+uYuFibHeE4aZd7xHELbnWspLgDTGwNqz7a1ux6ezpPTQV4wW0NZZy BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53jt76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 11:18:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6283C100038;
 Mon, 30 Mar 2020 11:18:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 303492A6215;
 Mon, 30 Mar 2020 11:18:42 +0200 (CEST)
Received: from [10.211.11.146] (10.75.127.47) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 30 Mar
 2020 11:18:40 +0200
Subject: Re: [02/12] mfd: stm32-fmc2: add STM32 FMC2 controller driver
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-3-git-send-email-christophe.kerello@st.com>
 <a989ce31-740d-8f0f-4c55-026c65259104@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <38a25c89-f45b-c5cc-2618-d1ee059e6ef7@st.com>
Date: Mon, 30 Mar 2020 11:18:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a989ce31-740d-8f0f-4c55-026c65259104@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_021907_581502_A78313B5 
X-CRM114-Status: GOOD (  15.04  )
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



On 3/30/20 1:36 AM, Marek Vasut wrote:
> On 3/23/20 3:58 PM, Christophe Kerello wrote:
>> The driver adds the support for the STMicroelectronics FMC2 controller
>> found on STM32MP SOCs.
>>
>> The FMC2 functional block makes the interface with: synchronous and
>> asynchronous static memories (such as PSNOR, PSRAM or other
>> memory-mapped peripherals) and NAND flash memories.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> [...]
>> +static const struct of_device_id stm32_fmc2_match[] = {
>> +	{.compatible = "st,stm32mp1-fmc2"},
> 
> stm32mp151.dtsi uses "st,stm32mp15-fmc2" compatible string for FMC (with
> extra "5" in the string).
> 

Hi Marek,

I have not sent in this patch set the update of the device tree files.
Currently, for backward compatibility, the FMC2 is only supported the 
NAND driver. We need to wait the review of the different maintainers 
before updating the device tree files (bindings acked, ...).
I will send a DT file update for your own test.

Regards,
Christophe Kerello.

>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_fmc2_match);
>> +
>> +static struct platform_driver stm32_fmc2_driver = {
>> +	.probe	= stm32_fmc2_probe,
>> +	.driver	= {
>> +		.name = "stm32_fmc2",
>> +		.of_match_table = stm32_fmc2_match,
>> +		.pm = &stm32_fmc2_pm_ops,
>> +	},
>> +};
>> +module_platform_driver(stm32_fmc2_driver);
> [...]
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
