Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC6ED2ECF7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFp3d2ftwvtf9hsqtaZrABbejPtGdEK4tw+ZWxx/5kM=; b=VJYUlNCdVrNQDL
	WpwEWTqsIj5PLk9w4A4whae7rN+Iakr34qWRqoDt//KpxWCla2Rm4EOusscrKo34gmHn2JlLDJ02a
	Bl0yDnU7wFakqmF0iGpq9ccFc/ksPP9lehs3KF89TVuEC3oKoa3wedY4NJSebvkPDtdHav/bd/JU6
	JkRGPQD6YNMGqOniicSy/aL6f1DA3sGXt+H0Q+B89ICVrrbW13gYI9JEaxeuz+OFWQ8346GRiNcwL
	kuUGOo+nIdxhsfLGhjOBNVg83gR0KUzjGUUzw0tcTkzYNk4PmXsEWplq4Vbwc6uBG3zvTct8Em0SO
	DTiFA4M3sifpZVb1evIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Zf-00000003Nak-0GSE;
	Tue, 20 Jan 2026 07:54:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Zc-00000003NaD-0MUs
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 07:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D5CC600C3;
	Tue, 20 Jan 2026 07:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F985C16AAE;
	Tue, 20 Jan 2026 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895686;
	bh=B726PHTSmFoDDIvtou6n2TxR0c1xXbiJY524zsjJtpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0C6eT+994EWlYBN33+wT2pGsYHsDgja6wB3ZmJcS8QQAeSIinXoiartbKEzfPZAi
	 IfDUu5MoQ5sQrnfa2tdGy3frZrkMgsM9flVupYVy3J8umUc2jwa9Wgams+vfJgLdVr
	 4edxaL24YiiBITeEarfWWqOjszsdvy0on8c7pdpQGB7/MrsEGgS3l+wR+NcSB12u4+
	 eIlS0x4Av9Wzl8hTr7cSaTNLBwivl2zF7pRz4cxgThRykeEupIEqX8WPJCQEdHva9J
	 hPFLeEU41UFX4KJpIODM5XUvjkrNqS2HhOxOT3vHHx0Ud/YeDSCn5d5TiMJEgshkrC
	 Xix/LScERsVfw==
Date: Tue, 20 Jan 2026 08:54:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 08/10] dt-bindings: mtd: fixed-partitions: Restrict
 undefined properties
Message-ID: <20260120-lime-nautilus-of-promise-8db3a2@quoll>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
 <20260119-dt-mtd-partitions-v2-8-77ebb958a312@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-dt-mtd-partitions-v2-8-77ebb958a312@kernel.org>
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

On Mon, Jan 19, 2026 at 07:48:29PM -0600, Rob Herring (Arm) wrote:
> The fixed-partitions schema allowed undefined properties in order to
> avoid warnings when there are nested fixed-partitions.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml       | 7 +++++--
>  Documentation/devicetree/bindings/mtd/partitions/partition.yaml    | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
