Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B670DC44506
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MlKMt1Ei96ysbREWmuWe0mPtoTZrTlb4uXF707dOyA=; b=kM9hBzSIWTB9qU
	YND4DUX3uXDO9BZ8SLL7/PFtOd5FAfvpByjsXQxeRXpT4uIrByscan8GGrWzd9kA26RYCiPs+cvTt
	h1RH2DxgrpMZCOY9f360gfaV/8lzvtGBeSvo1f8M0j0uAFGS/cGFHjIXcQI6I4vsP/mzLQrm5CjbD
	pCFgnutX/R52djWQRI18UcyYanFB5jTqgH0B2eczqzU+Ux0SWkurMuMvkaLXmtwTwMHDFDmKy7oJz
	j7FL+ZtMV3AoYkmupROF9ytskIy2OCmGdpQk7zsMkSxmJSAkxGvoQSMbaIlUfOzyTyaE4JEjk7qpX
	G7tewGlLoivgIWGz+ETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifbs-000000064Eh-3Mvt;
	Wed, 21 Jan 2026 21:19:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifbq-000000064EI-2X1N
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 21:19:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vifbR-000000004oU-2QVv;
	Wed, 21 Jan 2026 21:19:01 +0000
Date: Wed, 21 Jan 2026 21:18:58 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chad Monroe <chad.monroe@adtran.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 06/10] dt-bindings: mtd: partitions: Drop
 partitions.yaml
Message-ID: <aXFCws0XUToQ03UH@makrotopia.org>
References: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
 <20260121-dt-mtd-partitions-v3-6-ec3af93c8f93@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121-dt-mtd-partitions-v3-6-ec3af93c8f93@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_131926_644328_A49794C6 
X-CRM114-Status: GOOD (  11.62  )
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

On Wed, Jan 21, 2026 at 01:56:39PM -0600, Rob Herring (Arm) wrote:
> The partitions.yaml schema is an unusual structure in that it includes
> all possible partition types, and it disables the normal matching by
> compatible strings. As partitions.yaml has nothing to match on, it is
> only applied when explicitly referenced. The use of "oneOf" also results
> in misleading warnings which are difficult to understand. Drop
> partitions.yaml and rely on the standard compatible matching instead.
> 
> The "mmc-card" case previously allowed any partition type, but now only
> allows "fixed-partitions". There aren't any users and the original
> intent appeared to be only for "fixed-partitions".

It would actually be great to also allow 'gpt-partitions' as compatible
type with #address-cells = <0> and #size-cells = <0> and allow matching
on partition UUID, name or index. This has previously been discussed and
would avoid having to extract MAC addresses and WiFi EEPROM data in
userspace on many devices which rely on such conventions.

In OpenWrt I've implemented this as a downstream patch[1]...

[1]: https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/generic/pending-6.12/453-partitions-efi-allow-assigning-partition-Device-Tree.patch;h=cc2c20338aff476d3a5b028e71b08ea15a060daa;hb=HEAD

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
