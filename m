Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FD0C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gentJ/yNxqKvh9TWxeA2gXlaXwWrjeHGXUh+1qKUJpk=; b=F/QxBR4Y6zCEiiuRSslfL1JC0G
	fqDMoxnrFPoDNI8GwHD/RCWMesQUixMTsf2AceD4ba5au5r0mdiOsfEdI6n4drXfv8bUficZSqsUq
	MneN/bAyjIeHnU4oThM/N2YsJ/8/tIAUHkZdjpcG+mb1i3wfb3ncYf3yS7HxcCxBTTVaxskF4w67y
	eiO2+XmvvLEUYmN16lzCwlZPL5U2zEUqQ/YGd/hiLbk/W15hl84TK9OeE3tUrazZn75cL8cC23j9W
	odIPEHFxIuSsnGIlnXJRqe1dc+oRUjli/UzPmqOWI9pc4xA9KWSKKDIgV/Lm8RFHs+/l+9l8BEp5g
	AOxtTHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjrb-0000000Cg2y-29ba;
	Mon, 06 Jul 2026 13:59:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjra-0000000Cg2r-06dF
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 13:59:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 4E039600FC;
	Mon,  6 Jul 2026 13:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7DDFB1F000E9;
	Mon,  6 Jul 2026 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783346397;
	bh=d5A9F7YRSdfmeGU/z7pCaxQpCCmcqQoJObFd+mNbHsw=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=DG2z2nvP6YLHkhMaJNVBhMIdH76N4ZfFevW/IyOGT48KOi2eicm8RbgNrUfgcZ7eH
	 k6/UiaKLXYmvTCxGIuhLeOwk2RND6zZnQCD5+luLG23l99LpCzNQJYrL4xlti6vlAw
	 WOJyIyhW8pNscQ8VJf5ytfN4eqVK1ou3OfFU46RkV6Xl0t8mE9ryO9mB5G7y4qnXwO
	 /kyzpQhQzugqtmdBF0/Xdi4Vi0mA+6WaNHd37bk/1BAcGEIU+P/yx29jPAQ4A1kzsY
	 kxkJ2jm++D/UrbCREN3dcP+Pppw179K+3h7vnKV/MpOoWXVgd6LeXgbr7Yk2nS9ktC
	 GPkLHz98GnNag==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 15:59:53 +0200
Message-Id: <DJRJJB4NEUEP.168MF88DBSFDF@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name
 entry
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3292975283239087672=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3292975283239087672==
Content-Type: multipart/signed;
 boundary=f082675afff2fa84162382bdc8e6365ac8b5d03556610e7a5c21c9e16cc4;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f082675afff2fa84162382bdc8e6365ac8b5d03556610e7a5c21c9e16cc4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> This is a legacy field, it is often incorrectly filled and will soon
> become very incorrect due to IDs being reused.

And I thought winbond is doing better... So if you have a contact
there, please suggest they are putting a table with a unique
identifier per chip there. So we can use that to do fixups.

> Replace the names with a comment above the entry with the newly instated
> naming scheme to indicate what chips are covered by each entry.

This is exported via sysfs, so this could be a regression.

Not sure..

-michael

--f082675afff2fa84162382bdc8e6365ac8b5d03556610e7a5c21c9e16cc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku02RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h3RAF8C46iVmzgR2j16w3IXiUpjbeEZQRgn4jQ
sz33GZLIiXlwZfa9L8Qt5H/s/cOx8UHMAX0W7matRwHdIq6kRXaSJ1g1J1KZ8sD0
yDd+OoFlN/6ffX9qOlDnaoUrLelDJ4EFBgY=
=i6K2
-----END PGP SIGNATURE-----

--f082675afff2fa84162382bdc8e6365ac8b5d03556610e7a5c21c9e16cc4--


--===============3292975283239087672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3292975283239087672==--

