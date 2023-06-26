Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1CCEB64D7
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CL20qSopGM2vI6l9slUUbd7bmgmN8Y/jjaiC786Xb3Q=; b=0PGTlLQxVCWgFV
	EZGOOQNj729UW+NAK261fUEu8ieCEQ42IvtmPcJ2Y9ch/rLs251I1GbbFiDxSDQFee1LXln6xNJqD
	R/kZNqySsRnLX5B1+C99wXu3fRnmzPLMVKTL96Mk2O1kz8kDi7gX7Wahp74QulquoMMtGfi8SMYUM
	hVytJCPkM5+R9iSqcvb8WH8LPnLrJCE7qDffTh2HjiP3NCqEAxQqHxJvZBt6GqCktNM4tJYhQZGFF
	F+w2hFgLC8Id8rRDuHxxLr0FfiArOjxjlbhXLlFW4sTK+ytpwdA9ehy3Zkongx56GTnfDxJEzcAVS
	9+DFkSfkTVvmyNtIzBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk83-00A2je-0r;
	Mon, 26 Jun 2023 11:11:31 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDk7z-00A2ha-09
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 11:11:29 +0000
X-GND-Sasl: thomas.petazzoni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687777880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQv3AS+HLUfFEazEC3SqY1OYzbSNG18VjDZHK3YjV+Y=;
	b=UfKRyX3M9wmFG+dqZyLtdLzNfoyUWh/+3Oz7A9E2eGj1XLG4KWRl/A5JHEHZdMbjrzMY7Q
	nInBAqUdyyypPc3pf57TQHrAtocRcu+zadSKlgdPmQpDwIV9PslFyUNRq/RSK5QPJElhT8
	V+MdWTcjseXnAOUFDizupmj8MXC50wnctlkvYdrHaKYCnq+u8voWSPuDZyqx1Gb/gzyW3S
	gjEYh3lTEKQUd4FtUqQlVTJD9yWVDZ7Q/OltNzz3cqwqMRC0xPmP/hOAvD9wdjE8k2pfJB
	mbVLNuJnFCwfciBaNOXaFKBnb9lnhHqQy2b7E3RMnx7K7LY3S5qYGi/iX5XqwA==
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B65A6FF80B;
	Mon, 26 Jun 2023 11:11:18 +0000 (UTC)
Date: Mon, 26 Jun 2023 13:11:18 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Maxime Ripard
 <mripard@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mtd: Fix nand-controller.yaml license
Message-ID: <20230626131118.0f6fd166@windsurf>
In-Reply-To: <20230623210508.GA1096125-robh@kernel.org>
References: <20230622212415.3583886-1-miquel.raynal@bootlin.com>
	<20230623210508.GA1096125-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_041127_263146_BE85E3EC 
X-CRM114-Status: GOOD (  11.83  )
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

Hello Rob,

On Fri, 23 Jun 2023 15:05:08 -0600
Rob Herring <robh@kernel.org> wrote:

> Yes, we do want dual license, but things converted from txt bindings 
> need those authors' permission as the txt bindings are all implicitly 
> GPLv2. That didn't happen here, so we kept the default implicit license. 
> Looks like this case is all Bootlin authors for significant parts of the 
> original txt binding, so you should be good on that part (assuming your 
> employer agrees). Maxime did the schema, so need his permission too.
> 
> Note I have blanket permission on dual licensing from several companies 
> for DT files. It would be nice to get the same from Bootlin.

I hereby allow the relicensing of all contributions from Bootlin
employees on Device Tree binding documents in the Linux kernel from
GPLv2 to GPLv2 or BSD-2-Clause.

Let me know if this statement is sufficient or if you need anything
more formal or specific.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
