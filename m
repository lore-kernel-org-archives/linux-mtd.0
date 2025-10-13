Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED99FCCA476
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JdLsAWni1v4Z9AHQ4v0fDGUn0Vs3nAMqaPp52FvmgA=; b=LxdE6rwr1Pg5cP
	gcqpvUGj6lsf4H+Zt+5FaxBuPfdGa00pUi92zhCUBJQq6MtNncbq5qTWpNeYlHrC3/Xm8jl8tWGAw
	khbZTW5LE1nyAjsB8JVNOb8KbVvQsvp0XIkLb1o3GRO7xN5Uk87HweOKpPPKUNZw9LlfI63X7btZX
	3ZDYECG+nkxj8E8cJBZeyeb2zPnJsKaTpXReqL2zI0rqUq3uyVqRtcQGaJXf6+AYH3CZ/iHcz0fdF
	fRvXoEa3on824HDoT6qIUTlBoquCp3ODl4FtZEjY5RbJOzrswpcWsby1ZCW8RLxBzCbtAEk1UzAoX
	0Ay46X31a5qOtRFBjKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D0p-0000000CUjC-3Jov;
	Mon, 13 Oct 2025 07:30:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8D0m-0000000CUhi-2zcj
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 07:30:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e504975dbso21556515e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 13 Oct 2025 00:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760340626; x=1760945426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O7tThfX+A9pJzDxQgmG7Tj5N8YTWpyW9vcBCkeCqf1Y=;
        b=LIoIHzBuBujAjLYtwNC4OzHD/iaXIwYqLmH5o0RTN+ynz1Q5Z9GtY5JAiFut52HwHj
         cSw/+gsgKOhGZ/53a1BhI/aRCp4P0Pxi5nEH4VKe00LHFyyc40O6esBSuI9cfzYBPU+i
         jKvCJhHbZOjzeIcNWPBrShfRHx2yYsCr1urwPVslwLWEZR2yOALLlwb98wID6Y7AlXKE
         iXldsKFD/LXEL4RNv/XcKmEccQL8No9yOYmr37ImnKvv/KY30FPY2H81/dIYsV3Iw4MN
         iskUItWtp5J6j9MGWSeIpgT66SzWf98DGxG9V0cv4H30MCXhcugdmk7rMS1OaxmZzOr9
         zdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760340626; x=1760945426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7tThfX+A9pJzDxQgmG7Tj5N8YTWpyW9vcBCkeCqf1Y=;
        b=TR2bEGss0IuI+iCYT+0KmRueHn//UYpCCg4cw6SxJkVLWap14c2IchQt9Dy7N/L7eg
         BQljY9W9fycWe/hD9A4oTeAWPxMJ2yaX39xKCoq7Oczxx5TNS3aIVli6ZFpNBrB7jPrP
         S+LQDM9YVWcd0vEUPKM7PHmhYz3ZK/gmkZQpSGpHWKFJEQAoH/rlTDjXl0i8ERli+0+H
         RvuiFjlHUkssO224fbAJzrUjMiGcDCsdMZ9gn48FGIBWYYQP/k7Pr/+6MiUo4zrfDvwB
         BEhFjfPge0CrmtX2rf2vr6BPFzAd1xqOJg+IqmRVK8V8F7nCOA6a8eiZd98uerQI02id
         3YbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcH1efh+g/3KOyMQFolmRtVVLK98Efy8cIM/bnBnOEkTeN+0ALmB7LWX2C6eXveV5Mszbxh9Kjp2A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIxM6etIXg2obHsQQt+G5eedBmA+yhfbTpWF2ejkCmZE5iy2dc
	dlH4F5gcDqnjHDQrKo5QUqcPLcoMoOqLwkWTc0qOBSCJMfIeOWL4PYpgSD6quGyP59A=
X-Gm-Gg: ASbGnctCR5IThVvzj/5+ibJ/E4PHRXnVUgZtwMm2sv86Scy2QIOwWk36+DoEsJQTSIu
	OLOU8lLJ/N0rTzoEP92/ZQrTvEcXT5ihockOBQ089xM7bIf/6HIUCA5lwkM9GCnA6KmeBsA1f3X
	ZWSCrJ5SCcrnWD4b1BrlJqBtEGBv0g3qBrYI0sqYhxUkDC7acSkJHPFgjlbjYH3gGTCMSgpngny
	UdR73FX0OLsxZLXuAk9ogGfGLR0m5U6IJ7NWJVr6RNQvfeak1RrOCXnMzehQMxM7lPe4auV0nYq
	pwioXfrEicLp2wuliWWakIcdfV0l09c/lXsMQfKXsab11fVOT9bhqXWUKCb0s8y2ifRGL7Uz9tl
	N/OiZFUwtqSa0ZsYa+AD2uYoJ3+GMh2CX+0+1ue5ftHgas1vwzvAj0w==
X-Google-Smtp-Source: AGHT+IF0oyexkmT+hYLMRBg1CZ0D2tPubfKPEN4EIxAjwblVTb0yV519e8lVjoOsf0C8pdo29qcdmQ==
X-Received: by 2002:a05:6000:1ac8:b0:3f7:b7ac:f3d4 with SMTP id ffacd0b85a97d-42666abbbc1mr15035393f8f.5.1760340626525;
        Mon, 13 Oct 2025 00:30:26 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d015esm17200215f8f.33.2025.10.13.00.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 00:30:26 -0700 (PDT)
Message-ID: <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
Date: Mon, 13 Oct 2025 08:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Sean Anderson <sean.anderson@linux.dev>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
 <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_003028_943738_E33EFA68 
X-CRM114-Status: GOOD (  12.98  )
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

Sean,

On 10/10/25 4:45 PM, Sean Anderson wrote:

>> ... or, you know, read the data sheet, write the driver, and _test_ if
>> it actually works?
> 
> Which I did.

cut

> - Locking is not in your suggested test procedure for new flashes
>   (although it probably should be if you're so gung ho about mistrusting
>   datasheets). 

cut

> There is no evidence that the status register has three bits (except
> when the flash has 64 eraseblocks or fewer), and there overwhelming
> evidence to the contrary.

Nobody challenged that your flash has 4 BP bits. I/we just want the proof
that you did the tests, i.e. show the output of the mtd-utils locking tests.

I also need you to dump the sysfs/debugs entries.

It's true that the locking tests are not yet described in
https://docs.kernel.org/driver-api/mtd/spi-nor.html, that's why I encouraged
you to show us how you did the testing and maybe to contribute and extend
the documentation.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
