Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540CFD4415B
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+YooAp1dOyxLzqVA3BEGG4osY+JmY8WW5DLwMUdXU8=; b=ByQ3xl7a8J61fjdq01eHVqHowm
	m5SPwe/jsl7ocv7l6AB42a+mgV6Tsp4CO0QNd30z2C9ToKYW0QB2/3tJSieFKlK5XSKSc2HwWI7SL
	fuN3iJwMCKcqGhOJt6/dzp+iqYEdcR/AvuvOSyudukG726zI4nHYb08Xs0RS5jIUF6AoQa0WIa8It
	4uRTFZMyn+BwOyteVgIvpzs7yILRKVaju3GPp2HSgUOJBZ/VN3QND3CXvwrwqSu5aBRmSF6uPNBpI
	cJQ7l92MRHGL+7Rz+ke/z+BV+YXK9vEQ8J5K9LLY/t1Qe85BBb1QWch/lkjCNkaet1ifXkE6yYxWv
	cnRVWU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzPI-00000000Lgu-1dd9;
	Fri, 12 Dec 2025 09:25:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTzPH-00000000Lgn-1d72
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 09:25:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B7C3600C3;
	Fri, 12 Dec 2025 09:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE36C4CEF1;
	Fri, 12 Dec 2025 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765531545;
	bh=PsC0jPL32+OxjFDO3F0wqbNBNzmD5Mpq1C7BEYINTX8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=s5g14ODVsVQuLsKByoqfVwsp2iuxh2PYM2HB8JAJH7WcTutu8C6HoClkR7bpc5Zp8
	 SuBduq8C5Ddy+/KYH1+yBHnuv8EOtgkv6X9kRFetVA9gb573twgw3/qIwff3PjvG+4
	 2dowTEvVX7EFIWVt4bUQ4BRYuBtNp12Fh39jFL72xOEo+SWVjggt20LI3PFk20BxVj
	 PAWTHnJwhwSgiYLdshSxw+wlE/jmys444iPmk/a/L6q8SwDiHD+Ly4QmzjNhxqhaUH
	 JZ56SrU6qY6I9TxSAppqtMehSsLe9USNq08nTu2QK3jDEG3ROEVYSQLvkPRBGqcjkN
	 u61F1AyhgZC8w==
Mime-Version: 1.0
Date: Fri, 12 Dec 2025 10:25:40 +0100
Message-Id: <DEW4P4X1DBYG.1Q3T05DX2784P@kernel.org>
Subject: Re: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of
 mt35xu512aba"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Han Xu"
 <han.xu@nxp.com>, "open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER"
 <imx@lists.linux.dev>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bough Chen" <haibo.chen@nxp.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20251212-nor-v1-1-20a5a381979c@nxp.com>
 <DEW3M3BQEGIW.3AFGPPSCBGI16@kernel.org>
 <DU0PR04MB94960504A809674A265689D690AEA@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94960504A809674A265689D690AEA@DU0PR04MB9496.eurprd04.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============8129217590971926404=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8129217590971926404==
Content-Type: multipart/signed;
 boundary=3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

>> > Find two batches mt35xu512aba has different SFDP but with same jedec
>> > ID. To make all batches of mt35xu512aba work well and support OCT DTR
>> > mode, back to hardcode the flags.
>>=20
>> What are "batches" in this case? A new revision of the same flash chip? =
Why
>> would they use a different ID then.
>
> Hi Michael,
>
> Yes, seems a new revision of the same flash chip. Anyone from Micron can =
confirm this?
>
> What's the normal way for vendors to update the SFDP? Seems also need to =
update/change the ID.

No why would they? It's the same flash, but with new/fixed SFDP.

>> What's wrong with the parsed flags? Both support SFDP, so if you really =
need to
>> fixup any flags, please use a fixup callback to actually fix them. But f=
irst, what
>> will go wrong?
>
> Yes, sorry to lack this information.
>
> For mt35xu512aba chip with label 0DA15 RW303, the SFDP do not support OCT=
 DTR read/write operation,=20
> but still has one .fixups =3D &mt35xu512aba_fixups, in this fix up, it co=
nfig the OCT DTR read operation, so
> finally read_proto =3D=3D SNOR_PROTO_8_8_8_DTR, but nor->write_proto =3D=
=3D SNOR_PROTO_1_1_1, then has
> no chance to call micron_st_nor_octal_dtr_en(), when there is read operat=
ion, use OCT DTR read command
> meet issue.
>
> With this revert patch, I test mt35xu512aba chip with label 0DA15 RW303, =
OCT DTR mode can work well.
> Also test mt35xu512aba chip with label 4KA17 RW303, OCT DTR mode work fin=
d too.

So both support actual octal mode. Then please fix
mt35xu512aba_fixups. IIUC, you can just use
spi_nor_set_pp_settings() there, to fixup the supported PP mode. But
please add it with a comment describe *why* we need that fixup.

-michael

--3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaTvflRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gbPQF9G1qyDa4nQuHRqM3qKWeKDsR6FJbNiMrL
ybjOG7ZdhDPF31zt3TZSZCDINxJRkQDdAXwPvKHwauEWpvXvnsgGyjJ7qaTZze0T
vbY+5EHdQIr0rvQAVFIcozXMEmB1epVcIaE=
=xqBm
-----END PGP SIGNATURE-----

--3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd--


--===============8129217590971926404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8129217590971926404==--

