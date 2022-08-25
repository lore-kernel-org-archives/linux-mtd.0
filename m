Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36CFC28D13
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 07:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZwo8l41HCIuz14CUDSriWyrBHtmhwF4s2wIGk3OOu0=; b=L6+FqGjz+nxA+IxQPiFOjDx6g/
	WXsr8UaY5vHj1w1mDfM/Nb7Lzop3kl/sa8skYzFzV8S+M+r7FDz7yH+3XFWoSHfXeEFHdkvVT2/P0
	4RSJ1ElzpNXVz45UUS/arerZBpOWKar9SfRdeQy1JWj29Vks4idA2RdxsDyoqPDN6/3x4sOCC9aFD
	WYaswT9pRtYjzqIxeXedV1TNdiS3G/x7N3xmbIZH7LDRNH/aD/VftIiV5rpqgkz1eVBfL/gX3t1zZ
	Z7u1XfJkL84NaZRsMgiuxS9s0I44xxZpFlAA+ol5h7SNniMxoRIPkQZlz/s4dccvL3C0gX3req3U1
	le0NufYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7lz-009pFh-Jm; Thu, 25 Aug 2022 07:59:31 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7lv-009p8N-RZ
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 07:59:29 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BD3E17F28;
	Thu, 25 Aug 2022 09:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661414363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwWF0lI0RN5sUGWtha9X06R6IHpjVlBwFb6s8YhjBW8=;
	b=TP2dxZATUNPNVnLjsOdOYAqt6pd/K6BTQw6IJaHrnmjYzcHT6Z9F1T1VOy3ijiSnmsuK9O
	mxcgBfbMUPl47f1PUH35MEHtJVqeo2TGIq+e7GzGw0qK5rqSoaXMYNqawPwQXVaomxwTIW
	RDjff3b5e9KOOtVDTh5TdHsthcgej7ICWKlAYy0WeVOy32MOJGXobZKlZu25eomC9W2FKD
	8dYKwcMeYufCuo656IRh6u5jCP8GVN6VkXi57db0iLUb7s+ixnu2ZMlIO+TfV8sI8F1Shk
	hZcG06ZiA/OhRmEUDwmwJnEcaW/vbkGygohUMD2R6myC9hp9C1gOabeuhvn5Qg==
MIME-Version: 1.0
Date: Thu, 25 Aug 2022 09:59:23 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Rename s28hs512t prefix
In-Reply-To: <a304d1402ac8922cac63bb955069715b53ab60a5.1661392740.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661392740.git.Takahiro.Kuwano@infineon.com>
 <a304d1402ac8922cac63bb955069715b53ab60a5.1661392740.git.Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <aa76ae2bb6e4dd4e80eaa5ad80e13957@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_005928_071880_92AE21BD 
X-CRM114-Status: UNSURE (   5.45  )
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

Am 2022-08-25 04:20, schrieb tkuw584924@gmail.com:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Change prefix to support all other devices in SEMPER S28 family.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

I'm still no fan of all the renames. But I don't think this will
do any more harm than what there already is :)

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
