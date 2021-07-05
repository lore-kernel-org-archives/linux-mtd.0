Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5971CC07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 11:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686456135B
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 11:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686456135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCdP31rhzhQxoXpaKMpcpXdhIlyB9NTrQ0DBnFY3LXg=; b=lN8PChTEAKJWbLFjIrjmJdo3WY
	ZSocthxJrnN8dl/JjjRHXUsn/kaQzGwRjNnQjpdaArVGYX4N+BgaR7NwrHm7lUU5gUN9qgchvF+N0
	t46ROx6lbNBo8+F2nflS6rwaKNoqwi7IyqMdINqufP6PpNddANpEvsPRsIpx2AcHahtPG3xQSuSHJ
	2Mo2aiiYzFb3qBDsmEbevC3cixVFpPqfRF//gG8hgXstklCAcPq2ixeKWou3aK4ZNv8OexcOZ3a2c
	NmiYKLiAlfbcHU5kl542vP1uJb1OqWSUDJZxU7z/nvJ154R4/dlyQ6TVLBefvEu1HwnVbk//DqZi9
	0v2h2Fpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0MKb-008fp7-LJ; Mon, 05 Jul 2021 11:00:05 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0MKX-008fnD-Pz
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 11:00:03 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1DDAD2224A;
 Mon,  5 Jul 2021 12:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625482796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARQsX92EBp7Wn2K4MxzMaJPcsHshTPEoVI1zNKceyGQ=;
 b=Ms5M3RQCZMi4kj/C6L2RODPBc7vq6+R18mojp8AmaP70qfn0MqWNnhCXdTTgqtrX8mOuCg
 navFVHDJDG3umLd+ilqhb5sbuown1MAfuWpdkaKucJiVaHTonSymi4B/hmXg1k9+NStnH6
 jNyxxJQJVLsjssjW3BgPz1fZXjo1JpY=
MIME-Version: 1.0
Date: Mon, 05 Jul 2021 12:59:54 +0200
From: Michael Walle <michael@walle.cc>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Tudor.Ambarus@microchip.com, vigneshr@ti.com, p.yadav@ti.com,
 figgyc@figgyc.uk, mail@david-bauer.net, linux@rasmusvillemoes.dk,
 esben@geanix.com, knaerzche@gmail.com, code@reto-schneider.ch,
 zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw, macromorgan@hotmail.com,
 sr@denx.de, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4/7] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L12805D and MX25L12835F
In-Reply-To: <CAEyMn7ZjBPOcfJ7i3b01Oi-VxrVrK=m0UwfOYeD6sU9t0gAM2A@mail.gmail.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-5-tudor.ambarus@microchip.com>
 <25fd3d28-6320-98fe-b0e4-8caa16c3d357@microchip.com>
 <CAEyMn7ZjBPOcfJ7i3b01Oi-VxrVrK=m0UwfOYeD6sU9t0gAM2A@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <7038f037de3e224016d269324517400d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_040002_120109_B5BF8295 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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

Hi,

Am 2021-07-05 12:45, schrieb Heiko Thiery:
> # cat 
> /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0
> .0/spi-nor/sfdp | xxd -p
> 53464450000101ff00000109300000ffc2000104600000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> ffffffffffff003600279df9c06485cbffffffffffff

Ok, I like this output esp, because you can reverse it with
"xxd -r -p". Maybe we should also request an md5sum just to
be sure we have the same binary.

so the requested commands would be something like:

# xxd -p /path/to/sfdp
# md5sum /path/to/sfdp
# cat /path/to/jedec_id
# cat /path/to/partname
# cat /path/to/manufacturer

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
