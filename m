Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBDDC197A0
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Nov 2023 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieTHPJBSjx/58aImSuptCB6OiA78E1DyHp7hR49HEVs=; b=ypaJF4aGF8Oybg8WTeoNJMTKdp
	XtvBmLiwyRmZmBU/uKXAb2nJiE/I2zLhpCNMg9Nqnqdm7zqHFLTCDF3HZIoqYrhm2Rhrj3Kxq9GgU
	DXxIeAivDLurtDLkLhwEiwHTQ95M3DyFbgAn0NMUWxDHu88rQ6XqtXnd0QwoP58Lqn0G3DewQ7aqs
	71Xk/OcDtiXnZOmH2wkRgNibDyQi24HA6NtMqCDbbJQOOuMzOUpBK/W888vApbnTm4nslzKxxK0Rv
	+g+RYcwFYD4qe0g5z2qOMUIj7J1BnTjnpeOROAtsFxzcBAZoniLKja2goKQSUjOFoqGzhQ3edTVTl
	uU6OMitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eRF-003pfg-1Y;
	Thu, 16 Nov 2023 15:37:53 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3eRC-003peG-2P
	for linux-mtd@lists.infradead.org;
	Thu, 16 Nov 2023 15:37:52 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6A1ED959;
	Thu, 16 Nov 2023 16:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700149064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkzeO8gkvG3GN5Jru5wi0sviViECPmp8r79pScMlnXM=;
	b=u8F9GLoZH065uTsUxer2VnZihysU1cVc4/vx45ynWexmbPvSWoWOGJwDaqrZsYSagoTsDM
	5E9OTULboi10+nmv1LI5mFSoYssfraMDRMJQgR2mEGoj5Ag94qYUCPTqDz/ot5C76mad6N
	IVJPd98EUJk12D44LAikF0MncbFP2LhrdXHPLsbAAQZD3cFDBkHzPBfA0pIOa+RBWXO2Pv
	HqCslLMNY56e/UIebUwo74eXBv3gbqDHRLp2zbflYHhQtGdB6tziWb9F1HeLF7Kni0ubZP
	IuZkSOPF9Uk08bq8gIRorgj5eop5MoW9oO8O9w7FYx1fnFINjlhZGiY+Cx8tbg==
MIME-Version: 1.0
Date: Thu, 16 Nov 2023 16:37:44 +0100
From: Michael Walle <michael@walle.cc>
To: Mark Brown <broonie@kernel.org>
Cc: AceLan Kao <acelan.kao@canonical.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Dhruva Gole <d-gole@ti.com>,
 linux-mtd@lists.infradead.org, Kamal Dasu <kamal.dasu@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Mario Kicherer
 <dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] spi: Replace -ENOTSUPP with -EOPNOTSUPP in op
 checking
In-Reply-To: <401df72f-9255-4da3-b97e-93d3f38d352c@sirena.org.uk>
References: <20231116024338.337304-1-acelan.kao@canonical.com>
 <401df72f-9255-4da3-b97e-93d3f38d352c@sirena.org.uk>
Message-ID: <6d8dc9dba73e0a6274e9f8d891b8fcb8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_073750_960902_3A99A411 
X-CRM114-Status: UNSURE (   7.84  )
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

>> The purpose of this patch is to distinguish the "operation not 
>> support"
>> error from the generic "not support", so that drivers could better
>> handle different errors.
> 
> What is the intended distinction between the two?

The commit message is misleading. The intention is to replace
ENOTSUPP with EOPNOTUPP for two reasons:
  (1) checkpatch will complain about the use of ENOTSUPP and apparently
      should only be used with NFS
  (2) more importantly, spi-nor already uses EOPNOTSUPP, but calls to
      spi-mem might return ENOTSUPP. We'd like to unify this.

-michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
