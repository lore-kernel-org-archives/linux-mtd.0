Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17345C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 22:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOzj5oC9LajQw1UJxPwx2HDAB6D8jeXEhvDPTyXGltU=; b=Ue+caZgYR71Nu/my1LQ8039VzO
	2yC9Ol9k4PrnLIwnUivH7WauZsL3dxvtAuK4PRk94upS60FcTw2K42K5RHh5rouHg8r5m4r5sBApm
	0rVWAqYgeAJ2ffiJAsujaD3/ZoocbJ23l0vQO085QzXdAzhYxd+HgxCft/GzHCtRZ1do8HETUs3F9
	FlREMShA7OBNwmhy7IFPsjFOi+fHl1I1xKdH3oVsyrbR/Fz47IFBZSSbF/m5axesXKGTet0iGksAI
	z5M67uLcTBKum3tkpDjo+3IhimFKtvm7jVTwx4ZEpPNB5d8Tk2FofyxjCz5krjAy7JgmuV49JkUh+
	LcR2FCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKBK-000VNc-QJ; Thu, 23 Feb 2023 22:35:18 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKBH-000VLs-OT
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 22:35:17 +0000
Received: by mail-qv1-xf35.google.com with SMTP id f1so13063845qvx.13
        for <linux-mtd@lists.infradead.org>; Thu, 23 Feb 2023 14:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5TDQXxl+FX0fRazZmsOFaDn8hdf8TptupQVbcaS3P9Q=;
        b=Bz6lHQ8AkEl14uMqOCipoOZ3zjjTbCQHOFQrnbmw0JeimzrffclqI+l9ukGCSuzMYT
         JjlnSqTe29P7TC55v9EKK+scgG19RB5bg4XqfY3fK2vlthykkcBpVT6fwb2CqRqIsvEm
         vk6biogK5yFNQwnZHzE7tQTyFa71vKBh+Pcpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TDQXxl+FX0fRazZmsOFaDn8hdf8TptupQVbcaS3P9Q=;
        b=TLjD4Sty7Rqk3oVkw0gbuXobaJxfQAPv9vakKDx3n63PDrdqjodNdGQMJwvf2X7bTI
         CIH/eiNrrn7Fnh8Uh24gOnCCfN8HtpxO6kn6SHiSR08tc2lLiWK7AzmhEKwi5x5sZF8s
         4v6JKacjVk+Wbrp1JzlUKRo0fYNatt8byT+NXEr3IXpz3CSMrh5AXfWnXdpGAX6gU4j2
         RvMSI8Q2fZtQQgrOXvs3dXjqJjoIKhwpmifPSVSSpP3ZJRDB+PqbySlJYCdwe7+EFeNs
         VojSve05IPs69ClguDbH6wxrInAmBl+/huaIrttkrKnZi6y8nRNVG6R4aorinwhKPTEX
         GL2Q==
X-Gm-Message-State: AO0yUKXUiQ0oN1ymTmNhgcuZDvpOGPgvp3jVPBVlYXKUlOJ22iKSDUpq
	pfUGY5K+WSE0a5DeXa4KbMklJQ==
X-Google-Smtp-Source: AK7set9jqjNRAVuT/ujGFL2lCKuiXu/aQwCtREUj+Dm1NS5dhPzMuBW2pK7DykWK2rjCPFydU+c6Ag==
X-Received: by 2002:a05:6214:5010:b0:56e:a96a:2be1 with SMTP id jo16-20020a056214501000b0056ea96a2be1mr22934548qvb.48.1677191712605;
        Thu, 23 Feb 2023 14:35:12 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-7b76-35a4-b335-d04d.res6.spectrum.com. [2603:6081:7b00:6400:7b76:35a4:b335:d04d])
        by smtp.gmail.com with ESMTPSA id q205-20020a3743d6000000b0073b75718428sm5349722qka.134.2023.02.23.14.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 14:35:12 -0800 (PST)
Date: Thu, 23 Feb 2023 17:35:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 0/3] fdt: Fix mtparts fixup
Message-ID: <Y/fqHjw4e8LSaz1e@bill-the-cat>
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113193411.GW3787616@bill-the-cat>
 <20230123110606.56110e40@xps-13>
 <20230123200131.GD631605@bill-the-cat>
 <5a01a9d1-9068-576a-7028-53415cc03ed8@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <5a01a9d1-9068-576a-7028-53415cc03ed8@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_143515_820348_DC8A3D2D 
X-CRM114-Status: GOOD (  47.63  )
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
Content-Type: multipart/mixed; boundary="===============1231858612096626244=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1231858612096626244==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgdlogPFaVxQHz81"
Content-Disposition: inline


--fgdlogPFaVxQHz81
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 11:23:41AM +0100, Patrick DELAUNAY wrote:
> Hi,
>=20
> On 1/23/23 21:01, Tom Rini wrote:
> > On Mon, Jan 23, 2023 at 11:06:06AM +0100, Miquel Raynal wrote:
> > > Hi Tom,
> > >=20
> > > trini@konsulko.com wrote on Fri, 13 Jan 2023 14:34:11 -0500:
> > >=20
> > > > On Fri, Jan 13, 2023 at 07:45:44PM +0100, Francesco Dolcini wrote:
> > > >=20
> > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > >=20
> > > > > Recently we had a boot regression on colibri-imx7 because of a cl=
eanup change
> > > > > on Linux imx7.dtsi setting nand controller node #size-cells from =
1 to 0.
> > > > >=20
> > > > > Because of that Linux partition parser was no longer able to prop=
erly
> > > > > parse the OF partitions leading to a boot failure, the above chan=
ge was
> > > > > reverted in the meantime as an immediate workaround, but some imp=
rovement
> > > > > is required on both Linux and U-Boot.
> > > > >=20
> > > > > This change improve the U-Boot part of it, #size-cell is set to 1=
 when
