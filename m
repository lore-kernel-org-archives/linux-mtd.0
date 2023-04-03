Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7870C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGHH7jmcJtMRI0yfS+zcaHB0BjJcKTuEgWp2tWNFEdE=; b=rUkPNF+Nyny5friZuoCWt6y8jr
	e9pL0uyU5Sktygy6+Y5kWBD6ZdmNkJUnReU7dQDnRlPa12Sqe47rrD3LhV31WgUKjatPKvm7Klgko
	tBBWOb0UeOrbFRlRaCj/umE8K7oDxo+DqijGGg1GaspfbQ8sQ5cYIyVix37/HtEQIprUzTR4EeFVJ
	G+F835/6V6TD90X6W++WYAy8sbdEh6BMaXkxgKvz2y0/D9N8O9uTCOCuqCugOWG8/8mlPBE306oFW
	KaciLD8LbTaArqAZqLMT/VjGyqwY30VT3Y94zDl0c5+OiDJKlEr4BK9NUljvHdWtzZaUnbXLKZAOV
	SI/E/LEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJX9-00FJo8-2Q;
	Mon, 03 Apr 2023 12:43:39 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJX6-00FJmj-2r
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 12:43:38 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 66D17124;
	Mon,  3 Apr 2023 14:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1680525810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SYJViz/4N8t4+5Nr3/NhnXJXAfSKnQcLVADtXN8P48w=;
	b=ANttNXQG44x5Lkium/ohFLGpqpx8IiwF8YqUbGDtEMecMjsz/eauOOkCjF+4vn36LeeT4Q
	rZHO4DC18tYBLtwudcZDqGQafJOG1Ry7zfq45yg/QdXoiQxmW24zfrGbTWpc7n4cEgYYHQ
	0FlaIi+inBilF4F1c1L81aKAyEUpOLcvsYshlM/ZQ8w4cbXgNYT0fRd1/ugomXhaNZXro3
	IF6oxFQasTfr0ye/9XOASI95jbNHHOWxkyzEyVvfJSB7hfk2EaxPndwAYdc+BtkZf32Erw
	gZ2tIgEjsnVQ15/PMnu0SNHaY5VniNt8mkHQMX3do44fyyZkiCEH28jCL0AQdA==
MIME-Version: 1.0
Date: Mon, 03 Apr 2023 14:43:30 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 Takahiro.Kuwano@infineon.com, bacem.daassi@infineon.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/10] mtd: spi-nor: core: Move generic method to core
 - micron_st_nor_set_4byte_addr_mode
In-Reply-To: <20230331074606.3559258-2-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
 <20230331074606.3559258-2-tudor.ambarus@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4543c6475a6e2852435a1707ee70ebe9@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_054337_400357_611D9E25 
X-CRM114-Status: UNSURE (   4.29  )
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

Am 2023-03-31 09:45, schrieb Tudor Ambarus:
> This method is described in JESD216 BFPT[SFDP_DWORD(16)], BIT(30) and
> BIT(22). Move the method to core.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
