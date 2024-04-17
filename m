Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E1DC4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 18:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04n6n+xQeGtBNSclq/vrrYlBHeSLHccxSrvkmXw1tY4=; b=4JClVk9JErI4eQ
	C7dbnDHLSWBNyhe8XEh0P3Cf/lMRk3Muqozd3hdPnrUNLGB2OQksYsseARnK/e5lQFc8ZWzHr9Sjw
	eVLWNkIXhBfjCVwD2xd2Q5pvJLGDarEWr7oPXXfV+Ka6N0tAFBPOwkyEA9kROIL6ekZNtlY1pmj2f
	1OMK/ZAcpuVpE8n7uN/f0hA53l6BfuzHOZ73KxUjPn5Ki3kmJelmE9VfhOkOl/OiTHAeMxuePZb6u
	CrfkSCxYoQe1JO5q9fcRN9RHe36+OlaX5YpR1SyEoGuwvZ02A193nq4nR1AVli1oqhjJ4OBG/TR6c
	OPk7EDUlyWocgjJA7dkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx9mM-0000000H9c3-2WeG;
	Wed, 17 Apr 2024 18:13:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx9mI-0000000H9Z3-0vwy;
	Wed, 17 Apr 2024 18:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7277FCE165A;
	Wed, 17 Apr 2024 18:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64067C072AA;
	Wed, 17 Apr 2024 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713377579;
	bh=+QqZIxQ8UlhnEmUdS1HJUIQc1KETk2//TWOKmBcq1yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs7s/U33jKkoO6fTSIvWPF98FJeWk9FRSo6ex2nV7//YcFOfYLle3tz42e3PyHo1K
	 73MkXeI4MUUnqClLeVpdd3+PSkjp15ZdoetD6qpr3MJDoYlwpN+56vi8B30gB7xOSY
	 AeezwTtpZ7LNNa+uI8RGOHS1IgrPuBlQMDO8xsMSKFczvJ0NLdTTXRycx1QUxWZWY7
	 Vd1Ep+JZ7mOPAZZlorwnJd3eKifgKbVJ0lzMibz1s1k2zBeJDjQ4VZEfetj3X8zM4Q
	 4Eljj+C90Eu/ySegZOnD9uAWewMrVlDP8UtzYgerKppJOoaK8VWz5gsq27XoNUFkif
	 Dv+9crxRcKLSQ==
Date: Wed, 17 Apr 2024 13:12:57 -0500
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: oxffffaa@gmail.com, Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-mtd@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>, kernel@sberdevices.ru,
	linux-amlogic@lists.infradead.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <171337756287.2947093.12060380819740476831.robh@kernel.org>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
 <20240416085101.740458-2-avkrasnov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416085101.740458-2-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_111302_632977_F7BFB95D 
X-CRM114-Status: GOOD (  11.24  )
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


On Tue, 16 Apr 2024 11:51:00 +0300, Arseniy Krasnov wrote:
> Boot ROM code on Meson requires that some pages on NAND must be written
> in special mode: "short" ECC mode where each block is 384 bytes and
> scrambling mode is on. Such pages located with the specified interval
> within specified offset. Both interval and offset are located in the
> device tree and used by driver if 'nand-is-boot-medium' is set for
> NAND chip.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.yaml           | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
