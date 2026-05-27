Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B60CD5BD5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQo+IoiJilQjDQZMI+HQPQRklMnjY0tpTBdBnIToEMo=; b=XHXUu50lJFIg4t92tITRSaLzxM
	611OBMLLA+qa1gxnSPOqewh4wV5SFSPssrWUzungqnmKI9Ypz3gRkecqKkawM24LiyFoyvBHWpRF2
	pIQ5cOU5fbks+tXXQwhU3PPocJ8dhp+H87CWRUozZKVvG29/R81mULNeQ7RoH94v2uc5kclUecaXf
	xqOlFIT981CHROOVqqUCQmE+ZqyNq5j+sntVjuLj6WKQALxtNnGoa0fzofWR0/JdneGL91W4lw0TD
	7x4CvxzlF+wA8XweQaLkmsYGlw3oZNiWD4Ky4jAXYgRtCcZ4q2ikLmu6e3e1C0iVAZqF5Ils/P9QI
	PMjf1cQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDv1-000000049IW-3joE;
	Wed, 27 May 2026 13:03:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDv0-000000049I5-3H7x
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 13:03:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id E6D70600BB;
	Wed, 27 May 2026 13:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1C6D51F000E9;
	Wed, 27 May 2026 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887009;
	bh=9RZXmD+TnynvW3HqdFQpHhtez52J164lPzrs0JKxoMk=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=IJ0I8tVPyY93p0pSbj9KTUU9/F5Uy1f9OlgrN9ol2faMoU8bhjgme5sJuHjkuO8GJ
	 AJhfc+/JNKVk/Uoo48NTHCHmg0IF4VPLPZF36MEjCnY+kY1BfHY9GrM4dCaLnxLp+i
	 E1zzPkWQLYgry5onrmOsgvZ4iH6PlcP/iLNiIucgKhhwDDt8GyocRAU/dJKTj/jwdG
	 5J+8pqudq5LL8tdEvO/zHNfwwijrspeZxLkWAeYSeyekIyNwI7iOT2J8DgKSiQuT35
	 NGQ9Et3IsD5CARXCD/W0afm6YeCLX55r2AZg7R+A7yCwH1VE9caHjq0npDap9mWjre
	 fFQkDiESatDZw==
Mime-Version: 1.0
Date: Wed, 27 May 2026 15:03:25 +0200
Message-Id: <DITHAAHCPP0Q.2A2I62NEBHJOA@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Randy Dunlap" <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build
 warnings
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260526172341.773398-1-rdunlap@infradead.org>
In-Reply-To: <20260526172341.773398-1-rdunlap@infradead.org>
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
Content-Type: multipart/mixed; boundary="===============0748821324163441979=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0748821324163441979==
Content-Type: multipart/signed;
 boundary=20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 26, 2026 at 7:23 PM CEST, Randy Dunlap wrote:
> Add a blank line to prevent documentation build warnings:
>
> Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentati=
on. [docutils]
> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent. [docutils]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCahbrnhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jZMgGA8apjyVdaVecYH9nkB3LTUpLtFds0aFAr
D9SEwVMC+++3Yab4kXno50ApHYXq8lIVAX9FCn5fnzp72uUTQ+lvLdVWOqFa2AT4
AONe3cGuhMN52XPkPfZ3wJ/Y3u1XBqYkqqg=
=7W3L
-----END PGP SIGNATURE-----

--20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d--


--===============0748821324163441979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0748821324163441979==--

