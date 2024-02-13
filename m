Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E942C4829A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Feb 2024 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBXQw+1bL18xOBpM5bsXyVvLJT8PL4grvyZDOGQtL+Y=; b=MOeLHQa9jJjVXS
	XnOi1Tlo3/cSk6d+lvTh2VwCPpmpCubZ0SHptqyCWS2fk5WTlMmslpC3LgNYR32dfzQQQfsIbo6j0
	JAnpJ3ApMzzUa0w5eatk3gQ23YzoZNZd82LaHVdslyNaKBw8C/uBz4Ep6Zd6D/zkfA/cfIXEYyPzt
	0HecN07Db48q4Qz9/d8FK0EwcVtMnNURbWFZIzWBxCWKIyQR9ERv1x2UbFJ9+wtXbQ4xUL8D0II/f
	qAUNfqh0pDNrzSETD3ncYxdS3gOYGdqjyRvRsQb/He9tPISNcfotnIi8JMFgrzXCzZnu9mZ8N0UAB
	iuowxZ1ieHsFMpABSAjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrw6-00000009BYE-3Xnp;
	Tue, 13 Feb 2024 12:30:54 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrw4-00000009BVf-1cIS
	for linux-mtd@lists.infradead.org;
	Tue, 13 Feb 2024 12:30:53 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41D7d0cd002349;
	Tue, 13 Feb 2024 13:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=kHU+w4G8rI34Tv3Gohyrk/JVIGnrPjuaVTS+MdoFwXk=; b=t/
	DSLgBPM5IwMdlpBqfKAukMqNYXOPKwWIutP9G5ZbBlV36IoNpQK7fHQ2ckWL/3kO
	bzRp9HRF3XMXQrfs5HeF6ETaRGmp+xQn930VdL0uVwnFWBcZCoCPf7klmyXdZoBn
	uFJ2h4DhhLsUgoblkaPx3W7MT4nzMZcSQojx8qfsSZPYDybWivvJoSlpi3KeD5XG
	4A0CkC8yH5Aml8m4n0XBhyA1yk/me/hIs+kRoIra7Em39z6xB4XXO0AzclHI8SD+
	/i+8Mcd9n81L1jzlxHKbIYtQC3uvmRBxtR+woghddxK4OUk8Ohx9FIhN6fp7nkQt
	7aHnZ58DqqEDvUJ+jtZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62shtndr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 13:30:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A4D004002D;
	Tue, 13 Feb 2024 13:30:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B971F23C6AC;
	Tue, 13 Feb 2024 13:29:48 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 13:29:48 +0100
Message-ID: <f8525765-4c91-43ab-a57c-d236889cf122@foss.st.com>
Date: Tue, 13 Feb 2024 13:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] memory: stm32-fmc2-ebi: add MP25 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-5-christophe.kerello@foss.st.com>
 <afb4bd72-aa22-4d74-aeb8-d3875c6d07ca@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <afb4bd72-aa22-4d74-aeb8-d3875c6d07ca@linaro.org>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_06,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_043052_738428_9212E25D 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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



On 2/13/24 08:36, Krzysztof Kozlowski wrote:
> On 12/02/2024 18:48, Christophe Kerello wrote:
>> Add MP25 SOC support. RNB and NWAIT signals are differentiated.
>

Hi Krzysztof,

> s/SOC/SoC/
> everywhere

Ok.

> 
>>
> 
> The way you split patches is a bit odd. Shall we understand that this
> patch is the complete MP25 SoC support?
> 

No, it is not the full support but the way the FMC2 IP has been
integrated in this SoC. As patch 5 has to be written, I am going to
merge this patch and patch 5 in one patch. I am going to follow your
recommendation and use the platform data to distinguish between each
variant.

Regards,
Christophe Kerello.

> Best regards,
> Krzysztof
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
