Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAA5C48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdvX8HuoNc7PHscREZY/PgJ04KvAcHbN6eRMuJv6j0Q=; b=DeOBllyfy5U7Yf
	5zC3asUdHekq1HE+PuWDZSBVBwfeqHUDXF+SClqUELsmSZbvd1qiELbGcxycGFQTZRv1Hdo7N+Mwk
	ECRsRliMuXythUioX4Viq5lepfO1SHfnGqBtonQpZrt73hdzpWz8O6e7EV3E0w7Z2ahwp8vegDi9e
	9toxQWWQSpdh74UqgtTRFPgj+xUcQn2a0JUU9x8R+5fHqLE67Izb1s25qHL2by5j+KizHdHPiFJ0d
	JSGcKHKMGr15feRIo2Yii3G7D7qx8av0H/U9tl6aKUt5QhNpZnTmsvXBBCalPzO7aLGXKehwn6YA5
	LisNf2hZZQEguUGl8pbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racn6-0000000GYuC-2ys9;
	Thu, 15 Feb 2024 14:32:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racn2-0000000GYsi-3d3L;
	Thu, 15 Feb 2024 14:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D32AC61DC8;
	Thu, 15 Feb 2024 14:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA72C433C7;
	Thu, 15 Feb 2024 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708007559;
	bh=RDEiGRf90Re3gTpyPNkzNOs5ZMS+5zS+B9IMjDdiEVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJYTn6PLkujcFUnJvgg/0kGsJj7dNDW5rIMQtZCNHth4cnAzRs4d9XRGkR0BT704Q
	 8dUgAa+au0rcH43+3gpERDltdKtgKUK/PhaQd5VolFwjEPBW5erVWeofQO9LTXMKux
	 +eUYa0YRWM6vqSy408jHWgQCOd+9fNLgM1aTQpqJjNipiKKhg3Q+wrarJNVQEkwWpQ
	 Ei99Jalz/Te6GIOHmiqDQnAHieKA4wxjZrhzEhyMpzJVMx7d6PdPL4s9Qk6eHy5fZg
	 c41H+v4/p/NdPsickDYiPENZa57JL8o+QlYxag73ydYnaV7KbIq+d447C8a/Wq/n/x
	 /4+cbaWZUX+zQ==
Date: Thu, 15 Feb 2024 08:32:33 -0600
From: Rob Herring <robh@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Eugene Zaikonnikov <ez@norophonic.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>,
	linux-iio@vger.kernel.org, Nishanth Menon <nm@ti.com>,
	Michael Walle <mwalle@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH v6 4/7] dt-bindings: mtd: spi-nor: add optional
 interrupts property
Message-ID: <170800755249.11056.3790121633736757728.robh@kernel.org>
References: <20240212-add-am64-som-v6-0-b59edb2bc8c3@solid-run.com>
 <20240212-add-am64-som-v6-4-b59edb2bc8c3@solid-run.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212-add-am64-som-v6-4-b59edb2bc8c3@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_063240_975008_76AD39AD 
X-CRM114-Status: GOOD (  10.99  )
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


On Mon, 12 Feb 2024 18:38:11 +0100, Josua Mayer wrote:
> Some spi flash memories have an interrupt signal which can be used for
> signalling on-chip events such as busy status or ecc errors to the host.
> 
> Add binding for "interrupts" property so that boards wiring this signal
> may describe the connection.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
