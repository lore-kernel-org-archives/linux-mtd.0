Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AF3E6FE27
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v55hc/5vL72ht3PEoSaHI16RTeY1VXrZOdhc+ExomgI=; b=n33EzuoUrJLEfq
	zzhHR1Uc57TTFJvrnFRsHhjbIDW1oiSkyFliX3eDxs1t83lLfp0gIj5HQWT2xw+7T/EstJ+T4GAzy
	WrV1PAR+7HPiE+gXvBOgwRGRV9zr+I/2vvvNaVB1zts97Z2Tcht+GsDZ2ptrCNYc4RtzkItDqENhy
	O3kFIcCCk0lBxWnvekcCib+a8+WuZSA9EAMvWB3NTHero/xWe8LGD0k1O0x8v9o2ouTvsfqinPEkq
	ZEhpuesZF6DDqhcANG/LQOpJeGl8Kx05YRZ4XTSL2IQXAAlTIN4FtVjYL6H6zHYJEXNZb1c07OayW
	03xEHUUufpO2Ad1yL1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smapo-0000000Cl4I-1B1a;
	Fri, 06 Sep 2024 15:25:16 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smabP-0000000Ci0r-2hGD
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:10:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 982941C0003;
	Fri,  6 Sep 2024 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZUTVAepqA+jwCEzGkgSw+Dy++rZGvQ4PU8h+QLC69A=;
	b=M5owgzrfDtz62VtH/Mb5OyRrqhUwReZC3YK7qTz8CR+5MKjjWw32W7y3S6V0Ec2Nw3A80t
	I8rbMtTiHV1Gs4gSN/IAcqPJ84qXf002ZvWJvkBMg6Rvy+dbU/n9yW8t1j3fJw7rEx3cIo
	nRxvFdnhw3j4/7NKzzK3It43BzhRpaNY02TxslEg7RRGh3wNFf9umYZ4fehJ/KuB2Eriu1
	AGemnkOKo/vj0LrNOUKAUVK9fatosuHEaszal35qrzNYPMp/4IshMeK0nYPhXE853KdaZ+
	+8SujWPGnVVw5CL5q4Y42NrLBUSejtXKzvMv9TgpyDOyMj7Md1o/Mvb825Y3Ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uros Bizjak <ubizjak@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 05/18] mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Fri,  6 Sep 2024 17:10:21 +0200
Message-ID: <20240906151021.736425-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905122020.872466-6-ubizjak@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'098a573b6e8b8515354c1e07a1c54990435340b6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_081023_863952_431ADC4F 
X-CRM114-Status: UNSURE (   6.16  )
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

On Thu, 2024-09-05 at 12:17:13 UTC, Uros Bizjak wrote:
> Usage of pseudo-random functions requires inclusion of
> <linux/prandom.h> header instead of <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
