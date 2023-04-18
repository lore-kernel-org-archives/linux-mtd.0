Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F6DC77B71
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 09:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Lkt16tU6C2xfw45kCLpmACmI/6/xCevMoSO4gd+BCw=; b=D0ZfzFjsD8zRKV6o1zrOpkTV6z
	NghXiaPfv0+9awt3kNiAn0YkoYTUvQ8fs3yLstJMXy1Pc9Qd51K0nqnfxrEdqSNBePxpDacbgPYV5
	OPdas9DDc72UQjXViQvrlQQGhSXLr2DO1FJCAuj5cDGrBJKg99xHxpF2WURdqI9Y4Fnzet/DJih83
	z4QEv3CYmiWGx2hkg60S9rUus1ReWf0n9Re/Qfzamuw0bfudT2UlBlQk49PkGOu+Tb2xiojQA188i
	tUkYy3OszxnbN7YRwwonoCjcHR3uB8Xud7WL1+3OKVn6sclmhcNzRYhastom1niphEylJTiUMx7gR
	q7/Cfplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poheo-001TUR-0Q;
	Tue, 18 Apr 2023 09:29:50 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohel-001TTb-2M
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 09:29:49 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5B5DF9E3;
	Tue, 18 Apr 2023 11:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1681810185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NayrR68KcLRy+l3mJSHMh2mevUq9FSM3tf3pOAeKAqY=;
	b=p0n/c2lUevHY4Rw1cblUVNGasItTK6jdIGDkq2NlqWhIutLX+HulTKtcpgog3eWfey6mIS
	FwsIWy6AD3eXbkFIdmZ1EDvddqX9Hp5LG4E1Aru6pRh96tM7vLIa+7Bo18ytk3h+sjbykd
	VYX1a/nhmZwsJUN4p3fsJcQnQw96RvxHAyZdqauoOLYUKNhSVfGwqlWU8paWOQcTnaMeJX
	G2zC9+MU0HOa8uvNYmh7aZe1or1Wl+XdCm7q+TPRY7aI+ro8GzeL+MSqiDjRBDzzLVGSqZ
	SNLoyq3sLeEnFRyJoWzL4zbQig+pEm9agck7ZNtnXFu/6eKGX5fuBDxTzzAF9w==
MIME-Version: 1.0
Date: Tue, 18 Apr 2023 11:29:45 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com, pratyush@kernel.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: spansion: Rename method to
 cypress_nor_get_page_size
In-Reply-To: <20230405060456.48986-1-tudor.ambarus@linaro.org>
References: <20230405060456.48986-1-tudor.ambarus@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <736b881c4dd3d0fb0522ab0d385798f5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_022947_919546_3374F048 
X-CRM114-Status: UNSURE (   6.26  )
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

Am 2023-04-05 08:04, schrieb Tudor Ambarus:
> The method queries SPINOR_REG_CYPRESS_CFR3V to determine the page size.
> Rename the method accordingly, s/set/get.

I'm not sure about this one. There is also a
cypress_nor_set_addr_mode_nbytes() which queries the flash and
set the params->addr_nbytes and params->addr_mode_nbytes.

cypress_nor_set_page_size() also queries the flash and set
params->page_size.

Secondly, if this function is called get_page_size() I'd assume it
doesn't modify anything. But thats not true.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
