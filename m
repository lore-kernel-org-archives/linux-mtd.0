Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D903FC61DB9
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAcYMpz6A8f/BDEXBTZ7M+YNF8MIgWGA7AC8L+f7R4I=; b=vCng3kf+5vYrcU
	WMFurfOYC+Gyb9zelidsxZ2VbYH/GPGCY/ILAsKXeaOUHFB3I3ITIFRLen4+86RdCv38iccXCel2k
	GcrAfqev73wbJK2tBo+Swh+hoNA34srynxKvGHLafHVDj3Jt+LE68yMcT+ieB8Gn5S+ewcqghE/+V
	py2MNLsMv5MUHMpPCi7qFjiInMUWStrYxEM3fW7ujp6x95pY/NbL+eNQllEbzw1oL/OmrG+9pN0N+
	JFJScMZV3HLqVpBICWcvu/o9CMH4q3mhYPQE9SB4y3SAWNM21Dli37QpMC9o3kQBYB/lODN5dlqLr
	lZPAJRQpIFY/oeVmjl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrmA-00000000vUB-01nH;
	Tue, 25 Aug 2026 14:05:18 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrm4-00000000vT0-0SaK
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 14:05:14 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7AAD77A0114;
	Tue, 25 Aug 2026 10:05:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 25 Aug 2026 10:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1787666706;
	 x=1787753106; bh=ucX7NLr9HW0KkTqU7iBrbPlFt2gxW2dOPH97NEKPbKU=; b=
	WZ8vCk5T13W3psoAdmZXSbu81UFlG2e2JI63RWWMrmUvt5qFBQfBbV+2jZfYOTL0
	SU4CXOaub5gMcxs2z4f4ip33mP0X6waclmT65h21xRbwGSeNRi6OD9bQKPEBlzeA
	fovrftfFucP7FS1go/MQsvfCOHDgFxDGJzsL3mCZH6NET6x1+iI0neqUTaLsRIdC
	k6WE5N6BrruwUn2Q0OaUNqnRhpj6SwzgUx4fyLfjOqrvyECY1QgPt0sa8BY5NkZz
	vZug8z/aQF3PsUPY6wMd7L1rPDp8jxGZJhhIb+728wdQq0cNIqpEX+UJHgsN3Gud
	0dhd1OSI/BuCIET/CxafQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787666706; x=
	1787753106; bh=ucX7NLr9HW0KkTqU7iBrbPlFt2gxW2dOPH97NEKPbKU=; b=F
	gfy/xSmyBp29hh+S4gEddNfuL/RlbA2F2s64aZJvvm5Lroq1rMjLS+xQP37bpi4e
	8Tze8gyR2nGXV/Q0/ADWnOXsldvzs4R9ex2lU/XUC/o9j1ienywdySucz1Qy/Vej
	4AwquHqtMm2IdDXRgf4JX0V2cjH7bsGyS9+JXUgRSwaH4SzXfbDrSp7/q+drgaue
	Qd3BBVr3PsZy2eEY65vBDp+CgHciFTBre1nqvxy8HDGtt+5RgG1n5JdIaJWIWjNJ
	poXME/tFBp8Za7RSc7NscrcQ4HCSgu03x0d69xpyofNS2eexOiQlj5mzoTMxW8iO
	hbxNgI0Vsmlx3ysWx0Mng==
X-ME-Sender: <xms:EaGNapZy2sa4TOHHFi26Rh21CEPOaDmWIgiZD1v-kc1g-PneeSciDg>
    <xme:EaGNathKU9nxl4cxvVMJR6ZCHjdyrF4_PVnLA_YYMZ3J2INAK-1OpmPgnhZhmne2X
    DpSvQvAt0mBLM03zCgUREsFGZgvvEQZZKkQwLJjT5gqq7ZM8y4>
