Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CAB606A33A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E7lyjma3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Czzvnvt7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v4Q/1zoRq3Vf2mAJABmcvI/vEB3Uevrvlj8Ljn/38DE=; b=E7lyjma3lgwfgmA/xnmcfCPzbh
	sdI5Hadqqqb85bnV4toQdTV0c6ILjn0B7j2ltRbZiRO0vcBGj5M6YEjILvgVGEmyYZkogRTJuUB5m
	HceyxE4QRYchFcLvK1RkiO6fODHhMkg9E+4fRbuFupQVZLICfahjaegZPEzAWSQmkJkSbBiBmv3fZ
	fnHhyd51eqbYu3qWMPjVhCLCQ795+Xp8BLJAaYqde+aNTF17m4c5RGUF1wdhxGf7HHVv3E488t4Ie
	DVp8twial2QyBxXFv3Ep5Ibw6peT8J0BehfT9WF1faasFjuxVKJMAuN2S8LFdEH2lFk6osJ59S74N
	gdAJgSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmt4-0000000Fo4k-2TNM;
	Mon, 02 Nov 2026 07:55:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmt3-0000000Fo4M-1AGD
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 07:55:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 4C4C042487;
	Mon,  2 Nov 2026 07:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AB43E1F000C1;
	Mon,  2 Nov 2026 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793606124;
	bh=dCaiywWa9uG4oJC5Ccve/MxarN4z4rM+HUfQlCwmqfM=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=Czzvnvt7fM8JAvdXf+DiKKtIUV7Ar0oblwKD1uMcOsF/Wyr641zoy63xHPTaCh5QZ
	 YHR6fkkUwDANhYNXPGDDhz03ZcHuIa179pXqnJ2f4GHYV+AyTr79YNmLm6qPjexvCM
	 VnwPwL/N1SAtFEK1iHW+1Zdkxn2T2IhqQ/5HXZw3FHrvDXEJewmNzfbCHPF/TTU8JC
	 1S2ZAiSPI4+nPXAObh70gfcKmEWhtM0+XQ6xAzQNagNBaWI1LnfVm9K1JLk6ZVEJQA
	 guFgV+/en6sT84jB4n0AIQ26vRTAd3r4AAtWy/lcqDB0tC7W+7GdD9DeXvzjesgnIX
	 WEe0LMqxC+fKw==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 02 Nov 2026 08:55:19 +0100
Message-Id: <DMKKB0CXCHFC.365E5XOS5BSE4@kernel.org>
Subject: Re: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
From: "Michael Walle" <mwalle@kernel.org>
To: <Manikandan.M@microchip.com>, <sashiko-reviews@lists.linux.dev>,
 <pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
 <mathieu.dubois-briand@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com> <sashiko-outbox-175470@kernel.org> <ba131ca0-c659-419e-9ff7-26c7c6de1028@microchip.com>
In-Reply-To: <ba131ca0-c659-419e-9ff7-26c7c6de1028@microchip.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7668532378342655172=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7668532378342655172==
Content-Type: multipart/signed;
 boundary=8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 2, 2026 at 6:03 AM CET, Manikandan.M wrote:
>>> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
>>> +{
>>> +     struct device *dev =3D nor->dev;
>>> +     struct nvmem_config config =3D { };
>>> +     struct nvmem_device *nvmem;
>>> +     struct device_node *np;
>>> +
>>> +     if (!nor->sfdp)
>>> +             return 0;
>>> +
>>> +     np =3D of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
>>> +
>>> +     config.dev =3D dev;
>>> +     config.of_node =3D np;
>>=20
>> [Severity: High]
>> If the jedec,sfdp child node is missing from the device tree, np will
>> be NULL and assigned to config.of_node. Does this inadvertently trigger =
the
>> NVMEM core's fallback behavior?
>>=20
>> Looking at nvmem_register() in drivers/nvmem/core.c, there is a fallback
>> mechanism for missing nodes:
>>=20
>>      if (config->of_node)
>>              nvmem->dev.of_node =3D of_node_get(config->of_node);
>>      else
>>              nvmem->dev.of_node =3D of_node_get(config->dev->of_node);
>>=20
>> If config.of_node is NULL, the SFDP NVMEM device will incorrectly inheri=
t
>> the SPI NOR flash's main device node.
>>=20
>> The NVMEM core then searches for an nvmem-layout child node and will
>> find the layout intended for the main flash memory, attaching all NVMEM
>> cells to the small SFDP NVMEM device and marking the layout node populat=
ed.
>>=20
>> Later, when the MTD subsystem registers the primary NVMEM device for the
>> actual flash contents, it will skip the layout node because it is alread=
y
>> marked populated.
>>=20
>> Could any consumer attempting to read an NVMEM cell then be misdirected
>> to the small SFDP NVMEM device's read callback instead of the main flash=
,
>> resulting in -EINVAL bounds check errors or corrupted data?
>
> Yes, this is a valid issue. With no "jedec,sfdp" node, nvmem_register()=
=20
> falls back to the flash's own node, so the SFDP NVMEM device would claim=
=20
> an "nvmem-layout" meant for the whole flash.
>
> Michael,
> this comes from dropping the "if (!np) return 0;" check in v9. I'll=20
> bring it back in v10: without a "jedec,sfdp" node there is nowhere to=20
> describe SFDP cells, so the SFDP NVMEM device would have no consumers,=20

There is no DT user, yes. But there is then a "sfdpN" file in sysfs
which can be used from user space. And that's what my first remark
was about. Why would that only exist if there is a "jedec,sfdp"
child in the device tree.

> while registering it can take over the flash's layout.
> Do you have any other suggestions?

Probably tell nvmem to not attach it to any of_node?

-michael

--8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCauhB6BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jT7AF/eKiThz3to8pzhHpX9ZPFYFnbOmy47yTD
czHkeG5xD2uuceGDWu48+9yJaA7CZnLPAYCMhz9TDNZjyZ7ux0o8JmYl0VwafcPN
+t67N/Ksz/89BUzZ+/WjW2AlvsEE9/6UTzE=
=QGVJ
-----END PGP SIGNATURE-----

--8f4a6addbf35050c9efdc63c515bfb8f4c83c099cb1cfe7b5bcb4cbbd872--


--===============7668532378342655172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7668532378342655172==--

