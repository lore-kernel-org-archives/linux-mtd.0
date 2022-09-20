Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50FBC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 18:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URdcocIaderRFoXa8twK8WUNjkpf1to/JT5/nkJTSoA=; b=ygDDHacUCpx6P+
	Vhg68ft1UR0z8S5ZfldFutFY+o5xr/mehtzHA/WEuNvJTjiSzDZXq0d1AAb7KUxo88wG4T3QFdYkS
	yvglUQIAHNN+q6vF9V8gT4wz28d3Sb86qarQ5wF1q+KSk+5Dz/5/p7cvpIGTfl051iFuCE38Mqwhl
	ahNQnJaSiFMxMQoNpw9rSyT6U68vY5PJw9D6oTQZaUXJPfyYhJxqDDGpGzpVCY/oQYr5o40hXBYPB
	Mu4ZGW2xBk6SRTGtmRkxS4WhAGqcba1eotYha99tGAT3JYhhWWd8nquVDDv9kBmH1mmvfcTrp9oEc
	00MNp3zQ6MPdg+V6Ylfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiLh-005qwA-HM; Tue, 20 Sep 2022 18:52:01 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiLc-005qsD-QY
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 18:52:00 +0000
Received: by mail-oi1-x22a.google.com with SMTP id d64so1921346oia.9
        for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2022 11:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vY8sHYY7zNUoEuLbLjqUl5lsurpJUVgT1WqyEhJsWE8=;
        b=MMpj/KNqVxz+oHCOmTgPx1BIvbKWe/wPCPo4d7GodQLILghv+7qkr/S6m6cR3Kila6
         OhHVY2ETF82PAjps+SF6Eu9XkO2FMau6MY4QRnXQH33RMVm/FRzTuSH7Ai1N1ZM0WRma
         H2Hg5taBWg01mq4aQPWBPcLxlgDPU+2E/FXcY3ru2/No/T7fwsSxwzup98rcr+Ux7/BN
         EO09A/yX0P3FbS/nkBpLeII14aQBNx2+nE5dU+gCvOJeaj3jYC5kB+G9yrUcfqY0bpe+
         AEy5zeUZmCoJx/MdoNlMHmb9P1M+nTLMdkS7+IPKfn7U/ZnYadda2TAa0CiOM1IRO54l
         1qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vY8sHYY7zNUoEuLbLjqUl5lsurpJUVgT1WqyEhJsWE8=;
        b=Y3/NzGpDILWJ0SDHznBVisgYjq1JThI5zbKkQds/r23F8ISxGOxtYAu/bj3sm7AxRv
         zolT9PMQnc3mhHADmkSGXs/JGRkRoVNTeEM/6EA7jdtuIwYk3DM9uEmBnjMSmORQpDu9
         DLFoVmcUslTDsCF9DC+ltEWadeGBmYrot2OlLI0xZCHgrPPqIg+o9LgrcJyJhvpibJrd
         cqLzxZRpgoZ4J9aLa78Q9mSuI71eM/xa40qVHqmmdw5vfksXTTs8mbaX1nSLEQ+Owe0E
         S1CZRaAezSGuCq5NTZdsJA/MdoMpLm7Y6paFFcEGneS0q8bKQ5XRsfyG1LbsPsaOXpwH
         4X3g==
X-Gm-Message-State: ACrzQf3BQ4wZGeaVs22xdHhjsNmA8r9E1A/hwNHje0SDZFv7r1VLB6G4
	jKwTUVxuTiH1Km7p91EdRsDdwXHQOIWt0vy70Qyt1A==
X-Google-Smtp-Source: AMsMyM6mey0/kpmB5FqJFxrogjFkw/IEJbgHNhbIlkVR/h/IDgaOuLIZm1dytx7DrSZFsJrXL03uv7Ix3qF/X+rpPhw=
X-Received: by 2002:aca:35d6:0:b0:34f:bb2a:4f5f with SMTP id
 c205-20020aca35d6000000b0034fbb2a4f5fmr2279516oia.54.1663699914656; Tue, 20
 Sep 2022 11:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
In-Reply-To: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Tue, 20 Sep 2022 19:51:43 +0100
Message-ID: <CAHyZL-fHcyeBM-mmqQHjLidWJK77-cZgbOCjXrHDkXYyjL02ng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com, jude.onyenegecha@sifive.com, 
	william.salmon@sifive.com, adnan.chowdhury@sifive.com, ben.dooks@sifive.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115157_781674_BEC8611A 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, Sep 20, 2022 at 7:48 PM Sudip Mukherjee
<sudip.mukherjee@sifive.com> wrote:
>
> The datasheet of is25wp256 says it supports SFDP. Get rid of the static
> initialization of the flash parameters and init them when parsing SFDP.
>
> Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
> SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
> After this patch, it parses the SFDP information and still uses the
> same opcodes.
>
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> ---
>
> No change from v2, just resending again with the next patch.
> Results from the tests given by Tudor in the following mail.

Test result after this patch:

# dd if=/dev/urandom of=./qspi_test bs=1M count=6
6+0 records in
6+0 records out

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug erase /dev/mtd4 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*

0600000

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# sha1sum qspi_test qspi_read
57f8d4fee65622104e24276e865f662844f12242  qspi_test
57f8d4fee65622104e24276e865f662844f12242  qspi_read

# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
is25wp256

# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
9d7019

# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
issi

# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff9d05010380000002ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0f44eb086b
083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
11cecccd68467a757a75f7aed55c4a422cfff030faa9ffffffffffffffff
ffffffffffffffff501950169ff9c0648fefffff

# md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
ba14818b9ec42713f24d94d66bb90ba0  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp


-- 
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
