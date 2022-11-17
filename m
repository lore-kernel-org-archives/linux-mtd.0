Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7D8C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kkAlZLbc08oerlP6GmF5p26J+dCKvk7A2dKJNlJVDk=; b=pS2wX66Pl8lrK3
	vBVQapD8tDNnmDsDXibH182mmP5g+iTHxr2snXxJ0xrwo9LR3u8voU9NaNPISWKqKtqJVYp8BwgDT
	yc4KJXnE0YQ05EGcb7iySVWqj0DOebE/gvXlaZpr6d8SCngzOwN6oaSgiMUYsBWGdlIRubGgmRvvk
	ns3gFZ3QoHdVsIzwRgcdAaSNLpb3DTAlC/VXHixDfIr0am4djaEgdTD1eXjcmglOFDXK/YEXa7zwA
	ivPB1BtKH8Bj/Mg1W2x2LfK2VJzAUD7ZWDgEEukXYDvYV0sB3Nvnk/UNxb62jmhDY31hM0OPXcuEh
	mwalTmpgJU8JcIORoahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFD-00HYyn-KL; Thu, 17 Nov 2022 21:16:23 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEx-00HYhN-VF
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 184A4100004;
	Thu, 17 Nov 2022 21:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0LnV7zw4PVMZ/yFK8keNGGMheSfJL76xYuNexBsgUA=;
	b=Ca6vsTUOr0Uiru6/3wNLu4QBUlIsd3WogLBxNaFPFwZ04zQ81h2JqtSPqqOGMtfUrtUTmQ
	dzcx5ZH4NR70ba8XBzNF0dtC+MypYXgCAWG88yavL+hGeLnNTNFkYp/Dj+M+QTUl0+4jNK
	fl1HYJ4xoTMhVE13MYPoj/it1c/QHuV+RaiszkRm/c5vZl8PQSsRAiAZdp3l7iQqzDM9+u
	z6Tt1CEqUX+wem0EIDJ4y5Dcg8PFqm8E2Ca7fLTwRfUgBBFAUTgqEEZn6FcCpA1+BtmSuX
	WurKr9/idNKwznqk8zB3t+T7pA1i+v2IDQVIKWlbKvmwWcTKXrvMWXhmcyURCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 06/17] dt-bindings: mtd: ingenic: Mark partitions in the controller node as deprecated
Date: Thu, 17 Nov 2022 22:16:00 +0100
Message-Id: <20221117211600.1273520-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'73fc6320651ab13da88ee3f4a4bb7499f0b21e20'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131608_243098_3FF6A666 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2022-11-14 at 09:03:04 UTC, Miquel Raynal wrote:
> Defining partitions as subnodes of the controller has been deprecated
> long time ago, but unlike having partitions within the controller node,
> having an enveloppe named "partitions" (which is not itself within a
> chip subnode) is not that common, so keep this deprecated definition in
> this file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
