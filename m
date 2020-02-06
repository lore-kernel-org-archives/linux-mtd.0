Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5401AC35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 21:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248D720720
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 21:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LpjG1PXE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggFKmmC7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 248D720720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=S+yyMC27tTUB4X/GBpU2V9SmsZroetS0ldCtbVZvgBQ=; b=Lpj
	G1PXEkhmXdofYDfoUf1CGewJQZaO4//Tz+hOXpjthR35Z810rUrT4Xn42ysQNi9RvXnr4trWYgpX3
	tR3rSMgKL6L/nRS+txtfdCATpja0wRkSBdiseu/tO5CAkSlNfdNuNv/M/5d5pS40mFTl6T0NXwCGf
	qhFwcDjfTZrOuyRPbjrdAyx+1nefbvNvhicNuffjQxGwz+5hCuU+6Q9NcPeJkumSzGGgYbp9Ombb9
	cFxHnbhJ0gQYpxG7jqgLMCWq31WL+dVHg91vMlhIMn324Dg/qeNbMje7eWEL2UDkyD1oZxvEm8yla
	vl1CB03ncthNK8ygJnsC6GPHW9XUcUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izoJW-0006Oj-C6; Thu, 06 Feb 2020 21:03:54 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izoJT-0006OP-T5
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 21:03:53 +0000
Received: by mail-ot1-x32b.google.com with SMTP id a15so45033otf.1
 for <linux-mtd@lists.infradead.org>; Thu, 06 Feb 2020 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RsW1WN8kxKSa2f7YzzPazslyhuqLKMpGptNBenRwOk4=;
 b=ggFKmmC7xMzy26Ot2hc+I8kVqjH1Xk7jYd7Gf8mh/jGHb6neHN7aDKnLgg6SfNRBOS
 lFavpr1PFJO8EEYa/fbV/gmDgkxuXpK3hM1+848QrYlMwrKR4haSgwSxlZM0J/QgqM1C
 oDJKiJLJtE0NIunlTAwogyILgxdIvNtLvWT9VSUFLPTK06PumS7T9KNpDoUVpsqyfYT1
 OkVaXMsgekF3cM7ro8SanIAblEw93KTOyQ8mI4O8K06aCcL7VZdRdeqkdS7tU/dyrVpk
 7+7wMYHF1O3mw17sar49BmGzJeVP6vk8Pv2Vmc8B2u6G4MGuBVVh8uHYiXiKxQzvWC8Y
 mlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RsW1WN8kxKSa2f7YzzPazslyhuqLKMpGptNBenRwOk4=;
 b=NwVWoYM9dxv61ewd/EFfLqG0kFmpyzRoj5dihiGTD3LNc820ACMWAFVdYc8cImOI6y
 XGBrZZShgJN86wFF573Et5whHFoPab/hEmtXA4IYWxzO+ZAQn64G2JQxxZnU4D9viSrk
 r/qEhkitLNNRvy33HEzDhgzUCfmQperPtPYlICLHJXomD4VNIP2Kph4R/0ARX8OKmyrT
 FC1Bepjq0UTWCEX9gIQ2dZviHpMxOm0gW6wdFVJbJKFFqBaYMHjeA9FWfA7wW9/JI/HR
 ZvD+wdq53/hkMLZ/DfejrkO/c7SnLyx6srA68TEDL59FumzEOfJ0RxamNOaJVl5ncfXO
 kBbw==
X-Gm-Message-State: APjAAAUnYq0VV2j5er264oyoRt+PSZcHDb2cNCw+HIQ8BD8nAM9mBK3n
 PCzoe+IB4MQ14VBPRgH2m4XjnZdY3/8UGruHtogz1xJlTIM=
X-Google-Smtp-Source: APXvYqz0B7oGAhdkj7Vwc1BZDaEOMCKVicYu8zLB2asW/eCaJLJNfUSZNQdUHuH2Y44Pqef3ClCPHeovZ1O8J+IyFVA=
X-Received: by 2002:a05:6830:1643:: with SMTP id h3mr43668otr.70.1581023030367; 
 Thu, 06 Feb 2020 13:03:50 -0800 (PST)
MIME-Version: 1.0
From: ron minnich <rminnich@gmail.com>
Date: Thu, 6 Feb 2020 13:03:39 -0800
Message-ID: <CAP6exY+S8_CGSRysJgYXeGcmqdhRMW910PJtLvXFdCvWGwaGPA@mail.gmail.com>
Subject: intel spi on atomic pi
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_130351_939251_231C05A0 
X-CRM114-Status: UNSURE (   4.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Greetings, it has been, literally, 20 years since I used MTD ... and
it'sl all forgotten :0-)

I have a bunch of atomic pi boards, this chipset:
00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor
x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36)

or
00:00.0 0600: 8086:2280 (rev 36)

I'm pretty unclear on how to get to the spi nor. I've enabled all
sorts of configs:
CONFIG_MTD=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_PARTITIONED_MASTER=y
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_SPI_NOR=y
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
in my 5.5.0 kernel, but ... no nothing.

what am I missing besides enough smarts to make this work :-)
This is not a modular kernel, does that cause trouble for probing?

thanks

ron

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
