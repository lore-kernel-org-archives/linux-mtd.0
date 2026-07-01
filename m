Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30478C43602
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8Y6lUSh0tR4tEvfhKdhiioINQsTa8Fa4opTb7lcCk4=; b=26xCtSHdPI6OVZgV64W1MyVnSl
	X3KbfPspKWE/GnaSU0hLjsX0RC0yhlMvVx7pUPUJIvZ0C3Bro+or6OcFWs3j3aNkPFSXVSVc6TkFd
	bwX40vkXpzzEjLnjZGnR7bXDDYtNb4wjnzHtjHLIPMnnUU+rnb4GURTQ88yDknJ303od0Fi5+79n0
	+HFT4xTzSYd6n0xuRDk9CRAVFV5imT98R3qjl5NLeAF/JanR1MB0pfFd/1WmUeR3bg9+3nunXNHzu
	hJZvPlXwnOgVW76MEavYz5vdPRXm9yc/XkK2EnOwxTeELiomDWYVGv/kRi0AABqrXYj5QqRTQpCUe
	lb4gFqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqPE-000000012V9-23e3;
	Wed, 01 Jul 2026 08:34:52 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqPC-000000012U7-0jSY;
	Wed, 01 Jul 2026 08:34:51 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 880D35B6;
	Wed,  1 Jul 2026 10:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1782894878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OV8gaPiQO40kpe0vnMtC2nXL8DrZwaWi9384uLF+/CY=;
	b=h67gQjQBVSxm1zGv4NOn57N9gJTCxMWWp3YcNhFmHdxQHNawukaOxBFeoTLd7xSSsUmHEb
	QHOO7Rdm6R9+IhDqEV//349b1hxptHCVf1Ld31NKjoCEVG3yZWiCutXBBQIV2AETWkCvG0
	2cvaUpJLCDQ65E9H4T7Bz3ZxH6x4FUP/Fk5LNDw6NweLNxPVKswcK05bPvhIWZ5hC03CGb
	zu9OuKTRqyoO5BGXK6QgIby1CRCo3dgJBzS+jDk1gA31fpjROSM1sYk8vN6mvqxzcilIxi
	5sg1p4WSH4Ikuhd3m7Ug/A13vn7+YhQwohIgElCdJhJ/Z95aXmB3+k3/Z3v1Aw==
Mime-Version: 1.0
Date: Wed, 01 Jul 2026 10:34:35 +0200
Message-Id: <DJN3HIIAY4LE.3MXU9Q2YFSCJJ@walle.cc>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP
 to be exposed via NVMEM
Cc: <pratyush@kernel.org>, <mwalle@kernel.org>,
 <takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <srini@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
 <richardcochran@gmail.com>, <arnd@arndb.de>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <netdev@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Linus Walleij" <linusw@kernel.org>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>
X-Mailer: aerc 0.20.0
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-2-manikandan.m@microchip.com>
 <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
In-Reply-To: <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_013450_403682_95850C06 
X-CRM114-Status: GOOD (  14.23  )
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
Content-Type: multipart/mixed; boundary="===============6805135241755632987=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6805135241755632987==
Content-Type: multipart/signed;
 boundary=7dc42cc06038756823fa21ce147a9856939103d1b021230f1b15a2a59c78;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--7dc42cc06038756823fa21ce147a9856939103d1b021230f1b15a2a59c78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

>> Add an optional "sfdp" child node (compatible "jedec,sfdp") that
>> describes the SFDP as a read-only NVMEM provider via nvmem.yaml, so its
>> contents (e.g. a vendor EUI-48/EUI-64) can be read through NVMEM cells.
>>
>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>
> I would expect it to follow nvmem conventions like this, notice
> compatibles specific-to-general with sfdp first:


> sfdp {
>     /* NVMEM provided by SFDP */
>     compatible =3D "jedec,sfdp", "nvmem-cells";
>     label =3D "SFDP";

Isn't using label frowned upon? I wouldn't add that to the example.

>     read-only;
>     #address-cells =3D <1>;
>     #size-cells =3D <1>;
>
>     mac0: macaddr@0x00 {
>         reg =3D <0x00 0x06>;
>     };
>     mac1: macaddr@0x06 {
>         reg =3D <0x06 0x06>;
>     };
> };

If I'm correct, this is the old style, see commit bd912c991d2e
("dt-bindings: nvmem: layouts: add fixed-layout"). So it should
eventually look like:

sfdp {
     compatible =3D "jedec,sfdp";

     nvmem-layout {
	     compatible =3D "microchip,sst26vf-sfdp-eui";
     };
};

Which is what patch series will lead to.

Also I'm not sure if we really need to add the "nvmem-cells" here.
IIRC in MTD it was there to tell a driver to add an nvmem device to
an already existing compatible/node.

Apart from the MTD case, I've just found qcom,smem-part,yaml which
has compatible =3D "nvmem-cells".

-michael

> Your example should definitely be more elaborate like this,
> just an opaque sfdp node will not suffice. Maybe a separate
> example?
>
> Yours,
> Linus Walleij


--7dc42cc06038756823fa21ce147a9856939103d1b021230f1b15a2a59c78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakTRGxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+PesAYCvxlMrRPb3CpBzPYndulCo9xHSs8WFx8GM
YRvSkp3iZq/ziK9zzw8WIc8dB59hR7gBgJcgQcwu/qH+CFtJvfiWDEH4EWXU3HSR
2Jx1LkNCSYEaHycVFgiepmorZPwBghbBeA==
=IjRV
-----END PGP SIGNATURE-----

--7dc42cc06038756823fa21ce147a9856939103d1b021230f1b15a2a59c78--


--===============6805135241755632987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6805135241755632987==--

