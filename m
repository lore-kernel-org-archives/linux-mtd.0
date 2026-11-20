Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CB060A2600
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NKg6jXk7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wo7DzeTQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FvkDj5mdWoP6jZjw++FAMkgXKJfhKfqcL090zdCYuSo=; b=NKg6jXk7CjltNQoTLNgxJzsevF
	TcjURLeWiXkEmluNHdoAWNZ7ZKvPxFlZbjSP+4Df8Neo3VywAI1XLBfUKXIV/Z+4fXC4jFcMzQSIx
	en6s2iXhLyL+2WGwlAOxWhnDTBE+ePVlWBPzCW2RGq+nZbBxSGB1z2lvz707XiEHwcUk7KJXpkXkI
	SmAxQ0JZza2hiPs0FAcvU+lcks0k38Ru3IXCAoW9l9RRNSVZadgXHux5rx65If8NVEhEq7hmGp5nC
	m0q0hIMLYPbgHMH/E26weDEgTu7gtuUK30pCyQtjFsepdBSaMAlDKUqh4VfoP2XofSOSCfS5kkJaK
	RHIJTLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJjq-0000000EJ2g-3rae;
	Fri, 20 Nov 2026 08:12:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJjp-0000000EJ2P-1ZfN
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 08:12:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 74E5C60D15;
	Fri, 20 Nov 2026 08:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AB0B81F000C4;
	Fri, 20 Nov 2026 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162372;
	bh=7g7MZ9fUWqOrUAe8bi9LBUnozX0Zp8XzJ0El3O60aHc=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=Wo7DzeTQdrC7jOg9xJDJc5M5lNViAt87D+bA2JUQcxvW8+Tu3P7l0mXskDOjfq7Fg
	 cflVVfv+oXaH0tVYXMJP8SMVPwLf4ycKUHbJggKe9hf73czav2j1PSBU7n65yq7xO2
	 Lci6vsjCp+BWZxdTq+ZA8fND3vhs9V1aohjXITAFh/0GZwFAYmx0iZBq6JN0SYwsZS
	 E1+YpktAVbuJ8ZVx6EmVEnn5YrTEp6k8+Ob3Vj0cIVbzl8/lNzuY2aVu5Rl5OwiRU5
	 dJ1iTsGntW+1NuVpSaABpo2UUofuzifpWU/fyr2f0bV2XB5b6fJ8AvcYiM5+6di7XS
	 BEtwQHI6N8nwQ==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 20 Nov 2026 09:12:41 +0100
Message-Id: <DMZVY45HFRM3.2GTCZ9BV3YJL8@kernel.org>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
From: "Michael Walle" <mwalle@kernel.org>
To: "NG, TZE YEE" <tze.yee.ng@altera.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
 <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com> <DMY8H2AUQ3LV.VQ3MVOE3YV41@kernel.org> <381b16ea-cc02-4504-bbe0-83762886b46b@altera.com>
In-Reply-To: <381b16ea-cc02-4504-bbe0-83762886b46b@altera.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6247071408221061768=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6247071408221061768==
Content-Type: multipart/signed;
 boundary=7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Nov 20, 2026 at 3:21 AM CET, TZE YEE NG wrote:
> I would prefer to keep this series as a spi-nor-only fix, since it=20
> solves the problem for spi-nor today. James Hilliard's raw NAND series=20
> [1] adds a generic opt-in lifetime to the core (mtd_set_release()). I=20
> would be happy to look at moving spi-nor onto it if it lands, but maybe=
=20
> in another series. Are you okay with keeping this series as is?

No, not really. Sorry. Esp. given how cluttered it is and just
solves the problem for one user of the MTD subsystem.

-michael

--7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawAA+hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gkIAF/fh5e2uIwEPRaHgWLwwjxJkSCZdD6mRJP
UdMlUv6168kien+EQKt6rwlXBkooVPDUAYDpDLhw/SfXapyqcMK3gqohUnjMnjhx
1GIFNuA3LBmUyfsLENlX0keNJXiXjrKTC3w=
=Ba9O
-----END PGP SIGNATURE-----

--7f00468c0cc5da30f873745f70a967b80a05dcc6b5d5d22947fb6fbcabd1--


--===============6247071408221061768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6247071408221061768==--

