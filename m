Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA42C282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmNN5pYR1s2TyVFHSOq4lLJRtBXS4iWOWH3t09Dh+ss=; b=0xnOjcK0sfGfuW
	tNMPuVIgmLjfrqDNSbSwE/Hm43M986APgVT3Wb+qQ+72cEja3IsAKatcgQeyJDKDrKFoHLJeZTtmQ
	BwlUbB1Ddl0OyM/mMr9UBJMcfpL+7UOqZNmxWyctjnDTExvJu/Yhbzk2vDEDeCAcsRcO1JeAJc3IY
	fMvo6Asr4+dncI8nlD6/xrHJ09I1qAW5G7zTb+obHxAzVoY6U1ZA8yePEfPxHhrJy+lOwEk7p6//9
	6aHxnJWz5El+27Gqtk/FDFCCHWCWqRuAvm41WQ8YTeAJZkhTeMw5knbMCM8HMgLzymx1w4xUKJlBW
	sY3yPbRjiPUOXNPDkIAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCwk-00000003Ful-3mEs;
	Mon, 17 Mar 2025 16:04:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCuJ-00000003FJ7-1CfQ
	for linux-mtd@lists.infradead.org;
	Mon, 17 Mar 2025 16:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E2A9DA453EE;
	Mon, 17 Mar 2025 15:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0905CC4CEE3;
	Mon, 17 Mar 2025 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742227298;
	bh=aJ3IP71SO/W9NfRGjFTM7N+/kwSupocM7aNe9qVRBDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOJ7aJpIQ20nyMCGeBjFqGg1Jhcb2AzJUpo8g1Xhk3a/teE1uMfCJWQCyTiUsL/kf
	 nfEvWaQ8nytoiX5aGxOYplAVtFXJBwQRkAkipwl6rT4SsJNcUbDImnErS3L07tn13r
	 xkKVccxwbT3awyAhXnwDH8c+UJuEz/FfizEUyLDloYZMzzH8NF4uZwyVaEJQZRKLU7
	 ZFh9Id0HGx0/9E5GIq/gfVit0rjVclobVAHZLFx8MtCtfCTUFMCdp+UMzdiaUDF7Sx
	 bt7PUYz9ZSQo9K2hRiZUCPZhvZ8Eh9pWPd53xiJuNAqi/NrLIHKWldelYOv3SS7+f0
	 ot5949uIKvn2Q==
Date: Mon, 17 Mar 2025 11:01:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Crystal Wood <oss@buserror.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: raw-nand-chip: Relax node name
 pattern
Message-ID: <174222729663.55568.3356685384531262945.robh@kernel.org>
References: <20250313-ppcyaml-elbc-v4-0-55903722d9ea@posteo.net>
 <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250313-ppcyaml-elbc-v4-1-55903722d9ea@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090139_387117_137DB004 
X-CRM114-Status: GOOD (  13.53  )
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


On Thu, 13 Mar 2025 22:35:44 +0100, J. Neusch=E4fer wrote:
> In some scenarios, such as under the Freescale eLBC bus, there are raw
> NAND chips with a unit address that has a comma in it (cs,offset).
> For reasons of compatibility with historical device trees and
> readability of the unit addresses, this format is kept.
> =

> Relax the $nodename pattern in raw-nand-chip.yaml to allow such unit
> addresses. Unfortunately $nonenames defined in bindings that reference
> raw-nand
> =

> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
> =

> V4:
> - reintroduce patch to silence dtc validation error, after discussion
>   with Rob Herring and Miqu=E8l Raynal
> - add some more detail to the commit message
> - remove unit address format rather than extending it
>   (old pattern: "^nand@[a-f0-9](,[0-9a-f]*)?$")
> =

> V3:
> - remove patch after discussion with Miqu=E8l Raynal
> =

> V2:
> - new patch
> ---
>  Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =


Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