> > > > > it has an invalid value. This has the limitation to work only wit=
h devices
> > > > > smaller than 4GiB. In general the suggestion from the Linux MTD m=
aintainer would
> > > > > be to just deprecate using this U-Boot function and pass the MTD =
partitions
> > > > > from the command line, unless they are statically defined in the =
DTS file
> > > > > in the first place.
> > > > >=20
> > > > > This series therefore convert colibri-imx6ull and colibri-imx7 to=
 pass the
> > > > > partition list from the command line instead of fixing up the DT.
> > > > >=20
> > > > > Link: https://lore.kernel.org/all/20221202071900.1143950-1-france=
sco@dolcini.it/
> > > > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.i=
nt.toradex.com/
> > > > My higher level question / concern here is, is using one of the dts
> > > > partition schemes still valid / preferred, or should everyone now h=
ave
> > > > reverted to passing via the kernel command line?  If device tree st=
ill,
> > > > is mtd/partitions/fixed-partitions.yaml the one to follow or someth=
ing
> > > > else?
> > > I don't think we can "prefer" one mode over the other between cmdline
> > > and DTS. Both should work pretty well. Of course on the cmdline you c=
an
> > > only define fixed partitions and many devices require more advanced
> > > parsers, which are only available through DTS, but for simple
> > > partitions, it works totally okay.
> > When both are present, which one is used?
> >=20
> > > The only thing that I would like to avoid is the need to write code in
> > > the bootloaders to tweak the FDT in order to add partitions. That is
> > > clearly not needed, error prone, and do not follow evolution of the
> > > "standard", as we just discovered.
> > I'm not sure about this. Looking around in U-Boot today, I see two types
> > of cases. One of which, the colibri case, can clearly be not done and
> > either passed on the command line, or put in to the device tree as
> > there's nothing run-time related being tweaked here. That's a fine path
> > to take on those platforms and Francesco's patches should be updated to
> > remove the unused C code too from the board code.
> >=20
> > But the other cases are doing something dynamic and run-time related.
> > There's the omap3 igep00x0 family (which yes, legacy) that is doing NAND
> > or oneNAND and adjusting things at run time.  I don't know how much
> > anyone has interest in those platforms at this point, nor exactly who to
> > contact (for Linux or U-Boot). There's also the stm32mp1 family doing
> > something that's very not obvious at first glance, so I've cc'd the
> > maintainers there.
> >=20
>=20
> For information, today for stm32mp1 family we are using the build
>=20
> =A0of MTDPARTS and fdt fixup, only for backward compatibility issue
>=20
> (the MTD partitions change for boot with or without OP-TEE,
>=20
> with or wihtout FIP, with SPL).
>=20
>=20
> Today we are already plan to remove this dynamic management
>=20
> and to switch to static MTD partition defined in device tree,
>=20
> as already proposed by Tom in the serie
>=20
> =A0"mtd: spi: nor: force mtd name to "nor%d""
>=20
> http://patchwork.ozlabs.org/project/uboot/patch/20210916155040.v3.2.Ia461=
e670c7438478aa8f8939209d45c818ccd284@changeid/
>=20
>=20
> This patchset is already ready, we are currently testing it internally
>=20
> and it should be pushed when it will be validated in our donwstream.

Great, thanks.

--=20
Tom

--fgdlogPFaVxQHz81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmP36h4ACgkQFHw5/5Y0
tyw+bwwAjmh/Sd3o/7CPbh4rpOP7buBNm3A3BcQvAK6rFBShQrCQXw76hc/mgwDY
ZEdSHTYoz+/5U3DOrFtT9v8Wm9WDgC07Hh+en4KYSliX/KjW3OARsha89u2heDAb
sUhm8uOZHRYZ3DLtYElIVqniAgMP/lrnAEMOZN/m7YxgHk55wC84PC3z6JHiQCNx
QOhcI3McvekvqJa+rMn5g0vKYFiRNFd8IbgkpEqOPdq8o721+JQJL0zaKR2inQAT
sdvHf2L8mCRgxxhTST4Th4gMJTr2MbVS7VIm6/oei9ioaNCwou2YrPFC9e8eJSck
0FwsnXWulkhuCEmIhNlceexcjsQR1WW2dzoAFpAbB/Uoydc7+o7MyzWoOOqmw7EB
OWZv8osrphIxwi8K+gfgAExpdcIY7Sk2l4HDxMW+paOqnnn6FXTU7YU6g0p0w4Cv
uD9xEpojIMBJ3NpD3rsknlQNIj/DTl7Hfb+4xSESXskPs8wuzDNNIPKIX4sRpYYw
MmhUXOHb
=KRDt
-----END PGP SIGNATURE-----

--fgdlogPFaVxQHz81--


--===============1231858612096626244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1231858612096626244==--

