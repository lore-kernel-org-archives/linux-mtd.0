Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB5AEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyCXI2ch/D7QX1yBGKo+8HAPuf+wtQUVWlpGdqVOps0=; b=tzn/iFU78BOJVs
	dppst+ROInK4bDBcce+Dt0m68TAR/XYr+PPn92qx6CDvO49HffGi0QobsTVxN3StRFzzU2WFFBp4C
	r9bu+TifrHFPziM13oRz/gwX52okTSd/uPSIQ1bqIkpD4NWNEzn3C4M2budeqsUn2GoQx8SGef1kE
	3mal0NNR2WATALtfzB8q/U1GMzRp8wpAl5dNSHVE60+HiVyZSPLaphemz63yLWkVf/dF6OuFtIv77
	nph7dwz0Njsr1RXorRiwkU4D95NWgCIn5ULZE1SsPnFXpNe6aEV7d1cW67hAcRswlm9/EeVOFtXtW
	/6Jjs51IvsIadoYP0iLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8TC-007aUu-1D;
	Mon, 19 Jun 2023 06:34:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8T9-007aUG-0I
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 06:34:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C0CB60C5C;
	Mon, 19 Jun 2023 06:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30AFC433C8;
	Mon, 19 Jun 2023 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687156469;
	bh=kTLa1bABqE7PRoQN+W58XG0ov79lgaoOc2p0q5KvPv8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VXoLRzOF0VvD/3nq2o0zWmZr9+afT2QrBW/K7009DGYtIvkzaV+pjwvff7TLFthf+
	 R4jI16YPbMO5QMktV03LUob5jTFEuFkJuOUv9amSbxJbqtnx6UChAGLMeGkUjKLyAD
	 74xvHykvZRc0Yzhf2dHOuWnqHIs6/g/BXXWgF9TI2LcE3LfdPRsrMjCYI+i4L3RaP3
	 u5zT0t9pGyp1vUHi/O1NMgJFkZ5afFKaeK4voPVfNdAyTNc9xpO+HR6XE4D6EBvF9X
	 DcuBAqH1veT5giW/ici6JZ4nwW9yA+/ld+pHp3qqu51ycFfDFUvGUCw1Rz+ORp1rY2
	 0cJLEQWnDTvkQ==
Message-ID: <12fe2d4f-dba8-8a78-b354-6812d96ba24b@kernel.org>
Date: Mon, 19 Jun 2023 08:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 03/17] dt-bindings: mtd: Mark nand-ecc-placement
 deprecated
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-4-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230606175246.190465-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_233431_170758_CBA2BE6F 
X-CRM114-Status: GOOD (  10.92  )
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

On 06/06/2023 19:52, Miquel Raynal wrote:
> The nand-ecc-placement property has been deprecated for a long time
> already, it does not really mean something useful for the ECC engines
> and is anyway in the vast majority of cases totally useless. Just mark
> it deprecated to avoid appealing people to use it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
