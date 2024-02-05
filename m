Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A10AC48292
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUJdHDxyP20SUEd8I1FE0+Ff3pRUGqKIE+rK2FcaEzs=; b=mmLnYnsO7e8+22
	YBFTFaBOY8d05uxujIK2Dn8ELP6VyDA7QZHTQJ8IMuGI62etKxHKdMVKxYiYUMCy6mg8gNw/213Hx
	mGXgCnW/KlJ6TN4togknzxWjMo3aJa7fhVFlN/GH0e4ds8gJCNypI9gkM23QMIcixJ496Ef3v6zBA
	yfdapIPEYZnC1IqTdHRk9mrT3cJizbwqPyqphzHHteF5WWH4N3I5c5hU1g4EYATMI2+M3Ezw+H45h
	hJ+/IW6Mr6KWQ0thHP5mWlliI8hyqXuiOhZICUgrtHGZSZOSc8mjodC4HKe14oImTFKqx1cdE8ZEB
	cm3yeb5Yo9HUbj317z1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX46Q-00000004RyA-2avG;
	Mon, 05 Feb 2024 18:53:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX46N-00000004Rx6-0pzs;
	Mon, 05 Feb 2024 18:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66EC061241;
	Mon,  5 Feb 2024 18:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDE2C433C7;
	Mon,  5 Feb 2024 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707159233;
	bh=Qbx4RfwsaRZewR7VF0LKKdglBS5+QqF1mISUf3SCQug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftT2BpKqjqUHMeAYjo4IpSNQqGKP0HbPsNaNR1Va8KtG5qA5Y4uT3i+OO8ulu9lgS
	 2yYkX4xjOXMSdWdJTj85sfOP34hp1quElDtsSEVDRmXwPUg5MdVVY4Cko5ioJJNL92
	 8TefZuModxElW4R2bofhx08Jsc3DaC7PNuT8LJhcwV1B4Lo2gvZ/Qg7xXT6IaGaYQ4
	 eK+SZI8zSwji8RFhKZ52zuH7sXmLEjK0LHuxkVP79QlyCwgzcxdknnkqX5Uv+uPY8O
	 GhILRGN7/Tut0SKYA6oUZb9btKe3mKOZhvgS7wLEO5s7q6Bhe2w3ZxhTtBexEQQz9Z
	 QJ8cnBxJh15cA==
Date: Mon, 5 Feb 2024 18:53:49 +0000
From: Rob Herring <robh@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	f.fainelli@gmail.com, kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com, anand.gore@broadcom.com, dregan@mail.com,
	kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com, David Regan <dregan@broadcom.com>,
	devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
Message-ID: <20240205185349.GA4084919-robh@kernel.org>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
 <20240203002834.171462-2-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203002834.171462-2-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_105355_300946_3A25D638 
X-CRM114-Status: GOOD (  16.33  )
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

On Fri, Feb 02, 2024 at 04:28:22PM -0800, William Zhang wrote:
> Update the descriptions to reflect different families of broadband SoC and
> use the general name bcmbca for ARM based SoC.
> 
> Remove the requirement of interrupts property to reflect the driver
> code and only require interrupt-names when interrupts property present.
> 
> Also add myself to the list of maintainers.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>
> 
> ---
> 
> Changes in v4:
> - Split the yaml changes into three patches. This is the first one.
> 
> Changes in v3:
> - Update brcm,nand-use-wp description
> - Revert the description change to BCM63168 SoC-specific NAND controller
> 
> Changes in v2:
> - Revert the new compatible string nand-bcmbca
> - Drop the BCM63168 compatible fix to avoid any potential ABI
> incompatibility issue
> - Simplify the explanation for brcm,nand-use-wp
> - Keep the interrupt name requirement when interrupt number is specified
> 
>  .../devicetree/bindings/mtd/brcm,brcmnand.yaml      | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
