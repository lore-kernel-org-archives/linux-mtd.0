Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F212CC48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrrHT67sGjDfGSpnxKed3IQom0sbT2sjrtiTEH91QVg=; b=28w3lIj3RzKXbr
	k1/qy4FFXmVZUbtgzHzKQefYhABq4JBOjIcscaLC9ZvuIczEF6GF51E+D5iqEFshi7rTNrn9Vad0j
	S0Gb6UR147BdT+tl0pMvHt/vtyZ7FmCVVUQ7++IEQJChrgS8XtNXbSxkT3pPZ2ukwDi/iwyW87Ivy
	+PbBFcAfevhx3tB3O6wqayuCztZTZW7kdmdKZ4+aL4q+4lzxT2xwAhku75Vj7JDyw8LJ30CoZjUfy
	JvjFhcKf+0Wl9jhdf0r6cxTbeoXoz7xcq4W2SYoPzRnf4aE1qsjwmMpMe9xPW1xxBnQOBTR0UuMvA
	78wniM9emKAvlXz4Z6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racmd-0000000GYlL-02IP;
	Thu, 15 Feb 2024 14:32:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racma-0000000GYkO-1SkC;
	Thu, 15 Feb 2024 14:32:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCAA5611D4;
	Thu, 15 Feb 2024 14:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D9EC433C7;
	Thu, 15 Feb 2024 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708007531;
	bh=5fPHkNbQOnr/Rx0yCFr1hGYmrdP5ePSWpHM505l8J28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=th+RKnPurwzNKta9/48LtBEAxDOWfgwBDjh+4TU+pWHLwl5KSzivIzw90Q95+G9pf
	 Of1SiZ/EWJKC9RZNp357+kdMx+jiYQbOzYU/nXqoGmSdendLEqGg6T6T7LZ7iGpFZg
	 irdPw5Dt7cknyPFplXyahgCsEg/6bRJJFboWVick92+d3frnpTcZXjKZyOIQ3vO0sW
	 LMZS1E8uhZ3NiRrfiA4/pzh5c3Or+ffu6OmFyrOa/QsXxLc+rNYLHCvB1AZ/CA/ui+
	 KBkaro5ZwxHoa8aOpuizOlAh+9LoyTQ7WwP8w2QxTTEyY8q7tM7ZhNXlQPaKck7W06
	 J9tDQzrcplkpQ==
Date: Thu, 15 Feb 2024 08:32:07 -0600
From: Rob Herring <robh@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Eugene Zaikonnikov <ez@norophonic.com>,
	Michael Walle <mwalle@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Pratyush Yadav <pratyush@kernel.org>, Nishanth Menon <nm@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>, linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 3/7] dt-bindings: iio: humidity: hdc20x0: add optional
 interrupts property
Message-ID: <170800752707.10493.10095025505089429224.robh@kernel.org>
References: <20240212-add-am64-som-v6-0-b59edb2bc8c3@solid-run.com>
 <20240212-add-am64-som-v6-3-b59edb2bc8c3@solid-run.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212-add-am64-som-v6-3-b59edb2bc8c3@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_063212_457818_395CDCDF 
X-CRM114-Status: GOOD (  10.10  )
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


On Mon, 12 Feb 2024 18:38:10 +0100, Josua Mayer wrote:
> HDC2010 and HDC2080 humidity sensors both have an interrupt / data-ready
> signal which can be used for signaling to the host.
> 
> Add binding for "interrupts" property so that boards wiring this signal
> may describe the connection.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/iio/humidity/ti,hdc2010.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
