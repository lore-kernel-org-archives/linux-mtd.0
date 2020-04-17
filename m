Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF9FC2D0EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 15:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A690D208E4
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 15:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f94YaiEQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="WOknlh2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A690D208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o7TNMKIXn3MRPRHHTEjIIjKUiCe4qJMnGLCf+PGc1GQ=; b=f94YaiEQAGPW+hnUcqAJVzpV5
	804rCgK+6YpxRtzHwODkhAXcbWln+v/5EGBG0zGmnm4HHtbqYQBl892qPGIVSZyNksckUs+EaM58v
	iIeOAuUwUSST/KDRBkZZvKUnjutLkcr9haXodZBzw3piw2Ie8A9ZXkDeUDkmaGUYOlc6q2KbuFP5M
	tPx3f2eniP8cN1Dv1HGBJyD1fGP8FPn7yPgu6icBHoiO38GlWqL/N3hgkKtnuHlGdWKQM5hZTTmzK
	AFxOMMJW/+pMYuIzvMFfca2dRHQDSVIOTqW6c+idVwsxI2FAsr+1C37dM1iOuwqRVjot93guGFh29
	smy6sbv7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPSwK-0000wZ-09; Fri, 17 Apr 2020 15:30:00 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPSwF-0000vT-SS
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 15:29:57 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HFIR9E021936; Fri, 17 Apr 2020 17:29:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zg2l/xaHbJpPirEybKyuid8T5Usbcw6D5SirTrUwrsA=;
 b=WOknlh2tWPlU+ymmYGqe/VN9kY6eh986HBuIgNpOmh6u8LL+zNMcnkXC2nVtTETWa/Qh
 OAyc+jy48wqVIoUWuaaAQqOCznw2m2lrCQAPwHmyRjv6jZfSCihqfaFyx1QN283mAxJS
 9CE5BNrdgpUqvSiUSqtZEtvnMJw9luCpS1dizvC8ExxMP8n9rT91r/hatJqlqGpmfJvV
 pMjy/snxLc4YDxWWO/dKxKDOK4HGKiQ9Z+vswmhpZTa0GEDF7zoVm/VDFC8Kn18D+rwH
 Kbx9UxfkTBRaT431u+7pl/njiOxlqUOkw9gq11F3pq8p9KLoz9ymQUt+YePuYcXGMXWe ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn94tb8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 17:29:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 272C410002A;
 Fri, 17 Apr 2020 17:29:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3D612BF9AB;
 Fri, 17 Apr 2020 17:29:36 +0200 (CEST)
Received: from [10.211.0.195] (10.75.127.44) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Apr
 2020 17:29:34 +0200
Subject: Re: [PATCH v2 03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI
 controller driver
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
 <20200416215328.53982fef@collabora.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <e4a21df4-b01b-1215-7a3b-fea94f099b8f@st.com>
Date: Fri, 17 Apr 2020 17:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200416215328.53982fef@collabora.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_06:2020-04-17,
 2020-04-17 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_082956_402737_28669106 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: mark.rutland@arm.com, marex@denx.de, vigneshr@ti.com,
 devicetree@vger.kernel.org, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 4/16/20 9:53 PM, Boris Brezillon wrote:
> On Wed, 15 Apr 2020 17:57:27 +0200
> Christophe Kerello <christophe.kerello@st.com> wrote:
> 
>> The driver adds the support for the STMicroelectronics FMC2 EBI controller
>> found on STM32MP SOCs.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> Tested-by: Marek Vasut <marex@denx.de>
>> ---
>> Changes in v2:
>>   - call 2 APIs to manage FMC2 enable/disable instead of ops
>>   - call 2 APIs to manage FMC2 NWAIT shared signal instead of ops
>>
>>   drivers/bus/Kconfig          |   11 +
>>   drivers/bus/Makefile         |    1 +
>>   drivers/bus/stm32-fmc2-ebi.c | 1091 ++++++++++++++++++++++++++++++++++++++++++
> 
> Hm, I see that other memory bus controller drivers are placed under
> drivers/memory/, any reason for choosing drivers/bus/? If that's where
> we want to have all generic memory bus controllers to live it might be
> worth moving existing drivers to the drivers/bus/ directory at some
> point.
> 

Hi Boris,

I see this controller as an external bus interface as we are able to 
attach different devices on it, like a PSRAM, an ethernet controller, a 
FPGA, a LCD display, ...

When I had a look at bus/Kconfig file, I have found similar drivers 
(like IMX_WEIM or QCOM_EBI2 drivers). These drivers are able to connect 
devices like NAND Flash, SRAM, ethernet adapters, FPGAs and LCD displays 
as it is written in the Kconfig file.

But, after checking memory/Kconfig file, it is also possible to find 
similar drivers (like ATMEL_EBI driver that is inspired by the WEIM bus 
driver).

So, I will follow the recommendation and I will move it to 
drivers/memory folder if it is the place where this driver should be.

Regards,
Christophe Kerello.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
