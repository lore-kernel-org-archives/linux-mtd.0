Return-Path: <SRS0=jA3O=QR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB04C282CC
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 18:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC7A20873
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Feb 2019 18:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PdBOWwgT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC7A20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8928esJ1K5uwNhKH5YCGyWrggS0sgyZd+mX2WnfgTA=; b=PdBOWwgTEB1FCI
	2mLsHAhuV7PI6O7ViMBWd5fV0eFiztVv4hZBX0nexB02ddVucu6cFjXykT/8KnR33OFt+uTwhKM0G
	0BIzJRaL3Azo9kt5U59C0FGazcXoY0YmVg+J79IrJDR/PVQ/bQMoRz3S3Qk1pb3csCMM68WJPjgF4
	TKfpWXpf6s4I7WLXsGaU/u4bUnB/2G4nqVyXORZ7z9rZDawTlxA1hhcZDnCOxcnXAcrYNHRxXTjgp
	bUnu7BO/1S+m6/lvOknBovV87jUrywraCJk8bvU1QX/GWQDVGXDaMp+1HiiT64YxtsT//q2bBq7Um
	dV4Diul4aR5GWcBDZwtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsuHd-00022a-JO; Sun, 10 Feb 2019 18:56:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsuHa-000226-BB
 for linux-mtd@lists.infradead.org; Sun, 10 Feb 2019 18:56:52 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E1850260547;
 Sun, 10 Feb 2019 18:56:44 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Purna Chandra Mandal <purna.chandra.mandal@intel.com>,
 Fred Bloggs <f.blogs@napier.co.nz>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: mtd: spi-nor: cadence-quadspi: write upto 8-bytes data in STIG
 mode
Date: Sun, 10 Feb 2019 19:56:41 +0100
Message-Id: <20190210185641.29270-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128050229.44965-1-purna.chandra.mandal@intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 9558281572e35a86c8072d47c23ae6c9cdae2149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_105650_515608_D3ABB615 
X-CRM114-Status: UNSURE (   9.23  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

On Mon, 2019-01-28 at 05:02:29 UTC, Purna Chandra Mandal wrote:
> cadence-quadspi controller allows upto eight bytes of data to
> be written in software Triggered Instruction generator (STIG) mode
> of operation. Lower 4 bytes are written through writedatalower and
> upper 4 bytes by writedataupper register.
> 
> This patch allows all the 8 bytes to be written.
> 
> Signed-off-by: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Vignesh R <vigneshr@ti.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
