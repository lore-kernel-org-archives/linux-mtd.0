Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBABEC875F
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M53HRlVfah1W679HG0U9xTTWkbNW8nqPlcV7BEovTfw=; b=1/Plp1yxJkANUL
	PvCgaPcTjUw9MzE8cc7BF1uUuub71rD+1nioXt++aPL5Y6vUEWnlYepVoqrzTTFJ0vucRyPwTmiM8
	5KjVZ0TbKULvjsD4RrrcPblwpQOZBaJWMGW/+bLW6uNJ/V1jTlawlEaHn00160dq1g5EUHqts+hS0
	wcpIuihWMhJobMduhComGmZOoLgEzCxFpEFjaUPkNoZjyXe9+u/4PlduCzxAX2gRsuRpht+/Y2Hdv
	XlWKAc3e9PZOYzvP3xFU0b/jQFTnxFf40zjwSeBMeQrhwREcPeCsUs3i4C08bB1RGFdjG8Ow9OaPX
	qN89iVr2UkpjhGJtRl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qePOP-00CqeS-13;
	Fri, 08 Sep 2023 00:30:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qePOM-00CqbA-1f
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 00:30:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so319222366b.0
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 17:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694133021; x=1694737821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=;
        b=AclparNhffDJEsS4hICwxtJHQpnSffO1EMayO68QxYc0QSozGZo9SWMTY+H5JyuYUY
         lOPpBRaUwK7y82+mw463BB5mQqKArIPuGFSN+scAFMDvrlcaNwbiL3rbk0A4Rl+mgeEo
         84s5ovkmiS1stA6cjQL4MYYfAGX56BrUh+ocId/I3kjY3SenNdLHYtJ5+Pr3WacRhMtE
         R34NGkBdD2hGzBQYG9BRg8kQNO78Rjqm0SeL9NuqXG34/1lRYYe3UG6jeU2HcXMZcNfV
         vWVW8ZgsVrtRStyDk08cMzTJvTxpkZcrqayXksTpXphu3kXfr2GxMv8p9zordv7u3Tuc
         SAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694133021; x=1694737821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWH+VGW4ynUEnqVgfK8Uo5vbTneevGaezyT5mB/sqg4=;
        b=WJ3j8Qoyrjx8AepkG8Zd7EtRmY13laJI8Ib4sX/nLc+tunUc3lHQqo+FjxNbkDnOt5
         +WrqH7Krqa6eqE7Mq7tdOWP9sh7ygvtGQQAvMYzeeky6/xpCSzdVu5sF3oxyfpAHFE67
         bBHBzl+uVsbiQpzHqx2gc89FMZu3/dRS4z+7afln3nz45fSvBVAN1K5hRmcwqr1pmuOm
         trmUHjIL7YLBqhplTgMAXI1GhWVECD1aAe+F03bw5mlFeykq2vp1ybNn9zjHDuC84NS7
         rAxWlXNtWj++RQmPpNVXFV0TBfr+EOGVOarD/mXpbeKiexr29M2a65Eo6rC//2FABA+T
         vBbA==
X-Gm-Message-State: AOJu0YxHgTkZbp+oBSqaFvQMvQkpL407F5S0rTqtJ5xuKiYw4g9YbTum
	uDfG8lLXoWylNcfdJUfbBWI=
X-Google-Smtp-Source: AGHT+IHUmcSd3yGn0Yc+fxHKH36GJLlYUzap6qvtcfMqwZgOcAgDOYhbcm3dJF4+eYZ9U6PvPuYQ6g==
X-Received: by 2002:a17:907:6e87:b0:9a1:c69c:9388 with SMTP id sh7-20020a1709076e8700b009a1c69c9388mr4152809ejc.37.1694133021412;
        Thu, 07 Sep 2023 17:30:21 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.141.16])
        by smtp.gmail.com with ESMTPSA id lz24-20020a170906fb1800b009932337747esm280974ejb.86.2023.09.07.17.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 17:30:21 -0700 (PDT)
Message-ID: <6489b8cb-7d54-1e29-f192-a3449ed87fa1@gmail.com>
Date: Fri, 8 Sep 2023 01:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] vfs: add nowait parameter for file_accessed()
To: Dave Chinner <david@fromorbit.com>, Hao Xu <hao.xu@linux.dev>
Cc: Matthew Wilcox <willy@infradead.org>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Stefan Roesch <shr@fb.com>,
 Clay Harris <bugs@claycon.org>, "Darrick J . Wong" <djwong@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
 Wanpeng Li <wanpengli@tencent.com>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
 <ZPUJHAKzxvXiEDYA@dread.disaster.area>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZPUJHAKzxvXiEDYA@dread.disaster.area>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_173034_552912_00406F32 
X-CRM114-Status: GOOD (  18.96  )
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

On 9/3/23 23:30, Dave Chinner wrote:
> On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
>> On 8/29/23 19:53, Matthew Wilcox wrote:
>>> On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
>>>> On 8/28/23 05:32, Matthew Wilcox wrote:
>>>>> On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
>>>>>> From: Hao Xu <howeyxu@tencent.com>
>>>>>>
>>>>>> Add a boolean parameter for file_accessed() to support nowait semantics.
>>>>>> Currently it is true only with io_uring as its initial caller.
>>>>>
>>>>> So why do we need to do this as part of this series?  Apparently it
>>>>> hasn't caused any problems for filemap_read().
>>>>>
>>>>
>>>> We need this parameter to indicate if nowait semantics should be enforced in
>>>> touch_atime(), There are locks and maybe IOs in it.
>>>
>>> That's not my point.  We currently call file_accessed() and
>>> touch_atime() for nowait reads and nowait writes.  You haven't done
>>> anything to fix those.
>>>
>>> I suspect you can trim this patchset down significantly by avoiding
>>> fixing the file_accessed() problem.  And then come back with a later
>>> patchset that fixes it for all nowait i/o.  Or do a separate prep series
>>
>> I'm ok to do that.
>>
>>> first that fixes it for the existing nowait users, and then a second
>>> series to do all the directory stuff.
>>>
>>> I'd do the first thing.  Just ignore the problem.  Directory atime
>>> updates cause I/O so rarely that you can afford to ignore it.  Almost
>>> everyone uses relatime or nodiratime.
>>
>> Hi Matthew,
>> The previous discussion shows this does cause issues in real
>> producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
>>
> 
> Then separate it out into it's own patch set so we can have a
> discussion on the merits of requiring using noatime, relatime or
> lazytime for really latency sensitive IO applications. Changing code
> is not always the right solution...

Separation sounds reasonable, but it can hardly be said that only
latency sensitive apps would care about >1s nowait/async submission
delays. Presumably, btrfs can improve on that, but it still looks
like it's perfectly legit for filesystems do heavy stuff in
timestamping like waiting for IO. Right?

-- 
Pavel Begunkov

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
