Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644FEC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 01:17:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 348C820771
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 01:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zAk8yts5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 348C820771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HWTEKeFPuQV20GXTBSK1DsKZIXUKEPWrw+Ky+Ynvsb8=; b=zAk8yts5K/BZVtYsz0ZaynCf7
	Sby1a+thOcH8BZ+Ee3AJ6H7Vh+lQ/AwxnRM0zPx1gap/JMpg0mrzLHWdIBRHT91qwFSD5/7PQMo42
	nJf+Cw2X3N4X0YsjjDSkbSaNLj8IPMxkfoRE/3hqIvDAR2A2IPnDcFnWV1ylvqFzQT5bBWt8PtnZa
	qjXMmpAyvD2ZgSwuHQYfCjKy2yvjeUUY+rdqky49cC+k6+2/niqDFqKNPhPw/ZO/ypg+rmRGD3fdA
	MVz2x1CIoLdyhj5DvoTAIACiworIp39YzRJfNSZLBzwQnHhp1Ac+kWB5WdgtSiQIghl4tZoVVf0YB
	CCT2y3xJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqRLt-00016Q-Hr; Wed, 01 Jul 2020 01:15:53 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqRLr-00015L-6e
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 01:15:52 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 46335930B14F63E455BB;
 Wed,  1 Jul 2020 09:15:47 +0800 (CST)
Received: from [10.133.219.224] (10.133.219.224) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Jul 2020 09:15:42 +0800
Subject: Re: [PATCH v3 2/2] ubifs: read node from wbuf when it fully sits in
 wbuf
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200305092205.127758-1-houtao1@huawei.com>
 <20200305092205.127758-3-houtao1@huawei.com>
 <CAFLxGvzWYp7=6F7PY0-dxxSCPrN4L2H6tzE913N9rKsaChnoWg@mail.gmail.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <9f583ac6-2046-47e4-8327-33a488c1f138@huawei.com>
Date: Wed, 1 Jul 2020 09:15:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzWYp7=6F7PY0-dxxSCPrN4L2H6tzE913N9rKsaChnoWg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.133.219.224]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_211551_526598_FEC2928E 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, Carson.Li1@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 2020/3/17 6:21, Richard Weinberger wrote:
> Hou Tao,
> 
> On Thu, Mar 5, 2020 at 10:15 AM Hou Tao <houtao1@huawei.com> wrote:
>>
>> Carson Li Reports the following error:
>>
>>  UBIFS error: ubifs_read_node_wbuf: expected node type 0
>>  Not a node, first 24 bytes:
>>  Kernel panic - not syncing
>>  CPU: 1 PID: 943 Comm: http-thread 4.4.83 #1
>>    panic+0x70/0x1e4
>>    ubifs_dump_node+0x6c/0x9a0
>>    ubifs_read_node_wbuf+0x350/0x384
>>    ubifs_tnc_read_node+0x54/0x214
>>    ubifs_tnc_locate+0x118/0x1b4
>>    ubifs_iget+0xb8/0x68c
>>    ubifs_lookup+0x1b4/0x258
>>    lookup_real+0x30/0x4c
>>    __lookup_hash+0x34/0x3c
>>    walk_component+0xec/0x2a0
>>    path_lookupat+0x80/0xfc
>>    filename_lookup+0x5c/0xfc
>>    vfs_fstatat+0x4c/0x9c
>>    SyS_stat64+0x14/0x30
>>    ret_fast_syscall+0x0/0x34
>>
>> It seems the LEB used as DATA journal head is GC'ed, and ubifs_tnc_locate()
>> read an invalid node. But now the property of journal head LEB has
>> LPROPS_TAKEN flag set and GC will skip these LEBs.
>>
>> The actual situation of the problem is the LEB is GCed, freed and then
>> reused as journal head, and finally ubifs_tnc_locate() reads
>> an invalid node. And it can be reproduced by the following steps:
>> * create 128 empty files
>> * overwrite 8 files in backgroup repeatedly to trigger GC
>> * drop inode cache and stat these 128 empty files repeatedly
>>
>> We can simply fix the problem by removing the optimization of reading
>> wbuf when possible. But because taking spin lock and memcpying from
>> wbuf is much less time-consuming than reading from MTD device, so we fix
>> the logic of wbuf reading instead.
> 
> I'm digging now into that issue. Did you also experiment with reading while
> tnc_mutex is locked? So, no race at all (having safely = 1 by default).
> Just to make sure we don't fix an no longer needed optimization.
>> The code is already anything but trivial and adding more code makes me
> nervous.
> 
Sorry for the late reply. I'm fine if we remove the read-wbuf optimization,
but I need to check the code firstly, running the reproducing program, and lastly
writing a xfstest for it.

Regards,
Tao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
