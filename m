Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976BDC282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662CF20880
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cleomgLO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xkt2zQuF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662CF20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=HlJABojClB/WObx5Q5ktnlbDLEwXZ5hwCRhgk/RmLQQ=; b=cle
	omgLOBGb4Y0vkgELfaAqEwi9gqbVOMPfbtRaj9LBpAbBlMMDu22aBWMwrbFlsEQL9L+SexcgUk9Ty
	dxQHDxBSOfbzKx7jWxZwkk24JjJUUqX5wKq8odSIn8R8sUHzcx1sHrBkF+5hDuC5T59jGpm2a2ah2
	N6/2zoKyLh9vN2J6CRev4uJ2oG7X52gbfXgs3uxvYahTsyUvxvJQB3oNIEt4JsjGnRCAZzPcGfyXE
	GquJrXZM9ecT0GPgjW23y2y6jQ1sgSqbkMHOZG/LYwMNDd+hAU1mBtpuIZGBGQ+N+Fvbd6tLo4smZ
	/hUTO+fPE4x8YNlKwS8ovnGzc/gsRsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3ME-0001Cp-LN; Mon, 28 Jan 2019 09:37:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3Ld-0000Qm-Sg
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:37:22 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A32F20880;
 Mon, 28 Jan 2019 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548668217;
 bh=6bZF7swuykAvwsjatOpi0WMVWK0rZ/qqTZMdtU1Ci30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=xkt2zQuF+V0PS3Cbbu/3uYnjbqwbNv15n2EwE+kQoJ/DfnNahdfCpqKCXS/ny6vUo
 fFo/LrtHSKVn6Kflj/yIFQOg8fWD1ztCzGEpp4f4MI0A0vecn6CMoVQzltwbT/ewdy
 PhyQZkDGLjj11GttxfN+4GbPzYUm8dPRl75Pkc40=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [v4,2/2] mtd: rework partitions handling
Date: Mon, 28 Jan 2019 10:36:52 +0100
Message-Id: <20190128093652.18997-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 2c24c9af0f38eb9530d77fd876b5dd55e46349bd
In-Reply-To: <20190122114134.8199-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_013658_944175_F1E8A868 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-01-22 at 11:41:34 UTC, Miquel Raynal wrote:
> Instead of collecting partitions in a flat list, create a hierarchy
> within the mtd_info structure: use a partitions list to keep track of
> the partitions of an MTD device (which might be itself a partition of
> another MTD device), a pointer to the parent device (NULL when the MTD
> device is the root one, not a partition).
> 
> By also saving directly in mtd_info the offset of the partition, we
> can get rid of an external mtd_part structure. However the mtd_info
> structure now features a union of mtd_master_properties and
> mtd_part_properties, which host respectively the master or the
> partitions properties.
> 
> All part_*() helpers are removed, the corresponding mtd_*() helpers
> are updated to handle the partitions themselves.
> 
> The part_absolute_offset() helper is also replaced by
> mtd_get_master_offset() which is very similar but not recursive and
> accepts an additional offset. Plus, it is used in both mtdcore and
> mtdpart.
> 
> While at it, try to be more explicit with the mtd_info structure
> naming:
> * we usually use 'mtd'
> * however when there is a relationship between two mtd_info
>   structures, one (or both) might be called parent/child,
> * master always refers to the 'root' device.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
