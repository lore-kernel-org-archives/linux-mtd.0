Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF35D30CF0
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jan 2026 22:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/esAVsE1VxVpUO1hjmyntC4rl4J9qAdeaI78YE+Yqo=; b=o7IukqJrby7+xq
	50wGKtZTLv8v32GZAy1R5doA+IQxvSdrpCE9aC4SRZn3kKx7/o5SpKPYybI4HComC2PEXnQT7fK2D
	50YN//KzPfDxQHXmkTY+DdlIT6f7jU0BqTMn0ddz4eUFIx/rX5wYRqiAUUIIPYqcIHt9oW88zOcCq
	RjQrI4pFo0vouVeDaMtP3xYU9ZOX/k7Jvlznqs+4TVOaeB+Dnef6GAt+dpglcSlP9WlnNJg84reOG
	o6tmVTWIsM0zQ5OkvdQVRGIJoXNlymG3tXMORoz/wSf9IURr8hr8ANkrfJIGd1FJaP3XUTNEbO/HI
	IPstn5VD8gsdPhMfLwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnLN-00000007qwL-3i0o;
	Tue, 13 Jan 2026 22:58:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnLL-00000007qvq-0WmU
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jan 2026 22:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA552402D6;
	Tue, 13 Jan 2026 22:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC32C116C6;
	Tue, 13 Jan 2026 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768345110;
	bh=qSJ9XSZUSAIC+BNVE3Pm52Wp8VS9JUS/71ElN20sASY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kikfzoJRNhDZJM+6dhvq1BpkdAbdwfoMeYA5shoHDph8P6bRtK/qs1QtZ/GSkVVcl
	 rlH+Oy6EQbSFoXThT7T2zKvDnBazO7JyZ1gdmH9B/5NbtLLhuRYUKTLor1DTIqdUnZ
	 ABX1ivnUPPAQ/Jyw1Bn3Qc90ZK7bk9dj/KGb7xAfHLucbIsm6b21jH7A7kxIBYvOyO
	 6kqvJQGHsrd8k6D4YkkgHYLnSOH9jq80HWfAN9LfAKBCZweANvFByPtYp0kd7YZQKo
	 WtPdvwhoUdS1+ww6hmOOdvuE+3gNZ5ta8MgrMvvkaFLRKlCzDnlp8VJYJlt/xScNDS
	 /zBA0kcFyNi/Q==
Date: Tue, 13 Jan 2026 16:58:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	Angus Clark <angus.clark@st.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: st,spi-fsm: convert to DT schema
Message-ID: <176834510911.392089.15073442185735662277.robh@kernel.org>
References: <20260106-st-fsm-v2-1-7e0a2e18127a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106-st-fsm-v2-1-7e0a2e18127a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_145831_182673_51DB316B 
X-CRM114-Status: GOOD (  10.30  )
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


On Tue, 06 Jan 2026 15:25:43 +0000, Akhila YS wrote:
> Convert STMicroelectronics SPI FSM Serial NOR Flash Controller binding
> to DT Schema.
> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
> Changes in v2:
> - Modify commit message.
> - Remove "pinctrl-0" from properties.
> - Delete maintainers list and add "Angus Clark" to maintainers.
> - Link to v1: https://lore.kernel.org/r/20260105-st-fsm-v1-1-d1dd935ccee4@gmail.com
> ---
>  .../devicetree/bindings/mtd/st,spi-fsm.yaml        | 68 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/mtd/st-fsm.txt   | 25 --------
>  2 files changed, 68 insertions(+), 25 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
