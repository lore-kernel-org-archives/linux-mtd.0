Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912EAEB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6evsbZX13aiDrKsrfni5u34BW8JKexExmLwl4Ai44I=; b=Nups0VYDPmqnh76waLGa0YF3HA
	EQZTk+rQBl7aHMHiN87lfpGjrC7Roc6nRa1zI3+YXSs33Q1zlDEnFWITedMdnpC6/yVRiMKEIuE8R
	WnVzQC6Pa1+qWlCKf9KefaK0ze31czBax7HT+N2MDGekYGpgaur0Jb2dKSvIECl5ZGL/3ZP+12kfZ
	w83C6IIgmqraL9jF5wCi7D/j1oGSj0VmnVLkMRgQC8ABIacagXKRydMOP9Ray3vORDnqvXB+/D2BI
	ZHSxoj7VvouzvD5pnrqGq8jlQliPz+Nybh4e6b7SxDspVmolujPlN+KABfJNGTYGRI722lWGrOiX2
	tPtAdrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lmf-00EoOl-2l;
	Thu, 15 Jun 2023 12:09:01 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lmc-00EoMt-22
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 12:09:00 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7A8299F4;
	Thu, 15 Jun 2023 14:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1686830929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ByiMuKGszO/RULKL4xEPKNdqXuS6jdAajX52qRjoh/M=;
	b=z1xaFEBkLnxAYp4GTvNn4sIiMexPl6yL+tZeEf4oFbAD9M/vTcQYJ/aBHzCqECIZy9qNZs
	gH3af8xsGNtbSR7m/ntvDk4bRgcDKl4ZfuLWxLJWO9anWnQsyGU/Kk4ydt7JBYDljsVOyV
	fJSk5mLwGMNzog9JHJJzcjcQsLd9Fr9JabOoAyapDw16xocJWlb58PQyL3j0It0twNibOs
	pVDs7mETUwrDSYRRpRQ4kULF4je8bVInj7feUdYZG+bjJVXnvw7eUEn49cPLvN0KC3ArCG
	zcnjkT4NjGvurohIYeNXNx9InB+RaeqDVLPMQkg3aCEoHt6Xd8gWHRsBUBJGLw==
MIME-Version: 1.0
Date: Thu, 15 Jun 2023 14:08:49 +0200
From: Michael Walle <michael@walle.cc>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 git@amd.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property to
 avoid setting SRWD bit in status register
In-Reply-To: <20230615111649.36344-2-amit.kumar-mahapatra@amd.com>
References: <20230615111649.36344-1-amit.kumar-mahapatra@amd.com>
 <20230615111649.36344-2-amit.kumar-mahapatra@amd.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <54a22a94be29786f055924714a1ffce4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_050858_826047_746F8DDA 
X-CRM114-Status: GOOD (  21.00  )
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

Am 2023-06-15 13:16, schrieb Amit Kumar Mahapatra:
> If the WP signal of the flash device is not connected and the software 
> sets
> the status register write disable (SRWD) bit in the status register 
> then
> thestatus register permanently becomes read-only. To avoid this added a 
> new
> boolean DT property "broken-wp". If WP signal is not connected, then 
> this
> property should be set in the DT to avoid setting the SRWD during 
> status
> register write operation.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 89959e5c47ba..a509d34f14b2 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -70,6 +70,19 @@ properties:
>        be used on such systems, to denote the absence of a reliable 
> reset
>        mechanism.
> 
> +  broken-wp:
> +    type: boolean
> +    description:
> +      The SRWD bit in status register, combined with the WP signal 
> provides
> +      hardware data protection for the device. When the SRWD bit is 
> set to 1,
> +      and the WP signal is driven LOW, the status register nonvolatile 
> bits
> +      become read-only and the WRITE STATUS REGISTER operation will
> not execute.
> +      The only way to exit this hardware-protected mode is to drive
> WP HIGH. But
> +      if the WP signal of the flash device is not connected then
> status register
> +      permanently becomes read-only as the SRWD bit cannot be reset.
> This boolean
> +      flag can be used on such systems in which WP signal is not 
> connected, to
> +      avoid setting the SRWD bit while writing the status register.

FWIW, this is also a valid use case: have the WP# pin tied to low, the
OEM will program the flash and then enable locking making the flash
permanently write protected. IWO, if the pin is hard strapped to low,
it is not always broken. You might add that to the description.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
