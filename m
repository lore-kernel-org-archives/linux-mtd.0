Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A55FC36005
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Mar 2025 22:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y+VNw9di6GbGTI6SCl/yV8XDQ/sy1uimRtfPMcMNB94=; b=jKf3MSwHpb4w7p
	ClnYsWDboEpuNA8q3uBfSKhoPbbrVHdBJoWfaGSRVShZOZQVRo70D9hiU2TcLzLnfi7qVQR55KmCh
	2kVB6KfaTUR/wwA3GjiV/uNPLGWXpZUfYw52ORnS5nQyG+Ohu2rwKzE3kIjKadLcHNWbZeACE+KGG
	IABmFicBIKbd1mxHHofRqhx6wFzap3AYg2LHHks/0zK92SOr/ZYQBlKF+EGl85PQugJrHCNG6ChIQ
	Z4g3HCuXrphsV+TakyvV1B8UHOgclJfC/xMd+LBCJmRD9BQSGNasTOoT4N1WzWjiAwnc4iuoLEQZK
	kj8kKOOYKOYWAAdanZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twpys-00000004PAz-0mDR;
	Mon, 24 Mar 2025 22:09:14 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twpyo-00000004P9T-2QwH
	for linux-mtd@lists.infradead.org;
	Mon, 24 Mar 2025 22:09:12 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so8959376a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Mar 2025 15:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kohlschuetter-com.20230601.gappssmtp.com; s=20230601; t=1742854149; x=1743458949; darn=lists.infradead.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+gsjgrQK4Br0Rh34gYwu9Hk/4b7CYK/xQNIdQkgALE=;
        b=bgC92T3EjwYCimBfHqzC5MVGqjlgS/JOawbOTQFtJDt/CNk4Gm64JKpDnQHmw7oLLu
         Ba3cUp/pKoX1ZaPZUfrccWa9OXc7ygxc35xepUMJrEMuIZNShJ2XbSe46LNcXZDBX2cP
         Kh0Mvk30ZtLQczTbGJTpzoZk9kef/TMsSRg4GLsdqOnSJ83b2xJ2BdIcklc+b6hgY/c1
         IXuhQy6gsHSZAxO8BWTzY2D5kChK94hkiB3noidCQRYe3vbsK6YW+wh3CenLztjUFuV9
         5G9XpOpRAGuFpCIa0ZB7jm6QKGRriw26eZzEXd4rduwBM79d9XPDUlA4cjeqUq+cKEKe
         9rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742854149; x=1743458949;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+gsjgrQK4Br0Rh34gYwu9Hk/4b7CYK/xQNIdQkgALE=;
        b=inv8htPtJTTutkQR4UZMchbIqW04dSmmnm3hGLqNpbV5UJsuMIvGYy3+Q3YRz3oEZR
         ODW5i3QtEgtFa0qxeKxqm30uqkCG6lCe7L+uY3kVxfkDO8DGNejQshOKNjbnVFvrpz2q
         rsvCQ9kucJvoWh/LWrbHuAtxZVXl2P49Xw6aXaOhrPRnnuwO6aher+vM7p0dNFQf/loh
         McoswCYAs98eYHkBJZjFTr5SWXpU5AFJTznvUzV1Z37ldYM1nHmcUdkQfWcjs9cKhf1s
         Vcv+M2tCZg1Amq/i9L/E6KyP2E246xqxMyxc8JYc+aXrN40myXkyYO59hyf1YqTWO6oX
         WGPA==
X-Gm-Message-State: AOJu0YxV3zMYXzsjDc1EXahh8/P6TcV4vlZIkHhSIcPAWTPwJT60tUA7
	NQxEPKEE44NtDTs/Z26w+quJ30QZQ/zREJm3MRE99jgB+Xjt7i9wEKfr+DeCyn+5o3adKL1UcMa
	T
X-Gm-Gg: ASbGnctlt/IoMUq/1HIII5rv9HuL+QiWHIUSak4sBWMI8GyV1LxP36kjTVhao0gCCPt
	iT97vthK6yHbV+H/jbMZggCbqzyff7Ki+n0xGBspEO+hLPbgdNw+B3e42//NOZvVi3ul0UQbeOH
	GOl6MCUv73nc7AxJdUPSzS/9M4Bb8kibUeS1TY+NM+yrZ81TMhmpYFGiV6EFIuY7T9ajqzzdcFG
	Uug5U4EzsB60IyD2hQM102njrCs1lVMMEMNK02pLC1xXkcV/S9vtuQD/Bl29F11IfGOVpUHzJ1C
	P0mUlXh2ZKWmHLbHVkHYtQSbrwSBgxzIr8R34MFMs6FqVb7BFz2VDII71MbLCaqHEvXU
X-Google-Smtp-Source: AGHT+IEC9bYMc3by5IBKIdyKYMCqsHZ5bR20Keuf0Lp7ZuvAEgiX7clqej/K36RY/9XsCGz4m2jwQA==
X-Received: by 2002:a05:6402:5114:b0:5ed:125b:2687 with SMTP id 4fb4d7f45d1cf-5ed125b2defmr741356a12.13.1742854148568;
        Mon, 24 Mar 2025 15:09:08 -0700 (PDT)
Received: from smtpclient.apple ([91.64.76.218])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0c6f47sm6651574a12.52.2025.03.24.15.09.08
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Mar 2025 15:09:08 -0700 (PDT)
From: =?utf-8?Q?Christian_Kohlsch=C3=BCtter?= <christian@kohlschutter.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Cannot flash SPI-NOR MX25U6435F on Odroid N2+
Message-Id: <8D10D785-2C5A-4695-8BC1-C7F54050211A@kohlschutter.com>
Date: Mon, 24 Mar 2025 23:09:07 +0100
To: linux-mtd@lists.infradead.org
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_150910_887648_3CA9347D 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi all,

I'm trying to flash the MX25U6435F 8MB SPI-ROM integrated in ODROID N2+ boards.

Using Linux 6.14 (or any other recent mainline kernel), I can't seem to get any changes persisted:

sudo flashcp -v u-boot.spi.bin /dev/mtd0
Erasing blocks: 289/289 (100%)
Writing data: 1155k/1155k (100%)
Verifying data: 10k/1155k (0%)File does not seem to match flash data. First mismatch at 0x00000000-0x00002800

Relevant kernel configs:
CONFIG_MTD_SPI_NOR=m
CONFIG_MTD_SPI_NOR_SWP_DISABLE=y  # does not make a difference

With the same userland tools (mtd-utils 2.2.1-r0 running on Alpine Linux), flashing succeeds when using their custom kernel (based upon 4.9.337; odroidg12-4.9.y branch from https://github.com/hardkernel/linux)

Note that both kernels need a custom DTB to enable SPI (see ic/meson-g12b-odroid-n2.dtsi).

Linux 6.14 needs these additional entries to meson-g12b-odroid-n2-plus.dts (odroid's 4.9.337 needs similar changes)

&spifc {
        status = "okay";
        pinctrl-0 = <&nor_pins>;                                           
        pinctrl-names = "default";                                         
                                                            
        mx25u64: flash@0 {                                  
                #address-cells = <1>;
                #size-cells = <1>;             
                compatible = "mxicy,mx25u6435f", "jedec,spi-nor";
                reg = <0>;                                       
                spi-max-frequency = <104000000>;                 
        };
};

&sd_emmc_c {
        pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
        bus-width = <4>;
};

Any help pointing me in the right direction is greatly appreciated.

Thanks,
Christian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
