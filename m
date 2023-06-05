Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E698C77B73
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 21:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2F/SaLi6CVaC61cAXX+W11zsOh8IrHfgs0Bid0kjWY=; b=Jc8/Sn08WF2mit
	YQu6ysDw1aeYS2U1FF1xSay07vocq6yqE+H1RS+JU81wQ1hF8uE0f56Ur4RP8i61FA4HF5rubTYoS
	TydaPnG4oMXTxi6//kTiBFBBYyvCv8ubV/3sGleVerwPyLwVjR/TXWSQKf5f1FJoiTtRbR2vcOLCx
	6vtWFl5uGjvPaxJLTpHX4PWzE1zsY+7ib+u5zp4+8SNj5YlF1Uh1lPu0Fodvw3T7MfVt8F3SBkwQN
	rEAhOG1nEnTgNbhZMdnaR2stoAYArwCjRX1a3YciJuuo6P4QchIcIVvjtsW6C3QTerhqUlk8iiVO8
	NOWuwFzT92QF4DxCzgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Hin-00Gqb6-1a;
	Mon, 05 Jun 2023 21:26:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Hik-00GqYy-3B;
	Mon, 05 Jun 2023 21:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pjkBZVUgc3CiLu0gi0p3NgsM5Xuycekxxtcs51fqFw8=; b=LxF5UxaufA4Sp8u2YbbNXlz7Cy
	6Mrb3XFZ3WVTzuZkC/ngcGvAzcJs13Eg/khUwkc5te1pigBfwwVzXm0LzLBYq8x7U6i21YssND6ya
	6Joxt8oq5bSsm5+xLTTTHFUqNKkZyGGUUs7OVFx46OvUvIUBP9uGPeW6oQJvRn6Hu1GU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q6HiJ-00EwXx-SM; Mon, 05 Jun 2023 23:26:07 +0200
Date: Mon, 5 Jun 2023 23:26:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
	"sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
	"conor@kernel.org" <conor@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"enachman@marvell.com" <enachman@marvell.com>,
	Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v8 3/3] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <609c032d-0912-4ef0-b04a-4d40a7d2f0d0@lunn.ch>
References: <20230531234923.2307013-1-chris.packham@alliedtelesis.co.nz>
 <20230531234923.2307013-4-chris.packham@alliedtelesis.co.nz>
 <a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@linaro.org>
 <785368df-1881-e62e-6172-d902cee814a8@alliedtelesis.co.nz>
 <eaf9d7cf-c9f5-a5d5-67af-c43761c3c6cf@linaro.org>
 <4ea0b16e-0cec-00db-c598-e0364a7edef8@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ea0b16e-0cec-00db-c598-e0364a7edef8@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_142635_195516_FEFEB87E 
X-CRM114-Status: GOOD (  10.01  )
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

> > Then you are doing something different than all other bindings.
> 
> Not intentionally. I should probably check that the existing bindings 
> actually work as expected.

This binding supports marvell,pxa3xx-nand. That is really really
old. So it could well be it works in the kernel, but the YAML does not
fully implement what the kernel actually supports. Best practices
could of pushed modern day DT to a subset, and YAML only supports that
subset of reality. And once you get outside of this subset, you run
into trouble.

I don't actually know this is the case, but you should keep it in
mind.

     Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
