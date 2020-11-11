Return-Path: <SRS0=6UFQ=ER=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B30C388F9
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:14:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F4120659
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2020 16:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNcxrcLl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="0mdj8CtO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F4120659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O4Dsoy99vcJg5sOUVspoybeCUeZu3/A9UroBaAZOdqw=; b=TNcxrcLlvQ63BeqLD198K/dwy
	JNZg8kOBtlDcQhkDGvOqTCVA/Sur5Xc6al9pMfPolrl6uIccnXQG000v4/vvGVV/6g9Knf/O4gUlc
	idqEgkOQai/SmMllRcBwx89kuUoupE4up+kylVKqcFtecOsfIG9fxdRnXRCebsqMOD8BainesWtd7
	XEKTwuxzu8/y9lSnXsXw3ywjavbWTLq6otNNi7QQT56ilt9aZetjfEgL9I2o03mUaaQcODaKR4l76
	28QFI/gjqpMndnbFkjgxeXJLeEG441VoTvhVDjYxEvgE3KL2Hl8tKtf5aqDGXeAgpTuUec+EnI41z
	M+1xilxhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcskL-0002Su-5Z; Wed, 11 Nov 2020 16:13:21 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcskD-0002Qx-6M
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2020 16:13:14 +0000
Received: by mail-il1-x12d.google.com with SMTP id k1so2440629ilc.10
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2020 08:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7yS21c4EDamv1N5jFFAli/djfW/+Q3U+ZJfbXcDD9kI=;
 b=0mdj8CtO/R56ulgEDkoqOJkeoWn//omJtQsjKRxVAfyHMuD/i84TcxrzvRmjPiwu8d
 5QHIjv1vEPSxJ7oTOr3oXq08szlvpuUQyhdRv82dm8eKD6yeTe6aZ6F47Ab+TgA8euaS
 uCAQOWouzIbjPJKUwWzjNHJhlRh+SAuaCVGBS6zxaeSmTlcD93GvFMRBY2JS+rvj9/71
 62v/XE93mWLRdieAXrh+wRWHWhL/1mkIIJYsWWeoVEyvPFkHo6lRccH7n6CWyIJQ4DnD
 LGdZYCEGD4DexxHWKSV8QfZBXsJhbXqpD26FOUoZ7CLbUXUFw/+F2whGdyrKEEu1f005
 +RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7yS21c4EDamv1N5jFFAli/djfW/+Q3U+ZJfbXcDD9kI=;
 b=aKs6aAaCOPcU1G457lI1hjpI9WSEn6b+NAsuXqlHSqkp7V6WZfY7KKYLMyBUGqOb+F
 kLlmGOSBhEFLf1ac4Mv+s1WC3fF6wnnPA15VhWtHqO6stXyHJiB710o7pDbDLavz+3r4
 PGjfIVBwzRZWfdSbhX6LpxBHJC7y4NErRkCyvChWa8Mf5ipTruOzLYrNR+j7n8Fjikio
 rbeY1Mip5Tf6qk0feXaEcSfr859Jn039ccKPsOMadpjNKNw83jmVkMnb8//nkZwMp0rz
 Ez63mCPAqMtQD6Dj/QtFJvfa8afQGsONzurfdT6GmCr2ZlmnO0iDfknGCpXRMmPNLNb0
 ywBw==
X-Gm-Message-State: AOAM5326CbrSSWopXL5jUSTQiERnG/LLufqAK2rXmahWhE3ZsknXgtfX
 33m5uZxT6iNOxF4KWdM1ZxyBmg==
X-Google-Smtp-Source: ABdhPJzwILifX5tSP9gqWXbZq1R8Jv1w+MiHneN+v+U9u5cRPw2dSbsLytSjWr9uVfmYJHN8DBeLZw==
X-Received: by 2002:a92:8541:: with SMTP id f62mr20043826ilh.9.1605111187075; 
 Wed, 11 Nov 2020 08:13:07 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id j85sm1478517ilg.82.2020.11.11.08.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 08:13:06 -0800 (PST)
Subject: Re: block ioctl cleanups v2
To: Christoph Hellwig <hch@lst.de>
References: <20201103100018.683694-1-hch@lst.de>
 <20201111075802.GB23010@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <92a7c6e5-fe8b-e291-0dce-ecd727262a2e@kernel.dk>
Date: Wed, 11 Nov 2020 09:13:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111075802.GB23010@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_111313_251521_7CB8D4AA 
X-CRM114-Status: GOOD (  12.24  )
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

On 11/11/20 12:58 AM, Christoph Hellwig wrote:
> Jens, can you take a look and possibly pick this series up?

Looks good to me - but what is the final resolution on the BLKROSET
propagation?

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
