Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3306C43602
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 00:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifkt0Ki9j7x/rz6CzXVd4BYosndAf3dCtCxZ1vK8fRY=; b=n1Rpv8/nF8/ra0
	w0AQeupZWiyLrW0ZX3TMMY0JEDtHDYoExv71D43WBY1aTupzz/LuNJSHaj46D5/UA2p/ZDzU3a7nJ
	a1AW47df7xnpedQ1cZ5fSy0afIdCUWwDCY/qNrGOOPYOSMSC/WBRUmbA96HGkQx6fPcc918HmJSED
	s3MRoQppj7R4NsoM8P2mvF93amf5oU2mYKVyetX/U2wbrBRs+DFPff8G+C4fs9G0k6eieYcTNSREl
	YoIv5Jx3BALml2HNws0DoHy0QzGy7vv1iZZxEiaKQECHqAoSiTgcMDE9BXr5i6PSoBvGU5t0EkaXj
	EwViY1tYmbxN1QM9xs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5S8-00000003IgP-0oFB;
	Thu, 02 Jul 2026 00:38:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf5S7-00000003IgD-3BdM
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 00:38:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 374AA60120;
	Thu,  2 Jul 2026 00:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8CA1F00A3F;
	Thu,  2 Jul 2026 00:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782952730;
	bh=K2MvIxzJYyDxUHUyAWrPFvGMONjWCoIf+Y80Y08dkHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JS2n8/YrYo1cgjGgyK3Smo3rv5av2X3Q2tg6yuI1ZufWx0ETT8LmnQxORX80KZD16
	 qGMsE7JaYzGu9lOU9krOnbZtKWMVvZBpLTENb2LJhJo7FnecCFO+yMKucpQ9/oV3hs
	 6R2/6jwJwSbgUhUgL9iFIne0+peYgEQtm/QLXcG0HX2Gzxd6BnuayXHaq/JFYLPvER
	 1g58/IyoRtklcxOiWeA3SmzQfOIBTKS3WaktNPBvBs57xno0dnrdm89LkqakjiTkHu
	 N9kjuUXRqJOWvCaIF/nmeUYCvpllJtnUF7T2iQOgbOvQdNtSwkfck9US9kN/4shXBq
	 c6RblpgT7Riww==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Cheng Ming Lin <linchengming884@gmail.com>
Subject: Re: [PATCH 6.12.y 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
Date: Wed,  1 Jul 2026 20:38:32 -0400
Message-ID: <stable-reply-mtd-macronix-612-20260701193800@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701024204.2730472-1-linchengming884@gmail.com>
References: <20260701024204.2730472-1-linchengming884@gmail.com>
MIME-Version: 1.0
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

> Although certain Macronix NOR flash support the Quad Input Page Program
> feature, the corresponding information in the 4-byte Address Instruction
> Table of these flash is not properly filled. As a result, this feature
> cannot be enabled as expected.

Both patches queued for 6.12.y, thanks.

-- 
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
