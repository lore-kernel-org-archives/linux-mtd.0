Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FCAC982E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zS8JdrBogi01B0jPAXaeYkFimru9vfwDiAtqf6UIWw=; b=u5zuzpj7Vu+Xtn
	gZeTpGQWyx7ErAoFAWzRfqWcDYKpgElzUtMfu8FnUgqR4kxmUdgQhtoZrqrYAb4IR902baVZ3K3I3
	nzdP56Kl7k+xUJTiS++7A3QhLVnFCpap0FjfXp250fdL2l/hG6LwYVYUKWZjHOAaposHDnfoDm/Cw
	J5vtUe4/zDP171lmKSXHuinc9JC3Do8i7KtnKOKyIMrNFhcL1NoTf6nV2u//ZMzqtSkSvfzX6zkz8
	jrTPoCf2piaorgrm+gDYXTVfhFhrum71sI7i1LvNNdYXkHhEmg9GpIAoLatgU2+M5FXgb7M6GTmvW
	QGixb/glebdS38Mm8/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YpR-00000001Gkw-1mxi;
	Mon, 21 Sep 2026 07:52:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YpP-00000001Gkk-3zXh
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 07:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB603600D1;
	Mon, 21 Sep 2026 07:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82761F000FF;
	Mon, 21 Sep 2026 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789977162;
	bh=U7DD0xHw7espI4/AnC7KJkdaffmkOcl1dyECwif58s4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e61YYWJ6AYV/TOnS7KPTiAWp9tyjgmCpVboJIUrpMeeDehRlGlDx7RkTQc0tH5vQr
	 Q9ISacvKRlRCzGw40FWvIHQZ8A8ZTIqdUWXZHjUBeFPx2xNMEIwZFqu2+TmYfWYr0E
	 kiwnSxxWxxb/qQdsvV8KSxWWgo9IXjCfp4VFXZ1CbPhqlf8vfRAFGbzf9uti1qFRfD
	 7diACnUzwA6wsUZ1UgNq3cdv4f4Vc1wnu0dmRGBDuWMaTmkrQaKoz1w4nooud+NKyZ
	 D14Dy2Kt98hJm0obju2xWEj1LtsRXiVHzm08ZF6FtHdrg9x85L4SOLp9ob7nDZYXWn
	 wacg7ubgpLnOw==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
Subject: Re: [PATCH v3 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Message-Id: <178997716061.3543798.10663289831575576446.b4-ty@b4>
Date: Mon, 21 Sep 2026 09:52:40 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Mon, 21 Sep 2026 08:43:31 +0200, Miquel Raynal wrote:
> Compared to the previous ones, this series is super straightforward
> since it leverages all the core changes that have already been done for
> the JV/RV families. Like the former JV/RV series, it first cleans up the
> table for JW chips. As I have access to a lot of devices, I made test
> runs with almost all of them. This way I could extract the SFDP data,
> the capabilities of the chips, proof that they passed all the tests,
> etc. I then add support for the PW parts, also showing a full test run
> in each case.
> 
> [...]

Applied, thanks!

[01/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance identification of the chips
        commit: b1c987abe26f6b8614888c93dfb088193eebcdcc
[02/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance identification of the chips
        commit: 96601905963b030a82b9ba4b0df98d8681c6a002
[03/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking information
        commit: a0d9dedd3423efd069bad9f181cf69c7dda76464
[04/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking information
        commit: a13c9bf62caa62a4cb96d7b85394346cabb73496
[05/25] mtd: spi-nor: winbond: W25Q128JW-Q/N: Fill locking information
        commit: acaacdb1e75d7ebca7ffb1fa97f149b08ea0fd3e
[06/25] mtd: spi-nor: winbond: W25Q32JW-M: Fill locking information
        commit: f81793c87530d45e96c5a012fd35d87457328cd1
[07/25] mtd: spi-nor: winbond: W25Q64JW-M: Fill locking information
        commit: 6af98fcf79a5d86822d3863802ad063a7ad6ca7d
[08/25] mtd: spi-nor: winbond: W25Q128JW-M: Fill locking information
        commit: 9780e26196039d7a67c915409e22c87db6b721d3
[09/25] mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking information
        commit: f5e252b178066ecf4efe5abf2b0438242199a1ea
[10/25] mtd: spi-nor: winbond: W25Q32JW-Q/N: Add quad page program capability
        commit: efb7901c6b4d039d4a9a995c0710517b7217cbf0
[11/25] mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad page program capability
        commit: 016d9512933789a5e23608cf0839288f894b73a1
[12/25] mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad page program capability
        commit: d83b5c1df429b5df707046fc6562c60432445b32
[13/25] mtd: spi-nor: winbond: W25Q32JW-M: Add quad page program capability
        commit: afdf4a8c316bba78d8e72a2e113c63427504ca85
[14/25] mtd: spi-nor: winbond: W25Q64JW-M: Add quad page program capability
        commit: 34d7f1f5f1aab0c7b08599f0b77611d79b1377a9
[15/25] mtd: spi-nor: winbond: W25Q128JW-M: Add quad page program capability
        commit: 3520931436ee2ac2720f097c856aea01541ded60
[16/25] mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-Q/N parts
        commit: a95136c1c4756885e4d333c7968b716f9008ee99
[17/25] mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
        commit: 93a72776acb954814940af8b915e609e1b18893d
[18/25] mtd: spi-nor: winbond: Add support for W25Q64PW-Q/N
        commit: c0f1355cece2e2bd19d62a35ba1b66bd09e89bde
[19/25] mtd: spi-nor: winbond: Add support for W25Q12PW-Q/N
        commit: b8a959f55f9f1806865aa38304289d2abaceacf4
[20/25] mtd: spi-nor: winbond: Add support for W25Q25PW-Q/N
        commit: 136588c583adc2c73934bb0e89877fd1a8b91305
[21/25] mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-M parts
        commit: b60627be8faf82b2c64d86c83c27c730423d0524
[22/25] mtd: spi-nor: winbond: Add support for W25Q33PW-M
        commit: 03613e40f15d704013f90b2405c4a3bc6b751207
[23/25] mtd: spi-nor: winbond: Add support for W25Q64PW-M
        commit: d96b00b230d0512844d0e9c9bc391cdc30ab653b
[24/25] mtd: spi-nor: winbond: Add support for W25Q12PW-M
        commit: 8df89f0fe8e8ecc345c5a9e3ce49e41139eb4a0c
[25/25] mtd: spi-nor: winbond: Add support for W25Q25PW-M
        commit: ceedf3193cac49ddb488518616587484093d66e4

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
