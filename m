Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D530CF9C6D
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2024 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2/wHP+htQ3iCzvSU2LiCgn1b5+RCBQ+u5b0dZOArls=; b=EWkRERi293hCTp
	Yd286fq+eXRAHbutjDjJYYJEoffb4v8pBHiaszLgQ4dIu4teq8a5yQIUjSTMB7smiy+myqFyMsNIn
	MYRUBWP4A8yWd4/kkmdjebD9CTGwdcGte+BRsV+hm519wMi5VcBjADi/iGa1PtZ4t8zCmfgVTMqma
	iMs2tNpL139uOXYhwC7jzA0DRHdaH/rmhLAI8O3K7ai0bcignrUfHOA+jXvlqSFpB4UsnOL7uPdnJ
	QdxPEh3/k2yFYVtB61vtB2y5PXbMBxKxfow0NiMuUpF6uLtjTGdCios39XZju44QaTnH9AQdO67HG
	8dJUeUxM1CY4bleTLdyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssTGg-0000000Fi7n-2HhV;
	Sun, 22 Sep 2024 20:33:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssTGd-0000000Fi7S-1oKQ
	for linux-mtd@lists.infradead.org;
	Sun, 22 Sep 2024 20:33:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE7C55C5595;
	Sun, 22 Sep 2024 20:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5BAC4CEC4;
	Sun, 22 Sep 2024 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037193;
	bh=kQgm3SZGxW+gvFOufHSVT4h1ipvIYBkI2AYeB6f+NW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8nnl1TYczuFzs7OUpbOUX77WRhBHEaYd61DyEXSuzoQJ94NW6pXWJ410gB3wryFP
	 60K/2/hpjOS0aHHjt/r0PbJUOf+iHyDTr5naM95n7oF8gl4iwrhSUkZ69PBZP9XG/H
	 wcm0cUEVGZ2iRB8MLOi9GE+aM3LtUhknj0jB1GOqgdaAvryYyZiDC+/kY3f5RRxsrl
	 Wq9IdDJxVBIVQ/GeiihTQdAtesYasAP48yfkBhQpNxnfnjFjjQle+XqFMtpeXznpzk
	 zu7/RlEpKvjZ8s5Y8yhz3Kzwtuo6mjJL7m/gZj3j4L009g+rw3aIMPx5T7PU50wEsR
	 Ft+HfQ6hoi46w==
Date: Sun, 22 Sep 2024 22:33:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <n3u4licmep32gs23lucnelczhinhri3arsu4j6p3yf66j63oaq@3zoazav65x4j>
References: <20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com>
 <20240920-loongson1-nand-v9-1-9cc7b9345a03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920-loongson1-nand-v9-1-9cc7b9345a03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_133315_532248_7411ED07 
X-CRM114-Status: UNSURE (   7.48  )
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

On Fri, Sep 20, 2024 at 07:18:53PM +0800, Keguang Zhang wrote:
> Add devicetree binding document for Loongson-1 NAND controller.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v9:
> - Change the compatible to 'loongson,ls1*-nand-controller'.
> - Rename the file to loongson,ls1b-nand-controller.yaml
> - Some minor adjustments.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
