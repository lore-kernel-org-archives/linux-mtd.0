Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7ED8D73E83
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krjwpUsSGMBi3CtpwrlS9IkeL0P/BQeHMpB8XnDIMD8=; b=pTYCJ8LbRE05+N
	vAAK6GzDPHOVgUagXEICkWjGEnXjqwL7C5dAQwG/gbTQoRTupJ2Z8Am3Ee0ZJMjxg3KKfZeFbosHE
	85OVog2pODxlbAJOBGRMN2PAq7V826dNINSgZLhZfPQZ8ETe5/bufi5Z2KVIakvODm4787tr8Xzf0
	qclelezVUcSOO4JBzN69gubRd9IoXocrhJMyVclsk3myIIhxxwpKNyk/zYnuTkzY9RZ9YG9nox585
	GbajKlbtZFqzaQlEGPU6Jb9oFyLhdH2ODd3NyxmrYWtKyRXlTuV2L0gHSRuz9EedFy88Ooa6uQCsJ
	DQ1xQHgnRQNlG0i800hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWBS-00000000TLV-1yhJ;
	Thu, 29 Jan 2026 17:51:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWBR-00000000TL9-1D5E
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 17:51:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E115600C4;
	Thu, 29 Jan 2026 17:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF971C4CEF7;
	Thu, 29 Jan 2026 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769709116;
	bh=2JtMQNQa+OnOl3AsJAyVXPNjSQbR/yg0GPNKZNSyqBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q70g6PdYHrvphSTH9w0yeqNlsW8vvOFPvBzoE3V4fKDavaR/SrMzQ8QfgW0xFCZkX
	 iHSHz0i1d6UsRPytZqxmXm/QIgD2WM/QrdgUmB19iuSXOy4DJnp6Raw7T1ITup3SRZ
	 J7XYM252epF0BXgN0G4cRJW313mOtVapFHDFJWJ1RwdhdfuVpw1jX8o9RwNoPcxvKI
	 yrcieBe72iJrur0QRMmWcczORdBd+XwOtKWY+9/jDIommNB/ROnuBXgT4ltoqb1HhM
	 r/MdRZLwE6nU1nDEJRHMIVIJI9ePS0KDkPLRQaYWB0X2VSJqW4Xa2Sd4tx0TNbs9l3
	 9jCwwrXbJwOaQ==
Date: Thu, 29 Jan 2026 11:51:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v3] dt-bindings: mtd:
 mxic,multi-itfc-v009-nand-controller: convert to DT schema
Message-ID: <176970911448.1337178.5863396733768159664.robh@kernel.org>
References: <20260128-mxic-nand-v3-1-c61764e85f60@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128-mxic-nand-v3-1-c61764e85f60@gmail.com>
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


On Wed, 28 Jan 2026 15:36:12 +0000, Akhila YS wrote:
> Convert Macronix Raw NAND Controller Device Tree binding to DT Schema.
> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
> Changes in v3:
> - Fix errors detected by dt check.
> - Link to v2: https://lore.kernel.org/r/20260128-mxic-nand-v2-1-6f0cf94f2fd7@gmail.com
> 
> Changes in v2:
> - Add "Mason Yang" as maintainer.
> - Link to v1: https://lore.kernel.org/r/20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com
> ---
>  .../mtd/mxic,multi-itfc-v009-nand-controller.yaml  | 78 ++++++++++++++++++++++
>  .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ----------
>  2 files changed, 78 insertions(+), 36 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
