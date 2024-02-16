Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03960C48260
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Feb 2024 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mHolmWTcYeUHbjmJkHPCx8Bc5B6KNGL3p1R+Jio7JE=; b=nREcexlH9lM5pgDbg9oLvxxTqv
	S9Mr6ixU//E7i9xyVlIhZaznJsh8DTqzU5zMQ2nCrHnztzy/t2VYfd/osvjDSHf+UVelmg3VK9+Ee
	VEYSAuEyJishbjVGBeZ5umsLDTtPTzcCmkeQhJlZ/siFWzBpjDmluglO4vEaTwRJ4ZabGBgMVfnPQ
	l1qH0N7HNmrQCfnOw/1IgHYoyrM1yIhBwlki3Ms3xW3kefMN+lvRE3ZL9kpGd/iVwDwSdLZBgGf/X
	jsfeh9AtL/sNzdfS3ecV4y2X+LP70rcDqFZdiW8RG2qaykWyazmyp3HBdqH+5E2mW+V3MYQ091+sF
	kS532yOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ravKo-00000001wKb-3ThN;
	Fri, 16 Feb 2024 10:20:46 +0000
Received: from thorn.bewilderbeest.net ([71.19.156.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ravKl-00000001wIM-2tC1;
	Fri, 16 Feb 2024 10:20:45 +0000
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6F548E24;
	Fri, 16 Feb 2024 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708078838;
	bh=0elf/8DBFF9nD7HnEVv8mQ6pIMWx7HsQOmIWp2FVY/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AX393yptT4D1gnQTL0SLZpDFwTppZK18wmPWMfWUEguKzpArW7XJbW9RmHc7uDS3v
	 lSn7hSHxdHJVDHwQ2GW752BbF48UPsRnW215LappvaIN+6EqLREBTK2sY8cpdpfGk8
	 NTZIiTekG3ROb8sdELVBPNOYpons8lbxnHLAKzm8=
Date: Fri, 16 Feb 2024 02:20:37 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, jk@codeconstruct.com.au,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH] Add eSPI device driver (flash channel)
Message-ID: <f63c3077-f8cc-4f05-92ef-9b2303b181f4@hatter.bewilderbeest.net>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_022043_752442_11FCC4CB 
X-CRM114-Status: GOOD (  16.98  )
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

On Tue, Feb 13, 2024 at 06:36:08AM PST, Manojkiran Eda wrote:
>This patch adds the driver support for the eSPI controller of
>Aspeed 5/6th generation SoCs. This controller is a slave device
>communicating with a master over Enhanced Serial Peripheral
>Interface (eSPI).
>
>eSPI supports 4 channels, namely peripheral, virtual wire,
>out-of-band, and flash, and operates at max frequency of 66MHz.
>
>But at the moment, this patch set only supports the flash channel.
>
>Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>

Hi Manojkiran,

Glad to see this progressing again!  It sounds like there may still be 
some open questions regarding the approach, and as others have noted 
there are things included here that should be split out into separate 
patches.

I did try it out in its current form though, and encountered a few 
problems...

Firstly, the calls to dev_notice() all appear to be missing the struct 
device * as their first argument and hence don't compile (I hacked 
around this to get it to build).

Second, the device-tree updates only include aspeed-g6.dtsi, so I 
manually imported the corresponding aspeed-g5.dtsi change from the last 
version Chia-Wei posted [1] and used that for the AST2500 system I need 
eSPI support on.

[1] https://lore.kernel.org/linux-arm-kernel/20220516005412.4844-1-chiawei_wang@aspeedtech.com/

And finally, after making the above changes and running it I got the 
following during boot:

[    0.288079] aspeed-espi-ctrl 1e6ee000.espi-ctrl: something went wrong
[    0.288120] aspeed-espi-ctrl 1e6ee000.espi-ctrl: failed to allocate flash channel

I'm not sure if there's some change in this new version such that the 
dtsi patch I imported from the old one no longer works, but if nothing 
else it might at least suggest that the error messages could be made a 
bit more informative.


Thanks,
Zev


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
