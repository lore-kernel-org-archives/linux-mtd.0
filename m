Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4FBC282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNfipFttFkZcJePC1e08O14HN+W9Hl/NZPJSUX4CgPQ=; b=yCa/8/9KRyGS00
	6epQ6NlhJXUrqcX/vicKoPx9fPNWnaQI191Yx3gt+cWuvc6COsIueYkEe7d0VLG0/UqjEXCRAdRDK
	mrs4XxCyGOcNgl26Hkyn9JilFxJKxqdroh3MXpKHbQSWZzb3eT6j39bUR0VAxCqIrznzUn++aLmDV
	b+C37AyIgssXG8JLoXpajzdWYOMMnGaMw4+32HQOQl7GmIittH0agAWgK0oaU7/AsNImAJxeIpF/c
	6POmxVYM/HOycAcjbuhIxqStpELPwsYw8dxq7d9iMDm6kkTMvbsw04xJ9S0/waQkCZElqCUlKLzk3
	9dm1utB6+cnLycIQh7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCyQ-00000003GI5-10z8;
	Mon, 17 Mar 2025 16:05:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCvw-00000003FlP-2O92
	for linux-mtd@lists.infradead.org;
	Mon, 17 Mar 2025 16:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38397A45A5C;
	Mon, 17 Mar 2025 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ABAC4CEE3;
	Mon, 17 Mar 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742227399;
	bh=brfa3n5BnjS4QD+/ZuK3dFdFOzMD+7usaWnYZwDB2vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYQ7aey92vZohAV9PzPID7FcSshuLxYwtcSMAt3Qsi2z/KUDrwrLsi2Z7ZyYtOZAw
	 WlORpRoNPbTBQQan3TDe66NlKIqoduy0euUa9OMQuaqawTlynpwHEL4+BkHk4Qf9Gg
	 pE7T0MI9uu4KBOn9BqWLQ+iaXf8FgdXbhfCcNn8sefUMLFvvQC3QgARJA14Sa+WuFH
	 IH6k1g7PBmvraSOMzcMEgWVJuv4JyGDHxbIGC6oX7MLxAt+kWHfIKFasqDewCf0TLk
	 klAuTpvU0zitUzBE1XQbkFE0cnYY41IYWeMEX76TSVzuTTR73RON+qBcKrOmiXYHRi
	 njNPNMv8iNm8Q==
Date: Mon, 17 Mar 2025 11:03:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Naveen N Rao <naveen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Richard Weinberger <richard@nod.at>,
	Crystal Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
Message-ID: <174222739794.60508.9641557469920880307.robh@kernel.org>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
 <20250313-ppcyaml-elbc-v4-3-55903722d9ea@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250313-ppcyaml-elbc-v4-3-55903722d9ea@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090320_691334_8AC2A59F 
X-CRM114-Status: GOOD (  15.31  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On Thu, 13 Mar 2025 22:35:46 +0100, J. Neusch=E4fer wrote:
> Formalize the binding already supported by the fsl_elbc_nand.c driver
> and used in several device trees in arch/powerpc/boot/dts/.
> =

> raw-nand-chip.yaml is referenced in order to accommodate situations in
> which the ECC parameters settings are set in the device tree. One such
> example is in arch/powerpc/boot/dts/turris1x.dts:
> =

> 	/* MT29F2G08ABAEAWP:E NAND */
> 	nand@1,0 {
> 		compatible =3D "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
> 		reg =3D <0x1 0x0 0x00040000>;
> 		nand-ecc-mode =3D "soft";
> 		nand-ecc-algo =3D "bch";
> =

> 		partitions { ... };
> 	};
> =

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
> =

> V4:
> - no changes
> =

> V3:
> - remove unnecessary #address/size-cells from nand node in example
> - add Frank Li's review tag
> - add missing end of document marker (...)
> - explain choice to reference raw-nand-chip.yaml
> =

> V2:
> - split out from fsl,elbc binding patch
> - constrain #address-cells and #size-cells
> - add a general description
> - use unevaluatedProperties=3Dfalse instead of additionalProperties=3Dfal=
se
> - fix property order to comply with dts coding style
> - include raw-nand-chip.yaml instead of nand-chip.yaml
> ---
>  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++=
++++++
>  1 file changed, 68 insertions(+)
> =


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
