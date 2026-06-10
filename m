Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D4FCD8CB2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2026 07:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uiKfABzzC7h4EWqItiW6I9Bvsco3eUkpPjELDBoNio=; b=GgFgVEzyz9x9vk/Jo3quaw4JQ1
	VPZPA55azggEXFogdur6VZ9wtslCenGrj3f8TGONuZ+GPykF1roDZwlcbIglAOvxIig6/pO1BL4gx
	2TYPcCirjibRmMXCtmhM76JrO9Wl1yNbV4tqvmhTMBBdpolaac4Ar3cIlbkKHW1yfzW1TIF3PoMyy
	wwB+F6EHlSP6zWJRZFQHftVg3pqG1J5SSrriQc0KHCLaxuUV7o84o3vRaJsVMZxovQ/NUbuIjmjnA
	JiVUm98nLNPsVkzFR4sUmcNurP9+GkcWEiQsmrmyWSN+GNnB4vymbPCvJfok4Z7n0byB3p8/ShdOA
	Zpr0Q2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCvv-00000006vnd-21xE;
	Wed, 10 Jun 2026 07:01:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCvt-00000006vnX-2xn9
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jun 2026 07:01:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E74364440A;
	Wed, 10 Jun 2026 07:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 500A91F00898;
	Wed, 10 Jun 2026 07:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781074860;
	bh=OYJP1ER+hWgvvhAnpPvn2Uv/Zhh+Sw24s1fnb6afizc=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=faJ9MwZ2D45dw2/2Ylq1bvtNBeJ1oThJBO9abFz8MNI/4OYwyMyhFhUxMkM4v9eg3
	 Vb71zjef0t6/iJf+HcJsx7EE0HYrwn+oB6J31U9VIpDUSpQr6hFO5OmwYGrLtBCJeF
	 LI29NOxhLqVXH7SHXJg0HVP3+WDhOKU+reg95PaoGJ6qRPha5ElPiwUKItMeGrdyzc
	 RM9ReduZPAGwdE+fi7mVy64c2zUvG2Ns86KCrURuYAuRkXVyRUcSaoP79OAOzeBMCH
	 aoBXfwzqU8cRD0kNr3JhRVsa/8SxTbatBwSTEhHqgDNqtsPWf17VsEryjBJLae65is
	 FuwKt3W/bT0uw==
Mime-Version: 1.0
Date: Wed, 10 Jun 2026 09:00:56 +0200
Message-Id: <DJ56CDMRVFQ6.FOZRIQTF3VDW@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown"
 <broonie@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 1/4] spi: spi-mem: Add a no_cs_assertion capability
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Steam Lin" <STLin2@winbond.com>, "Santhosh Kumar K" <s-k6@ti.com>
X-Mailer: aerc 0.20.0
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com> <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-1-0d626e1dfb2b@bootlin.com>
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-1-0d626e1dfb2b@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3013447064305821660=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3013447064305821660==
Content-Type: multipart/signed;
 boundary=b5f343c01bc04cde0b400a6bad042f9df3d8f60de18666e4c55db11e9b74;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b5f343c01bc04cde0b400a6bad042f9df3d8f60de18666e4c55db11e9b74
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Mar 26, 2026 at 5:47 PM CET, Miquel Raynal wrote:
> Some controllers are 'smart', and that's a problem.
>
> For instance, the Cadence quadspi controller is capable of deasserting
> the CS automatically whenever a too long period of time without any data
> to transfer elapses.
>
> This 'feature' combined with a loaded interconnect with arbitration, a
> "long" transfer may be split into smaller DMA transfers. In this case
> the controller may allow itself to deassert the CS between chunks.
>
> Deasserting the CS stops any ongoing continuous read. Reasserting it
> later to continue the reading will only result in the host getting
> garbage.
>
> In this case, the host controller driver has no control over the CS
> state, so we cannot reliably enable continuous reads. Flag this
> limitation through a spi-mem controller capability.
>
> The inversion in the flag name (starting with 'no_') is voluntary, in
> order to avoid the need to set this flag in all controller drivers. Only
> the broken controllers shall set this bit, the default being that the
> controller masters its CS fully.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> I am open to suggestions regarding the naming of this flag.
> ---
>  include/linux/spi/spi-mem.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index bd2a73d46980..de153719a08e 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -373,7 +373,10 @@ struct spi_controller_mem_ops {
>   * @swap16: Supports swapping bytes on a 16 bit boundary when configured=
 in
>   *	    Octal DTR
>   * @per_op_freq: Supports per operation frequency switching
> - * @secondary_op_tmpl: Supports leveraging a secondary memory operation =
template

Is that removal intentional? Looks like a mistake.

-michael

> + * @no_cs_assertion: The controller may automatically deassert the CS if=
 there
> + *                   is a pause in the transfer (eg. internal bus conten=
tion or
> + *                   DMA arbitration on an interconnect). Features such =
as NAND
> + *                   continuous reads shall not be leveraged.
>   */
>  struct spi_controller_mem_caps {
>  	bool dtr;
> @@ -381,6 +384,7 @@ struct spi_controller_mem_caps {
>  	bool swap16;
>  	bool per_op_freq;
>  	bool secondary_op_tmpl;
> +	bool no_cs_assertion;
>  };
> =20
>  #define spi_mem_controller_is_capable(ctlr, cap)	\


--b5f343c01bc04cde0b400a6bad042f9df3d8f60de18666e4c55db11e9b74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaikLqRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hA/wF/cauGbYgS+7axtDX7bARvaFo1s7ShHk93
xYUr0A1V/EKIlPOwYTjGGhlSTUGmr14dAX0T0GR9X/5DVFPkgADCUHpNHn9oBEkm
iGWHOJyMULNphr8Y1lCZSmNbrmcQTwyZvp0=
=Xngn
-----END PGP SIGNATURE-----

--b5f343c01bc04cde0b400a6bad042f9df3d8f60de18666e4c55db11e9b74--


--===============3013447064305821660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3013447064305821660==--

