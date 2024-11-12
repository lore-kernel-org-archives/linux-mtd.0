Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041C4D32D7D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zl3+HrypRW/j+0HP+ot0nu0WI2MsTy4elkSfco6mz/o=; b=PfHuefAwhZcnyJ
	xInT8YJAGck/1wZAY5M1mJtF59MpuDcBYntLH2EgxdbtgnO0Fgk7V/j3vZLXZQZXAcA/gC3GUN062
	FBmUvEinQ4KH05OU50WtMq7fogDcVcuIP+q3EVt1rL0t4Bqtdj2p/njgRkJdrhx+aEp8t43KB1s8o
	SbuhriUyQvMQa98LC5rFDLxUEVfMZfXIYwl58AGZZb9cVqKkib3cMKc6ycil/SWBiXUg80e/lMqR7
	J/sUE16hDYE93n+Lmbxie6zwBtt5ktO919Y5ySgnaa/7CtBGY8UrfjTMEJCgIAWKqphIg8Y1tgoHg
	Z5oOtHwnpeYCVbH77+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnKf-00000002tiH-2qTa;
	Tue, 12 Nov 2024 09:37:09 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnGd-00000002pn7-04af
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 09:33:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so5364712e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2024 01:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731403977; x=1732008777; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dhi4LfKU3ipkwc8NywPImwQqvqvfcH47W144waGwl8=;
        b=YpxGmBpxdwJe+MAU5ouljxUjn0hRC9wdp5EaVYnFcL/rUdQCbLtgaGPq/0GR6J+xsw
         i2ky751Ip9IqKvyHtsz8q6Xe/JkpVsYpYENep66m57fbKkatLj4fjdOR0NunK1EKW02c
         oDQfD4Jby98CprpVW5qZfH0dJ1wPvN/M4qbP3NXbHeO5D70538tc33eAOtRcxbGI3IIf
         JHefNnPrfY0DX+u9tsTyJ0uLF44VDxa6LSWHtyMPyblr93RRR8/kZuAWsQs3hG9TQ358
         rdP1OJUQhHTzPFHTARiE/q2aSSuAHu1O0QB/MiVSRxvIUpSvgj7LqwMFOfmCXrQ0VORu
         +tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403977; x=1732008777;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dhi4LfKU3ipkwc8NywPImwQqvqvfcH47W144waGwl8=;
        b=aMOhqex208MiP2mo6tD9MN4CoULLVCDgPRwfAhjXBiegBEN3kk2xRgNSP2WZAcyxck
         EccAXXf9b9DTRPfIOdTPLecTr5MxXRJTQL73/asR+9uY/nLaN9Y9ACGhGCorE9sLTAta
         swCwF0B2ot5LNjxJl3epEmFv3HduxUPd8juFZ/khFP/XdY6MkSqeQkFo7g3otCf3G8YJ
         URt9K3W1ZEk8cITAmtfhhWDt0GZJCMnCzMMtCPsEy5V+if+FfkFoasbmlzz4ACwWJsTl
         dbBskFpgl77mj+oD5rAe+Di5p9VnZMn+8z/gHzq8HECvMXu9EvRaUc/QiYBQ3lHJICpV
         W1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5HgfviLpyVa78Mvzxs9tP63cdBTKuGUuDAn2JuMpowDbUUDDgzjQ4Uht2sU5wjw5tCmVEUM2SOTI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzpJG+Rv9qGRIBzwI1JdHNtt8KmtCl91QoHxegiptbRCPu+1a6
	VklGqK1vyIpB7lNUvdIo2oX+ollwYyBEI/gKLRjizw7KRlnobOxUHU43D81Ii3Y=
X-Google-Smtp-Source: AGHT+IHRp2bDx3H/YnbEHx56PZp7Niz36cAYZ3sBhFurqZsEqELAEZ5g9IxMMtCuhlrB2T4yeezGcA==
X-Received: by 2002:a05:6512:1045:b0:530:ad7d:8957 with SMTP id 2adb3069b0e04-53d862f7e1amr7186226e87.49.1731403977169;
        Tue, 12 Nov 2024 01:32:57 -0800 (PST)
Received: from [192.168.0.62] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97e62csm14825855f8f.37.2024.11.12.01.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 01:32:56 -0800 (PST)
Message-ID: <2d182f21-9766-4c05-8b97-786af69666a0@linaro.org>
Date: Tue, 12 Nov 2024 11:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: [GIT PULL] mtd: spi-nor: changes for v6.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_013259_219941_040E5D46 
X-CRM114-Status: GOOD (  10.67  )
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

Hi,

SPI NOR v6.13 PR includes the mtd/spi-mem-swap16-for-6.13 tag that
contains a patch for SPI MEM and one for the SPI MXIC controller. I got
Mark's approval on queuing them.

Thanks,
ta


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/spi-nor/for-6.13

for you to fetch changes up to 98d1fb94ce75f39febd456d6d3cbbe58b6678795:

  mtd: spi-nor: core: replace dummy buswidth from addr to data
(2024-11-12 10:31:17 +0200)

----------------------------------------------------------------
SPI NOR introduces byte swap support for 8D-8D-8D mode and a user for
it: macronix. SPI NOR flashes may swap the bytes on a 16-bit boundary
when configured in Octal DTR mode. For such cases the byte order is
propagated through SPI MEM to the SPI controllers so that the controllers
swap the bytes back at runtime. This avoids breaking the boot sequence
because of the endianness problems that appear when the bootloaders use
1-1-1 and the kernel uses 8D-8D-8D with byte swap support. Along with the
SPI MEM byte swap support we queue a patch for the SPI MXIC controller
that swaps the bytes back at runtime.

----------------------------------------------------------------
AlvinZhou (3):
      spi: mxic: Add support for swapping byte
      mtd: spi-nor: add Octal DTR support for Macronix flash
      mtd: spi-nor: add support for Macronix Octal flash

Cheng Ming Lin (1):
      mtd: spi-nor: core: replace dummy buswidth from addr to data

Takahiro Kuwano (1):
      mtd: spi-nor: spansion: Use nor->addr_nbytes in octal DTR mode in
RD_ANY_REG_OP

Tudor Ambarus (4):
      spi: spi-mem: Allow specifying the byte order in Octal DTR mode
      mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
      mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
      mtd: spi-nor: winbond: add "w/ and w/o SFDP" comment

 drivers/mtd/spi-nor/core.c     |  5 +++-
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/macronix.c | 99
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/mtd/spi-nor/sfdp.c     |  4 +++
 drivers/mtd/spi-nor/sfdp.h     |  1 +
 drivers/mtd/spi-nor/spansion.c |  1 +
 drivers/mtd/spi-nor/winbond.c  |  1 +
 drivers/spi/spi-mem.c          |  3 ++
 drivers/spi/spi-mxic.c         | 17 ++++++++---
 include/linux/spi/spi-mem.h    |  8 +++++-
 10 files changed, 133 insertions(+), 7 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
