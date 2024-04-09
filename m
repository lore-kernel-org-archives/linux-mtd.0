Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D898C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccDsC6OneLg9h+skgnGEbk9coAI9CJrSOLx9QzEiGqg=; b=kHn0vKZYNq6pZjzBjJfJMl23y8
	6ug5q2VIEqPAXqeh2RXNT46YHAwmFPMW203eBMuzAC4S/6Ms0EWnx7nXJZn9J/QEPC3dm/BeHKQyg
	gTxg5DqvfMZNZx4mQEdYgHDIl8LZZxLA9JMj+3MkaDWOh9djF5srO54d1NO58OY2jKE/A6vbQ3XeK
	jhy0uPqNrDFa3pYvWUU7WYG98eqsb55IxLXBZr0Ig3/33/hvNXyJ5xNouT05Kbdhv9JQ2+FfCzZ3Q
	gGQGTpoZ1+P4AV44muxgLxM5791nfSjjovAeFO21HNP2ErOtQ4UmM6RfO00w3zGv3XIN8m3Wa35BH
	t36+4qBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru7yn-00000001GDy-2HmD;
	Tue, 09 Apr 2024 09:41:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru7yi-00000001GB1-3mSK
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 09:41:23 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 148E53D5;
	Tue,  9 Apr 2024 11:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1712655668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=B1hRF4wh5KsEIlNYnlONjUnwHiM/6l8Y0AGg+VjQqrI=;
	b=UA764w1yQyVsuLGF6Lk+kfDHdZhFDibWXIrnwXcrK/b2vDlQVDhehSpZhGld8VTQlDT5Wg
	/Qx/N2KRJ477RGmQv9Qs4s+qZgpmV3kF2VXlzJ1yXarTQI6ZHpKhcmWK2pcoVjLkk/uT+N
	gUNtI6X20YBPuXVlye++Tk8wqiJNKOv1DWOd1OYjYhYdLsPLMictRnyQ4PgWPize3PBlTP
	7HhYb+Npmmfr3nHQOVCb12am3FVBBNbLiqS26vXz5qdBAV6GOCUyOxpSY/NzofXcM/ijeI
	JWZpOTz2HdNwueoVBML8t6clo2yQJl34olPUELkWXN3iMANTaurzrMmE3qVrhA==
Date: Tue, 09 Apr 2024 11:41:06 +0200
Message-Id: <D0FHRJG05LJN.1GU1N7J0BH6S4@walle.cc>
Subject: Re: [PATCH v4] mtd: limit OTP NVMEM Cell parse to non Nand devices
Cc: <stable@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: "Christian Marangi" <ansuelsmth@gmail.com>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20240402212331.27328-1-ansuelsmth@gmail.com>
In-Reply-To: <20240402212331.27328-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_024121_218201_C0928C8B 
X-CRM114-Status: UNSURE (   6.18  )
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
Content-Type: multipart/mixed; boundary="===============1682054764495111627=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1682054764495111627==
Content-Type: multipart/signed;
 boundary=8a32cdc00bd7bdcde487afcf8d9f9ed3c2c6e755e2a918de1ef16595d7db;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8a32cdc00bd7bdcde487afcf8d9f9ed3c2c6e755e2a918de1ef16595d7db
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

just a quick (non-technical) nitpick if you do a new version or
maybe Miquel will fix it during applying:

> Subject: [PATCH v4] mtd: limit OTP NVMEM Cell parse to non Nand devices

subject should be "non-NAND", also cell could be lower case :)

-michael

--8a32cdc00bd7bdcde487afcf8d9f9ed3c2c6e755e2a918de1ef16595d7db
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZhUNMhEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+LymAYDD9wmmYfgy26EJDv13ae+bC0ut1EyeUTAm
lJ9YqLRePNYZ6DdNEEPblZqfBNUTD04BfR6m8Yg0Y/LiFSrhkmPFkcOGZroghen/
hXr19Rz/FouCSXF2uoJ0y/cdSqW5pYZJKg==
=wSoG
-----END PGP SIGNATURE-----

--8a32cdc00bd7bdcde487afcf8d9f9ed3c2c6e755e2a918de1ef16595d7db--


--===============1682054764495111627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1682054764495111627==--

