Return-Path: <SRS0=44aE=VQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97ABC76195
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jul 2019 08:32:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0DA2084C
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jul 2019 08:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sUzfmuFb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TA7Ls/ZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0DA2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1a+eR06R2WiyV5C+pOa7MAsliqSf+4fITzDJpR3MarU=; b=sUzfmuFb5sS3s4
	yn977suEJeuQtlNklq5WCbPCzYYgpAmB44n+mxjW1Dy0ZkrqQmxMeonwM8kcY3lXVt1Qg7dzbrfh3
	u8MqdGx/N4esM9tn8YAFCnGtJjfBgdMV9C+5WeQrpABpenkjHzWTTGQt9HyxVR5pkd9pNQHjzJel3
	/L21YNaz2ORb8CB5NG0+yQFUznlvh3aRxQDq9Vuajvl/85Na9maGRJmZjkPN9oAzqSShlp3Z+i877
	t7GcWyMSOXR/OcWzzR1yhbVj/g1OAYalSljTAL2JjWKmmOODVwx9NBfRAHg5BmbpQVPmDKcjhgC33
	KaMPjAcGAxV9pd4yxS5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoOJe-0002dY-Ja; Fri, 19 Jul 2019 08:32:34 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoOJa-0002cL-RI
 for linux-mtd@lists.infradead.org; Fri, 19 Jul 2019 08:32:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6J8WALd020368;
 Fri, 19 Jul 2019 03:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1563525130;
 bh=IVqQ1ovk/uB5I3+HYY88jIzu+tAVMCodVGet/Jwe4Qw=;
 h=Subject:To:References:CC:From:Date:In-Reply-To;
 b=TA7Ls/ZEkH2MbrRXeYpK/I5F6jqRsO9SrdHYTKsvbb8YV35on1KfFQeB8SYPnL6re
 6NnLvVEyQ/sNskzSNhGBpXoW24Vu3AOGMPKwtXzVy9rmIuySPxWTc7hbTUkKRxRZh0
 RK1pIyAePXpb4zqaFDDjRbt9YttbGuTaI9GGpXn4=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6J8WAor097464
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 19 Jul 2019 03:32:10 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 19
 Jul 2019 03:32:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 19 Jul 2019 03:32:10 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6J8W6xV081189;
 Fri, 19 Jul 2019 03:32:07 -0500
Subject: Re: mmotm 2019-07-17-16-05 uploaded (MTD_HYPERBUS, HBMC_AM654)
To: Randy Dunlap <rdunlap@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20190717230610.zvRfipNL4%akpm@linux-foundation.org>
 <4b510069-5f5d-d079-1a98-de190321a97a@infradead.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c3b93f7a-5861-475f-faeb-3ec7e8e9b728@ti.com>
Date: Fri, 19 Jul 2019 14:02:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b510069-5f5d-d079-1a98-de190321a97a@infradead.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190719_013230_975703_41743CF3 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: sfr@canb.auug.org.au, mm-commits@vger.kernel.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, mhocko@suse.cz, linux-mm@kvack.org,
 linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 18/07/19 9:15 PM, Randy Dunlap wrote:
> On 7/17/19 4:06 PM, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2019-07-17-16-05 has been uploaded to
>>
>>    http://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> http://www.ozlabs.org/~akpm/mmotm/
>>
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>>
> 
> on x86_64, when CONFIG_OF is not set/enabled:
> 
> WARNING: unmet direct dependencies detected for MUX_MMIO
>   Depends on [n]: MULTIPLEXER [=y] && (OF [=n] || COMPILE_TEST [=n])
>   Selected by [y]:
>   - HBMC_AM654 [=y] && MTD [=y] && MTD_HYPERBUS [=y]
> 
> due to
> config HBMC_AM654
> 	tristate "HyperBus controller driver for AM65x SoC"
> 	select MULTIPLEXER
> 	select MUX_MMIO
> 
> Those unprotected selects are lacking something.
> 

Sorry for that! I have posted a fix here. Let me know if that works. Thanks!

https://patchwork.ozlabs.org/patch/1133946/

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
