Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915B2CC6B3A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aA+E+85nQJy6g1lVIrOA24b3w76Nv7VWjIZdBdC5M3k=; b=qLCLTEYnlGxHVu
	AdgQ8/l6aG5sfliU6SlxLTRCwkrXP3M9KjP3FQ97yuo4Zc0t2afn5EbwW08+fqTB2AbC0Yv48+jV0
	ko0syDxh4f25GfKuqDaiCQZYo/L8SfJYl/nynTepox1RrNNEwNjfd11Su2ZG4ZruhuPvARRR5QWK0
	w0jNnlH3lFC+eufRe1x2qc/lAVBox4n05GhP/N1uSxhv1OjIszRbzxuO3Ma7CeR2Q6UULnGnf/aD2
	/cOKqu/AG9u8fmkTugWORISSSMcvXKAfQ9DalRg+mlGkXZUOaWVHXIF6i4UV7DkcaLHsNGHkh2101
	ZEV5k6pTEj9sRDFuf2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN4Q-00000000WLP-24gD;
	Thu, 15 Oct 2026 15:08:38 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN4M-00000000WK5-0xUa
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 15:08:36 +0000
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYPmi855761
	for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 11:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ehfL
	YJwa3g7g3wT5mmEqYN0XViiWIyJQPYm2+5YbMss=; b=NLrmGITTeTXOHwhcBKmt
	VmRQkoTrCcj9+SfYtzFeC5lVmyxneX+pHiHHK7+yE7srhiOA7vk8WFaCrgcDouXT
	5EqSppccNzPXGeKwqIpQyGyt2deLXu8WVc5g1Cvj31TdxZgGdjaFR/UNauxiXzB6
	ymHzV63pDi9ffEdZfyRLKCzoVUEnETjx4J3YfVJbJfh4V4yomcpg3cTaclnIYGso
	z+M38QyROYV2TT5/lecfDiv3g6wEAMjuFS96wT0fR6M+3T3tW5yyRcZHK52DaxSq
	sUG42IUOxhe1DBIxeq+nI9b5z61CScc3JhNDjCtWweNGb8xxHezvPtweU3koOPxO
	Rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hatthjmrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 11:08:30 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so1152722785a.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792076910; x=1792681710; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehfLYJwa3g7g3wT5mmEqYN0XViiWIyJQPYm2+5YbMss=;
        b=AD7YDjtaRf5zxWMgCSoiV8yobeAPHmgBpQp192fnefMhYT5Jozk0Mjxrxt4AVNbI/4
         x64GOw4OWt8bAl8cYZbs4ZaIdXUgjMv+KCxAV2c7hGJzcm4P2yaR25/P6ShhujaLhpLs
         TZ72HC+Hj+PiteNf/yRY8f1y1gy+sZXxox5znC83SpmGCt86R56QUw1c9eyQGwKjI8Vt
         tfkXUbgx994Bvv7M0+lZadagloob/LyAiYkWrSzxhN/m5HzyhmoWdgxDW/DmHWSprJ8M
         cGimcKTcxEGRhINNU43inSZuNLRWu0OD0kI7hpxLp/M02GqD/9Gi3jBgdp7UCHNb4jXT
         j4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076910; x=1792681710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehfLYJwa3g7g3wT5mmEqYN0XViiWIyJQPYm2+5YbMss=;
        b=pYJjECgCFDeroT25MriqWGGU67/JoCdli2gtgGPELiTz6uvQ0UeVIZgcC+DBPyzSon
         jWEVdOtduB9fhxD40WwpVLpdktMUAoXbVJiQ+cSLkZBdlaruyUk7EXlRBH2ZC90q0DEA
         aRp+B5IWJ9L9vilna9DG3EBi0w0X8Apz62MVnovuhRaUGnRBAwo5jg5NV6YvkRW8Z3X+
         sgVBuaaYADN5y6cfbh+u95MvHTjr9Kj0eT23Iv010rq0DrWy1ywJZ7zoENJ6Tb+5dIPy
         2o6Wf79ZF6Lj1PmqbOIiyB77ddp3q0NyTcKaVWRdxg72//ABNXTOHg+6eWbZrMouK8a7
         abVw==
