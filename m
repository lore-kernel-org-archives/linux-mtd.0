Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A5AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsvMI6/WcpKB4Bqr77sGF0MQhy8P52fymtFO5YO2Vno=; b=LIss4KLeebrmw0
	acQDYnYBAVXFeFwZH+/qSERp/mEAH+LD2LXYGGXG0IM41UC6uRn/2zwiewmb2JIzaWe8gRkAgCbd6
	kxw+LJ1bo/D9Qqiavp1GieaAuiZGr33i6kd3igEB6z8Uv96kERgp1gIj0A9WnU0HgIjXF8zVEC/y3
	wE1ukr6FxAvxiQeclPQmUkR1MpyTOOUXYmshQjUPX8xSUkADSsepSGzAXvKg6czKypPGABbmokO1p
	EHARQP5rixKCwMiAJEym1ApXVwof3Wt4D/VO4u0nAM6XR5cBy0eU/11pTxVD4azP8khef5VTSXFzf
	hsBqdDrhYp/2QJtIl+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6ZK-00Az6A-Pi; Mon, 07 Feb 2022 16:08:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH674-00An0o-ND
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 15:39:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B32D60013;
 Mon,  7 Feb 2022 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644248373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ue7iEOzm7gMzquIxmneLt1DzQ72CyImCrmDvYDAv4oA=;
 b=eG2diUHLBx221F7J+vROTodtZPASOgiHWSCPnDQKYNs44BjErD6SCJPvvzTvADv3i9iYJh
 OEVzpcfGgIyqCkTFnWa4Poz/obg+PDPtgYNYd+UI3x+NuDK248pYrXi0gJyKHD6RZsV6HR
 7TvXWbi+EKETWFf8gZ+c70W6gffRplsQ7Cs9yZLoLkE2yXpqS784Fr20IuzP+BJv7PfYJ0
 SVenrpnhDoSfmU/Ci0vXf8FS49HD8XNP5FdULL9iNkVAgvXazAH8/K3Lh1ZkoFqVzu9yhP
 QFO+nUVnEFwT55NobOWOMo+N4AQaDIt7rbli+3YNjcy7u+0AkYcwSOCIuTUThg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/3] mtd: mchp48l640: Add SPI ID table
Date: Mon,  7 Feb 2022 16:39:32 +0100
Message-Id: <20220207153932.710335-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220202143404.16070-4-broonie@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'69a6d06878f05d63673b0dcdc3c3ef1af2996d46'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_073934_943153_A951E624 
X-CRM114-Status: UNSURE (   8.90  )
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

On Wed, 2022-02-02 at 14:34:04 UTC, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding an id_table listing the
> SPI IDs for everything.
> 
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
