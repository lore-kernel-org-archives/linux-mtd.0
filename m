Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1DCC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 11:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EP6mn3V2jIJPsBtbAz9abG0jhrR7Ww0/fDWa65M+no=; b=ULHlYFGxcJ6cBw
	MGH0HRJXrfrcri3t52PQi01DK0neGIEsT9NQNClq1PwfU0ekqwNw70l36+fX71mAgkd6W3gTjlT3i
	UqpND49grtOvSbE2VrkWgle3B8BT1UTAhBlA0wsgYGLN5IkPF5vgHKpnBgW1E68qISZdeKt1RPorh
	xm45mSVViN8y/KyrijweoyJIEBWRdURjPcxwlM5joeMVHnslBFKvNjX0ZGMkE/vZAeq7B87ieQX8O
	/OGV+LPO8creMTRsLnA+wTGbMwvT4ZEYZvxgCabFrHe0Ayt210LFQ1qaLDNAxR7fTHhPsYJJBDdW9
	TFkP0kFenESYz1pgiQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W3I-00BVmM-H9; Wed, 29 Jun 2022 11:40:13 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W22-00BVAq-KO
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 11:38:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C1A120011;
	Wed, 29 Jun 2022 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656502733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ypnc5OCq23W0X4HdDWD6sZsKnrlByxC02RY//sNedVs=;
	b=X1vQlrOvXJDpNI6XfdM+GtyRvgSIw61K7DDPASriWUtJ2tlh8DCi0yDCCDRPiVgvqMF7Af
	aHRYBDzGTECHHLmDfkSP9KYDDZQmAc/y6ZJ7+aslz96wSWRIuMWVLAImxp8H3VsISFEaru
	xH4SVC3t3AfO5PZKjvyYSQtKNf000O5KFXx7LZSCN9NB6ki7bLAxQ8AcyYtgNI2s8tUbaQ
	R2OX7tJXVSQE2F0C09HiHeye9rJr9MK90Hneb4ikCOuR6D0jUfIGJTYeAg656XdPdudTXA
	UglVjRtjfKu0RTr2eLVQMplwDI0izDojom/f0EGyQXAqsP0Kj+SP6jeOqQ7w5A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?b?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: support label/name only partition
Date: Wed, 29 Jun 2022 13:38:51 +0200
Message-Id: <20220629113851.283725-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622010628.30414-2-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'118f3fbe517f49e17877f34fd677f7374970d92e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_043854_863960_1810AF23 
X-CRM114-Status: GOOD (  14.38  )
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

On Wed, 2022-06-22 at 01:06:26 UTC, Christian Marangi wrote:
> Document new partition nodes that declare only the label/name instead
> of the reg used to provide an OF node for partition registred at runtime
> by parsers. This is required for nvmem system to declare and detect
> nvmem-cells.
> 
> With these special partitions, the reg / offset is not required and a
> 'partition-' prefix is needed.
> The node name with the 'partition-' prefix stripped, is used to match
> the partition allocated by the parser at runtime and the parser will
> provide reg and offset of the mtd.
> If the partition to match contains invalid char for a node name, the
> label binding can be used to declare the partition name.
> 
> NVMEM will use the data from the parser and provide the NVMEM cells
> declared in the DTS, "connecting" the dynamic partition with a
> static declaration of cells in them.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