X-Forwarded-Encrypted: i=1; AKwUvBxDJdoj4rLhVgu65erK8CJt7Jya1pqpRnMY8mW6LYYvjR+xHPtX/+A/IjUCwFHeVjAjN95I7AXYPAg=@lists.infradead.org
X-Gm-Message-State: AFq9FYLIDOdf0X4YO6ApPue93akZDoNs5jFnrMbeqrr+rmXvKvrvmyHa
	45p6f5f7RsLsfLYEDqto0cnrLJhtFpTqhlyF6XvvTHQkXuRD/VzOzsz18JeiCrCH8cQfidpUqr7
	sfSICWJ2JzCe1cJ1uGbdGUpFJQWQPjycriD4tCRcx7MwtV9TjHxtV8Pu+2wjd7eo=
X-Gm-Gg: AYBFou2PBCVsxuKKxJKE40yziN6+CcgDEsJ/ag3hoBg+vXHAz2NPznF1TzrapmJLiB4
	rNclheyIEwbgwBtt2X1UeuKai/Z8DJcwFgi2HoW5IgDn1u/zWn/tdTQm96/Fw5Ae3UMMpAGixTD
	fVZVDYZBwkwDs4o5y3hAoA9lphavBB3KaSEke7e13seMDzeSbctfNllAY861nHD8hmQa9hjV1vC
	slqbEBtAB4bWDMrySlr0LAwKAUYbJwetZYjBHtpvqf6mZttWluZeQO6KBtGT4reSPbFRHFTBE6E
	whsLZKEWTZWwWp1UgIn+eNabRb3jKjdRvKTSDKMeMtmruuiuIfwlAVHhC6rqmng7Lb38JCg+bCS
	PThI6X+MC9QkD2/3FZOk5oM5W6wpMllJ2oB2xTBP7P7Im5A==
X-Received: by 2002:a05:620a:2254:20b0:93f:d30:6aac with SMTP id af79cd13be357-93f0d306b3amr341386585a.75.1792076908351;
        Thu, 15 Oct 2026 08:08:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2254:20b0:93f:d30:6aac with SMTP id af79cd13be357-93f0d306b3amr341379285a.75.1792076907641;
        Thu, 15 Oct 2026 08:08:27 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500973asm785388085a.15.2026.10.15.08.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:08:26 -0700 (PDT)
Message-ID: <90cba2d3-a185-4bd0-bf8e-faed40bdb1ae@columbia.edu>
Date: Thu, 15 Oct 2026 11:08:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: rawnand: nandsim: use a NOFS scope for cache
 file I/O
To: sashiko-reviews@lists.linux.dev,
        Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org
References: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
 <20261014-nandsim-nofs-v1-1-47e49f37e387@columbia.edu>
 <sashiko-outbox-172202@kernel.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <sashiko-outbox-172202@kernel.org>
X-Proofpoint-GUID: tZwFWlEk6kkgFIMxvKvq3ZJxMK4mTLu-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfX7zmxEbzIkZfH
 SEajO4ObfeCS8GCxHOZ0Sm4iTFDc9MHctIrSJvCUULq6zP/OODpBLEEI+h+KnkRgKMXbWRPc21r
 Ke3FSz0KOvq2HI3F0PrNY9cOHPkd3yL+qweeQeZIsY22we3Aop/2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2MCBTYWx0ZWRfXybTxNcKFsM+z
 GLdQKlmmXUIV8h62hDZUPE83kdRSlAUfSG8X3DCv+Rw3dv2LCJ93eLHQtmggy1CUMMVJcjqe4/z
 VymSf2rrx424fj1BeYvreOPvijIXgbUoerpUdCcWM96bgCTJlzjODyaVQfYNg0owu4KKz8OiBdx
 mcABRQ9uMtBTrJsfuYD2ee2gza1SQkd/R6fm0RUWpjKiSjsCg55IhWH8Jiyqqy98PZMi1JSiOCh
 V544K3ZYd71tVQ41SeFNrtiCJlNVIodUMtbcNLWVIosuvfvynJEoH7mfP3XwVR1XRjmxI67hPSq
 7exu182+Ti9VAP1sxpYf7DskyFO9OomEZOiij+kPfdfXw+67pYlaHM1A3xt/RH4byS2qXKyhbCm
 rJNXbOhMC6hdmH6KR3q6jUmr1kq5AhfNAYTNE2BFANHMc08bzh+GJxOzZegL2dwN1j5TtUWaGYR
 hYQ4/u/uCOtKyZUgpeA==
