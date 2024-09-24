Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFA3CF9C6B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 08:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7DlVtjpmHWnIJPoxUzrL2SPYxqcVUx0g0jtzrDyeL8=; b=SsmcPS2UEqek842ZeUxHBLn2RA
	+4sEdvuMMgj1JNedn0LEBCyCXDYyMMG6qzgCyJwTWJP/87j87pGdqDbve4ThQAiwsV+VrWOfp3/Mq
	v/GPSQlgXZEMYjVDNV29HXpc5mPf1rtV63Zmk26ysyDHlefQ4A8O94ajRQeZpJtH5Ae0L8Xg2PbB+
	qXiqFRSTN0idtpHmTZYJaxGxlofhXSMkrCEM9bsAaWFKCi/cu2kb9agHXAERuWE9gjaij9oBZMruC
	x8iRF+AvRup3GbyKjEL/TfTA0re5xc1RtQcy78JCyefaOryLlKU+CDu9FuSY90W8SsTLAWEXF6SCB
	9p6fbHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st0q6-00000001ZsM-47bc;
	Tue, 24 Sep 2024 08:24:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st0q3-00000001ZqP-2uAv
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 08:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E01435C5B46;
	Tue, 24 Sep 2024 08:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0294EC4CEC4;
	Tue, 24 Sep 2024 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727166242;
	bh=ckRz2H/4tJB6RQ0mCyK5NOaS5g/WnTlcZAmRzp7SN6c=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=G9wJ4B80RuxhY2806Eyc9wOmGoBDBlHqOr8YjReBQpIfly2mSy2Em+jW2OFbB8aoq
	 LIw0jcZ6i5+kTTb+KPt73cKjlVyPTGoMTgRbwzBlk9IjCMaNYHjPe9n8Uc1WYZvKAZ
	 JUUnpv79xzQR+EhuAS2yv/7NsQ4AKP56PBIMPWk1bR4Nf3oSVJZa5VSu7xoNmSrAaE
	 ycmcuJLdvV9P7VqX5xLyEWKZJrsPlVwp7Z8OslsNMn7D71hy4aRCywvu66likFVexU
	 equCaEDX5VgNMGCp9FrjjKmtZ44NE+mfZG9a4cAIBZG67Q+WUbJBTxRy/zEhxRWz0X
	 Yk4d+5ArElbew==
Date: Tue, 24 Sep 2024 10:23:58 +0200
Message-Id: <D4EDC01ZOSDV.AOFOP6LNWWJ6@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron)
 CY15B102QN F-RAM support
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, "open list:SPI NOR
 SUBSYSTEM" <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240923165324.845639-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20240923165324.845639-1-alexander.sverdlin@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_012403_820769_DFD7376C 
X-CRM114-Status: UNSURE (   5.51  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5321805918428148243=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5321805918428148243==
Content-Type: multipart/signed;
 boundary=43a5cb3ba7a798e36c971f2d77cf26a95f7870fb83483e97a3bae8d38f11;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--43a5cb3ba7a798e36c971f2d77cf26a95f7870fb83483e97a3bae8d38f11
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Similar sad story as with "cy15x104q" where JEDEC ID comes last-byte-firs=
t.

Please have a look at
https://lore.kernel.org/linux-mtd/20240729102016.8527-2-alessandro.zini@sie=
mens.com/

TLDR, please have a look at at25.c.

-michael

--43a5cb3ba7a798e36c971f2d77cf26a95f7870fb83483e97a3bae8d38f11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZvJ3HhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h6fwF/ZVYvjRdsuMN/OM8+Zrqjb0JAwSlAqGQw
iy+dcmpfRqmNgog+Q3KE7dJyYbXmbLoXAXwJ6W9nNwNrJSGNdz425jzQdZ54+iJR
4BsQy4RrUzy1/VO0qFP27Dt7kYfJ+K1N/Sg=
=+lO2
-----END PGP SIGNATURE-----

--43a5cb3ba7a798e36c971f2d77cf26a95f7870fb83483e97a3bae8d38f11--


--===============5321805918428148243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5321805918428148243==--

