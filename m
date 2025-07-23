Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64765C83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 04:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FrxhFbdeWZuP+L+tYGgWPR7lcwJL+u93aBxewoEQDw=; b=E25tGSTvsclEvk
	AihlQtYXrkTqKkxVhGY6W5FF/lHqtkwGh5/wgQdED/dp267qLoqO+K8d+mzIPq7d67dzG35L71foe
	Earx0heGp6JnswhMnGo/AKp/nBKA+8Dq9+u8Nquy4nngV2RVv2ai/XVbSMdnUJ8h9bPz87t5eKbq9
	FLFENuZXxzNmUqy9G1/bGWNX2aeZV1pDJjmM2ybLJWh8f9nxTPNQ0ncFIBkZhJqndh1bxmuecE4Tt
	LAsVCcCYMB07KTjh/2fnZ5+4bjsWFun0nAzSUoAp8CqQJqyRGbRm6Yu/pUiVfHi6zuIgWgSD0NcL2
	NQkjyCiM656zuVRjGJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRTB-000000040zX-1Mgv;
	Wed, 23 Jul 2025 04:52:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRSg-000000040yW-2ncw
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 04:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDC32668EE;
	Wed, 23 Jul 2025 04:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448FBC4CEE7;
	Wed, 23 Jul 2025 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753246303;
	bh=c5i2bIwG0Z+7skW9ZiHKvSW09i+jTKJfniaboye5Wkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNGzEx7H2RrKv41icPRYaa2omTkYItLJMuKbqQ0wbF7Bw24ac+vB7AbMjYdJ7UT1C
	 qRHjCfFDd/omD5E/H5L4tKH2mCiMeG0AfyKM8Xno7njfbd0IxT037oY/nG8rNDUP4e
	 kN8CByMwzTPWUkTPBp93QRfpSqr+9FwnRJz3H+ad7VIWo060gkaPNXV3r1Hu11UKMe
	 KUREnxJ1Bmt5LAiVEMX7sjoFXudekIvP0LBXqLY3bXUGOzqdzyMWN8arqQZiq7sSds
	 N4JtG/sYQEitjv74LKnmCYdw3Wt2Wbrds8zibYE2tpMVBQ6+aQw84vytXZwHP6LY1W
	 mxpAGFts9VDYw==
Date: Tue, 22 Jul 2025 23:51:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Xuerui Wang <kernel@xen0n.name>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v1 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
Message-ID: <175324630208.1226180.15885418620531152001.robh@kernel.org>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
 <588639de591ada408bdaeb0d279c5d62a4b53d61.1753166096.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <588639de591ada408bdaeb0d279c5d62a4b53d61.1753166096.git.zhoubinbin@loongson.cn>
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


On Tue, 22 Jul 2025 17:11:04 +0800, Binbin Zhou wrote:
> Add new compatible for the Loongson-2K NAND controller used for
> Loongson-2K0500 SoC.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/mtd/loongson,ls1b-nand-controller.yaml         | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
