Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CBEC10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 13:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F2220652
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 13:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oWvfuHz1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F2220652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=true.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	Message-ID:Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wpZ2tEFSNK4FWQZvJd5NoK5NYdIFEVRNkah6Ze/K79w=; b=oWvfuHz1Tor5Xd
	rwvNhe9GyRmKpK80Gyqz/2TBOEmV4zhyRNkZUcCPgwbo89W4U5/zjOsVVx4RHw4PU6op5K2QZ0xUL
	hNHY9/XI2ymlyrQ+KNJzSZjddVj3EEwa4Gjlydv/TVRHl5Z2oWcRf749H2Ksu1oRYnIDOBOHWjtnl
	x+GX0qmyFOIgAsxR3kv05a6ScBX4Cpm10pgkeDBr0zLzKBoq2G4+4LEmslRqTZewahYTFpLz1MF+f
	bcph2o1UjerusPGwpxW1clAg+Mknspslr8U/zddxxNMqsx3S0lu5a5UiKHgZrhlAXn3/SuzJyA8v6
	joBaOy+av3PhENrtG/3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH7Dl-0007FD-U5; Thu, 18 Apr 2019 13:36:57 +0000
Received: from smtp-out.xnet.cz ([178.217.244.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH7Di-0007D5-El
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 13:36:56 +0000
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
 (Authenticated sender: petr@true.cz)
 by smtp-out.xnet.cz (Postfix) with ESMTPSA id 69CDA4262;
 Thu, 18 Apr 2019 15:36:48 +0200 (CEST)
Received: from localhost (meh.true.cz [local])
 by meh.true.cz (OpenSMTPD) with ESMTPA id c89ef53a;
 Thu, 18 Apr 2019 15:36:46 +0200 (CEST)
Date: Thu, 18 Apr 2019 15:36:46 +0200
From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
To: devicetree@vger.kernel.org
Subject: Reading MAC addresses with NVMEM under MTD partition [Was: Re:
 [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for the cells
 list]
Message-ID: <20190418133646.GA94236@meh.true.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1521933899-362-1-git-send-email-albeu@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_063654_643217_2FF2D089 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, John Crispin <john@phrozen.org>,
 Alban Bedel <albeu@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I'm wondering what is the status of this patch? I'm currently trying to do
following with modified of_get_mac_address[1] which uses nvmem_get_mac_address
under the hood:

flash@0 {
	partitions {
		compatible = "fixed-partitions";

		art: partition@fe0000 {
			label = "art";
			reg = <0xff0000 0x010000>;
			read-only;

			eth0_addr: ethernet-address@0 {
				reg = <0x0 0x6>;
			};

			eth1_addr: ethernet-address@6 {
				reg = <0x6 0x6>;
			};

			wmac_addr: ethernet-address@1002 {
				reg = <0x1002 0x6>;
			};
	};
};

&eth0 {
        nvmem-cells = <&eth0_addr>;
        nvmem-cell-names = "mac-address";
};

&eth1 {
        nvmem-cells = <&eth1_addr>;
        nvmem-cell-names = "mac-address";
};

&wmac {
        nvmem-cells = <&wmac_addr>;
        nvmem-cell-names = "mac-address";
};

It seems to me, that this use case is not supported yet, but it could be
probably handled with this proposed patch or something similar. What could be
done in order to move forward? Thanks!

1. https://github.com/ynezz/linux/commit/919e9a943af4cdf9b78b0ead17e9855be90d9466

-- ynezz

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
