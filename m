Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D320DC77B62
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 09:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvYPOMp7R4oGTDjVD+uzSmWCf1ltO4Cfael2tATwcmQ=; b=av/IpmSQ8kft6R
	zbINnwDSwZmfO0KzgtEHT2JZVss5odv1QtYAXzfNxODCZRzRnaoXmps6SAAZj+xsAbKzGKivWAlCw
	It9uSz/3CVBn5BryxlBIu3c6bPe/AER/lv4YxVzsZjCTmOdrcr8bufZD/qt2o01lB7oV+SPd4IbkR
	XuO/AaJET6byUKK+xosl3tkv9KtbaMMKHz5c4x3X7rl0RTNLrWCuLfb07f6I90yfgpvWi5ZnAH1Tx
	I6Ha0S5bAiTXJtCma33mBowdqqnCmkzjh+JqYtaMsWyECL+Cwdhjf+DR0xWMls4Lq//14OuRwW9kE
	gLeZ3WhaLL719nm1YIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjF8-00AUPZ-2z;
	Mon, 27 Mar 2023 09:34:22 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjF6-00AUOd-0X
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 09:34:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id r11so7976364wrr.12
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679909658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POgdeDq6GTq5hmNPSFdueivmMjzmCDTzevp+cgu6XvA=;
        b=mR7CT2fV0Ybfj2vBd13RThvEyQ1D/PFjh1kTPbdiiQnlgV/kM/CwdDqtXmhZ7zZGki
         nix0hpWmXn1G3Cd3Z54UOTdcdRCrOIPzMOGhvCFoJTB4r1v+/tLUM/1yVWUbrpsa3yHo
         LTBfnCK7l+x0J2n6XR0LXHrrMJMhpEaIAi70Z8L9NWOKjT/1kbUXLw2H79C4dG4qvWfU
         qi/mRpIwP1XhTzT0NcgAjFp1QAXMhVgwDTIOQ2QnTCl2iuDjYg6lAqg6UBp9TuPnEeXz
         dFALI1ZWsDOvy2loMU6WEcZPP79BHa2SzQ8aOabfFnaFBzpQmZxH8KgeV4xSxmcGzgMt
         vNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679909658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POgdeDq6GTq5hmNPSFdueivmMjzmCDTzevp+cgu6XvA=;
        b=QRn6lclmYVzTyb3gbOlZZBF6uVduEqraywfdoMNTMhp9EU0WQk79KP3DSOb529U02R
         H63v2pRn9g44wEQEGWEUgc+iOsLyEK1oMbv+WywL/CD9W29ULLkCu03ULkhaWhmmH8DU
         TVXX91xboa9N5M+cq9NkWGhTqB5ul0Pcxsf51YWTO4kWmbYzAM52+Q+fIJtSxp9tki6p
         +syj4sjxrN4e+bdKpt1Gmi68mABiDmqo7D61rt5zLY+WfcAA9rNcPOFYnQOuDfOKs8kV
         aQlJjRUiER9Mm18mMBmQ5qMN2hNm65zMP2lpFSPL8gIkxx/+rBOC+hd+ElroRLr9HO4+
         mLZQ==
X-Gm-Message-State: AAQBX9d5ZPbdmEKiQCuQ5qaA8bNe9av2qar9q63S77PnTl95MJL79AS4
	kQdsZWOgAkZUDXQ1a2T3n9bHVQ==
X-Google-Smtp-Source: AKy350biDzt4J5AlQf8bORqhDcPyA2F6kFQA73y6/+x397VtOTmTSjosx2Yg2EBrJbXnu7dsvNVQ3Q==
X-Received: by 2002:a5d:414c:0:b0:2d6:4e98:5f32 with SMTP id c12-20020a5d414c000000b002d64e985f32mr8347150wrq.23.1679909657869;
        Mon, 27 Mar 2023 02:34:17 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id u8-20020adfdb88000000b002cff06039d7sm24536801wri.39.2023.03.27.02.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 02:34:17 -0700 (PDT)
Message-ID: <a6ef11cc-3a94-9cd6-60b0-b7ab86dadd01@linaro.org>
Date: Mon, 27 Mar 2023 10:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/8] mtd: spi-nor: read while write support
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
 <f904e8dc-6585-c90e-7226-3854613216ce@linaro.org>
 <20230324145140.58509d50@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230324145140.58509d50@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_023420_209738_AF003882 
X-CRM114-Status: GOOD (  31.47  )
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



On 3/24/23 13:51, Miquel Raynal wrote:
> Hi Tudor,

Hi!

