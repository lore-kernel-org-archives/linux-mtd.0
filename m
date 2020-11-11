Return-Path: <SRS0=6UFQ=ER=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B846EC55ABD
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:24:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A99320678
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4eOM78Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="HZsNKlo2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A99320678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xjdu0SPsCcRhln1doAdoxb84vRnQpjeG/CPlCskvhIQ=; b=n4eOM78YjCAt5vDCDad3dErPO
	iuvfnb9+1E5Y0qnEyZPkkKU2mbK74GVbABq08z6QPUusWraRWTtJkWttyF2mkZd4eiEITbpaMzJPE
	2Ln+p2Fk26pIb2XgXpPGwczmiiJ0RNZMbrMsvUbuIGabgFlwGXD70RMSkqLS9nf3mU6YSrYfN04n/
	5dnpbsCRd0Dtu39xFn3eXB/sXxRJ3+3Uy/FRHyNidkQdGkA6uIZdr0GxbiMrpkrB2qlvJa4//fvil
	HL3osO+Xe/Hhjy6BmoFJDxFFy4xP5X22CEqRMvDDffusdhNhSSNjbbqnH0KZllEiYo/d0IryeBRiq
	Uv/ujKOZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcsuS-0004p3-Ps; Wed, 11 Nov 2020 16:23:48 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcsuP-0004nK-JB
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2020 16:23:46 +0000
Received: by mail-io1-xd32.google.com with SMTP id o11so2829011ioo.11
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2020 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s4Jgqy8FHGYsxGd2uxg+9lGtU2p6NtadNFvzPdnxd2s=;
 b=HZsNKlo2UT9eRHtIwf289PTytKLb+zC8ek6E2dbj+f9F9pstXmXwaxqLvfcUbGalxN
 7Oddm2Wzh03m6vCQyr+ZlxLXiTaEetSry4XhA+EQxPZK5u22S4cQ2tA+19gy85pl0EZm
 Nt1au8XgQB6b1OgnynW0QwK26oe+DPu/U5nM7FzkpfFR3ecq4TzPZUU3+iQVCJ6lMYP9
 TinPfa4Va++MxpxAGgGeKk7iIJlnt8noV7Rn/gsf5YNLrMEWieECbH0dZGJG2fgNh0F3
 FM1tsPApkc2WvAbxES7anE/7P/cltGtV32WLSNJ0In4d0In83NeR8d45aH7hZ92FOetl
 HoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s4Jgqy8FHGYsxGd2uxg+9lGtU2p6NtadNFvzPdnxd2s=;
 b=JIULZwOxv+Jw9IFbMkK0oybzGgdvgaeAaUaL0e1Idih+iJVVIJfxP71KlTUuzCToJJ
 Nl97QPAwnaik0/lP72Pf8dwA6tpiLCVfVXmkQypAAYv1MvXbmrHirkfZEFPhel4m4ptY
 AIElLdBTRdRN5ry00w6tMWTw86HlOFqA8lrVG69FkayIdqzx55XffCw/Fv5qtol2Dk4j
 OhmufPr3Kc4ZrOMxvtl0YB50pARSq7SI0ezIr0sVqZPWXeYAZhk1oTYVdJiNlemnXpS5
 IsjC8eKZHJ+MhhOmPyZk5q/2Pesp/fCwB/uEcZN0pu5Tf6js7KM51YayT15vJwhAZezP
 ApNA==
X-Gm-Message-State: AOAM531ARC72Uj73hSfmWvE0Fy3z7wm28r+wyUTqP4vkHT8HaBAijf3T
 eszO7Xm1p5vrp5qEd0QTEE/HcQ==
X-Google-Smtp-Source: ABdhPJzHHGmG1XrS7WDG6d3tzoxSvq+xuGBnqMcFnvnMWf0b7Gy9hUgmOrM9tqcOMGUk5yzj63tLLw==
X-Received: by 2002:a5d:9d16:: with SMTP id j22mr19163231ioj.172.1605111822389; 
 Wed, 11 Nov 2020 08:23:42 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id v9sm1439555ilh.6.2020.11.11.08.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 08:23:41 -0800 (PST)
Subject: Re: block ioctl cleanups v2
To: Christoph Hellwig <hch@lst.de>
References: <20201103100018.683694-1-hch@lst.de>
 <20201111075802.GB23010@lst.de>
 <92a7c6e5-fe8b-e291-0dce-ecd727262a2e@kernel.dk>
 <20201111162035.GA23772@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <10469de3-10a9-c8b5-8e95-05a014b1c24a@kernel.dk>
Date: Wed, 11 Nov 2020 09:23:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111162035.GA23772@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_112345_691255_E325AF58 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: linux-raid@vger.kernel.org, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-s390@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, Stefan Haberland <sth@linux.ibm.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ilya Dryomov <idryomov@gmail.com>,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/11/20 9:20 AM, Christoph Hellwig wrote:
> On Wed, Nov 11, 2020 at 09:13:05AM -0700, Jens Axboe wrote:
>> On 11/11/20 12:58 AM, Christoph Hellwig wrote:
>>> Jens, can you take a look and possibly pick this series up?
>>
>> Looks good to me - but what is the final resolution on the BLKROSET
>> propagation?
> 
> Do it properly including a hard read only flag.  Martin has an old
> patch that I'm going to forward port.  For now I think we need to
> adjust dasd to match the behavior of all drivers, so that we can fix
> the common code to behave more like dasd in the next step.

I applied the series, so just send something for this on top.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
