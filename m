Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DF7CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o24m9Z1u4EeC4sRR0fF7NXg+aUijzQhfawxZPSjEnoM=; b=T/pxFetlNE+eTn
	z04tjOuUp4yQc4KMv/0tZVqmhk84ulh5pwsHyLAYLXYKbfoanna1HiQEDfuiOmGN+f3EUZoQcu9I2
	ehjQ7HpShkuqzOVfZR5wKdhuUw5B4KJ7bPdF4LfcXdk6dmpmyBpqUb0GlfrxWorezhDtWmmHBwola
	qjZ3T9gFvz+gXn/DbcvvMpd12jaBwiz6vRCsYjTikTqDubjMghoEn+E31U+wJcX/xByWaJ5K/YbDG
	I2J6H4fmTceJ/a30ztQihZARv0LOpgLSPr0Pjvhbw8BkeU9IPJ2BI+AurfmwARCQOoP32K2gS9Exy
	3CzUHEImF4XkdsVXxFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvPD-0000000F3H5-18Js;
	Wed, 14 Oct 2026 09:36:15 +0000
Received: from spam01.horizon.auto ([42.62.85.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvP5-0000000F3Cs-3o9r
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 09:36:12 +0000
Received: from spam01.horizon.auto ([10.9.15.111])
	by spam01.horizon.auto with ESMTPS id 69E9Z8cC019411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Wed, 14 Oct 2026 17:35:08 +0800 (+08)
	(envelope-from fei.xie@horizon.auto)
Received: from server227.horizon.auto (10.9.0.252) by exchange002.hobot.cc
 (10.9.15.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Wed, 14 Oct 2026
 17:35:09 +0800
From: Fei Xie <fei.xie@horizon.auto>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>
CC: <nuno.sa@analog.com>, <miquel.raynal@bootlin.com>, <broonie@kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 0/4] spi: cadence-xspi: add ACMD PIO support for NAND and NOR
Date: Wed, 14 Oct 2026 17:34:53 +0800
Message-ID: <20261014093453.688565-1-fei.xie@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c79f5f39a5656fa838e424ad2ca72fe74a1d31a8.camel@gmail.com>
References: <20260921093701.1341766-1-fei.xie@horizon.auto> <arOwdePAmoghlakj@nsa> <20260928055005.3987624-1-fei.xie@horizon.auto> <arp-E1MDFLfV1ASq@nsa> <87bj99lef4.fsf@bootlin.com> <c79f5f39a5656fa838e424ad2ca72fe74a1d31a8.camel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.9.0.252]
X-ClientProxiedBy: exchange001.hobot.cc (10.9.15.110) To exchange002.hobot.cc
 (10.9.15.111)
X-DKIM-Results: [10.9.15.111]; dkim=none;
X-DNSRBL: 
X-MAIL: spam01.horizon.auto 69E9Z8cC019411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1791970518;
	bh=lK8wRYJ+AYqo2LGH0BO63nJiMWgl09XhIwZHu37kNNc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KBet5xZ+SYMzcjpDMyHl1AZPMN/KLJHChUmaUEuu1/Ezo0XCz2TmtEE4ePiF4gUcs
	 H5tD6dspkAN2Olc0Yy0vF3Max9ZR2BDZv5SXeZx4iuWnFoja0YwkuTRlvMg54/5yfd
	 /qjKMj5HK9A4gOS/6WCnvuGFJaUif2RiYz8SSmLtaypDMPz9nvvdPtcj6yJNEbA5No
	 J/v/P934KzMetQ2ZQyAFYy/3kcUakKjNOfXIqrvPE3HDkZwGCjHJ+gkZa9E04s/Dxw
	 OKEHcANxkH3ElCBBRqIBLJez8E+jglfVtr3csoN7gZOVRclug9oZmEqlCCaCvJ+UsU
	 cLIRFrw32HElg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_023608_557173_457B412D 
X-CRM114-Status: UNSURE (   9.27  )
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

Hi Nuno,

Thanks for proposing this. I agree that starting with your simpler ACMD
support makes sense. Please go ahead with that approach. I would be happy
to help test it on our Horizon J6B board.

To clarify my earlier benchmarks, "sequential read" referred to reading
consecutive addresses from /dev/mtd18 using dd, not the NAND device's
continuous-read mode. Our GD5F4GM8RE datasheet describes page-based reads
with cache output wrapping within the current page, and its SPI-NAND
driver entry does not advertise continuous-read support.

Could you point me to the version you would recommend testing? I can
compare it against the optimized STIG path and our combined NAND
read-sequence implementation under the same conditions, checking data
integrity, throughput and CPU usage.

That should help establish whether combining page-read, ready-poll and
read-cache operations provides enough additional benefit on this device
to justify further interface changes. We can then use those results to
decide what, if anything, should be built on top of the simpler ACMD
support.

I also agree that program and erase can remain on the STIG path, given
our results.

Thanks,
Fei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
