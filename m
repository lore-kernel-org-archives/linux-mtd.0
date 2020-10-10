Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D856C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 18:55:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F91222EC
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 18:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zSTA0LIb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gJURoGia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F91222EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mD1kdb0kfbYwPMblUX2Tg0vVCAD/HoCFhBHLLN/A7Sc=; b=zSTA0LIbBdCKhnnmHjfPXB3Zq
	AwbTXIHfi9cNEUI/8a4/ltlANVcO/j24iXZiP2nb0ZIrM/IXzHqhOT/l4UFKB4/A+sINHMtnaNTkJ
	zT/CfFGpiy2ydej8Htt2eA+4frJ0GhYJERsRfDh3AnFu3a5urhQ1mlHxEB/EvXmRoLmM6G95ZKhyu
	Fb1u8JbeyIM0xk55YkFbHwXLt9ol2n/3HbjYWs0hgAiFLmyExvLvRngEuOhPRj+xuov5iBxjOKgvP
	RlP/2S+h55Wd8m1R/AetFd7o5M9W7WUBIQFq9GSZENDwmiFnuAl7Vr2x9EJFws1fsHh/EoTAK9LMg
	eVs1MDgTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRK0E-0001Kz-6T; Sat, 10 Oct 2020 18:53:58 +0000
Received: from ozlabs.org ([2401:3900:2:1::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRK06-0001HF-0Q
 for linux-mtd@lists.infradead.org; Sat, 10 Oct 2020 18:53:52 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C7vGp3lzbz9sTD;
 Sun, 11 Oct 2020 05:53:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602356021;
 bh=0ZiYU2BgRkjQ0tmAd8YQC8T8NNHc+p4p/Aymc9T60Os=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gJURoGiaEEpoAj7KajOh3gSfnJdnFAGufWHRQkiRM08NwdjUv1T6jIIYHpxMgEUWW
 fxaedqF1KKOOjJ1cpaxKU3inFqol0AIprW9OKDjljBJYtobNRZn3w8DwvxqfBX0IGY
 y03M7FsSXyKSfF19dSvxB5mbc/ITchmxvQLKsugELUQn6NYX8V9SjPTpCEjx0c1SVR
 IS0+dtJ4bg1r23LFNZY0H8J5fwLBUgfh8YNZNH+55b2taEG2LZkq7ohXyIyFQunlRj
 9XDWi0eDRXgLH2XCtS8l50huLM8IreRqCrcIfsBMXx0H7M/Y2VHu82E4CN0ChvEEdZ
 b/lpIu13sApRg==
Date: Sun, 11 Oct 2020 05:53:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20201011055258.22337d66@canb.auug.org.au>
In-Reply-To: <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
 <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
 <CA+G9fYtG6Ro-NdrP89ipDyUqVVT2=_8pTvjTSeFcWr795bp8AA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_145350_648688_E0E534B8 
X-CRM114-Status: GOOD (  17.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>, Rob Herring <robh@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Jim Quinlan <james.quinlan@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Suram Suram <suram@nxp.com>,
 masonccyang@mxic.com.tw, Robin Murphy <robin.murphy@arm.com>,
 "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>
Content-Type: multipart/mixed; boundary="===============4023777689752174228=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4023777689752174228==
Content-Type: multipart/signed; boundary="Sig_/VDFBoy40HHV45rBGLSbjbCi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VDFBoy40HHV45rBGLSbjbCi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

Just adding Christoph and Jim to cc]

On Fri, 9 Oct 2020 19:26:24 +0530 Naresh Kamboju <naresh.kamboju@linaro.org=
> wrote:
>
> On Fri, 9 Oct 2020 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> w=
rote:
> >
> >
> >
> > On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote: =20
> > >
> > > On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote: =20
> > > > Yes, the issue was introduced by one of the changes in "dma-mapping:
> > > > introduce DMA range map, supplanting dma_pfn_offset", so it only ex=
isted in
> > > > the dma-mapping/for-next branch anyway. =20
> > =20
>=20
> FYI,
> The reported problem still exists on 5.9.0-rc8-next-20201009.
>=20
> [    1.843814] Driver must set ecc.strength when using hardware ECC
> [    1.849847] WARNING: CPU: 4 PID: 1 at
> drivers/mtd/nand/raw/nand_base.c:5687 nand_scan_with_ids+0x1450/0x1470
> [    1.859676] Modules linked in:
> [    1.862730] CPU: 4 PID: 1 Comm: swapper/0 Not tainted
> 5.9.0-rc8-next-20201009 #1
> [    1.870125] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
> [    1.876478] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=3D--)
> [    1.882483] pc : nand_scan_with_ids+0x1450/0x1470
> [    1.887183] lr : nand_scan_with_ids+0x1450/0x1470
>=20
> full test log,
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201009/=
testrun/3284876/suite/linux-log-parser/test/check-kernel-warning-92014/log
>=20
> > >
> > > Okay, alright then.
> > > =20
>=20
> - Naresh

--=20
Cheers,
Stephen Rothwell

--Sig_/VDFBoy40HHV45rBGLSbjbCi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+CAzEACgkQAVBC80lX
0Gyv1gf+OhvuoKZ7Dmo9fQYJq9511FjSgaqsakQ81Jh2iL8ekt5hPSz0Hss0+Crs
kG4GTzQg9CiRbNN/JbDmIC2SPF59L6ht6kVddSJ8A6qb7o0b/+aBOCsKen4AxFER
YfGofzrnHpWORu2/JyYdoOPbyaJL0ohW5oFW58icU8AyRNMGOq8GhDsrPXl3Ebf6
4tNKIcz4PGXJO9HiuQUuKJSD4b/krtHkh2m0Xz3NC7zY6aRAxBWS8/OieouK0EiR
E59fS4A/AaJQUheKpfcEkBiZXsLBx7bZ/ki4EQ1NlQakjpF4KMVhZKrlsB/kBimF
41tdxnpjq4DzVLXrV9nAg2OBIS6TMw==
=vHqX
-----END PGP SIGNATURE-----

--Sig_/VDFBoy40HHV45rBGLSbjbCi--


--===============4023777689752174228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4023777689752174228==--

