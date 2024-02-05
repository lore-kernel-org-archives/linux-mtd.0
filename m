Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC218C4828D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GywtRxouRSYXBDv6yBsuMBnB5WoV3aS7TUjkagF8dxw=; b=SSDI14Ml+HcDXT
	c9kjmlCz/GZX0l3zrRFc8b+utXnA6XH+47TvblK7V7H7kN0jmt3BNVebdn7IyLQM/rP8x/wG9Q47e
	cg4mRx/aBSQvH8++8tXtA2fCa/Qll8Ppu4/2o6nsCXKZAx/5OTEgHQ/UZalOPJI37tSLdIUdyUngK
	3MfDrLDyqKXwfacFpVhZicL6RlLupQW4yIWpl3hF+Jp+3Lf0MojlMNzEufTjqhT7Zx0EffdE39eLM
	Q5uRtNxgxZcceZeXrAIUn9bUHx83IY7Mxhs038lKltLf+lwHcHsHFERfy3OF8NvZ6lRVQTcA1g7SM
	erEy78uoeYk6pNFBpAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzxD-00000003bhA-1UTO;
	Mon, 05 Feb 2024 14:28:11 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWzx9-00000003bet-3HSG
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:28:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32AFEE000E;
	Mon,  5 Feb 2024 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rr8qzPIYqM+HdXpoa3bzvlmyjnTmSf9J/CC9t8G0s0A=;
	b=U5DBarV1kWvF6kp6bsYh7pMLbNmHG365DTQi/YCihxMfxi3a94oiNCX0QoZem3hi/YJM1P
	Dgpo1S7r2d+8hybPIBGTKY4JK6pSTMP5lO+krI1U049Qt1oEsOgbSGzWeq3oMgjnbmcIAB
	AkOU7a9qwJnFbvgBqNAzSlEDe6HpQ8aLDX77UecgqHEZ8JgLcsv+xW8RWy+TBh/vpbwnyd
	L2OP+pTXjafmMZQWKYE33jVBYFKOQvjfNU1Z3fzPVHH83J6i6yxmEpIGmDzUWeeM5mSksI
	BrYJ07GDTL+HBVIaitm7ekLHQzHWm/jII1GAmQP2sA5bPybyv43/6h2mWEEWLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ezra Buehler <ezra@easyb.ch>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spinand: esmt: Extend IDs to 5 bytes
Date: Mon,  5 Feb 2024 15:28:00 +0100
Message-Id: <20240205142800.466649-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125200108.24374-3-ezra@easyb.ch>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4bd14b2fd8a83a2f5220ba4ef323f741e11bfdfd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_062807_980172_457496E1 
X-CRM114-Status: UNSURE (   9.87  )
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

On Thu, 2024-01-25 at 20:01:08 UTC, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> According to the datasheets, the ESMT chips in question will return a 5
> byte long identification code where the last 3 bytes are the JEDEC
> continuation codes (7Fh). Although, I would have expected 4 continuation
> codes as Powerchip Semiconductor (C8h, corresponding to the parameter
> page data) is located in bank 5 of the JEDEC database.
> 
> By matching the full 5 bytes we can avoid clashes with GigaDevice NAND
> flashes.
> 
> This fix allows the MT7688-based GARDENA smart Gateway to boot again.
> 
> Fixes: aa08bf187f32 ("mtd: spinand: esmt: add support for F50D2G41KA")
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> Reviewed-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
> Tested-by: Martin Kurbanov <mmkurbanov@salutedevices.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