X-Authority-Analysis: v=2.4 cv=WJvqzXsR c=1 sm=1 tr=0 ts=6ad0ec6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=VwQbUJbxAAAA:8 a=JUG9QDwV30nwqC0Dl2EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tZwFWlEk6kkgFIMxvKvq3ZJxMK4mTLu-
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=10 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_080834_386905_3CC320BC 
X-CRM114-Status: GOOD (  21.32  )
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

On 10/14/26 11:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mtd: nandsim: IO reclaim self-deadlock due to memalloc_nofs_save()
> --
> 
> commit 6c4530163aa059b5f98e17ba82a9c2b06c3f48bb
> Author: Tal Zussman <tz2294@columbia.edu>
> 
> mtd: rawnand: nandsim: use a NOFS scope for cache file I/O
> 
> This commit replaces memalloc_noreclaim_save() with memalloc_nofs_save() to
> prevent allocations during nandsim cache file operations from recursing into
> filesystem reclaim.
> 
>> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
>> index fe968037f75a2..4559df2cfa3cc 100644
>> --- a/drivers/mtd/nand/raw/nandsim.c
>> +++ b/drivers/mtd/nand/raw/nandsim.c
> [ ... ]
>> @@ -1342,14 +1342,14 @@ static ssize_t ns_read_file(struct nandsim *ns, struct file *file, void *buf,
>>  {
>>  	ssize_t tx;
>>  	int err;
>> -	unsigned int noreclaim_flag;
>> +	unsigned int nofs_flag;
>>  
>>  	err = ns_get_pages(ns, file, count, pos);
>>  	if (err)
>>  		return err;
>> -	noreclaim_flag = memalloc_noreclaim_save();
>> +	nofs_flag = memalloc_nofs_save();
>>  	tx = kernel_read(file, buf, count, &pos);
>> -	memalloc_noreclaim_restore(noreclaim_flag);
> 
> [Severity: High]
> Can this cause an IO reclaim self-deadlock?
> 
> Nandsim executes MTD operations while holding the NAND subsystem device
> lock (chip->lock). While memalloc_nofs_save() strips the filesystem reclaim
> flags, it leaves direct IO reclaim enabled.
> 
> If memory allocations within kernel_read() trigger direct reclaim, the
> shrinker might attempt to write out dirty pages belonging to this same
> device (for example, if used as a swap device or via mtdblock).
> 
> Writing out these pages would route through the block layer back to the MTD
> layer, which will attempt to acquire chip->lock again, resulting in a
> self-deadlock.
> 
> Should this use memalloc_noio_save() instead to safely prevent reclaim
> from issuing any block IO while the MTD lock is held?
> 
>>  	ns_put_pages(ns);
>>  	return tx;
>>  }
>> @@ -1359,14 +1359,14 @@ static ssize_t ns_write_file(struct nandsim *ns, struct file *file, void *buf,
>>  {
>>  	ssize_t tx;
>>  	int err;
>> -	unsigned int noreclaim_flag;
>> +	unsigned int nofs_flag;
>>  
>>  	err = ns_get_pages(ns, file, count, pos);
>>  	if (err)
>>  		return err;
>> -	noreclaim_flag = memalloc_noreclaim_save();
>> +	nofs_flag = memalloc_nofs_save();
>>  	tx = kernel_write(file, buf, count, &pos);
>> -	memalloc_noreclaim_restore(noreclaim_flag);
> 
> [Severity: High]
> Does kernel_write() face the same IO reclaim self-deadlock risk here?
> 
> Allocations within kernel_write() could also trigger direct IO reclaim
> while the chip lock is held. Using memalloc_noio_save() would protect this
> path as well.
> 
>>  	ns_put_pages(ns);
>>  	return tx;
>>  }
> 
Both of these seem mostly accurate. I'll switch it over for v2.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
