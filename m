Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C01C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qR3ib+dfFds6PbYNYrUBAEbnPw3ye9ho4hhglDE9K7E=; b=M3VjkIfxCnpj1QE8cpngDNR+ML
	KNGtEbenxSfPWQj3dOaQlCxpuvIsUJRdquwXslLLeLCb2sROl+EmjoZYPuErKQAkEeRdskorJydYc
	qPKoeA/b+xSF1q/VqrAE8ya6ea2xIG65z523NSBKsi1MxTdJUVcKmgR1iDSa5og6s2tjEQ+DUpMov
	rfZFJOHvHYuuj/Xr5j8h9BM/2vM4Qil1GunuM1NUKhLKA+DdUWj26wBJG4qpOFnCw0uZ4iAC9aaFI
	V5UWiZeJgi6sXzigrXK/Aormhd/iQizqKn4p5vn6VI0scty6Hf1GQag90AbrPX1DgsJzn2SZN6WiY
	kXRf8z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWvss-00D2MD-Gf; Wed, 23 Mar 2022 07:58:22 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWvsp-00D2LV-UL
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 07:58:21 +0000
Received: by mail-lf1-x129.google.com with SMTP id t25so1305631lfg.7
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2022 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=EWGluHY41oB2DNwYR/phH3xA48/at0G7MqW79wqI4To=;
 b=mD/yJdWlr7hdTZ+720n8ehdTlJj+FZJJ2gvXx6OfoJpRJVvsyreCkTBtfzrk2PnGSk
 ioYkox4KA93oroRoojtfUByvv80mxXYao4y8/JJIprdEuTbMWcjxsalSNgl9Q0Khmhhh
 8CwVoJzRowensT98LhPb8+p/EwdRpW1NprP5lAFFQPUOhq0w1e8SGDxAV+8FZGUH5HGA
 l5MgwhN83OTg8xzcbuu/GUL93SPUkbBy+oeEfosC6Hb+WybN7hbV8IQgxzNiVX4gaD80
 6+8VO3beabIi8EBEJdsGo774WcCAY53yYIoufcIFZzFfkBtRnx8nbhB9JUog2JEY3SAp
 9k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=EWGluHY41oB2DNwYR/phH3xA48/at0G7MqW79wqI4To=;
 b=hcWQOSN5e/XYvwj0hTDzwXnShfMkwUf4adVe90mpH5QZr437La5fRazWBaZu33obnS
 /vOdEc1bp8NGLzjTOtBPCLPoRuV51i7gVPWPXJvtIQyVXTtd96TBsAj9CeXgJse10U9m
 oZ5rZ60vNrd8M3RvKUKMsFaS1KrI2FS0vFlRglr68rktJPzMp2ABWidJp4dcKf0DWIoS
 Km0wkPpALGL4QrKMw5dv1f4zuDSgHVp2xmivQ6IoHqkCDIjWZWrMv69N+MrXiJGdEYSr
 1lYZZhZCh7UrF+UmsOBMMg+ycU+/7m6FMalqhPzvfe2PLHs9owqXJrW2f+7bNQscj0P1
 4L7g==
X-Gm-Message-State: AOAM530CyGYhs6L3dKSmXSXOKHPXv93hBr3mP1I3murJl8kcbcgN0Wzo
 VQCXwxDf7IEy6X7mSAHcYdM=
X-Google-Smtp-Source: ABdhPJzCUqZhbmXbjctr1cZXYzwtGrqnZhmaz3GV8vsUGv1j0WeJPzm9xjryQbwg+sEfNJrwiZGrQA==
X-Received: by 2002:a05:6512:3e0d:b0:44a:1097:ac with SMTP id
 i13-20020a0565123e0d00b0044a109700acmr15758346lfv.405.1648022297823; 
 Wed, 23 Mar 2022 00:58:17 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 q13-20020a196e4d000000b0044a0f41ecb1sm1820550lfk.61.2022.03.23.00.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 00:58:17 -0700 (PDT)
Message-ID: <44064faa-e7f3-a17b-62da-000d149ff285@gmail.com>
Date: Wed, 23 Mar 2022 08:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] UBI: support EOF block marking end of ubinized image
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
References: <20220318155304.14916-1-zajec5@gmail.com>
 <085c994f-1362-8757-0432-fd612a38430c@gmail.com>
 <c47d1b8d-772f-aed2-8b82-ee5385c96dd7@huawei.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <c47d1b8d-772f-aed2-8b82-ee5385c96dd7@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_005820_016891_B22E7591 
X-CRM114-Status: GOOD (  21.23  )
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

On 19.03.2022 04:15, Zhihao Cheng wrote:
>> While I personally think that UBI should provide *any* solution for such
>> poor bootloaders it has been stated upstream won't accept this hack.
>> There is no idea for any other / cleaner solution neither.
>>
>> For details see e-mail thread:
>> Handling ubinized image flashed on not erased flash space
>> http://lists.infradead.org/pipermail/linux-mtd/2022-March/091993.html
>> http://lists.infradead.org/pipermail/linux-mtd/2022-March/092081.html
>>
>> This patch is meant for downstream usage in projects like OpenWrt /
>> Buildroot / Yocto / foo.
> Does 'downstream' mean this patch won't be applied to mainline? Eventhough, I don't think this modification is sutiable for common scenarios. The UBI image provided by poor bootloader does not follow the standard UBI format defined in [1], and linux kernel should have recognized bad image and rejected attaching rather than tries fixing bad image.

Yes, downstream means carrying on that patch in projects using Linux
kernel (I named few). They have to patch kernel with it before compiling
it.

Upstream means simply:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

I'm not sure what do you mean by "sutiable". Linux doesn't really offer
for raw NAND flashes anything except UBI. So that's the only choice.

Of course those poor bootloaders don't "follow" UBI on-disk format. We
all know that. The problem is they are there. On millions of devices.

People out of your utopia still need a way to use UBI with them. All
crazy ideas like flashing intermediate firmware just to flash a target
one properly (with UBI proper flash setup) just don't work in real world


> Maybe there are other better solutions? Such as,
> 1. For 'EOF' ended image scenarios, DIY an userspace tool to convert bad UBI image to valid UBI image.

How does it make life easier for anyone?

1. Every distro still has to carry on such user-space tool
2. We don't have any intermediate rootfs so it needs to go to initramfs
3. That may confict with other initramfs usages
4. It requires scanning blocks twice (in user-space and then in kernel)

I don't see any gain from moving that task from kernel to user-space.


> 2. Erasing/Formatting the whole mtd partition. (BTW, why does booloader only format part of mtd partition? What will the left space in mtd partition be used for?)

Don't ask me. Ask ASUS, Linksys, Netgear, TP-Link, whoever. I think you
can even try Huawei - they seem to have some Broadcom and Ralink based
hw that does the same.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
