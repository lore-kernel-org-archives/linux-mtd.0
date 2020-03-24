Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88B5C4332B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 10:38:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B4A320775
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 10:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rU5oCT/z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="gENvra/K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B4A320775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcOHUuDpfKfkGNjNG7HrDSd1LAyWU69+P+4rlayCr8s=; b=rU5oCT/zcD/vLlMIt/8jL9D+Q
	33ziAHeeyCaSJlE1f9TM343adQyExM2mXMmH+e4J+dRZZp7XqkS1L2ANmDueFxox0KoTjSqXwL88z
	j7cDp0pUfgdbVJPR2D43M7/Yk8/eYBoAa1JWdw88RudFcTVAyX2/tMfpuoobpxTBkLH1iTlccECZU
	YaymgF6kEh4K8BQ1x15Mpclom25u8Um0k3opNRK2Ul3boud6t9IdK2f7zjqjD3y1RBttBgLCqDLQN
	uV0NRNMrrb8jk9jihLQm71A82sIY1Qa0iG2HxxTUggFZJ4gFs/kU01iwizcldjkwwy86ElzXttBIU
	dHdqtKf1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGgx4-0004pf-UB; Tue, 24 Mar 2020 10:38:30 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgx1-0004pD-9u
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 10:38:29 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OASjEF027802; Tue, 24 Mar 2020 11:38:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=qjix0X4rFPtS9PXPYAPD9xbtsp4+DScbfwh25ikjWl0=;
 b=gENvra/KxMaUTgzVIC6WWgx8cNmguR7U6Oi46nV1B7+ehSp2XpF68k3i+d3gAYLXCIJ5
 I12o+MExVwWDIMtxBcS1SaJ/ABFsQXJcG+x5f89gpjajPD1FKFi59fqXM+620PbZibgB
 pkQm5SoMDZ862hxomvlXUp6v/Ls9Y3VfVV+vHT+ypPfWXu5knoNPCaE8PHr4uMujAV8q
 58RLoC7mEzpYzMQwQIN+MVZYnQ6Lglpry52Vi8mj65uXwEStg+0TgdH37PwuAYSp65D0
 nc+Nfuz2p7Bev1D/KxKA368dwaljN0WDVB8VOqeKWyS7G0kjZDN0RQQ8OU4TJmDs3++x mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9jyxxeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 11:38:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 022B5100038;
 Tue, 24 Mar 2020 11:38:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE9182A6EC5;
 Tue, 24 Mar 2020 11:38:10 +0100 (CET)
Received: from [10.211.5.183] (10.75.127.48) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 11:38:09 +0100
Subject: Re: [10/12] mtd: rawnand: stm32_fmc2: use regmap APIs
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-11-git-send-email-christophe.kerello@st.com>
 <784fafd2-f1f3-f9c4-d6eb-1d2f6f8d38e4@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <bac5f70c-5e12-2ac1-fc35-46f838f4d480@st.com>
Date: Tue, 24 Mar 2020 11:38:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <784fafd2-f1f3-f9c4-d6eb-1d2f6f8d38e4@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_03:2020-03-23,
 2020-03-24 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_033827_793031_112A9E81 
X-CRM114-Status: GOOD (  11.35  )
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



On 3/24/20 1:44 AM, Marek Vasut wrote:
> On 3/23/20 3:58 PM, Christophe Kerello wrote:
> [...]
>> @@ -531,11 +515,11 @@ static int stm32_fmc2_nfc_bch_correct(struct nand_chip *chip, u8 *dat,
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> -	ecc_sta[0] = readl_relaxed(nfc->io_base + FMC2_BCHDSR0);
>> -	ecc_sta[1] = readl_relaxed(nfc->io_base + FMC2_BCHDSR1);
>> -	ecc_sta[2] = readl_relaxed(nfc->io_base + FMC2_BCHDSR2);
>> -	ecc_sta[3] = readl_relaxed(nfc->io_base + FMC2_BCHDSR3);
>> -	ecc_sta[4] = readl_relaxed(nfc->io_base + FMC2_BCHDSR4);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR0, &ecc_sta[0]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR1, &ecc_sta[1]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR2, &ecc_sta[2]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR3, &ecc_sta[3]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR4, &ecc_sta[4]);
> 
> Would regmap_bulk_read() work here ?
> 

Hi Marek,

Yes, regmap_bulk_read can be used. It will be done on V2.

Regards,
Christophe Kerello.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
