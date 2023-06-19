Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79009EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4pmI/O/7h1//1isJFXySp1nZ7q7Mv+k3c1zMz7HHvQ=; b=4+vFXY73zOFqEm
	q0lbrPNi+O2A8xx4G8RO5YZIjRmszG0bwffDU+h2ObrkX5scnyb2vp269GbQGzCy7XTvrvrh3ug6F
	2Nr4i+/VWTbSxre4wuLmyQLvJiLe56YP8/IUtrPh1+TIXNieAhWHbkggA/S9djZE9Af6VuT8hQWUX
	57GKfzZy4+KxhNBstpobtL2DidiVzQeRLehZKd551GPEIETWsGSIuAKDspwMEdxpMfFhgbN0/MjfB
	CKzA2Eg1iYm77lkrLqt9LHJPankShNW4eeNdw4HFVuUg/wHFpzamHxOBdvcDcZe+7MJ6cTAYOA2qJ
	ayTUrpyKNNKO2D0NMo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8Ni-007Zxy-2O;
	Mon, 19 Jun 2023 06:28:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8Ng-007ZxP-0Y
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 06:28:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A8701614B8;
	Mon, 19 Jun 2023 06:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B5CC433C0;
	Mon, 19 Jun 2023 06:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687156131;
	bh=5H6NfjLHLoCYiMs1YIWSouPqe6Jr3GUlzaml/UWEkkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R9ypIbhrU2uig4v9Ac8FuY7uQtX0Uj+a0DMGN4XNdaxol+E9AkaV6EgODJWlxQ5E4
	 0QcS3dVGgJLM1HiTv4zjK4WY/0HOpt2n4w/4bdtBThaMb12DU1jHB9AQjcS4bV0g1u
	 YuCXHYHeBnqoorvQNV23tCmJ4qkr1Zs9t5MOC7ohcV0C6FnCp6oqWf6OEFcaY3peA2
	 C/bForGbg6nY9YjOqfBSkhcMhqxtHM/QTndwTcHQpoA1qkZDSnOdMKb5THd5tGwEt3
	 xQdxAwpN0ZbrMZX558DnOm3XQ7TevLzNbgvIs7etmfnlTwgGfOV1EPj6Yd6WkMt83i
	 oc1Ljioj7uQww==
Message-ID: <f3b86b21-a042-06f9-dd90-03fbaa9c0d42@kernel.org>
Date: Mon, 19 Jun 2023 08:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/17] dt-bindings: mtd: Accept nand related node names
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
 <20230606175246.190465-2-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230606175246.190465-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_232852_256072_2659BDE5 
X-CRM114-Status: GOOD (  12.34  )
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
> There is no addition there, but the mtd.yaml file is so generic, it can
> be referenced by a wide variety of devices, including nand ones which
> already define the node name to "nand@<cs>". Right now it does not lead
> to any failure but when we will constrain more the schema, this will
> become a problem because we want the mtd-wide properties like label or
> partitions to be available for the callers.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
