Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C606AC5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxH36blb/OFuT4C/YKVo8dCtmisM7Xu9eucZ/qaByvk=; b=lMOKasKw01kMX0
	yNA4d9F6B+ZbDMT1CmGcZEhLuGpqTw0o6RnQL/41wbNJwTWE+45MbVXle07OXAfgHtajT7wdsWyjB
	SphgMBKPXa6PcN7kDLTurnZMa3D9A0+bidQyASx6aZKXytRSI88ylgdgRdXHZ8Jyxr2IQTHMziq1F
	uVlbinA8DDmEXFKmEN/61fAmXQsmB9oVJ69fGrg/a5WVRvbMuf8E+Lm0gU5ywhUbrRQgXBALtOK8s
	UatHnA6lQscbJnH7ilJ6Czukw0MSrq49AbXmHlHgYcXhNEGb0XIDz3jtoIfWne8IUSQ+utXXmKo3G
	cW5E0xepKqC907f2DrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1N-0000000DQJB-3rn9;
	Tue, 11 Aug 2026 06:31:34 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtg1L-0000000DQHz-3JMW
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:31:32 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 272BC4EA;
	Tue, 11 Aug 2026 08:31:29 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 11 Aug 2026 08:31:28 +0200
Message-Id: <DKLWJLDFA3QD.DW07KLCA2H96@kernel.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: macronix: Restore fallback
 parameters for MX25L12805D
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alvinzhou@mxic.com.tw>, "Cheng Ming Lin" <chengminglin@mxic.com.tw>,
 <stable@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260605084837.1875896-1-linchengming884@gmail.com>
 <20260605084837.1875896-3-linchengming884@gmail.com>
In-Reply-To: <20260605084837.1875896-3-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_233131_970577_755B3E5D 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri Jun 5, 2026 at 10:48 AM CEST, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> In a previous effort to drop flash_info fields and rely on SFDP, the
> static size and no_sfdp_flags were removed from the MX25L12805D entry
> (JEDEC ID 0xc22018).
>
> At that time, the legacy MX25L12805D was already EOL and unavailable
> for physical testing. Verification was inadvertently performed using
> the newer MX25L12833F, which shares the same JEDEC ID but supports
> SFDP. As a result, the probe succeeded during testing, leading to
> the mistaken removal of the fallback parameters.
>
> Since the actual MX25L12805D lacks SFDP support entirely, it strictly
> requires these static parameters.
>
> Restore .size = SZ_16M and .no_sfdp_flags = SECT_4K to this entry
> to fix the probe failure for the legacy part.
>
> Fixes: 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info fields")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

Reviewed-by: Michael Walle <mwalle@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
