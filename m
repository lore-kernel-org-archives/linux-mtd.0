Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98B2C35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9n4yoCpHAbRIwHNv2vSdwtTsfwn7QnxTpY1dUi6yEw=; b=Dduc9Evt7HFxThTDjyWYblSCOq
	uF9Gwc3VbQz0a+2McpujzbFBvBQ/8D9sphJc5jCHsO0JVY+pxvPVUDHtSFmcpRdsunLvtXH7gWFej
	apSyzDN0qN5gPsaW82d5uTzZMSrA/qNBXUD3LL0x4bEbh8TFXcKPmaFZM6KnWKLsDom1JPveLJvQl
	0RsljYlgzJjh8bi8vfScsVHuAEUiIl1nO/gUyU5PeJCM2DkVFpN5jCH8SYfRfuwC3LYOiNFe8MXuW
	bVKOvtboxVJ2XVxjU94cvzK9gZrBoevXIc2n0JwBPdloVHCHpzVZNg/IlBcR8zLf5VoUMkBzzRzd+
	S3qlg8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCQ7-00AYWP-2G;
	Mon, 18 Dec 2023 12:08:27 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCQ4-00AYUR-1A
	for linux-mtd@lists.infradead.org;
	Mon, 18 Dec 2023 12:08:25 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E2CDA5D4;
	Mon, 18 Dec 2023 13:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702901300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HwcO1HBrnFwN8fglAkiHLgkaZQhaGL5lpJAofpl8yGQ=;
	b=C0/i3W1HJqGA/xGB87btawUYMulwSBCFEBftHUhENNGHigDOh7XljFj5RowpxEhBKOGQgs
	gQhgl6J57D8f+YkRUiEoyWzysk0c+edKLmnwvm9cp057ThGZsZmoWn/Pw2LPa07EUehyau
	hhriBJmCZFig1xq0mwTHFoWaMyxHIBu1InZRLT504j6ExvgKc1C89yEpc3yqeHElUgi5br
	Fqh4lCGCF7A7HN6evQun9BuRWvg+UTJJFhyBowh8SxNy1o/2KMalMM61/0IwBJCnWDtVfx
	K2Ck0Gjm2OUFrNgjqz+O0QsnFggN+OAkP2xbkJnNWZb+5KootR1/ACHMnknKxA==
MIME-Version: 1.0
Date: Mon, 18 Dec 2023 13:08:20 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nor: mark the flash name as obsolete
In-Reply-To: <20231215082138.16063-3-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
 <20231215082138.16063-3-tudor.ambarus@linaro.org>
Message-ID: <5603ba319b2a89e7373b850792c6090a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_040824_552132_0564F20F 
X-CRM114-Status: UNSURE (   4.76  )
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

Am 2023-12-15 09:21, schrieb Tudor Ambarus:
> The flash name is unreliable as we saw flash ID collisions. Mark the
> name as obsolete.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
