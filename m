Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C4CC2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 03:33:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C1B2071E
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 03:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ENjgagdy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C1B2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIF5tIqVDjSU1vpMEXDf4nKXOIPfLmh2FW0Y+PCUrb8=; b=ENjgagdyGuPAYf
	n58Jm7al/YrbqMP2rg8baNSSdfAFVU0VPwHyErB8Ty/BFqINEvD4NIfpucKdMJ6wGhI24onT0/+/T
	0jL1RJBQ/Mr/azbLZzMbIQF+3iJqlYkOFqHh3J6pDOFRZv963F6YP/NrjW8ov2ZYvMnnXXHgf9Yue
	TfAPRZ512SbdIuubSzxBk1jNVTQx+E12Vx0olHcviWG/8UOra/K6liKMPKRRalBT+ab3Wqi47bHok
	CZ2Z1oTxF6WFCNMQ4yQYkH219UVIt9h2jHAb45ye53/JzMpUwRpBJK+PQVO28PqKePW+Y525AAyzH
	zw+yeIKgpGJyLKqLMnqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQjf0-0004ZR-J1; Tue, 21 Apr 2020 03:33:22 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQjey-0004Y4-AU
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 03:33:21 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9759F735A9D2264F059C;
 Tue, 21 Apr 2020 11:33:13 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 21 Apr 2020 11:33:05 +0800
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for s25fs128s
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 <Tudor.Ambarus@microchip.com>
References: <1586939433-20861-1-git-send-email-yangyicong@hisilicon.com>
 <3664588.JgWbhVaYgF@192.168.0.120>
 <7a8b4b41-66d1-afd6-b8a4-b591a7fa36d4@cogentembedded.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <23f84c1e-319a-e018-50cb-fa36af0c7646@hisilicon.com>
Date: Tue, 21 Apr 2020 11:33:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <7a8b4b41-66d1-afd6-b8a4-b591a7fa36d4@cogentembedded.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_203320_557968_F664CCFC 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sergei,


On 2020/4/20 19:05, Sergei Shtylyov wrote:
> On 20.04.2020 13:18, Tudor.Ambarus@microchip.com wrote:
>
>> The flash should be named "s25fs128s1" - this would be the flavor with uniform
>> 64kB sectors. One should add a "s25fs128s0" entry for the flavor with uniform
>> 256kB sectors.
>>
>> We usually don't add new flashes if they are not tested. Please specify in the
>> commit message with which controller you tested the flash. The minimal test is
>> a read, erase, read back, write and read back. This sequence should verify if
>> read, erase and pp work fine.
>
>    This chip (as part of the S25FS-S family) most probably requires a post-BFPT fixup to make the writes work. I was going to post the patch adding this fixup for S25FS512S chip.

Thanks for the information, I'll test whether s25fs128s1 needs this fixup with your patch.

Regards,
Yicong


>
>> Cheers,
>> ta
>
> MBR, Sergei
> .
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
