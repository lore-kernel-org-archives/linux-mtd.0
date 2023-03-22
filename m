Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C97C6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLCy4nfzqjBsf1oPIVfg2QyFJ1JcCBXuQ0rEtoyDOVg=; b=L+gtAU6uKC38+I
	NWrYZASCU0WJEOu/KC+diUP33oC7TEtvC7ftmvZO5+ICuFPXorO3TOfDGxAPWBj4gISGq4Pn0TmAP
	iyksD8K75W8mu/Th8bFm1AQN+9xd1QvNYcYoy7p/2153svFDsxcobutbdwKKlCjVjH0cHnZWqJRnr
	vcEO0q27T2/sbrXqstXBvrDwB8vY5srYQjQ9F0B4JWSvCfmPNoiVuKE7aYjDdiKrux1dAdn9TfWCG
	qDZe3TYTPPAs5qEVZWmTOgXM3K+63sSj7+8xMJ4fe+etgPBMBitQ7eCjWSGk5qB/G08Lg8Cq0uBdx
	0oD5qxz/1P92J+fDt8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10X-00GbJs-23;
	Wed, 22 Mar 2023 16:08:13 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10P-00GbEA-10;
	Wed, 22 Mar 2023 16:08:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 32DC5100003;
	Wed, 22 Mar 2023 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMNRn5L+CaeB59tcwag0gxW6LL0loCqp1DLAG5DxHE0=;
	b=nOP2Odox8fG1yzMRTLe71QAaBJiw3BMhKjlGTyUZgFKn7I27vSjMlNQnzuiIZ9pyt6tHF8
	CleOUFiD8hWifzswVuB66uveeMSsHCxTlN+indvbCh5QjRAPyAfOJjajU1GWUtL209E6VL
	ZrLDlyE6auMsL08EeABhoeLEVaXgFIVns7HCPJNGN81RbqtJl8IO3oiISXqpP+lA1Tz1W/
	F6GweoMQ6RVffRlizsqEvjg584YqLFiMTHSNqkyq8iicwJLSjRj1Js13kKQQ5ZAcmuelqi
	mLsJens0IkEYRjVuqNy+NXw0paHG78albya8Pv92cAM58HC+3cFvSJiQ2V6AqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru,
	oxffffaa@gmail.com
Subject: Re: [RFC PATCH v1] mtd: rawnand: meson: invalidate cache on polling ECC bit
Date: Wed, 22 Mar 2023 17:07:48 +0100
Message-Id: <20230322160748.2232587-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d4ef0bd6-816e-f6fa-9385-f05f775f0ae2@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e732e39ed9929c05fd219035bc9653ba4100d4fa'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090805_646396_AC250A69 
X-CRM114-Status: UNSURE (   7.12  )
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

On Mon, 2023-03-13 at 07:32:44 UTC, Arseniy Krasnov wrote:
> 'info_buf' memory is cached and driver polls ECC bit in it. This bit
> is set by the NAND controller. If 'usleep_range()' returns before device
> sets this bit, 'info_buf' will be cached and driver won't see update of
> this bit and will loop forever.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
