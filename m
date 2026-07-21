Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78088C4451C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIzWZuo8L5tGfncaMxWp7xQ78kip+jKpVN+pWJ858E8=; b=zcyFvZ0koan+pRYvfDgbg5MSBE
	i5mBW5uHJxUynhPxLggkIvsmt8WrUvFIIUydu8OIUarOLtvpIHZvpFh/ybGT6yBVGPdZpdPPPkfgW
	USbjJDA22dl13om6aEyAz+Zvk+HrW5GH8+wtIH4FKl/B6jqvbRjkLuWaFGl/2tt2WB89/aJ5hncZs
	2Jqy7mWoyYrEbhzjGCXeaaT4dX3zBjOYeLod4XHjmEltig2wR2pGFUhsKCR06Hk0udlg664KFjkaH
	L/YdUCf5Swwzf+8bXcXaZfzur1MXISTX+GdmqkpdMz0qJo08mOUmuVUvnbpvNEwlwOysp/Uy3nqq/
	tsaWk3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm68O-00000008sKF-1hzZ;
	Tue, 21 Jul 2026 08:47:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm68M-00000008sJz-38Pz
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jul 2026 08:47:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 723E141195;
	Tue, 21 Jul 2026 08:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C06F31F000E9;
	Tue, 21 Jul 2026 08:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623646;
	bh=xVmKfH/jK57T3H0AU3g6NhFxkqK9zdRK/CucNScwoAw=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=WWpzEvQVqyv0LS8lQocPqER0lrtDvLoUKelAadpKd/32KmAv2mv45uvujhChS9G3O
	 xsZtp9kLBQQFBDMBCKYNz/k6gPP0KTW18sof8NN4annn26ZN6SIhAmZpfFq7ChjTNC
	 AeAVWKkD2QmLGrSwjR+NpgiktwtINwvwQHF5zgWlngM5R/lzc8Zgl57CNFDSqsQeaT
	 UO9+uXD8Hw4yzNMn4insaL8vxD3vZQOWskGTT34OwoHkpphREox4DlWzDrrA9O0hSV
	 rjIRL+gDB3C3eyaR101+8l5mpJhRc2wgpPX5VyxXAbp1bv8GQ1wYPMSHvk6GdsFO+z
	 S1TD21co7sg2g==
Mime-Version: 1.0
Date: Tue, 21 Jul 2026 10:47:22 +0200
Message-Id: <DK44A7A87AGB.U01P9983P29J@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Fabio Estevam" <festevam@nabladev.com>
Subject: Re: [PATCH] mtd: spi-nor: xmc: Add XM25QH128C identification
Cc: "Fabio Estevam" <festevam@gmail.com>, <pratyush@kernel.org>,
 <takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <heiko@sntech.de>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260718213827.701787-1-festevam@gmail.com>
 <DK372KBK7E8X.383DA8L7J4JIX@kernel.org>
 <12de54ff-0f0f-a101-4f63-c0b72fd81cf4@nabladev.com>
In-Reply-To: <12de54ff-0f0f-a101-4f63-c0b72fd81cf4@nabladev.com>
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
Content-Type: multipart/mixed; boundary="===============2963010445394613472=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2963010445394613472==
Content-Type: multipart/signed;
 boundary=15ddd975892464ec2512ad69e1d711e7c4c28f4c1d5f4535782946b14ef8;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--15ddd975892464ec2512ad69e1d711e7c4c28f4c1d5f4535782946b14ef8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Fabio,

On Mon Jul 20, 2026 at 8:43 PM CEST, Fabio Estevam wrote:
> On Monday, July 20, 2026 03:45 -03, "Michael Walle" <mwalle@kernel.org> w=
rote:
>
>> So why do you need an entry? We don't add .names on new entries.
>
> Currently, I see:
>
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partnam=
e
> spi-nor-generic
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_i=
d
> 204018204018
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufac=
turer
> cat: /sys/bus/spi/devices/spi1.0/spi-nor/manufacturer: No such file or di=
rectory
> root@rk3399-station-p1:~#=20
>
> After this patch:
>
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partnam=
e
> XM25QH128C
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_i=
d
> 204018
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufac=
turer
> xmc
>
> The advantage of this patch is to provide the partname and manufacturer e=
ntries for userspace.

Yeah I get that, but since vendors tend to reuse their flash ids for
different parts, the part name is useless (and probably wrong) most
of the time. The idea was to just expose the id nowadays and if you
really need the flash part name, it's the duty of an userspace
application to figure that out.

-michael

>
> If this is not wanted, feel free to discard this change.


--15ddd975892464ec2512ad69e1d711e7c4c28f4c1d5f4535782946b14ef8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCal8yGhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ixmQGAlPRrfEuceAX1KmTF4RRDvsUB1LYaTtWv
xBGay4FLxNAInBMxKszTnLIcALxmKsnbAX9XSgdk3zZyt1ACJjkBJcN6SgIotQq7
w6ngOjZHVGaCMwN5Fp8EpAmpfq6qVEeU25s=
=Xe/u
-----END PGP SIGNATURE-----

--15ddd975892464ec2512ad69e1d711e7c4c28f4c1d5f4535782946b14ef8--


--===============2963010445394613472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2963010445394613472==--

