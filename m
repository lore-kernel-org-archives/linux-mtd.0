Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A87EC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/KflLxwUXotYo7bKwE2DbODL8m1uOgia/wEjG3TX2w=; b=Yrz8/xGUgXcS4B
	62BFbmS2sKxJZHVPAcf1uRxSQQ5tIpCpq32cOnM5X5O599M9XmecN4uz/ucFb5arM8fXnszsDF88p
	GZ8BorulL/akEs63y81yAI+lqxxCz1jjvu+ORyEyZBeExUf79yVn4EJu+5cGWp3B8ezh3U6VGsRH4
	1uipr8lAOKPUkSOcWQPu8maXSmUOLM+8oPKclCbxA1m9USTwEggvpJ/0EfPJATqRFv8Isq1u2TdPc
	hwukN666FsPS4cHaPGm32J0kgDcsA8aGgTHbWRX63mnuPKFnp7ECgJveMqGtkCzwsv+oeWhRzy1L/
	GFcg9EMftc+/QE7sDc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObsx-009uhN-07;
	Wed, 26 Jul 2023 10:36:51 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qObsu-009ufj-0r
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 10:36:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36QAaecI018115;
	Wed, 26 Jul 2023 05:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690367800;
	bh=1B0MDuc+ApzvvO3kxA++pppssIfBmpbwHLhnpmlFZXI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iu4IYUJ0BJAHe2vg1m85sp9aYBPjJwr0QgP0j1OEo72IUUrn4ummwG6a4CrzdRK8P
	 xTHMqOSk9AeEjHxizOITnk8XbzJ8IgqV/mCX3e5VpMnoVSRTFuN3VfiG3D8wz6Pp+w
	 040vrFUs1uRrMyRYs1p4LLQTG6BsgPMQZOCj/CMI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36QAaeqM003359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jul 2023 05:36:40 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Jul 2023 05:36:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Jul 2023 05:36:39 -0500
Received: from [172.24.19.130] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36QAabEh078104;
	Wed, 26 Jul 2023 05:36:38 -0500
Message-ID: <9b20a155-f662-cfce-c617-f21901841ef2@ti.com>
Date: Wed, 26 Jul 2023 16:06:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer for HYPERBUS
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Tudor Ambarus
	<tudor.ambarus@linaro.org>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20230620025359.33839-1-tudor.ambarus@linaro.org>
 <20230622102836.2be2ab1b@xps-13> <20230710114903.352bc12d@xps-13>
Content-Language: en-US
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <20230710114903.352bc12d@xps-13>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_033648_343310_54B1A309 
X-CRM114-Status: GOOD (  10.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 7/10/2023 3:19 PM, Miquel Raynal wrote:
> 
> miquel.raynal@bootlin.com wrote on Thu, 22 Jun 2023 10:28:57 +0200:
> 
>> Hi Vignesh,
>>
>> tudor.ambarus@linaro.org wrote on Tue, 20 Jun 2023 05:53:59 +0300:
>>
>>> Add myself as Designated Reviewer for Hyperbus support.
>>> I'm assessing the framework and I'd like to get involved
>>> in reviewing further patches.  
>>
>> Vignesh, any chance you could give feedback on this patch quickly? I'd
>> like to take it for the next PR if you agree.
> 
> I'm surprised there is still no feedback after 3 weeks, I haven't heard
> from him at all since a while.
> 
> Vignesh, are you still around?

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>


Thanks Tudor for taking signing up. And sorry for the delay.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
