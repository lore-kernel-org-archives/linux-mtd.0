Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD788C11F64
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 15:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7897F6139A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 15:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7897F6139A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upLhvtPzmyG9xSe3agdO2nzC+JzrN0eNEQtICy5dcKY=; b=C/asIjIB6hfHe/
	4ZdcI5fDrQ2ErR+mgBY2+7Hu8rN++w2ZIBfZXOQN5pOnQCVDHPXFTur473sNgV44Ke1mBk064XKiR
	oziULbo0H64rpRccswAZsxnY/A5q7X/lYw9XY3mVF9SCnKTsGwWF5GfLUP4YXLWtineuWaQxydZQV
	whhbcuaR1Xl+tgAZOPN5hGKM5XByJqpY0XC++6O3Ry+2Pe6WQD1Fjfk+VFM2x6hs+HKH5xWnDpduF
	JtphMzwh1G5hTQ1yJQq+X4GAQhbx0y7wJKiaYdpm+eMxneogl8nUJQb9BgJtj+EVefsb78kJhXGdY
	UioPocgkQ8/EEJ36qVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyyTA-000DQh-EI; Thu, 01 Jul 2021 15:19:12 +0000
Received: from atlmailgw1.ami.com ([63.147.10.40])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyyT6-000DPn-Vi
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 15:19:10 +0000
X-AuditID: ac1060b2-3edff70000000c56-29-60dddcea2ebe
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 9B.86.03158.AECDDD06; Thu,  1 Jul 2021 11:19:06 -0400 (EDT)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Thu, 1 Jul 2021 11:19:05 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Michael Walle <michael@walle.cc>
CC: Hongwei Zhang <hongweiz@ami.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] mtd: spi-nor: Add some M45PEx ids
Date: Thu, 1 Jul 2021 11:18:39 -0400
Message-ID: <20210701151839.3011-1-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629150846.21547-2-hongweiz@ami.com>
References: <20210629150846.21547-1-hongweiz@ami.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCLMWRmVeSWpSXmKPExsWyRiBhgu6rO3cTDBbe1ra4vGsOm8XupmXs
 Fm9Pb2C3uPv8B7vFxyUODqwem5fUe9z5sZTR4/iN7UwenzfJeRzY28IWwBrFZZOSmpNZllqk
 b5fAlfF98jvGgkm8FXMv9zE2MP7n6mLk5JAQMJHYM/MCaxcjF4eQwC4mie2zV0E5Oxkl/hz4
 zQ5SxSagJrF38xwmEFtEQEXi8ecLjCBFzALbGSU6G76xgSSEBSwlJm58yQpiswAVff93kRnE
 5gVa8XHXV3aIdfISqzccAItzCphJzG1/ANYrJGAq8WxNDxtEvaDEyZlPWEBsZgEJiYMvXjBD
 1MhK3Dr0mAlijqLEg1/fWScwCsxC0jILScsCRqZVjEKJJTm5iZk56eWGeom5mXrJ+bmbGCEh
 u2kHY8tF80OMTByMhxglOJiVRHgnTL+bIMSbklhZlVqUH19UmpNafIhRmoNFSZx3lfvReCGB
 9MSS1OzU1ILUIpgsEwenVANjmtpPc990n7erOkR+ugVxZ1+pPl5RY6Tto/fRSuvqjC+zoyeY
 x26/fVJzZvZMXf7ong5Dh6qzK264yT1LmH10qZWxDdcZjs/1Vw49bWJbpsNme+fYHNt7V/Km
 3ljl47JwDdf5oz7OB2TZ1/9/LzLLab7Zt6leyXxB8Tfqf3zZ8bXwVNxnLdVzSizFGYmGWsxF
 xYkAbKvRwEcCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_081909_128696_975CFF63 
X-CRM114-Status: GOOD (  14.21  )
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

Hi Michael,

Ok, I will separately resubmit a revised patch with update later.

Regards,
--Hongwei

>Subject:	[EXTERNAL] Re: [PATCH v1 1/1] mtd: spi-nor: Add some M45PEx ids
>
>>> Am 2021-06-29 17:08, schrieb Hongwei Zhang:
>>>> Add some Micron M45PEx flash memeories into the IDs table.
>>>
>>> Did you test all these flashes?
>>>
>> No, the patch was added in porting drivers related to AST2600 EVB.
>
>Please note, that all flashes which are added must be tested.
>
>>>> Fixes: dd1e9367157f900616f (ARM: dts: everest: Add phase corrections 
>>>> for
>>>> eMMC)
>>>
>>> Bogus Fixes tag. First, I cannot find this commit id, which tree is 
>>> that? Secondly, adding new flash ids don't fix anything, esp not 
>>> something related to eMMC.
>>>
>> Sorry for the confusion, I thought Fixes tag could be also used for 
>> referencing the revision base for the patch to aplly on.
>> I used dev-5.10 branch from 
>> https://nam12.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
>> 
>ub.com%2Fopenbmc%2Flinux.git&amp;data=04%7C01%7Chongweiz%40ami.com%7C72a7d2569f6a4cb
>629fe08d93c775f8a%7C27e97857e15f486cb58e86c2b3040f93%7C1%7C0%7C637607305682606148%7
>CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
>%3D%7C1000&amp;sdata=h%2BoFfg9m0udXdQgb85oq0NKEIcL1DFNha186lP0HwG8%3D&amp;reserve
>d=0 , should I use a different repository?
>
>AFAIK commits in fixes tags must be relative to Linus Torvalds' tree (or a subtree must not rebase, like 
>the networking trees, which means they will end up in Torvalds' tree).
>
>Anyway, this is not a fix and therefore there must be no Fixes: tag.
>
>-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
