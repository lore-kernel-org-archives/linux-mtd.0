Return-Path: <SRS0=cldr=WS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B18C3A59D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2019 04:23:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC8C521848
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Aug 2019 04:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AUeU/DLY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mhUmvkeY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC8C521848
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcME0oE3MG9VaAFo5oaQdj9DQf0s38FNhycNQWohE9w=; b=AUeU/DLY73aSgM
	8A/G2kgt76KfoovBimeCD8dJ4CJGoaGZ7+LJbDMQroG06udCE6GuAvQNUW4vK017M7enfc05vaS9V
	Nq1GEp0Tr43X/UIjU70HHFSi9ZU+4AoSFBWxND74ObNQxjglGcw/uyLXFdsYK4/tOe5vAQZ+Cyw4v
	uevUlF/mGG8h939+GzDSDWBD5NG3eDhxfOTBKbDoufVULcMiQTmkRfCgzz5ewfUrthCPP6tqI3tje
	qsgK38pdXIglWsoXzHNtcH707ZkDrzojK5xkOf3B/lHRo/nKw4GD2UzMgBGqIBRtwCGC5B9P+z6Nc
	hxS7ne3qfCdBzVXYtIKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0ecZ-0005dq-1S; Thu, 22 Aug 2019 04:22:47 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0ecS-0005cy-5M
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2019 04:22:42 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7M4MLLs066039;
 Wed, 21 Aug 2019 23:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566447741;
 bh=Qtz+l/8ogXSMEv9t2tFgpFnOf2Fu2uSuosv6yasRiOA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=mhUmvkeYK8dKovNl1mwaEZ/kZNepO6Gs+4tKeXr908Ru8KgpJy0g1g4H3DtYmSfUJ
 S/K3KnbIHvvxFGNCN0Yi0qlOZ5hJVvz0/UoWJcSGkaTWz9LGU2OKJKoo3ARci6N6F0
 WdFBwZQYzTwFu9ZH6sE2esNfARGIujefjqspHR+s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7M4MLR5051119
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Aug 2019 23:22:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 21
 Aug 2019 23:22:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 21 Aug 2019 23:22:21 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7M4MIuK017345;
 Wed, 21 Aug 2019 23:22:19 -0500
Subject: Re: [PATCH v7 0/9] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "ikegami.t@gmail.com"
 <ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
 <7f092ec3300c2c982b85ecd58d45f39e3dbae98e.camel@infinera.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1c069c15-afee-1c52-380c-13d311eba447@ti.com>
Date: Thu, 22 Aug 2019 09:52:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7f092ec3300c2c982b85ecd58d45f39e3dbae98e.camel@infinera.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_212240_335800_68D814B0 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: "chris.packham@alliedtelesis.co.nz" <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 21/08/19 1:33 PM, Joakim Tjernlund wrote:
> On Thu, 2019-06-20 at 01:49 +0900, Tokunori Ikegami wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> The change is based on the fix for flash erase to use chip_good() done in
>> the past. And it is fixed as same way in the OpenWrt Project as below.
>>  <https://nam03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.openwrt.org%2F%3Fp%3Dopenwrt%2Fopenwrt.git%3Ba%3Dcommitdiff%3Bh%3Dddc11c3932&amp;data=02%7C01%7CJoakim.Tjernlund%40infinera.com%7Cc576b3ddad2d4f3c09f008d6f4d635b2%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C636965598194534713&amp;sdata=1XV5w3jD6tbfP%2B2Q2eBqfeHp07kHLDxpiJhW4ZA5Ea8%3D&amp;reserved=0>
>> Also includes some refactoring changes.
>>
> 
> Did this go anywhere?
> 

I have this series in my queue and will consider for 5.4-rc1.

Regards
Vignesh

>  Jocke 
> 
>> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
>> Cc: Fabio Bettoni <fbettoni@gmail.com>
>> Co: Hauke Mehrtens <hauke@hauke-m.de>
>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>> Cc: linux-mtd@lists.infradead.org
>>
>> Tokunori Ikegami (9):
>>   mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()
>>   mtd: cfi_cmdset_0002: Remove goto statement from do_write_buffer()
>>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce function size
>>   mtd: cfi_cmdset_0002: Split do_write_oneword() op_done goto statement
>>   mtd: cfi_cmdset_0002: Remove op_done goto statement from
>>     do_write_oneword()
>>   mtd: cfi_cmdset_0002: Split write-to-buffer-reset sequence
>>   mtd: cfi_cmdset_0002: Split to wait write buffer to check if completed
>>   mtd: cfi_cmdset_0002: Split do_write_oneword() to reduce exit paths
>>   mtd: cfi_cmdset_0002: Disable write buffer functions if
>>     FORCE_WORD_WRITE is 1
>>
>>  drivers/mtd/chips/cfi_cmdset_0002.c | 290 ++++++++++++++++++++++--------------
>>  1 file changed, 182 insertions(+), 108 deletions(-)
>>
>> --
>> 2.11.0
>>
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
