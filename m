Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FDBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 14:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6AC6103B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 14:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A6AC6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lug-owl.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsN+p4azU6DwMdzgK3xEDZeV2Qied5AxSO5QBP0O43E=; b=up7S0Jyhf7ZqlG5rWjJSWnV45e
	WeWVunXbUl7mla3CjdXf0PwZwsm/yjvAPtm+X7L6r+SVlGg+wKnDkp0eTjXrKZPzbyUU2/b9WWeiA
	DlAIblwwy/SgWqyNBFKm0Knh4uGMQ9sdaBAbRzX1CjpEvAbchEvE3hGSFADiJc+jGVbF8zLMV+TiT
	ap/7atmd0j/kCCea/wievaISQ0wTQjzxEVqa63T0Nhr28xOYbnDAmDHz7XdXG/gJPzYQdlVcMs83j
	i+ud4sJzx/pN870uwaaTUiXXVkIlpDpSDXnMbXyNUKz3sMAoRozYDa4l5sJMkbEXFkSPEqQg1DR6K
	IoV3OlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYULl-00HawF-Qo; Thu, 07 Oct 2021 14:26:21 +0000
Received: from lug-owl.de ([2a03:4000:10:469::])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYULi-00HavE-7y
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 14:26:19 +0000
Received: by lug-owl.de (Postfix, from userid 1001)
 id 8E5D041EF5; Thu,  7 Oct 2021 16:26:17 +0200 (CEST)
Date: Thu, 7 Oct 2021 16:26:17 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: PING: [PATCH] Don't overflow when writing a key
Message-ID: <20211007142617.3hgjddbbvcowzgc3@lug-owl.de>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
 <20211005144936.xnkzugjr3oygauei@lug-owl.de>
 <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
 <1970203009.45154.1633591205445.JavaMail.zimbra@nod.at>
 <20211007135401.4z3gcunwr2uq7fpx@lug-owl.de>
 <135911793.46658.1633616346904.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
In-Reply-To: <135911793.46658.1633616346904.JavaMail.zimbra@nod.at>
X-Operating-System: Linux chamaeleon 5.8.0-0.bpo.2-amd64 
X-gpg-fingerprint: 250D 3BCF 7127 0D8C A444  A961 1DBD 5E75 8399 E1BB
X-gpg-key: wwwkeys.de.pgp.net
X-Echelon-Enable: howto poison arsenous mail psychological biological nuclear
 warfare test the bombastical terror of flooding the spy
 listeners explosion sex drugs and rock'n'roll
X-TKUeV: howto poison arsenous mail psychological biological nuclear warfare
 test the bombastical terror of flooding the spy listeners explosion sex
 drugs and rock'n'roll
X-message-flag: Please send plain text messages only. Do not send HTML
 emails. Thank you. 
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_072618_457912_8836710F 
X-CRM114-Status: GOOD (  14.84  )
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
Content-Type: multipart/mixed; boundary="===============9115742817912734572=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9115742817912734572==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfqbhzscrssh7apc"
Content-Disposition: inline


--sfqbhzscrssh7apc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-10-07 16:19:06 +0200, Richard Weinberger <richard@nod.at> wrot=
e:
> Hmmm, fortify assumes that the buffer behind "to" is sizeof (union ubifs_=
key) just because
> the function does:
> union ubifs_key *t =3D to;
> ?
>=20
> Even though memset() operates on "to" and not "t"...
>=20
> > Maybe supply key_write() the complete target buffer length and
> > memset() it first, then place the properly formatted key into it?
>=20
> Well, that's the whole purpose of key_write(). It formats an in-memory ke=
y for
> the disk format.
> I fear this is just a matter of static analysis being not smart.

Guess so...

Maybe it'll get better.  At least, that's been with a very modern GCC,
so I guess this'll come up again in one way or another. (Either as a
GCC bug, or by not simply having a key[] array were the data is
"magically" written to, but some union with that array and probably a
struct like struct ubifs_key (where, for practical purposes, it's
__le32 j32 already is the on-disk representation.)

So ...  The code does _not_ overflow, that's good first of all. It's
just a bit confusing how the key bytes are written to the buffer. At
least I was easily distracted by the two different sizes.

Thanks,
  Jan-Benedict

--=20

--sfqbhzscrssh7apc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCYV8DhgAKCRAdvV51g5nh
u+01AJ4i6G/AYxjW9xB7zmZ57ZmUSsxHrgCgkQt08IIn+5a4Ctzxfml6n1Md3ok=
=8Aoi
-----END PGP SIGNATURE-----

--sfqbhzscrssh7apc--


--===============9115742817912734572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9115742817912734572==--

