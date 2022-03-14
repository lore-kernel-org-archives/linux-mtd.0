Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA93FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nn38acqF3sHHTBeu7v0z9Pm0df8sina5qyu2oPDPSV0=; b=Qwxk8CQUXe+DYd
	cETqJVYbuQ3ebehJwJTVuN1i/KwEZVdcig8JWNUZg9WrPqcORWbIv5DWVQn59bxwdSIar9PqaC6fR
	6416LCa9Ku0Y0NK5LczO0XkJ/v+FNu0Vf82qu3pIaIFyxwLE3Hp5LdZAHPwmSFbdFOvDCjQhYyGm7
	w9YopsH5FJDGx1658TChAFywTKHW78zNTyNrs8u5U/JIVYzfDSmMzfUDLNTXE8pMB88CN+Op3q66/
	XdaTGGlxofmXmGnY2cDk1Gc31GB7XYYkRdjPFrtjGcSlD0SHR8Y2tBz6A/VKy5KQQha4Yn3FqPsxl
	b2n+ISlVeKRKMAYtm+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTn7q-005ucE-Ud; Mon, 14 Mar 2022 16:00:51 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTn70-005uHj-IX
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 16:00:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ECB2B40013;
 Mon, 14 Mar 2022 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647273597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5tSI+6s5RfospdOGvGWlFTdtWMCpSRJ+W9UMg05WK0=;
 b=NC5ymPCFEvnqxR8hJH3ASVl5uk2P7GRZOJ/c25w4jm6ZR94yFXJWR3nAZwbkBdi5GvtWuA
 IvHbBe8J7JYNJ9IjbSbdz1VuNmgv0MAZjAkCfaSX3FGvNzGBmXAGY+pG1dpOoG0czbI217
 P2jKkrWH1PcOlk4xZ42BxI8AffUXPFNJ9uJmxO4qRvNSqZUIFZGsq4hOBJSs9jMma0nAxF
 Dd3mfy/5QTbKM8PgYo7DZDkgREWVISjQbiKX4PilAKSpMUXXQj36UiOYw4ttoQVifA0tiN
 kJaye23LrSqnVw/QpdGYHPGlJb9WKnxL2omj+G3d5wOsZ8ILOc2cwoSladcVvg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 david.oberhollenzer@sigma-star.at
Cc: git@xilinx.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: tests: Fix eraseblock read speed miscalculation for
 lower partition sizes
Date: Mon, 14 Mar 2022 16:59:55 +0100
Message-Id: <20220314155955.77400-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220208103905.13354-1-amit.kumar-mahapatra@xilinx.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ad627c3fc7d5acc9114b37a472e1ced217e13dfd'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_085958_776593_24DCC668 
X-CRM114-Status: GOOD (  21.14  )
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

On Tue, 2022-02-08 at 10:39:05 UTC, Amit Kumar Mahapatra wrote:
> While calculating speed during  mtd_speedtest, the time interval
> (i.e., start - finish) is rounded off to the nearest milliseconds by
> ignoring the fractional part. This leads to miscalculation of speed.
> The miscalculation is more visible while running speed test on small
> partition sizes(i.e., when partition size is equal to eraseblock size or
> twice the eraseblock size) at higher spi frequencies.
> 
> For e.g., while calculating eraseblock read speed for a mtd partition with
> size equal to the eraseblock size(i.e., 64KiB) the eraseblock read time
> interval comes out to be 966490 nanosecond. This is then converted to
> millisecond(i.e., 0.966 msec.). The integer part (i.e., 0 msec) of the
> value is considered and the fractional part (i.e., 0.966) is ignored,for
> calculating the eraseblock read speed. So the reported eraseblock read
> speed is 0 KiB/s, which is incorrect.
> 
> There are two approaches to fix this issue.
> 
> First approach will be to keep the time interval in millisecond. and round
> up the integer value, with this approach the 0.966msec time interval in the
> above example will be rounded up to 1msec and this value is used for
> calculating the speed. Downside of this approach is that the reported speed
> is still not accurate.
> 
> Second approach will be to convert the time interval to microseconds
> instead of milliseconds, with this approach the 966490 nanosecond time
> interval in the above example will be converted t0 966.490usec and this
> value is used for calculating the speed. As compared to the current
> implementation and the suggested First approach, this approach will report
> a more accurate speed. Downside of this approach is that, in future if the
> mtd size is too large then the u64 variable, that holds the number of
> bytes, might overflow.
> 
> In this patch we have gone with the second approach as this reports a more
> accurate speed. With this approach the eraseblock read speed in the above
> example comes out to be 132505 KiB/s when the spi clock is configured at
> 150Mhz.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