> 
> tudor.ambarus@linaro.org wrote on Fri, 17 Mar 2023 04:13:27 +0000:
> 
>> On 2/1/23 11:35, Miquel Raynal wrote:
>>> Hello folks,
>>>
>>> Here is the follow-up of the RFC trying to bring a little bit of
>>> parallelism to support SPI-NOR Read While Write feature on parts
>>> supporting it and featuring several banks.
>>>
>>> I have received some hardware to make it work, so since the RFC, the
>>> series has been updated to fix my mistakes, but the overall idea is the
>>> same.
>>>
>>> There is nothing Macronix specific in the implementation, the operations
>>> and opcodes are exactly the same as before. The only difference being:
>>> we may consider the chip usable when it is in the busy state during a
>>> write or an erase. Any chip with an internal split allowing to perform
>>> parallel operations might possibly leverage the benefits of this
>>> implementation.
>>>
>>> The first patches are just refactoring and preparation work, there is
>>> almost no functional change, it's just a way to prepare the introduction
>>> of the new locking mechanism and hopefully provide the cleanest and
>>> simplest diff possible for this new feature. The actual change is all
>>> contained in "mtd: spi-nor: Enhance locking to support reads while
>>> writes". The logic is described in the commit log and copy/pasted here
>>> for clarity:
>>>
>>> "
>>>     On devices featuring several banks, the Read While Write (RWW) feature
>>>     is here to improve the overall performance when performing parallel
>>>     reads and writes at different locations (different banks). The
>>>     following constraints have to be taken into account:
>>>     1#: A single operation can be performed in a given bank.
>>>     2#: Only a single program or erase operation can happen on the entire
>>>         chip (common hardware limitation to limit costs)
>>>     3#: Reads must remain serialized even though reads on different banks
>>>         might occur at the same time.
>>>     4#: The I/O bus is unique and thus is the most constrained resource,
>>>         all spi-nor operations requiring access to the spi bus (through
>>>         the spi controller) must be serialized until the bus exchanges
>>>         are over. So we must ensure a single operation can be "sent" at
>>>         a time.
>>>     5#: Any other operation that would not be either a read or a write or an
>>>         erase is considered requiring access to the full chip and cannot be
>>>         parallelized, we then need to ensure the full chip is in the idle
>>>         state when this occurs.
>>>     
>>>     All these constraints can easily be managed with a proper locking model:
>>>     1#: Is enforced by a bitfield of the in-use banks, so that only a single
>>>         operation can happen in a specific bank at any time.
>>>     2#: Is handled by the ongoing_pe boolean which is set before any write
>>>         or erase, and is released only at the very end of the
>>>         operation. This way, no other destructive operation on the chip can
>>>         start during this time frame.
>>>     3#: An ongoing_rd boolean allows to track the ongoing reads, so that
>>>         only one can be performed at a time.
>>>     4#: An ongoing_io boolean is introduced in order to capture and
>>>         serialize bus accessed. This is the one being released "sooner"
>>>         than before, because we only need to protect the chip against
>>>         other SPI accesses during the I/O phase, which for the
>>>         destructive operations is the beginning of the operation (when
>>>         we send the command cycles and possibly the data), while the
>>>         second part of the operation (the erase delay or the
>>>         programmation delay) is when we can do something else in another
>>>         bank.
>>>     5#: Is handled by the three booleans presented above, if any of them is
>>>         set, the chip is not yet ready for the operation and must wait.
>>>     
>>>     All these internal variables are protected by the existing lock, so that
>>>     changes in this structure are atomic. The serialization is handled with
>>>     a wait queue."
>>>
>>> Here is now a benchmark with a Macronix MX25UW51245G with 4 banks and RWW
>>> support:
>>>
>>>      // Testing the two accesses in the same bank
>>>      $ flash_speed -b0 -k0 -c10 -d /dev/mtd0
>>>      [...]
>>>      testing read while write latency
>>>      read while write took 51ms, read ended after 51ms
>>>
>>>      // Testing the two accesses within different banks
>>>      $ flash_speed -b0 -k4096 -c10 -d /dev/mtd0
>>>      [...]
>>>      testing read while write latency
>>>      read while write took 51ms, read ended after 20ms
>>>
>>> Parallel accesses have been validated with io_paral. A slight increase
>>> of the time spent on this test has however been noticed. With my  
>>
>> how do the other tests look? Is there any change in performance for
>> flashes that do not support RWW?
> 
> The current implementation takes care of not changing anything with the
> existing flashes, when I resend I'll provide all the logs you asked

yes, I saw. There are some ifs here and there, nothing scary, so I don't
expect any change in performance for the flashes without RWW support,
but it's always good to have a proof.
> for, plus another quick test without the RWW feature bit set.
> 

Cool, thanks! Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
