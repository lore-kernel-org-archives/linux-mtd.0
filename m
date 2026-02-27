Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3CE104891D
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Feb 2026 23:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f7z1oY3ROUyl73Ee2gyNe1tr+N2AD2PIXtGX0Hy5X90=; b=2RIwI2vH8Y8+Im
	idb7NT+G+wSxCGX64ItQv7gbc8JVIL7nqQJVVHqDpPzBfzHms6670dZMpuGZxqbeOmelaKeMhO/Ra
	RzeNOsLD052bgnzqa62t+Cl+hpGRAxgq/sgugky7HaU+NPV+RkqkUe2PcTRyexLT+P99FaZnzx/0e
	EQtcYHEBJ03Lb+HJprP9ZGw615Yqe86CafjrQCm3ImUeO1khOA/jbiKE766EYrRYd0zsaCyl3K+Wq
	lrQkXaUqqPX7ahPesQMe3GeA6dUvnfdDzpxKMHXJZD8IoZc983k7RId2SaeYJ4XBybQa2FDkVCvf0
	Bl/m7g2SEOTI/MhqFiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6qc-00000009FS1-3olX;
	Fri, 27 Feb 2026 23:02:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6qb-00000009FRo-3Ysd
	for linux-mtd@lists.infradead.org;
	Fri, 27 Feb 2026 23:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F46C6132F;
	Fri, 27 Feb 2026 23:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A98C116C6;
	Fri, 27 Feb 2026 23:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772233333;
	bh=Iglr5a/uMiSNItPCwlIYFisg2PDATTWy5iPvGNVh5Ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjKuB2FcE68TLhxxy8HRgIlDbxjmfSUCGBE91EcAIpnf7OAby0GY3b2VcsQGY/5bS
	 w0+MUg1NtI5r/LbRU4D5ZxVwe1Upcoj3B5hiyb+t3awrdSkobMB8VOMJc8cFeROsr7
	 L+WflGGwN54py3hgQEo55lI9ppfGyYUCJloySgO2MkZfLfpzCs7fURR47jQbM0GeUN
	 9K0BMckCNw+f2vxtTCnzkImtiMN/7SW1mKB8LkzrI+FYgKXM6YSzeL1cvAhOphUnkc
	 uaiooKkLMD5EVFbBtw3Ujc2U3C+SdhJjEDAXFFKlE4UIxI+rAkLYxKe3fvmTSWAZRh
	 CrM94IKEnv4/Q==
Date: Fri, 27 Feb 2026 17:02:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Akhila YS <akhilayalmati@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: mtd: st,spear600-smi: Fix example
Message-ID: <177223333156.922984.12576783607070606721.robh@kernel.org>
References: <20260225-perso-fix-spear600-smi-yaml-v1-0-8ef3d205ab3a@bootlin.com>
 <20260225-perso-fix-spear600-smi-yaml-v1-3-8ef3d205ab3a@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225-perso-fix-spear600-smi-yaml-v1-3-8ef3d205ab3a@bootlin.com>
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


On Wed, 25 Feb 2026 17:24:45 +0100, Miquel Raynal wrote:
> Example is wrong, the reg property of the flash is always matching the
> node name.
> 
> Fixes: 68cd8ef48452 ("dt-bindings: mtd: st,spear600-smi: convert to DT schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/st,spear600-smi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
