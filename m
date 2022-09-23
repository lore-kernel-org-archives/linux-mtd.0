Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB162ECAAD8
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWYwtLToBRuyC4o68UDzl0nOyA03VTtgmYRwKyFr+QM=; b=uS2FlMiQaEJ7lQ4quxburHuMsW
	Fe6Bw2d9uP8xAhk66BeE3z+crHm9UpdCMhsh9wrRetr0A8D4fsnf3m+kxeF1r4Gke97jJH8hSPAzw
	dArPemYOZp3Hf9wnjN2kyHU/le2rWwiTPaivMcttvlbS8zNW2SFAaa0Dn6b94OxGvjZGF704KLSmA
	IA+7MMqNtnVCLuNGb4o+yyE8x31hQphx4Np1X1+s8w8QnKfXFv+N68xdzjV+zX6Oe3bBjv+nI3TKK
	hVdTvSbKomjz/pHSdQxavFTq6j0jdUKcxpHcNmgXq6yQrdgXHffBYhdO3CKjK4Jkd1JY9LHdZuoy4
	QXhpbGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf7S-003OeG-QO; Fri, 23 Sep 2022 09:37:15 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf7Q-003OZp-4F
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2022 09:37:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2AB6411ED;
	Fri, 23 Sep 2022 11:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663925825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxN2mG+WadcV7ATKwEM/ygrGgGkryUjR5Cw+HTzfK+s=;
	b=LZXFDOLgmypkutAtMrMzogu+uFrsF/pjYtzBDj+Zh4Oze/fox36TPgVIHRvaZr5kFT98Cc
	Hqq0hmid1VAmAK5pSkdE4z9IV/T9CP14BGIe+H+KmLrbJvwZaVUtn7ce/Y6vhsGDBSbLnf
	KwEX57wMiOF+2tpItCvXmNi/5PuXiGIDXRDDsBJAPOikMYDUuhpRBdUrqXLKABvQrPRjsU
	4HgrI/81bj7CjD8wg+qilA24ZLEtLOoIft6hsy0NHmApfvc9UPzo4gZidYDm/VM3DZVJpx
	Jx8aaB8rFQtEkEe5050GfQ2rk26xXGdIMIR00izM+CQLZuwq9iuQU+lakgrXcQ==
MIME-Version: 1.0
Date: Fri, 23 Sep 2022 11:37:04 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>, Hongyu Ning <hongyu.ning@intel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
In-Reply-To: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
References: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <3e9e5425b68584d81032c4c51e3e5238@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_023712_385549_E5C3F3A8 
X-CRM114-Status: UNSURE (   7.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-09-23 11:34, schrieb Mika Westerberg:
> The Intel SPI-NOR controller does not support the 4-byte address opcode
> so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI 
> flash
> chip probe fail like this:
> 
>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> 
> Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
> Return error code from set_4byte_addr_mode()") it worked just fine.
> 
> Fix this by ignoring -ENOTSUPP in spi_nor_init().
> 
> Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from
> set_4byte_addr_mode()")
> Cc: stable@vger.kernel.org
> Reported-by: Hongyu Ning <hongyu.ning@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
