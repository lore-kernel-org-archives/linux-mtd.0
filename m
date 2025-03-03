Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0402C282D1
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0lSnq1fuAP/f9qCoTdS2HZCVvGKC1arBg4C/3bNt/4=; b=R50mS54a++yIdG
	iGoVB25TS4i4CT2FtdjNQp1oopSsuYhsiAHOPrCihul8p01z6iaL8NNXov6FXYYn17QHzgaSCnbRf
	k9+Jjwi0Mig7ENTDN6uCVq4GLnU1BsTzygwUAK019SW7VouF/HSqO0o4SvOz7SuQ2WxCRoT48iSPp
	SHK2gA09w+uOx/yqXC4kTqKXq4r+PBf+U/TR6vBmdoZHEMVAAbRpXpfwmVgwTAi3w02iBlu7/P+Me
	W9dZewtYUjrAMgxoxIiaxzeTaEzZh8WiwYg/g54a4qupWpGTNp0zINmwbQozsq8DNQwF695ZimRW8
	mCIxjodX2Jt8KDW8FCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6cT-0000000147S-3SoN;
	Mon, 03 Mar 2025 14:18:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6LH-000000010ZU-2JdZ
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 14:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FA2B5C566B;
	Mon,  3 Mar 2025 13:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C4AC4CED6;
	Mon,  3 Mar 2025 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741010422;
	bh=Kp+dH75fRkj4Yg2B/u14qSdnyXfV1851mjVlG/eyDkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDE7VziqE8Z5eAcLy1ADJtkYPvmnQ1FWgShTdhPsi0Jp00/5H4ih7eFkudyTpV6Ey
	 vzUekJexEEcxmdtofMzZn68/GabGTmMLoyDmPxm2kdElEPPLV3qZha5Aib/AxkKR7v
	 m/mOgM3NliygKNSm4cdkNZYbDU4CUHy7o2nUsiBNydIculfOZE9XJX6vA2Cx8O7TEs
	 nqGWAiDj2LY2VHmrB5jeTqSMkAWpR8/oVe9f3U39KoH0vSV+sGksApEvY4YbqOUYgD
	 MEbgvDOyAHF9gVrkOu+yiC5BM/+QxMgNexT3mwUVWIsR0RWjNldR9e1Z2gFqBmOcaC
	 wYe+elLtbMKhQ==
Date: Mon, 3 Mar 2025 08:00:21 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Richard Weinberger <richard@nod.at>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Crystal Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] dt-bindings: nand: Add fsl,elbc-fcm-nand
Message-ID: <20250303140021.GA1732495-robh@kernel.org>
References: <20250226-ppcyaml-elbc-v3-0-a90ed71da838@posteo.net>
 <20250226-ppcyaml-elbc-v3-2-a90ed71da838@posteo.net>
 <174059551678.3319332.12055848852503108874.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174059551678.3319332.12055848852503108874.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_060023_677624_90E6D7ED 
X-CRM114-Status: GOOD (  19.56  )
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

On Wed, Feb 26, 2025 at 12:45:17PM -0600, Rob Herring (Arm) wrote:
> =

> On Wed, 26 Feb 2025 18:01:41 +0100, J. Neusch=E4fer wrote:
> > Formalize the binding already supported by the fsl_elbc_nand.c driver
> > and used in several device trees in arch/powerpc/boot/dts/.
> > =

> > raw-nand-chip.yaml is referenced in order to accommodate situations in
> > which the ECC parameters settings are set in the device tree. One such
> > example is in arch/powerpc/boot/dts/turris1x.dts:
> > =

> > 	/* MT29F2G08ABAEAWP:E NAND */
> > 	nand@1,0 {
> > 		compatible =3D "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
> > 		reg =3D <0x1 0x0 0x00040000>;
> > 		nand-ecc-mode =3D "soft";
> > 		nand-ecc-algo =3D "bch";
> > =

> > 		partitions { ... };
> > 	};
> > =

> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> > ---
> > =

> > V3:
> > - remove unnecessary #address/size-cells from nand node in example
> > - add Frank Li's review tag
> > - add missing end of document marker (...)
> > - explain choice to reference raw-nand-chip.yaml
> > =

> > V2:
> > - split out from fsl,elbc binding patch
> > - constrain #address-cells and #size-cells
> > - add a general description
> > - use unevaluatedProperties=3Dfalse instead of additionalProperties=3Df=
alse
> > - fix property order to comply with dts coding style
> > - include raw-nand-chip.yaml instead of nand-chip.yaml
> > ---
> >  .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++=
++++++++
> >  1 file changed, 68 insertions(+)
> > =

> =

> My bot found errors running 'make dt_binding_check' on your patch:
> =

> yamllint warnings/errors:
> =

> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
td/fsl,elbc-fcm-nand.example.dtb: nand@1,0: $nodename:0: 'nand@1,0' does no=
t match '^nand@[a-f0-9]$'
> 	from schema $id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yam=
l#

Drop the unit address in raw-nand-chip.yaml. So: =


properties:
  $nodename:
    pattern: "^nand@"


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
