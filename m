Return-Path: <SRS0=NFBb=ZR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C100C432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2019 16:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6838A20740
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2019 16:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k1wWDO3e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Cg/7vv3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6838A20740
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lz44yjXjwY+8An2sZFogkY8KJFyB6M5z5DrnaNYFRDU=; b=k1wWDO3eSwZkKbC6nmwinr49+
	GXZd6fGp1FT/hsW2kmGNAt2Hcbwta9zAxjgVM09R7RNKREXXm65reUkwDH8dqw6QWCLso7rSowd25
	Rls844YW82KieWKT6jQ8jnUyRhx8q298+H2hN/MS76BioxKu737jAxSXmcvEjmfNaPfEwXrul3Uo9
	dhJ4Da78Gz0M43bkSXyxkHJoatP1NARVXmjruuxZLEYiBlm+PFM3dZrCO/xEJM50NxZYKR7onHDSi
	Uz3buNjKlqVRDeW15eqrFUzAt/4R1tjy7NCQeoEM1sQFpCPtoQFiR8I5qB3SWFHY4ouG++i5HMVLD
	eHOqs00qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZHJx-0005Hh-91; Mon, 25 Nov 2019 16:34:41 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZHJu-0005H2-6Z
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2019 16:34:39 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPGRw0B014214; Mon, 25 Nov 2019 17:34:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=auNwC8Og+UxT0YXv3DVgSuOwHEWs6615wNsybbaTUQg=;
 b=Cg/7vv3OCDOZGVlVy9JwhLP7C98IcGtYomX+91cKtrMZFHCcc2bmT93M1/sIfTHzW0yM
 rV30eEf0wuaFqmSiZ//f7zA5rZ3MNmIlGK4dLRTr9fg/SxS2SpMea/4U9T84Yx2Qb+Cs
 8IuZ7yL5WdaBQEJ9ZGSlIuX9lFUk5Xmm6DBowoAPfnYFxIDIu/zW+XI4OfeUKjey5JFK
 ien7UTdyHfVzhImiDhZT4/Pf0FF1yXWzMLJF+6rGzLOcxSmSkL6qNXzBOtfgSzud6WuN
 fqHnwuv56qMCB/t8SxvVJAjgK+g6J7BmPspokeh8G9SBR+bYLKnrc5X1a3sQq91RSb+Y og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weudw2624-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 17:34:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64E6B10005F;
 Mon, 25 Nov 2019 17:34:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C27D2B2429;
 Mon, 25 Nov 2019 17:34:29 +0100 (CET)
Received: from [10.201.23.29] (10.75.127.51) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 25 Nov
 2019 17:34:28 +0100
Subject: Re: mtd: Use mtd device name instead of mtd->name when registering
 nvmem device
To: Steve deRosier <derosier@gmail.com>
References: <1574442222-19759-1-git-send-email-christophe.kerello@st.com>
 <CALLGbRJ00TeZKPfhkqj_mwu9zhMzc_+A8mh4uwaPnFBUatrwTw@mail.gmail.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <e7801419-1644-d768-4186-ab4f17151980@st.com>
Date: Mon, 25 Nov 2019 17:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALLGbRJ00TeZKPfhkqj_mwu9zhMzc_+A8mh4uwaPnFBUatrwTw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_04:2019-11-21,2019-11-25 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_083438_598324_3CF0433F 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/25/19 5:05 PM, Steve deRosier wrote:
> On Fri, Nov 22, 2019 at 9:04 AM Christophe Kerello
> <christophe.kerello@st.com> wrote:
>>
>> MTD currently allows to have same partition name on different devices.
>> Since nvmen device registration has been added, it is not more possible
>> to have same partition name on different devices. We get following
>> logs:
>> sysfs: cannot create duplicate filename XXX
>> Failed to register NVMEM device
>>
>> To avoid such issue, the proposed patch uses the mtd device name instead of
>> the partition name.
> ...
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 5fac435..559b693 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -551,7 +551,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>>
>>          config.id = -1;
>>          config.dev = &mtd->dev;
>> -       config.name = mtd->name;
>> +       config.name = dev_name(&mtd->dev);
>>          config.owner = THIS_MODULE;
>>          config.reg_read = mtd_nvmem_reg_read;
>>          config.size = mtd->size;
> 
> This would be a breaking change for anyone that depended on
> `config.name = mtd->name` behavior. Obviously, if they were using
> multiple devs with the same partition name as you were, they'd have
> already been broken, but I suspect if a lot of people were doing that
> we'd have heard about that before now.

Hi Steve,

I understand your concern. So the recommendation is to have unique 
partition names.

Regards,
Christophe Kerello.

> 
> - Steve
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
