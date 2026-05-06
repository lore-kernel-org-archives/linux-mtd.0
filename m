Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C58CD3439
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ/P4z0sitg2fQDJlnYnjrfbaeXE60Emk278PRN9sko=; b=TzCT0/XDrp3AjR
	oD6pLhQPXaJcvkJ04dLW+uaO2w8jAwfPu62Lc3ADx7nzWV2PNHj9nHAjHQcV8RMm0fa4u4oKA1yo/
	CRVdrPuYDar7e+avqeNlCv/uQJ0XAVV/Elpfnfi8Ut1iPYUfwWzaDuDryA/kOejw7Lwc5nWqNJAOd
	i2W8tHpFscemMozqk6bjzmwwLlsSOGmvA3ErmhbdDLlufgzBT//IzJxuauqV/lw63xlKPAu37Ry9E
	+20zAnYYNaym3kF8tUku/mzNrZ0O44dReoW3D+XDtn2aczLbmmPx8cqdb4ybm93Zk4rPWtXYVAxTm
	y5iwlMkfnm3NDoqRc3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkb0-00000002BD7-15Wg;
	Wed, 06 May 2026 22:19:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkay-00000002BCO-4ATm
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 22:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 667784197C;
	Wed,  6 May 2026 22:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E8AC2BCB0;
	Wed,  6 May 2026 22:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778105996;
	bh=/+CKgoeuypQEaB7jyv2Zm3OW8jOi1NyTKSfrDXFqRhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpSWsfc56Yj3uwb8u81FnIIC3/JdJ62h+fG/xSsxTuCfW/N7DssJcmHwyKyPcTTX3
	 CKON33G7l/otFmsXbqc9bWkoAL8U9g2je5zrzrAlhd+QY/W6ban9Nv2EUR4LmRjcJ5
	 UJLH4SD299tBu5o45uhAGc4+Cs/FcpJbElOA4mLeWiMUnXXCC0jzHYL7xQKp85qKqQ
	 e3r89avbtzCqaI1RDGHg7tG3OGAc5FL/ZVdGLJcpfZ40VLFIJsM38JQKesGmOZpmXe
	 RlupeC/briU7sP08A6Zn3qVh3TRXaHC2X5NS8mcT0H3Ke9RXzGzZg689DvhJtz31Bs
	 t/K7HnJ3qJSNQ==
Date: Wed, 6 May 2026 17:19:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: conor+dt@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw,
	devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
	krzk+dt@kernel.org, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	vigneshr@ti.com
Subject: Re: [PATCH v10 1/3] dt-bindings: mtd: nand: Add nand-randomizer
 property
Message-ID: <177810599339.3410044.3676671440442113308.robh@kernel.org>
References: <20260505013453.980249-1-linchengming884@gmail.com>
 <20260505013453.980249-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260505013453.980249-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_151957_052173_D44FD2EE 
X-CRM114-Status: GOOD (  13.39  )
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


On Tue, 05 May 2026 09:34:51 +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Add the 'nand-randomizer' property to control the data randomizer
> feature. This is used to improve data reliability by reducing
> cell-to-cell interference.
> 
> Depending on the hardware architecture, this property is designed to be
> generic and can apply to either the NAND chip's internal randomizer
> or the hardware randomizer engine embedded in the NAND host controller.
> 
> This property is defined as a uint32 enum (0 or 1) instead of a simple
> boolean. This design choice explicitly supports the "not present" case.
> If the property is omitted, the driver will not interfere and will leave
> the randomizer in its current state (e.g., as already configured by the
> bootloader or hardware default).
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
