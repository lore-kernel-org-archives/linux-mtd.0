Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BDEC77B71
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDZu2H2J5PpBsE4oFOXGPyeo3pa9Mw1F/dTIZQwXvK0=; b=sB1dUyO2o81jTpTP5YNgGr/xqe
	vLY5G+Bs1ZYxqFQgN4dwWBL741he20zYVfJy+4qWx33EttNx1hZaCwhG60lRpbxY57G/VvOc4tC2S
	dH57skwBtLQvmfPEsK8r777r7oH0BMs/WuM2V/33XfE9a25RxUZcg3DrDe+uZjXMoDOQ2Ag6RgMsb
	zdqdx5ShT+ZQLW3tn9Iz3IQLYR9VCrzXquehiV2kwt5O2NiFKrC7mZlSBGYJ+iNpuAflCH9VhfWeh
	Q0KyOdj64WkV+Ul+sXj+4pe0BtmJMkxzdA+4ViQf7b1DF7p5T1kPvRnM1AJn4HYbI+h9VWNcRRIZK
	KvBpsZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohaJ-001STB-18;
	Tue, 18 Apr 2023 09:25:11 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohaG-001SSd-1S
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 09:25:09 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F02CE9E3;
	Tue, 18 Apr 2023 11:25:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1681809906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PUkY4vygHyk5s53A2oqEQV2z4/qRItW1OOsd86HcBWU=;
	b=wpFsVLHDslrsCnlhCDkjlqM6Rb6eC4IhU7C8n6RsUDGlr6hEoTZLuzeQAqzdFbgP13wMzy
	4OY3Khvk9A3KvbWBde83jA09mVlDk2UimrHuR+LLsdXNkztljNKGeXesDRDx6YC5Vf1006
	fyZ5zj+714A6qh1EWCYlXv0mNOL8dHAxEz1hhUt+7sZTdMM9EXLH8x1T1bjYsg798Bq2OE
	FAm9G5BrcaODBPwHexTU5owA//8mSeMeOGWozkjrzsIf752iN8YWSw2PAW+vWYyYfIvk8W
	gKWb2VGr0Mo/Q3cDQw/8Z6KovQCaEGqCYokGsB9XK8f/zVf/wDvax4XL2UHuZA==
MIME-Version: 1.0
Date: Tue, 18 Apr 2023 11:25:05 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com, pratyush@kernel.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Allow post_sfdp hook to return errors
In-Reply-To: <20230405062106.49594-1-tudor.ambarus@linaro.org>
References: <20230405062106.49594-1-tudor.ambarus@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <ce297db930bab7ed3d72637dc911436a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_022508_647390_99CCFCB0 
X-CRM114-Status: UNSURE (   5.82  )
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

Am 2023-04-05 08:21, schrieb Tudor Ambarus:
> Multi die flashes like s25hl02gt need to determine the page_size at
> run-time by querying a configuration register for each die. Since the
> number of dice is determined in an optional SFDP table, SCCR MC, the
> page size configuration must be done in the post_sfdp hook. Allow
> post_sfdp to return errors, as reading the configuration register might
> return errors.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
