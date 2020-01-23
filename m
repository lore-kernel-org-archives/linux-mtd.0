Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3386C32771
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 02:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BD72465B
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 02:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u4aIBLet"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81BD72465B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcGg1I8wDyzH1s+WKJcZHSQyWsAlw55agOoWc779HGY=; b=u4aIBLet/o3W0U
	N+zqrM0RlwyVAk8LD2LEQKssYnJanCY2jKhaDImEjtTYgSGKLYWfTrYrtbVgg4IoK5EHQ2gfMDNP2
	klRLcxfAiedu0SF1VsX/d8n2XrFwiRNxJAm/N9SI/G7tdMFElNx2tvAIcG+9/CGfsZH+dNqJA6wco
	CoR4FAkDc5XuXEuUi6i6OblABS4faKvSIyuJFVKplwUHU3jkvDO7WgkVD9rt7Qg+UyDrBgPNB573Y
	O3ipfNcItQpjIR6lns6eZw4/tKF6YF/DcapMfdbsiSyam4mSHwUys2bbZbILhAWlAj/KIR5BgZ03w
	Pv7VJuxfLDEPAGT0ePXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuSBG-0002KD-9o; Thu, 23 Jan 2020 02:25:14 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuSBB-00016y-Pu
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 02:25:11 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 35ADC651C4DD263FBCD7;
 Thu, 23 Jan 2020 10:24:58 +0800 (CST)
Received: from [127.0.0.1] (10.133.219.224) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 23 Jan 2020 10:24:55 +0800
Subject: Re: [PATCH] jffs2: Fix integer underflow in jffs2_rtime_compress
To: Richard Weinberger <richard@nod.at>
References: <20181215162350.12489-1-richard@nod.at>
 <cae86ca1-91f9-6728-df64-40580145220d@huawei.com>
 <2142335.HPRDAJu19m@blindfold>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <e727e81a-c633-60be-9b93-5b6dc9d1936a@huawei.com>
Date: Thu, 23 Jan 2020 10:24:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <2142335.HPRDAJu19m@blindfold>
Content-Language: en-US
X-Originating-IP: [10.133.219.224]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_182510_001007_1BAD7769 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On 2018/12/20 18:45, Richard Weinberger wrote:
> Am Donnerstag, 20. Dezember 2018, 11:43:08 CET schrieb Hou Tao:
>>
>> On 2018/12/16 0:23, Richard Weinberger wrote:
>>> The rtime compressor assumes that at least two bytes are
>>> compressed.
>>> If we try to compress just one byte, the loop condition will
>>> wrap around and an out-of-bounds write happens.
>>>
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> ---
>>>  fs/jffs2/compr_rtime.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>> It seems that it doesn't incur any harm because the minimal allocated
>> size will be 8-bytes and jffs2_rtime_compress() will write 2-bytes into
>> the allocated buffer.
> 
> Are you sure about that? I saw odd kernel behavior and KASAN complained too.
> 

Sorry for the later reply.

Yes. KASAN complains but it doesn't incur any harm because the minimal allocated
size returned by kmalloc() will be 8-bytes.

But we better fix it, because it's bad to depend on the implementation of kmalloc().

It seems that mtd-utils has already fixed it years ago. Maybe we can use it directly ?

And your fix also looks good to me, so

Reviewed-by: Hou Tao <houtao1@huawei.com>

commit e8457f16306ad6e2c8708275bf42b5dfff40fffd
Author: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date:   Thu Jun 24 15:02:40 2010 +0200

    mkfs.jffs2: fix integer underflow in jffs2_rtime_compress()

    When '*dstlen' is 0 or 1, comparison will return wrong result.  Reported
    by valgrind as

    ==5919== Invalid write of size 1
    ==5919==    at 0x40564E: jffs2_rtime_compress (compr_rtime.c:51)
    ==5919==    by 0x40676B: jffs2_compress (compr.c:246)
    ==5919==    by 0x403EE4: recursive_populate_directory (mkfs.jffs2.c:884)
    ==5919==  Address 0x4e1bdb1 is 0 bytes after a block of size 1 alloc'd
    ==5919==    at 0x4A0515D: malloc (vg_replace_malloc.c:195)
    ==5919==    by 0x40671C: jffs2_compress (compr.c:229)
    ==5919==    by 0x403EE4: recursive_populate_directory (mkfs.jffs2.c:884)

    Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

diff --git a/compr_rtime.c b/compr_rtime.c
index 131536c..5613963 100644
--- a/compr_rtime.c
+++ b/compr_rtime.c
@@ -32,7 +32,7 @@ static int jffs2_rtime_compress(unsigned char *data_in, unsigned char *cpage_out

        memset(positions,0,sizeof(positions));

-       while (pos < (*sourcelen) && outpos <= (*dstlen)-2) {
+       while (pos < (*sourcelen) && outpos+2 <= (*dstlen)) {
                int backpos, runlen=0;
                unsigned char value;



> Thanks,
> //richard




> 
> 
> 
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
