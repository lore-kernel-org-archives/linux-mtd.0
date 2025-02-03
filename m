Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AF6C02195
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2025 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQmgJoOsUsPYGXhe4NvE0w6wrDI0NY7ebZ3cuw5bpF0=; b=x/TEqw4xC+Seqn
	fcGi2VHG2vdslT/Wu3Mrnh4QdEMicziulxNSwqwYihaITN62Irzy9qwomMbFgmwzoD4pAeuqe5NcT
	vFR51E7pLU89yBApavuHTjz+IFVPMi/xJ7aM/SnolOyVsWhysboFhXB7/QdKnHKjo9dNVv1870Qxr
	DHKb72uJWga9fhUEzcUUNEFnDMtiHiXh2SWT35O0tXAvRXjyTjfL2PoZh4wow+aPuVnS5XfCm05XI
	xQhfefjbLWz5mIu5tVNzxZJg1NsTGFL8+JUm2iQTjsRftP5yxaOpTDqfhTwmwdmCroewRFica6fN6
	5lDBKqP9YxeoDKOgRfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tey7O-0000000FpEi-25Iv;
	Mon, 03 Feb 2025 15:12:10 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tey7L-0000000FpDr-2N16
	for linux-mtd@lists.infradead.org;
	Mon, 03 Feb 2025 15:12:09 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ce7c4115e8so17567095ab.1
        for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2025 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738595526; x=1739200326; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRfpPZzgAZa6Zak9GDas5XD80wl2C6NIA/57szE4cSk=;
        b=VHiB8aWlbNfWkXqlKVdEUbGSs1glsoC5JU9kAghIkbpY1IEuc7e+AaecLmSs45GOdw
         Ho5T8ULJSc3xDqU+XyIQvz86U9LHNYde8paPlz4uu9mobldllkpPbTw2FE8uxPWpNO6I
         lCVoRP9KJJvN/5TT33oURwaiVv7yrFsKrmyJxhYt7ITeImTViP6nfxSWZzyNZPSPhy/L
         f9XNOqJEBwuLDRX+OGLPHEXuh57kcc62Be1Y4tik7G6DlREhYHj1/PaD/RFtd7Zf8dtd
         s8GYo5aQzzX2J/8e3RolWIZsr2E6lfpdyqDmhmtimBj3p0EpT0/r4wnrZIPGeR605AJa
         5f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595526; x=1739200326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRfpPZzgAZa6Zak9GDas5XD80wl2C6NIA/57szE4cSk=;
        b=G+mf9WqmlSzpgyJ8p2P7cbjIE3tZcmyZNwbi1Ls1DjB6UaQQVoPu/PGwlBhIBzwSAz
         gvwlPJ5XNS88+80Cv3zAdwAZx5J8XdeD+RkHDoMf5wmxEPmjxg+P9Z7pu5wSP0IBl7T+
         VbhZwEkebI7SA80zEmWGY8OPz6WRKX8bsL5pU2YNyqCfc5AWcmHtKf4ok7aVNoRrMMOk
         BsqYSY644AKJ6me3I85kWYIaY3dknleR0H+DXE+4bvY0Nu5szCCp40cIxKDXzZ449U1n
         vebENHH3IIsuOVbfgwPG+6GeZhwVqEBtFUDWluq/wih0fMhERFUo66yK75a/ilHb1l13
         KuVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFQ7cNe2v+dQUxIHI29lzektmkfO6DCw9QkZ5JaJA2MY+KCr5Mw7YLe/bm9L8fY430vEVu/wc44pk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/5BecdDvQUaXkBxExcAfxUNjweNnd627kA/wz+i7ONu43eAqy
	KJkvq2SxC5Zbld4Ae2PMnsDrC9AW+jeXIIsAwY1zNOT9h28my8t7ADeFH6TOWX8=
X-Gm-Gg: ASbGncsRDMKFIi4A1TD+QRYN2D1ZO+SBPMHP1RuC1rqEO8hGlihz8TXNaSLiJPMPzvU
	dB01D7c+GCYXbU2ojY0Gbw33SGmj/Bd9aN7nAf4vItsKHqKLFIiS9tTfq0+TxpQCZpsIpizbBXc
	0VfGyNdbg19uhYyJzc2h5Gg7vYiJnQ/Au7l33Zk9pFA6rlARkxcIJ41W+M/gWTxCt+TdEBSxUhY
	3P98nyqF3L5g+JjXK276TjJYuB6IoSsHrTWzjZbIn1Zx2pHiyFx/WPmjBER4Aac/DTGa+8dhUYo
	GU+7ieTZMfU=
X-Google-Smtp-Source: AGHT+IExPksUoM3E6ty6LrIuS+bUTXtJbAwi3WKcho/2VPhbuSKK1HIuLb1aeN5jPmbZBIOOLKzxHw==
X-Received: by 2002:a05:6e02:2688:b0:3cf:b2ca:39b7 with SMTP id e9e14a558f8ab-3d008e71836mr145248235ab.3.1738595526174;
        Mon, 03 Feb 2025 07:12:06 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d01c433734sm16125455ab.14.2025.02.03.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 07:12:05 -0800 (PST)
Message-ID: <262032e2-a248-40aa-b5bd-deccc6c405ca@kernel.dk>
Date: Mon, 3 Feb 2025 08:12:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: force noio scope in blk_mq_freeze_queue
To: Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@lst.de>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
References: <20250131120352.1315351-1-hch@lst.de>
 <20250131120352.1315351-2-hch@lst.de>
 <2273ad20-ed56-429c-a6ef-ffdb3196782b@roeck-us.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2273ad20-ed56-429c-a6ef-ffdb3196782b@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_071207_816690_774B7627 
X-CRM114-Status: GOOD (  13.77  )
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

On 2/3/25 8:09 AM, Guenter Roeck wrote:
> On Fri, Jan 31, 2025 at 01:03:47PM +0100, Christoph Hellwig wrote:
>> When block drivers or the core block code perform allocations with a
>> frozen queue, this could try to recurse into the block device to
>> reclaim memory and deadlock.  Thus all allocations done by a process
>> that froze a queue need to be done without __GFP_IO and __GFP_FS.
>> Instead of tying to track all of them down, force a noio scope as
>> part of freezing the queue.
>>
>> Note that nvme is a bit of a mess here due to the non-owner freezes,
>> and they will be addressed separately.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> All sparc64 builds fail with this patch in the tree.

Yep, Stephen reported the same yesterday. The patch is queued up,
will most likely just send it out separately.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
