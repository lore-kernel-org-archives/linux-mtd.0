Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D63EE4996
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0nBEWpD0Td4Q+uZ7nMgIwV+XUDKNKVbV2A/qp4C1n8=; b=eysptgZczh4W+6
	6oEe9eOKYwlKWmlsGFjaBelUwnJPDle66ei3+KaMoKuejU9A+whZPutgm4wOV+bEfVacwze5m1klH
	IkkhUCCyBAKrYMwXOmqoZyUPeeZ0s3N6CGatnrtwO5g6uy9nIcAb6DHX7HjLBaq0ezAowqa7RVPMo
	KFeiBTaoSpgWYR2Z3gfZsDfNvkFUkuWQPTPT1oqXmDQA4JcvQiUUdMwjwmiy7lEFJXYUKOLUWF59r
	BNo77XZMMyEiNxvmt+kaWVi1ujw7UTE2mSEjLnQW0z3ysJ/9MBdBdXhFWvvpQpbrct4IxrDYjXtMx
	Df1Mv8p1sE0hKZezDYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8kS-00ERa6-33;
	Mon, 21 Aug 2023 17:31:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY8kQ-00ERYq-1Z
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 17:31:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58FE5636E3;
	Mon, 21 Aug 2023 17:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA5AC433C7;
	Mon, 21 Aug 2023 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692639084;
	bh=h20Kkl5UnPX7qAyLV9K3yW7xdsP/ZAcy7V8OZ5SeLEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLvhkTSUncZ/bD8I/q4eCrfRw0ElcvysAb0wVtfvPIRt5Hhwm8m2mH50uIl7AwQao
	 NPAj4HxoCBw216Ug2JMTsUydXHuAw096mCXLPHQe+Lld2np/zhZu64wP/SqC8WVqsB
	 mslia/bHKMgDJReVCvatiIeFXXBBpJ6GkzZPpzk+anUr5yG1jDep2DtRDWQs0yl/74
	 Uxi27CM0ds8gfvRiizbaQPQRCNDc+M72diw5VgzElBvRhpZ52oXq8DGqr0+J0lyVKH
	 8Jp9c9d3JJA8GVM5dtZmLbA/XszwkNUNs5rNYkxt5GxIc/e4l6m1vQzdcDpeOfXVDz
	 HshgJrHoyRIjw==
Received: (nullmailer pid 2000677 invoked by uid 1000);
	Mon, 21 Aug 2023 17:31:22 -0000
Date: Mon, 21 Aug 2023 12:31:22 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Randy Dunlap <rdunlap@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: mtd: add basic bindings for UBI
Message-ID: <169263908218.2000617.16931192155432403196.robh@kernel.org>
References: <cover.1691717480.git.daniel@makrotopia.org>
 <a640bb10e6fbaeef96efdb9e8b666ca39e993589.1691717480.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a640bb10e6fbaeef96efdb9e8b666ca39e993589.1691717480.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_103126_614879_9B72B496 
X-CRM114-Status: GOOD (  11.96  )
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


On Fri, 11 Aug 2023 02:36:37 +0100, Daniel Golle wrote:
> Add basic bindings for UBI devices and volumes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/mtd/partitions/linux,ubi.yaml    | 65 +++++++++++++++++++
>  .../bindings/mtd/partitions/ubi-volume.yaml   | 36 ++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
