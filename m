Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F8BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AD8F60F39
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 01:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AD8F60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rqEaN8fYC2y8JABGQhkjn3AiZYLQHiHRS9yhN0KdA1s=; b=vYlziWOc8NWw8eQsjkH76xroup
	3LoewUAsDtzXvlFh1dvN/1Exsfsjn8HbrqhkOZG2kLtaLk4TxH5vkXh7skAaqMwxknevTYGV6y0QL
	A6+7je/x+rmsKiDD9S3XNHpaxgRNbSf/5YztkGMCrO0GMlAWbucO10WZlNN/xBn4VCXrDHl8Zf0dY
	TJqus1TYaPdVG7xYhp1CIqpQd+Ol3DTvpNgZPxeDrSHA/hXBUa2S5H1VPMLS/60o2xN1vK6zXt3C4
	pQisjQwPgRD2jfmT4UsLVqznpfLX15r/jLia26gsVnOXj6ljB9tW4RQUensaX4A76i9kPtsswFLFt
	NGMZWPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi54a-003loM-Hy; Wed, 03 Nov 2021 01:28:16 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi54X-003lkf-BG
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 01:28:14 +0000
Received: by mail-il1-x12a.google.com with SMTP id h2so927244ili.11
 for <linux-mtd@lists.infradead.org>; Tue, 02 Nov 2021 18:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6py8bgQ0B5/+fIXWiAKE7dARK0paBlJ7XzGDJcrhlUo=;
 b=fY4Xy+5HpEK8ZhIkUmNH1j3a9zqOyiBHtuJicBDonOsEEWvYTzx9H5pDPgOWuIZFPR
 gqYcIlgwXR27OtzPc+K6hZMh8BxvcAmq2TC9oMlEXlzeFnfuyroynIjynj844KdajEzr
 aj7umF/qQgApkedlFSqpjrB8YtmYWXJMn0TZryPNtobrhoKLPZbstgJWO/WT2obWdP6+
 xGeASjXcTPUIMfM3qftKOY5NgzVzS+2dMQtAEEOYwog/HU4iF84L6ggDijD7fR4gCH/N
 wLbIvSaoVm7hDUYbkSJMPmopfK02pXiCoJliqU6efpVekD43pTkO9y07oo7CZxfykj3n
 RqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6py8bgQ0B5/+fIXWiAKE7dARK0paBlJ7XzGDJcrhlUo=;
 b=6fJNYwwp0mwVwFFslafqKnxkGFpv6qBcHLLZT62ZX5aWkKI+Rc7nHXTeMRbcPnhcje
 dWwCr8xRjSAtktzA7w4+Z6EvdXfwUn0I+mGKXLQZq7VsoRT/W9dVCmZ8v5plAAWwD1GZ
 UOUiDF+W/dxSTBUZheIjhjnojh9JyNjlus/ZSN3fNqoz58CqQSjykWYieDnURRXdHFrC
 nIvmICODdrvWua2nX9nVMuLGssPf1t76iTIfHJAkiOm5deiCrVD7Iy4VmZ70mbOf75Is
 /xji2GBYqkrCh1DMDTQYuwYpa9evD88jAV313PIw6DFiHUCf6yEBQ356D36L+PEZWVtP
 kS8g==
X-Gm-Message-State: AOAM531jr1EmpNDOnJHUQJETErObScGHP1mBF59vr6l1J1nL5EeePtl6
 6sc8K5BOic4RHF08XiMQOXiOrg==
X-Google-Smtp-Source: ABdhPJwO1JGTdFIdOfS6rJRB6NOgCNJYxGHsGlwnV1pIOoBRAmgNDLSmAlVORwzRNUcJ3aKtd2J9Zw==
X-Received: by 2002:a05:6e02:190b:: with SMTP id
 w11mr2361219ilu.211.1635902887266; 
 Tue, 02 Nov 2021 18:28:07 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id k11sm446896ilv.66.2021.11.02.18.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 18:28:06 -0700 (PDT)
Subject: Re: [PATCH 06/13] nvdimm/blk: avoid calling del_gendisk() on early
 failures
To: Dan Williams <dan.j.williams@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Jim Paris <jim@jtan.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
 senozhatsky@chromium.org, Richard Weinberger <richard@nod.at>,
 miquel.raynal@bootlin.com, vigneshr@ti.com,
 Vishal L Verma <vishal.l.verma@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mtd@lists.infradead.org,
 Linux NVDIMM <nvdimm@lists.linux.dev>, linux-nvme@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-7-mcgrof@kernel.org>
 <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
 <YYHTejXKvsGoDlOa@bombadil.infradead.org>
 <CAPcyv4h1dqBm71OQ_A5Qv4agT3PhV7uoojmSB1pEpS-CXaWb5w@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <51f86768-04ca-bc7d-c17c-3d0357d84271@kernel.dk>
Date: Tue, 2 Nov 2021 19:28:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h1dqBm71OQ_A5Qv4agT3PhV7uoojmSB1pEpS-CXaWb5w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_182813_457114_09607511 
X-CRM114-Status: GOOD (  20.88  )
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

On 11/2/21 6:49 PM, Dan Williams wrote:
> On Tue, Nov 2, 2021 at 5:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>>
>> On Fri, Oct 15, 2021 at 05:13:48PM -0700, Dan Williams wrote:
>>> On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>>>>
>>>> If nd_integrity_init() fails we'd get del_gendisk() called,
>>>> but that's not correct as we should only call that if we're
>>>> done with device_add_disk(). Fix this by providing unwinding
>>>> prior to the devm call being registered and moving the devm
>>>> registration to the very end.
>>>>
>>>> This should fix calling del_gendisk() if nd_integrity_init()
>>>> fails. I only spotted this issue through code inspection. It
>>>> does not fix any real world bug.
>>>>
>>>
>>> Just fyi, I'm preparing patches to delete this driver completely as it
>>> is unused by any shipping platform. I hope to get that removal into
>>> v5.16.
>>
>> Curious if are you going to nuking it on v5.16? Otherwise it would stand
>> in the way of the last few patches to add __must_check for the final
>> add_disk() error handling changes.
> 
> True, I don't think I can get it nuked in time, so you can add my
> Reviewed-by for this one.

Luis, I lost track of the nv* patches from this discussion. If you want
them in 5.16 and they are reviewed, please do resend and I'll pick them
up for the middle-of-merge-window push.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
