Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B7CFA750
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I1Qod7x1+/FYNrx63E9ouUGXp2A9RgMEj86b+OdykqU=; b=vVadqEJiV/9n6e
	qAxWVtbFX15Nqdzca3HZn248I1NqwUd6Wj6wwH72aeiP6sKZvTGVCiwPV7GE15M42DcM2huvn/BrD
	ZU9wFr32Snj+kZ60vX48jvLdWK6paEJTOX03Up8PCIbwvLU+njT1meB1Kofar4hOCyWMWrdmhqrzP
	F8KsG3/+bLJw+bCk/1SurzH4Z85ZHBOJJTxlphOuh4MkJgXMoq0y/tZXdeQGfiQ+NdUSSZ6BdjA/T
	4W5DDmW8Vp0FadQkLs4P8kAJ91OlonNs/INDstYY04ISVVv8JyRS/JkD0Qs5Itjk2CaZFJj+DU5lg
	kUbN9V1kFqJw6VF8tLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdSL-0000000BMYg-0jd0;
	Fri, 04 Oct 2024 08:14:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdMv-0000000BLKZ-0Evy
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 08:08:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a8d4093722bso261764166b.0
        for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2024 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728029335; x=1728634135; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4auiUipRSvioY5qlUieN0FCimA2FylPsygyRNrf3t9I=;
        b=UczJ3pBKMSDXNI+VP/iFGWFzQhVnYlO94fMPy33om6gWxS6YMWc/9/er3r8fjUtBx7
         zAZQ95tdGMui7Py84OTaqrwQ3VHV0wDNGpPYivUmTqNBtBbPb4uYwtyUYv8gVo9d3zqF
         BH/3Sy7ThMQfJwAO2u60IcEt0kJhtGR3WATUvTv4wWRkkoVlnyLw5RtRzP+0g/mCTwsm
         S/gmSKdi/dU/2+9QPOw6//obHA530XYVVIwjjw5v1ABQAv2kWiejiUPU2AHhKKC4str3
         W+IyHqSibYzUFbPYrdyQ/L1eSElqANmLOo8H/0jd+8Df73imFXcLdF69DDuK+jXICQeC
         OKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029335; x=1728634135;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4auiUipRSvioY5qlUieN0FCimA2FylPsygyRNrf3t9I=;
        b=TuWUSQT0tXniWApeOdVuQSgWG+Ny2PMtwsrUlb9C9DuXor7ZnuqChIkUQWOjogStNv
         3xtWtzyfmV0y7mi7yX182MnA+9S9+SHGMnC2Ey3eL21HjNftFooQNfZhijKaO/B2uCrZ
         C+N0v4Nh1Np5oxzwhXVy2udY6HW/5TR9U/hK3bWPAun03F6dxvSU/3ebikKnqfG7rMQB
         qrGGGQm1POfXnjSEqan3fGBO2lx9Z45KFmhFOvSBDgYHjXdUUj8GGi5b7NIP361b7/zS
         HhHwO6SZwr8E6p3v7Rf2pVNcUAMOBfiWE+QULWgFz/ZE/g2xl8EFg7qx50QQK532oNLS
         xtHg==
X-Forwarded-Encrypted: i=1; AJvYcCWo4YkBBRvYHsmhaZTph8fa3OZPtqLozbQGGZcIrc3MLwwbr0MEXK52qmBgM9dTN3QkyjuDq72WksU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxluLABkm63NfJmTq+NaCYA7q3InQCCHHjEOG5aoq2g+/EuRaqu
	wiBXWDaoUW+W1Dhw5FdBPsHS9gVTcu8BdadrLGJluPOjvlxZPeAizf5BeUVLg5s=
X-Google-Smtp-Source: AGHT+IFgl/nvfLhcNVun/syHAmXlZefx9G+73C15fAoSRXNCIuh634p0eFrgfM/y8L+b25rL7WLqkA==
X-Received: by 2002:a17:907:9306:b0:a86:b64e:bc4d with SMTP id a640c23a62f3a-a991c033557mr210668066b.44.1728029335197;
        Fri, 04 Oct 2024 01:08:55 -0700 (PDT)
Received: from [10.11.12.174] ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910473a89sm193047166b.149.2024.10.04.01.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 01:08:54 -0700 (PDT)
Message-ID: <5b2bcd4d-faae-40f6-908a-63f4dbb02adc@linaro.org>
Date: Fri, 4 Oct 2024 11:08:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Cc: AlvinZhou <alvinzhou.tw@gmail.com>, Pratyush Yadav <pratyush@kernel.org>,
 mwalle@kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 richard@nod.at, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 chengminglin@mxic.com.tw, leoyu@mxic.com.tw
Subject: [GIT PULL] spi-mem/swap16 changes for v6.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_010857_139749_2A3B4B7F 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Hi, Mark,

I've made an immutable tag for the spi-mem swap16 changes. I let the
0day bot run on them, I got no complains. Pull if you need them.

Thanks,
ta

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
tags/mtd/spi-mem-swap16-for-6.13

for you to fetch changes up to 50cb86f21ec2ede08d0ec0479fbd8697a8a25616:

  spi: mxic: Add support for swapping byte (2024-10-02 09:44:57 +0300)

----------------------------------------------------------------
This allows specifying the byte order in Octal DTR mode.

There are NOR flashes (Macronix) that swap the bytes on a 16-bit
boundary when configured in Octal DTR mode. The byte order of
16-bit words is swapped when read or written in Octal Double
Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
Swapping the bytes may introduce some endianness problems. It can
affect the boot sequence if the entire boot sequence is not handled
in either 8D-8D-8D mode or 1-1-1 mode. Therefore, it is necessary
to swap the bytes back to ensure the same byte order as in STR modes.
Fortunately there are controllers that could swap the bytes back at
runtime, addressing the flash's endianness requirements. Provide a
way for the upper layers to specify the byte order in Octal DTR mode.

----------------------------------------------------------------
AlvinZhou (1):
      spi: mxic: Add support for swapping byte

Tudor Ambarus (1):
      spi: spi-mem: Allow specifying the byte order in Octal DTR mode

 drivers/spi/spi-mem.c       |  3 +++
 drivers/spi/spi-mxic.c      | 17 +++++++++++++----
 include/linux/spi/spi-mem.h |  8 +++++++-
 3 files changed, 23 insertions(+), 5 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
