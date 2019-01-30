Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99924C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:13:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 682AE2184D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="agw6/k8X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRuwJuIZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 682AE2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvJEu1k4gQR0/ZTRadhjnZ6dD7o36VOsZg0aL+6nJ/Q=; b=agw6/k8XXQgkzI
	l9xks7aH/Ix9YBWvNmKW1wutpF5+wNgqbZNShBxw9w7ZRsQ9GWUdcziZyTYwr3UP6STMS4Kooh1N3
	aQIpqjGxHHwB69aUSGxFLX6D69MXR2kXya+G/3zfMn9isHCRIuIPlpaIg9FAbvm7fB4fW3kScsAAH
	PIyu03qkqvHv0a9+lmUj9p1MwEXjrq+B4aJRndbTq+R+qvXF41NE6DZ4iSnrGMaenlhOECC/gIfte
	TQ8HAs0jWrF95ab3t5gSVxP5ptQx/9QIX7Gr8THawyiN1rwWjMp3Wc30/4gaApOdMIPiuOlpczGb1
	5d27r0d58mAwLYRl+xGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1golw4-0001L7-CG; Wed, 30 Jan 2019 09:13:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1golvz-0001KO-7J
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 09:13:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id x10so25107668wrs.8
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2019 01:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w6L6/MQaaJ92RffYD3U7oPSvhvJyuSc8C16R8E77xeM=;
 b=bRuwJuIZJLdXS5H76UWMj/tc2x0BTZOUVWJfJXWT6yDqdJgcHiKbQbsjKfZRz4MEgl
 aHPEpscys7uxl7RIZTcK/dgkWRKuH5EngLtXV7kginLg/QA4Aje6elrgTH9WLBN8579l
 3LUMEmIAaLRR1bsnbV6WGCZubSRY4iDlDNhiqBtMBxZ5lTNUUGOlNDyfDg1kkUS9w1Cb
 CoIBgwkQoUbZ0JTX616bB2iPyjP4hZZ0rAOETPYKRkxo8ImGNl0jMVULo89+0c8FnBIr
 9iXlzUY1fNgBADOQxfv1h5sd8fobc8MWS3skgMmk0SNPWefs/gTOjCEoVl7pOB/DJmKC
 tGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w6L6/MQaaJ92RffYD3U7oPSvhvJyuSc8C16R8E77xeM=;
 b=LyU4w7yzx6SjfrqXTcS722dju4gDg8YwnhNZtUeIjNk3PMCP/kQEq/85UaStDjbrKF
 xz3kIaE90OpZkba0wRdowg5p+bSzap+X1jDYPU8Ry4W7vJW2NqIz/TdzPys78gLwAado
 Xlgxs5ZF0gbG2GLgi2vy0lXJALtnqMzLrc7dmhHkPi91Ow37mDIWvr5AY/7V8BHIUtIJ
 9luRWk4vwxnkLQM+YM9VMIiKXXx6M3+pqOC0lh7qPCUFpq2GwfHL9Sh8wN9/oOylAkA4
 DHWAhyts1JAt4p+AiDfSIX2z8dqo7tpRl5atJoz8eE/CbTIj7rCgWg2AnFn4H8qkmJcE
 AOFg==
X-Gm-Message-State: AJcUukfDa0LoJep/jle9hl+vLcssdD8YnyYCUhUdWv/Y+co/dISM2iOm
 pYbvShbWVaoikgv6zTNmkds=
X-Google-Smtp-Source: ALg8bN5SqZW17/2fQc61ni3Y4N7d5AwxCf6QCOHmTAoxi0EnYl7QeF9edwSMN0nNXnSUEq47GFtCwQ==
X-Received: by 2002:a5d:6710:: with SMTP id o16mr30230322wru.152.1548839605132; 
 Wed, 30 Jan 2019 01:13:25 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
 [86.49.110.70])
 by smtp.gmail.com with ESMTPSA id c14sm1487016wme.13.2019.01.30.01.13.23
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Jan 2019 01:13:23 -0800 (PST)
Subject: Re: PATCH: s25fl128s
To: "A. Celenk" <ahmet.celenk@procenne.com>
References: <5458abc1-ada0-615c-32a4-7fcd99fa42b9@procenne.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <d729fe39-f9a3-2c2d-58ff-08437075d90b@gmail.com>
Date: Wed, 30 Jan 2019 10:13:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5458abc1-ada0-615c-32a4-7fcd99fa42b9@procenne.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_011327_282869_080D8FD4 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/30/19 8:51 AM, A. Celenk wrote:
> Hello Marek,

Hi,

> In spi-nor.c, Spansion s25fl128s shall be seperated into s25fl128s0 and
> s25fl128s1;due to two different versions of the chip: S25FL128SAGBHI200
> and S25FL128SAGBHI210. Patch attached.
> 
> Related thread: https://community.cypress.com/message/183016#183016
> 
> Excuse me for the mailing style, I've checked out "how to commit to
> kernel" for a while, and seems it'll take lots of hours for me to patch
> just 2 lines. I hope this doesn't offend the pathcing rules so much.

Take the patch, apply to linux-next/master [1], then
$ git add -u
$ git commit -s
<write the commit message, e.g.:
mtd: spi-nor: Split something somehow

Blah blah description of the change ...

Signed-of-by:...
Cc: Boris <email address>
Cc: Marek <email address>

Save, exit

$ git format-patch -1 -o /tmp/
$ ./scripts/checkpatch.pl /tmp/000*patch
< fix checkpatch issues>
$ git send-email --annotate --to=linux-mtd@lists.infradead.org -1 HEAD

That's roughly the process. You should follow it, because maintainers
are overloaded as they are already, and cannot fix up ever single one
patch. Please follow the process to make it easier for maintainers and
prevent burnouts, which can lead to unpleasant experiences while working
with upstream etc.

[1] https://www.kernel.org/doc/man-pages/linux-next.html

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
