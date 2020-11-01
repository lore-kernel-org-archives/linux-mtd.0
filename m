Return-Path: <SRS0=Psr0=EH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2688C2D0A3
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 16:48:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5687722265
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 16:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YnXwesEy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="C6/CfdYP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5687722265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S07yp1WCB4dgAMoK3evJhf+iD1AVKJbx1rsy+NyoRrg=; b=YnXwesEyEUmrUcbaX8ZJ5Zsz+
	qIWJZxUU0/KxvMpqVUKrcY4BTnpAzHNXTrpibIXa0/eGH24tetOo8SWAp//oS3ntHEsrYETdxZFNL
	S1AZoZUTcMvLc1cSiDPeC5aQRit6KUOLCo/5YCYQ7g+ijudMvsx6hbkVg1kggbQdPrjj8EahQd9Oh
	2cLdxwmUR2U5Tc58IN0NN6MCJdByktzHinz+pIJiJ2Dok/CjMFN69+ja6x4fv0ShgebgM/Asoxex5
	MiIeAkxQ29ZSxZLe+nSnKgKCFLMYiDun7/6WW7OG90B6cHH+Vdgkw60wmsM9qlJFWha5Ujau9qSut
	YGo2qP5ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGUv-0000NM-6t; Sun, 01 Nov 2020 16:46:29 +0000
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGUr-0000Mo-Kj
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2020 16:46:26 +0000
Received: by mail-pg1-f194.google.com with SMTP id x13so8724462pgp.7
 for <linux-mtd@lists.infradead.org>; Sun, 01 Nov 2020 08:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JA2Mrg1CETiakxbFSgknGwTSjNWYLI4LI30te6RUQlo=;
 b=C6/CfdYPKDaybjemy7ROjgbyGvqWB8u46p2B5eG/nr68U2TGp2xvaVgp2iM+RQBZ+e
 vV4TDjQS6iV2HmZeWPg2tXHrVpg8bNCvWcTGkRCyfQM4VmTSm7ZkoYxM8E9U4qNpDugu
 Qax0PNfE8SJPPsu0S6mBjDQwFfvGp10HHDOlsLWe/na8mnnzwk9wfgZdtm/9swmogTuN
 MzUs4wDSAKQ84FXYmaRgT4XRnKdOog9fc8vkJy7193hpA168Vg4RCSDycjU8LT4CkDLf
 psgPKi8H66LLmuMPHcpmP2gIuP2Gy0GJ+RoHYRYrDqDnw+YBKkZKLYUYa5o/LThczwuA
 1PPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JA2Mrg1CETiakxbFSgknGwTSjNWYLI4LI30te6RUQlo=;
 b=Mb2Tde9DK94KBDHPM3gIn2RnBZfeGYn1CxjNpc669O3J+3NV8A7m+qJF06Vh+Kfh2i
 3ZCp27stslXQFkBb8zHKW4wgHTkQHkYzKlMmvPC9N2sbWhbnJDj0DV3p8EaWQqcwnPJu
 6648pCGTAAxF0mBrC5URmE8DU8x5QF5b1W/6xp2+envnGyJ/kPE7C14rDuIVBGVE0diy
 MA3DYl2QrWXYDGXlC2IjG6V5UV4PTSBlZlWMiUxrMXmKCqxhk/LiiSKfI7l0mzBuWtkW
 xuIEmBJrzFRKHYFO7sIKTbR4kSjEXbBnCDhqhFoaIjNZlWo5r1KALQj4lm5KvGPpp1+8
 JeLQ==
X-Gm-Message-State: AOAM533yBMHLnslrQU2f0x+t1G8TW2MEGhWFS/Loc6HYHooZm4mKqHxu
 qIaBw2osncKngBzS9UBZVD/qtQ==
X-Google-Smtp-Source: ABdhPJxoCG9gkDR5+SPv2EwBLd3ow0z0XlOgH7pokFA9cV+UVH6OXY3zdVqqdFKxBkTD88zb7corAQ==
X-Received: by 2002:a63:5046:: with SMTP id q6mr10223402pgl.373.1604249124121; 
 Sun, 01 Nov 2020 08:45:24 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id gf17sm3763037pjb.15.2020.11.01.08.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 08:45:23 -0800 (PST)
Subject: Re: [PATCH 02/11] mtip32xx: return -ENOTTY for all unhanled ioctls
To: Christoph Hellwig <hch@lst.de>
References: <20201031085810.450489-1-hch@lst.de>
 <20201031085810.450489-3-hch@lst.de>
 <f128e8bb-7ce4-b8f4-80cb-1afab503887c@kernel.dk>
 <20201101102735.GA26447@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <842f4d23-b8c2-8ade-caf3-50b7cb9542cb@kernel.dk>
Date: Sun, 1 Nov 2020 09:45:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201101102735.GA26447@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_114625_726303_47C32DC7 
X-CRM114-Status: GOOD (  16.39  )
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

On 11/1/20 3:27 AM, Christoph Hellwig wrote:
> On Sat, Oct 31, 2020 at 08:58:52AM -0600, Jens Axboe wrote:
>> On 10/31/20 2:58 AM, Christoph Hellwig wrote:
>>> -ENOTTY is the convention for "driver does not support this ioctl".
>>> Use it properly in mtip32xx instead of the bogys -EINVAL.
>>
>> While that's certainly true, there is a risk in making a change like this
>> years after the fact. Not that I expect there are any mtip32xx users
>> left at this point, but...
> 
> -ENOTTY is what most drivers return.  That being said we can keep the
> old behavior, so if you prepfer that I can respin to do that.

Yeah I know that -ENOTTY is what they all should use (and most of course
does), just saying that this change carries some risk. Given that
mtip32xx can probably be retired in the not-too-distant future, I say we
just keep the -EINVAL here.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
