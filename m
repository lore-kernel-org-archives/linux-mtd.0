Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E0C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg3wsatRVytLLyWHMepAwYqF82Cg2VwtTX8luYbOn9M=; b=LA+z2ebJ7fCKSrmIJ8DxEJFlG/
	sz6IoI6zPLMtrY4oFvwFuxNYZL9IIj16HAbjHVLnCMv0q15jF1LogMAot/D9cHUYOEksD2cSddNZV
	sbM/VgY72jbtpKiUmOe1H1AE7zwiWz8HbU6XF3iiT4E4ADk0gjkQ4O1pGwdYNJnImOg+hkX6iU0/r
	pb+S4AgaeXqSB1fPIGHPZJyNhQHWpN7sha9JVT+fiYxG8uoxyzpEE1SNiStU/rX1ouW8aaIPJW5gX
	ygPsAnumWJInOg58a1s18fdltQlg7bT+ZEsS3I16zzGdx/iXYr+KH6aZg0zFHcw+LI8oyRKV4yQ7L
	8V5QUuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLLW-00BVkZ-9u; Mon, 18 Jul 2022 07:39:14 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDLLS-00BVjS-VC
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 07:39:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 8C4CE2222E;
	Mon, 18 Jul 2022 09:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658129949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/DWlXv3hCjUIcmrUZpOnkgU0ztlcQ5rZy7MZpY0AIIs=;
	b=YEEl9cddWINhI5mgUcL0kP9WS9XEQ4z1GUP8KG0gZlBnxY85Xb/Mi8tZOXTLYMsKDbj4J6
	6pDFJKXOhk/zfBb9w5oU5ZPs3dmyCHbVqq/lpjfNAlK+rnRGyWklkL8qXcthy2fsxU1+Gl
	KQFqw/T93Et3FyvyBWN9fxeNUvlwG5o=
MIME-Version: 1.0
Date: Mon, 18 Jul 2022 09:39:08 +0200
From: Michael Walle <michael@walle.cc>
To: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 greentime.hu@sifive.com, jude.onyenegecha@sifive.com,
 william.salmon@sifive.com, adnan.chowdhury@sifive.com, ben.dooks@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: spi-nor: issi: is25wp256: Enable Quad Input Page
 Program
In-Reply-To: <20220712163823.428126-4-sudip.mukherjee@sifive.com>
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
 <20220712163823.428126-4-sudip.mukherjee@sifive.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d918c4d3d91adac247ebae6418b409b7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_003911_186558_AE54C428 
X-CRM114-Status: UNSURE (   5.10  )
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

Am 2022-07-12 18:38, schrieb Sudip Mukherjee:
> The flash chip is25wp256 supports Quad Input Page Program. Enable it
> in its no_sfdp_flags flags.

Are you sure, that chip doesn't have SFDP? Even the oldest datasheet
I've found [1] mention SFDP.

[1] https://datasheetspdf.com/pdf-file/1303587/ISSI/IS25WP256/1

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
