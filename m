Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1D1C88E5C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aueuiiSY04rUk1zXjrCRSmH3PQL+Zqa0IfI3WfVPxuQ=; b=Ozusv1+JE9AU2T
	zFzto9BzCG7hxDqhUQjXXp7TTMst31qJbELMitHj6tDhcWJrmLUu0vISq0I+jUd7sRKR5PGeF79S6
	8tGRqLXcpa1QhGtZfYkTpkeVDBVJXGGvL3wimk7Kwnx9oiml/21HBGGyab/OBYm4dpZTyHqw2tmZe
	Afcumy3PeUa0LaorHDU0d/iGsPtcka/1gi8yNrFwwXebMHjkjo9ALoX/kRr70J96ptuD0WQvqrJCc
	cnMEeIu0pKH1sqsl83GlkTsZO2D7KjKAF3zpJaJsh8uKRIW9W2tISuXYETWnbB50w+LmPCTeeaiP6
	DrA3DeRUepebYimujWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6knx-00000008hC1-3rTu;
	Wed, 16 Sep 2026 08:15:45 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6knv-00000008hB4-0B3x
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 08:15:44 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3B74219F;
	Wed, 16 Sep 2026 10:15:40 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 16 Sep 2026 10:15:39 +0200
Message-Id: <DLGLAZ55FZH3.114WUI353COSS@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to
 s25fs256s1
Cc: <pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@linaro.org>, <alex@sverdlin.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
 <fb4398e88939472eaa86cdc098a3d265@infineon.com>
 <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
 <e15daee278f346cd8dae030e2409445e@infineon.com>
 <874ifqoctq.fsf@bootlin.com>
In-Reply-To: <874ifqoctq.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_011543_251747_1FB148D3 
X-CRM114-Status: UNSURE (   9.09  )
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

On Tue Sep 15, 2026 at 3:37 PM CEST, Miquel Raynal wrote:
> Hello,
>
>> This didn't help as SFDP cache size is truncated to PAGE_SIZE in sfdp.c:
>>
>> 	/*
>> 	 * Limit the total size to a reasonable value to avoid allocating too
>> 	 * much memory just of because the flash returned some insane values.
>> 	 */
>> 	if (sfdp_size > PAGE_SIZE) {
>> 		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
>> 			 sfdp_size);
>> 		sfdp_size = PAGE_SIZE;
>> 	}
>
> That size just being a sanity check, if it no longer fits our needs it
> must be increased.

Yes. Takahiro, could you propose a patch to replace the limit by
let's say SZ_16K. Hopefully, nobody will use an arbitrary offset >
0x3fff. but who knows :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
