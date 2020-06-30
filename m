Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFC5C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 09:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71CD206A1
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 09:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alU7lcbm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Xiq6/Exw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71CD206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QnEeFszVruRXHocPA4B+u7U67lFOX4R+ofCglNJP14I=; b=alU7lcbmp1GZ9skZML7eN7lxb
	rUCW7GmdzLBk5BcHUSqJd69vC3LSf56sVAmJH6YCqPyIxRkw4zMAiTt/MIDbndpbRxfCn0KgeJDzg
	8CfHC9FWsMccECAI/h5QJjxhQiCZTqHaFHsHzhS/4e2zKXFoZhe8EQcJ/NjIo/Ju9DUBKI4vk14lL
	/yTtDoqVYOlNObk7MEbAG2+FSgRgszbI9+5UBBCRL9r/8ua/fNSXrLF5cr1ghdx1DdD2nBd2xGQh6
	LN/AjPCRoHb4kfDfmVV8mPqN8VWVy4DsmxA/C7T89Xee/ZOinXu2/r4QYoScSONW3sGFOO+uAAuUA
	KPQ6VCguw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqCgM-0006bz-9N; Tue, 30 Jun 2020 09:36:02 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqCgJ-0006a1-T6
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 09:36:00 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U9Ytb1002355; Tue, 30 Jun 2020 11:35:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=XvCnsTc0gHyxA4bCQuL6yxD7F1TD1d0nVE+Ilwp4DeE=;
 b=Xiq6/ExwBe2jgYMzd+pcK7nxWvhuZTiZD4+4aj24d34XfntXZzCOg2vU6FyXga20MRKD
 PJOMKuRZSZrEgXKkZziTieNlwWC7FC6WQ7K5ug86Uc/UuIMj1FH5c6MokhYVTyd1RB4Y
 BViFUk/QltOESaJu/VrVtyK11Z3odChqDAl2TRZxDSeOSNsesG5PvoP6T2JMLbtl24n/
 QJhdX61xYpJCFSWNu//POwF8zBpTJo0Zh/4hG69m+nY2ObKs8JX7I7gNJhF2Gsg4aJIA
 dGPTfO8/bP3n6l54ihWE3J1/86/86QAJnpe1rNONw8Ia2/X5tXbXZfJztV2RmEVDgQnS YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89hxgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 11:35:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 314C510002A;
 Tue, 30 Jun 2020 11:35:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14BEE2ADA10;
 Tue, 30 Jun 2020 11:35:41 +0200 (CEST)
Received: from [10.211.8.105] (10.75.127.49) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 30 Jun
 2020 11:35:39 +0200
Subject: Re: [PATCH v5 4/6] memory: stm32-fmc2-ebi: add STM32 FMC2 EBI
 controller driver
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
 <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
 <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <e30abadc-83c0-f010-be36-fe8d14c4aea9@st.com>
Date: Tue, 30 Jun 2020 11:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_03:2020-06-30,
 2020-06-29 signatures=0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 arnd@linaro.org, Alexandre Torgue <alexandre.torgue@st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On 6/30/20 11:13 AM, Richard Weinberger wrote:
> On Fri, Jun 12, 2020 at 5:24 PM Christophe Kerello
> <christophe.kerello@st.com> wrote:
>>
>> The driver adds the support for the STMicroelectronics FMC2 EBI controller
>> found on STM32MP SOCs.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>> +       if (!IS_ERR(rstc)) {
>> +               reset_control_assert(rstc);
>> +               reset_control_deassert(rstc);
> 
> Shouldn't there be a small delay between assert and deassert?
> Other than that the code looks good to me.
> 

Even if I have currently not met any issue, I will add a udelay(2) to be 
safe. It will be part of v6.

Thanks,
Christophe Kerello.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
