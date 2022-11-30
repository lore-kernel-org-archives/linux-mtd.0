Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBD4C4321E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Nov 2022 22:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IA/IR4NNZH7xLUWkmpPi9FPzMTyhDG15XXREjwpFb4=; b=SuiV8HiD+ZbqShRqczmmBKE7FD
	y7tnxNxMuNRgG+N0be7ihOaNnuT0Ug3x/Ossd1iLZXDbjNsFOcnVdsUBH4HEYLpXlozDwK8z+A7qr
	1t1iRQPBzjArtePKU5BQckagZ7rIYiQoG0GL43o/lfgBDXa+4MVBxEG7KRk3mVT9ppY8k1ckalwCK
	vCESNQMgAaCRuT0keoBqFy6etR5orIfFtv3+LGyC13SU6AdwNgFnxiSbIw7PWFc4wmFdIpVp8iFmB
	PwX+NR7pBcVPbvRy9JF7t5/INHwrzWADmmz7OBbZmCUhvkvZDUQkSnG3Nq9UnwEmlXX7Fj0c2DDhI
	ZshcyAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Vd1-002zO2-AA; Wed, 30 Nov 2022 22:32:31 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Vcx-002zMp-G6
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2022 22:32:29 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 838AF124D;
	Wed, 30 Nov 2022 23:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669847540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TCPLE07GprHeCRJB1dOgcZEjpdPq49lqGAMoL1+eQr0=;
	b=mfMl55jkYAJIhjINB/HjyFEsUrIiGUHzbyK1aIIeJVWi6OMlUFZ2doGG9hxm6FB5RLE9Fv
	N0TOv9sHIlEknxKTMM+wrXz8LLH2UJgh5PGREUAgIEE3nBJjCIi+W39fZETW7io4YqotqF
	9iOFKR5UmuDYXBfGQ5QuMWSjpNIibL+VPVh5wBmr/PsyVXXN0Dv8yk+iMdm0aDJ7k0VNyR
	8J+F5fe2dzCa9X4LWDRyDOapSmrUC8L9ElSwbExccBkm3jCq4YDzYBZ21cgN554ulgsA9u
	Hy/p3cVRrftASdon1Aqjml5WBAinQUXyytoX1bw1PaDPeeYH5cCVeDWV+S9lqg==
MIME-Version: 1.0
Date: Wed, 30 Nov 2022 23:32:20 +0100
From: Michael Walle <michael@walle.cc>
To: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: issi: Add in support for IS25LX256 chip,
 operating in 1S-1S-8S mode.
In-Reply-To: <CAPE2wM0LZRX2SXmntNFo25zOwYtZ7NQS+G=5VgeeW-iON4UN2g@mail.gmail.com>
References: <20221128172455.159787-1-nathan.morrison@timesys.com>
 <2acae3be377a5d8c3df66f860d944dbb@walle.cc>
 <CAPE2wM0LZRX2SXmntNFo25zOwYtZ7NQS+G=5VgeeW-iON4UN2g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e07105d41ec62a6ee47ca0295ca347dc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_143227_721789_A8E8E72B 
X-CRM114-Status: GOOD (  17.93  )
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

Hi,

Am 2022-11-30 16:34, schrieb Nathan Barrett-Morrison:
>> Does this flash have SFDP data? If possible, this should be
>> derived from that. Could you dump the SFDP table and
>> post it here [1].
> 
> # hexdump sfdp
> 0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
> 0000010 0084 0201 0080 ff00 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000030 20e5 ff8a ffff 0fff 0000 0000 0000 0000
> 0000040 fffe ffff ffff ff00 ffff 0000 200c d811
> 0000050 520f ff00 2224 00a9 8e8b d103 01ac 3827
> 0000060 757a 757a bdfb 5cd5 0000 ff70 b081 2238
> 0000070 ffff ffff ffff ffff ffff ffff ffff ffff
> 0000080 0e43 ffff dc21 ff5c
> 
> Looking at the latest SFDP document from
> https://www.jedec.org/standards-documents/docs/jesd216b, I see
> 1s-1s-8s would be in BFPT DWORD 17, which appears to be 0xffffffff if
> I'm reading this hexdump correctly.

There is no dword 17, the table is shorter than that. But
there is a 4BAIT table at the end, starting at offset 80h.
And from what I can parse with my sleepy eyes, it says
"support for 1s-1s-8s via 7Ch" and "support for 1s-8s-8s via
CCh", which is consistent with the datasheet.

So all you'd need to do is to extend the sfdp parser to parse
that modes in the 4bait table.

Btw there is a newer JESD216F (you can get it from JEDEC for
free, you just have to sign up there).

>> why?
> 
> This was because ISSI's default_init was setting a quad_enable
> function pointer which is not relevant to this part.  This probably
> doesn't need to be done though, as SPI_NOR_QUAD_* isn't being set in
> the flash_info table and therefore quad_enable will never be used?

Yes.

The SFDP specifies 111b as the enable method which is reserved
according to JESD216F. I still vote for setting the quad_enable
to NULL if there is SFDP which should know better. This should
be "fixed" (IOW unset) by the following patch (but it never
made it):
https://lore.kernel.org/linux-mtd/20220304185137.3376011-1-michael@walle.cc/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
