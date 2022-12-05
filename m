Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553BEC4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 08:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LHgxU6FDxVRp9yE8f5FfxKH5+tUCkpj49fuxUQvQZA=; b=l6EuIaBiQAbOAT8PotDDCUJRqd
	qOi9XDpZmlcENwIP1WiCh+xLju+orDZx9FQKNpCY9PVIrRWW7gORkQ3RKXx2sPLQMlOMPjRqxqiNq
	TJ9oqRE1v2yAJbugHSJCmgkp8Df5ciAB170ne4a25TlDh3kdTfsKlqBtAhnFoJJ5BMrku6LFEn38B
	p0XD8I2Dn9f5LCHqb53ireVwnHM+tkDzRosD/PPcj+W0KhppsxfXbOb6+UxK1L15DzmK3flQgWma6
	CAvaFoOf/Uw2zrMiWmsJ5yAyiZHPFI7JlPJ66E4TLzsYBTkBgw9tQvrAK1qEAzeOVDwPICNt8Dh2k
	yN0L2I2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26kR-00GA3A-TK; Mon, 05 Dec 2022 08:22:48 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26kN-00G9qz-CI
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 08:22:44 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 955D111ED;
	Mon,  5 Dec 2022 09:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1670228557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cawzhIrCiAJrKU4rgqns2i/i9FlaNB5jAb1CiiwigTg=;
	b=dzGyMcFnsKv8tBH5RiAV8tn5dQq9ToCaVQiu/j+CK7ZUbklX+1dlFKI4CEpn6wEv+bUbmw
	22B3R6+qUNjuBBoQrwZ5M7GOaHbJxCx7eAYUtWsY/c68ZJXSU2orOuS2bOfDytKv4N41DQ
	ZqV5dJ1NMLV/52q7b1CXc07ASRBVFbPg4MwZMRCKN7wELq9H7cKUCisxfpOmOQ6ApdMd4D
	YI/z8TKCaUJq04TB+QJ3yqSgrHRV3CPaDXie33pTQ+JMoc+0cWG9GdiQzr43gPgsSC0RXP
	aGm5rBO+wpCGtokA1KvNVNhC14iU3fU9n9/GfyvGMDDDXGi33JpSUJlfpKV1Vw==
MIME-Version: 1.0
Date: Mon, 05 Dec 2022 09:22:37 +0100
From: Michael Walle <michael@walle.cc>
To: Victor Lim <victorswlim@gmail.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vikhyat.goyal@amd.com,
 amit.kumar-mahapatra@amd.com, alejandro.carmona@amd.com, Victor Lim
 <vlim@gigadevice.com>
Subject: Re: [PATCH] Linux: SPI: add Gigadevice part #
In-Reply-To: <20221204080000.4100-1-vlim@gigadevice.com>
References: <20221204080000.4100-1-vlim@gigadevice.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <dee37d18f8de5af7d07388031fc08571@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_002243_724192_7C0DDE7B 
X-CRM114-Status: UNSURE (   3.47  )
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

Hi,

Am 2022-12-04 09:00, schrieb Victor Lim:
> Edited gigadevice.c

Please have a look at
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
