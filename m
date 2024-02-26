Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791C8C48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY2miBmwIDGe1gh09XXr8K8fjbqRc/tiuDAc4Eh4TQY=; b=1pXknUrSiAwvfq
	TVGt6bGMA0y482Q73awCIBvG0IEBULGpmh6+eOv8g6YaLKLJe8SvEvTpoCvQDhlp15MhQ/PMTLVP3
	053EWPKjwWnDpt+ubahdsibVtNlPO7fXFtOGKeU9U2HH18NsDuPi+UjWUf34KAMuVyKwx5JzTjess
	vNcrZqOgMibyFrFJgdqtcXuuE5QaEWleJoiwNpIcgT+6NXyfcZYn+mHZgd0rVMRYiUmJ3LdD630zj
	JbgGBU3h5//PCGlfolh/ZJh/rrsxYRtiRGUmEy2z8Zg8lyxg/7AZxEvrcCtBwwONW6sSyq8K/3m4z
	TKfUKWZlWBvJpFZ/vnqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYV7-00000000AH7-0Mfh;
	Mon, 26 Feb 2024 10:46:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTr-000000009S3-3D6M;
	Mon, 26 Feb 2024 10:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fPexO6DRjAqEh41hFAbTYxuEnPMPjtTxwMJrh7MLMNs=; b=Ww6886SDXZZ2nj0htHlHBvUaOC
	Em3HIXq8y6NOXH5MnOQe7YNz8eJDw/1K3g8tW8RivjGKuiIcyw6DMipD5q02b7NyoVRGLG1A89UID
	7+j6wRtnPtTsbPy+cMF6rNXxiPPtAUiADHIJvds02gUbUTERf1HxJIS/lbQ+uha1Ra8OnsGx5w5WO
	8wcTcjRCuNLv4mKpydZxYkjW6B488FpjZkjGbBrcEHl9AS+kTT+cKqC09hVAAzI7r/Gp0BAVHr5IW
	nhgYxBJDDmpCo2TWSpaWKlYwNkdpEUTwwz6WQQ+yZJvSWTLySG2T0qiACLZvl3zXs8PeaiBnkRTux
	SHSezsLg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTn-000000017z5-1k31;
	Mon, 26 Feb 2024 10:45:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A7AA60009;
	Mon, 26 Feb 2024 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPexO6DRjAqEh41hFAbTYxuEnPMPjtTxwMJrh7MLMNs=;
	b=TRaofYXQ2zaSq+Ppu6StTVFrg1zN2D0YPWob5XALDQrTurFWqQcigGboAQdnVCPwhZNcqf
	40B1yCw8sqby8K7KbFd2GP7zaYzyOMvi6XbUKGNjiSP/zd21Q9MoM2iIZyQDI7oPipQAcC
	nNppCVoDguyhEZf1As6CmfcvFf/a+OTPpbMPEHrK1yTtZjCnWPX7wZSsi8sWCIU8E46oMz
	1ZnI8InnR/Peru/Jv6fF9PDB4qtAJGebmpb8yHkSovZxaq87t/GAMOhJUlOM9wIBiW6LEq
	4fM8kjOb23t6L7TSXNl9VCmL85fKqlbPeuu4uzJw12yvh7IHYpvKDPSE1Rtb/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>
Cc: oxffffaa@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru,
	Stable@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix scrambling mode value in command macro
Date: Mon, 26 Feb 2024 11:45:00 +0100
Message-Id: <20240226104500.490108-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240210214551.441610-1-avkrasnov@salutedevices.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ef6f463599e16924cdd02ce5056ab52879dc008c'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104504_581801_836BF6C8 
X-CRM114-Status: UNSURE (   6.66  )
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

On Sat, 2024-02-10 at 21:45:51 UTC, Arseniy Krasnov wrote:
> Scrambling mode is enabled by value (1 << 19). NFC_CMD_SCRAMBLER_ENABLE
> is already (1 << 19), so there is no need to shift it again in CMDRWGEN
> macro.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> Cc: <Stable@vger.kernel.org>
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
