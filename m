Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB68C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47Z6Y56eXSyibQKiboMmJ594gnQjyBPiAT0rDSAH1NU=; b=VWr+X0kom9PKyu
	HkyZAhQK/hd7HhCbNc/CyecifnxHQmiODn/ZcpSpXmPUAoH/3Xvfy+4KZC4f0MB4amTg6XsmfjWTI
	8pz8HyBo8UCS5DVOEEp5SIe6RD5KUjJPG8M7g0D9RZB1b8LbwFP7GjujiNgamlQHuMx/L0uq/IWdk
	UbPGcQU+RVIsJCpX3q9U/eBBvOrQyUzebUOhGWgGvB9+SiEe4Clcze+DfpX+OC5gq0lp69duGPuVC
	ORBIWzX5RJkF/23GtOp9FtzyppeuNv/G+jXSqrF5p4banhw+OJhLGRy0LqtCu6VIl1748espJUut0
	ATMRBnw76Iob7Wok/v6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAMk-0000000BPgk-1iDZ;
	Thu, 20 Mar 2025 07:30:58 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAMg-0000000BPeu-2swG
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 07:30:56 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 97CDB14B;
	Thu, 20 Mar 2025 08:30:43 +0100 (CET)
Mime-Version: 1.0
Date: Thu, 20 Mar 2025 08:30:43 +0100
Message-Id: <D8KX1NO755U3.2HC0O2OX5MJUL@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Rob Herring" <robh@kernel.org>, "Takahiro Kuwano"
 <tkuw584924@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bacem
 Daassi" <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
X-Mailer: aerc 0.16.0
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com> <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com> <20250319233024.GA2625856-robh@kernel.org>
In-Reply-To: <20250319233024.GA2625856-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_003054_877699_CCC7F79B 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu Mar 20, 2025 at 12:30 AM CET, Rob Herring wrote:
> On Wed, Mar 19, 2025 at 06:47:44PM +0900, Takahiro Kuwano wrote:
> > There are infineon flashes [1] that require 8 dummy cycles for the
> > 1-1-1 Read ID command. Since the command is not covered by JESD216
> > or any other standard, get the number of dummy cycles from DT and use
> > them to correctly identify the flash.
>
> If Read ID fails, then couldn't you just retry with dummy cycles? Or 
> would unconditionally adding dummy cycles adversely affect other chips?

Yes exactly. IIUC, the first byte of the auto discovery (RDID
command) would return random data, because the output driver of the
flash is disabled. The second byte would then return the
manufacturer id and third and fourth the device id. This makes auto
discovery fundamentally broken with this chip as the first byte
might randomly match any manufacturer within our database.

Takahiro, if you can reach designer of this chip, you might tell
them, that this was not the greatest idea :o

> Otherwise, add a specific compatible to imply this requirement. Adding 
> quirk properties doesn't scale.

Since auto discovery doesn't work at all, you might just add,
"infineon,cyrs17b512" *instead of* "jedec,spi-nor" (because it doesn't
support the usual RDID command").

Alternatively, we could introduce a "generic" compatible which just
uses the standard RDSFDP command instead of RDID for discovery. Rob?
Then we'd need some SFDP fingerprinting mechanism to match the SFDP
to a particular flash type.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
