Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98583C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWf5EOZB4SZvFgQcTVzWpgINu2RrKnguQvDxd2OqMSg=; b=019D4PgL5uQmJL
	nsMNFXkCJVuVm6LegN31uRQWINpUS9/EryNeXH+5S+FuTQa2o0wxBH/qhyYmZq1R8CQZu0lu2b/a/
	61tc9ASkxIhLHzFzXH150sw8fmssPSDxzEjRRTaYiYP3PD15qY04XII4BRATV4xZKo4iORBnJ+UZV
	Fh5Q59A8ftm82nHOeYtU35eN6dOeQzPoca/oaWFIbvAl2Pmc2XyIqFU18cUtBmlRkhFbzR1rUAv/j
	MPEJCVykV5Lc4IW2aEuoEy9BkD7Sf/F/Sj9MbERBBerUKt/d4DFjcJ+EMnVUMsY21pQ4icg8DsGoV
	UmlwN991Exgm5FSAUJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAj0-00CbvN-AA; Thu, 12 May 2022 15:27:34 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAiw-00CbsB-Uw
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:27:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9BFC61C0003;
 Thu, 12 May 2022 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xe6gof0su9adg1T78nGygOfJDwljHm2NDQAvr9m7iDU=;
 b=UFjVnqD79eYZ3HPa0Iv172QpaHho0LkO+Ptoi6Xc6jTCniR2gbNiY4fPXOX7qbcamAYVJY
 YtXg6K01OIHYKiEo+aMJZC6mkglf4J6bYd19v1vm9XbyyGPIREP8RFbpUbU6wesZp30+W0
 CkgRkZbhy4D9Qn0zQvKRpJMcOi/YPwKn8simKQodtnc4bPUSpU4D2m9/gvTtZv5R/IthpX
 ln33PLd0TjKxCyCYaniL5vzU6f+X7tcp5Vz+i5BJH9uffsbJNyeboMfUVVhiIt4N3c6gpI
 c5bMdkRoKt9D8TZfcRk+pq59HJgaTJOy0ux/pMbxCz0+l6AV/Ru66I2q284WrA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: partitions: Extend
 fixed-partitions binding
Date: Thu, 12 May 2022 17:27:25 +0200
Message-Id: <20220512152725.244872-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220503155007.2339847-1-csharper2005@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'33f6106400b60b0e3287efbd0a9f29476d278f06'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082731_188974_8925A3DA 
X-CRM114-Status: UNSURE (   4.84  )
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

On Tue, 2022-05-03 at 15:50:07 UTC, Mikhail Zhilkin wrote:
> Extend fixed-partitions binding for support of Sercomm partition parser
> (add "sercomm,sc-partitions" compatible).
> 
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
