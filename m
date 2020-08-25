Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF0EC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:11:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 682E22074D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 07:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X2m8nlGZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3Wq0A6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 682E22074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0wCgdwlr79MPxHQIJ1mRLXmmkArl/eJnnz0qOdppY3w=; b=X2m8nlGZtgYtR19+f5dlQmlON
	rXl0U6jXAwD5HqTuiH5CBkOq+FLehUzXVwdB/g9ZZ7r6TUshYSjQ7klLwNWT5o4ijTA4DUQ5BL5in
	dlFHKomDgqSDK6038x+ro2hySgk7zUjufVZOR7stG/ioX9bf8Pmj/JlLDutj6refflGCSyCaorGPR
	jsHVhkc6YzK1O7HhZIkxj+UYkYPrY8n+w5FRdoPL//N0o5gMsq8GWcmI57ujyv8wXgaQ2R/8KsFyQ
	KmH9SOemzXxK/O2weaEGbJ3qewSfaR+M9V70SQcpltoMr0JWV0TSbj94wXl9f3LqLWZnTLjjeWrw+
	hZl5riL1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAT6R-0001eu-NG; Tue, 25 Aug 2020 07:10:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAT6M-0001cy-A0; Tue, 25 Aug 2020 07:10:39 +0000
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C35662074D;
 Tue, 25 Aug 2020 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598339436;
 bh=FWfgAaWELOpnq9T2ZqffNJ7A9qnO3QfKuIy+OMg+Nkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3Wq0A6wK+XyCx0NdyaVbiOp2OMrI3KPwj1V3RQ/NOii/Sv8XJMYsbLmiBZPZxHLr
 0oPOxmO4ZW2uxwUXqLpZCKZIApP5fRkbLXbO9bWzKlL5g/hG5Vx0qfVAI9CAKfOqMV
 tmM358uBo/FCFQE7cpCl+yIXbi94y/ptPbOUqIoI=
Date: Tue, 25 Aug 2020 09:10:33 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
Message-ID: <20200825071033.GB1861@ninjato>
References: <20200812203618.2656699-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200812203618.2656699-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_031038_474089_878B745D 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============5858997060389207430=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5858997060389207430==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 02:36:18PM -0600, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, long lines, and missing
> EOF newline in schema files. Most of the clean-ups are for list
> indentation which should always be 2 spaces more than the preceding
> keyword.
>=20
> Found with yamllint (which I plan to integrate into the checks).
>=20
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

I trust you guys in figuring out the details, so for touching I2C:

Acked-by: Wolfram Sang <wsa@kernel.org>


--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9EuWkACgkQFA3kzBSg
KbZbPA/+MqNMzGTVXT++2afD+v/Qkum1LRbeldro+e0ewQSps4tnW/eHg9RaemYr
BwxfsOZA+EJp0lGOnRM5/vhPMoInlSEwJSBlxtjratUScfPiR7D4ljKXGaUQv4IV
l9cXBZuOeLnSerxdYsuGrs8M0uqe4rAc3jt/FGD4rSgawNTN1HieFaQ0vq/0I5Gi
pyJv09alaosBuqNYc37Gqm9Ddk6xEJb8lvwrVqeS2ZGMFmfJuFlsuLKhwdgen/og
Wik6VZEjyUHJbyZgkcwMn6rTVTnopK7E0RYmdap35Bh6MAZ3auQ4eQU2tktY3L0G
+NL/ah9FAvmPH1RAR7KmXzZxVYX2ZoWm3AJVpCIvlc9toZI5NdOwdruT+KlTLHIY
T0vs7B3wqsrD4pHputHdDtf9iSZDB0FiTi44yJjReI72Yb47gDXXK7tOcewvq33Y
J9dv/HeT85ER8dZ3fCssLdOsIVSE5ZGaDGjP9M4hPo5ZqM5WlMcqW13gmBsEaY3W
quFFx4pgOXFmnO+7fCb0OIoySeTtgCMNqSwekaNsrbK8dBsFhMx62IzUwwCwL8ST
clLrMsK81BA4v5hiU1SXC5zAJJG1W0FEpGvIuQRa5YxW8goqwIJrEuvy8jWLhg1x
kB4BNFdQdBMg8xw0GSHGDhOZhIxgC5t/fvrbiLmqazzmbfCE1i8=
=71f2
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--


--===============5858997060389207430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5858997060389207430==--