X-ME-Received: <xmr:EaGNaq9H0bDADemljMFv1BDgJ27T2pCfIt784cay2q2AFo4fIKdcsjRdgJjwvVnihzsArYimdm-UAW_-Ly9EqbpEJ5xb-5Wm1-STrfPXuNvleIdPDZU>
X-ME-Proxy-Cause: dmFkZTGhrtdVch8QdM5Vdv2WRheNpHzKWyr+RhuNdGJa6+gO7LgYYke4cc27gT0LwiWtpK
    2GyCJCLEA1lgo0ZCBvbOe8vKWw1OijLmnbam96gP8dIdeEIW7V2ouwMVZVhxx0pvaFQw8k
    4tn6kjm2btNTOM/CiAc1LChX3TCtysPb+m0ELFcQtgF+F8orw88GgtoFOE3OMg/6qg7dZw
    leKkL4e6pV2w6BHZtZM3viZO8iZ+vXWZiFgj3C9XwuQbdjGgGtR5vhLwF9IPmLmdBLdVQt
    laZjoxgP+19P1Do8/8tXqEXHeO08ll5J1jt/UkYA33xBDdCz30SqZa8NMTIy2kpco2GKY1
    nNorBJhU89LhCb7zgmRQQ9IA8nPRPECThvlcmkgCD80x9oBm8uEmujLEdXKGXRKvHsVBqH
    qCwvfoIf8314y+xGIF1CrcHDaOI01lfr/xWW4yZqssfxNDw21ocwYa5gX1Bkbue1lVd8/x
    /IpvgXcuCqcOQYOYZLknsaHhvw/K1ocUXVDIjVf0ttfY5vtlrQ+eAszHKqW397p/qmZ8DT
    WDDR7p6OHLYzpchrOUdsqWRIL5N/xTMBO6MmLmWNC1awdSGRhjDdhHtDNVz10yhOt1Lcih
    GtQg7JFAiPTvE7R4M0wgrYfw2dmc4UHy60hAwmqFxDFLGxZ12/3+jco6bE9Q
X-ME-Proxy: <xmx:EaGNaooHEH0VObuwp-Kuk1FBdwnUOVuibjDh-s_rwRvEXluYuspVNw>
    <xmx:EaGNaiVzQj0ruvvEkqi4bjKMIfCJ6xgx7ajRqgSI4XlFxaz-MA_GTQ>
    <xmx:EaGNanCfnU2g8kbL9gOJMZEZDhz7Ut0eHh-G-wgx7z5-FBzACh1Jmg>
    <xmx:EaGNam3yiKi6S5-FBtn9kq94x4jNg7SONYR-o16jlWBs_rEy7EUCbw>
    <xmx:EqGNan1_eqFFZhEROkvFv4STWRAJufBO9KEXk3nmrt87jqG-nTeUC2os>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Aug 2026 10:05:04 -0400 (EDT)
Message-ID: <d7915536-ec56-4fd1-9a29-d0275687d47f@kroah.com>
Date: Tue, 25 Aug 2026 16:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: parsers: afs: add size check to v2 partition
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260824-mtd_break_looper-v1-1-e46d7f02faab@kroah.com>
 <87cxv6gvuc.fsf@bootlin.com>
Content-Language: en-US
From: Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <87cxv6gvuc.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_070512_199347_D155EA94 
X-CRM114-Status: GOOD (  21.44  )
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


On 8/25/26 3:42 PM, Miquel Raynal wrote:
> Hello Griffin,
>
> Thanks for the patch!
>
> On 24/08/2026 at 15:50:27 +02, Griffin Kroah-Hartman <griffin@kroah.com> wrote:
>
>> Add a size check to the loop in afs_parse_v2_partition(), avoiding
>> walking out of the imginfo[] array bounds if a malicious packet fakes a
> "packet" refers to network wording, whereas here, in the MTD world, we
> would rather talk about a malicious image.
Good to know! thanks for clarifying.
>> ---
>>   drivers/mtd/parsers/afs.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
>> index 26116694c821..2c6f8768312c 100644
>> --- a/drivers/mtd/parsers/afs.c
>> +++ b/drivers/mtd/parsers/afs.c
>> @@ -287,12 +287,18 @@ static int afs_parse_v2_partition(struct mtd_info *mtd,
>>   		 block_start, block_end);
>>   
>>   	for (i = 0; i < region_count; i++) {
>> -		u32 region_load_addr = imginfo[pad + 3 + i*4];
>> -		u32 region_size = imginfo[pad + 4 + i*4];
>> -		u32 region_offset = imginfo[pad + 5 + i*4];
>> +		u32 region_load_addr;
>> +		u32 region_size;
>> +		u32 region_offset;
>>   		u32 region_start;
>>   		u32 region_end;
>>   
>> +		if (pad + 5 + i*4 >= ARRAY_SIZE(imginfo))
>> +			break;
>> +		region_load_addr = imginfo[pad + 3 + i*4];
>> +		region_size = imginfo[pad + 4 + i*4];
>> +		region_offset = imginfo[pad + 5 + i*4];
>> +
> Looking at the code, I see that just above the loop there is an actual
> check bailing out early in case the region count is overly big. In
> practice:
> - pad can only be 0, 1 or 2
> - imginfo array size is 36
>
> The check is:
>
>          if (region_count > (ARRAY_SIZE(imginfo) - pad - 3) / 4)
>                  return -EINVAL;
Sorry, I was not using linux-next, so I did not see that this was 
already checked.
Thank you for the review!

Griffin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
