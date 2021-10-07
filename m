Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF46CC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 17:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA2A61248
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 17:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CA2A61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lug-owl.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bkru4V9g5MCTVTvApKZZ4qjObs2mb6NkWE8UlO8aDLE=; b=4aM85wxJz6+CAUY2JlEA2qu8tR
	HnqUFl4p3wKcJBqxZtPZDiwBFrx+gECQKMEC/Z1Gk0YsL+7DfuGJ/CoSIM2w7TNPtXiPILLQoApIe
	7OmZltvo/JMQHFA34lFIiiI/2tpp2/HVT0tFBBAmZVJ8aF6wsBYWlkeU1nXkFzR7KFCO78uKNLzCc
	tKS6xGylV5QhRv1UYNdsHPlC1B1lVh6SxptMHucIf8vzrePfDmLwGqxRBZ4RwCTCJKzyPj1gfVJuU
	akdWMObsc2ep4T9OqCrv+TIJWHNEVOOiiZ1IIPBsN+RhxocWl8T5Rla1KJFkUKFzCWCbzPo18Mct5
	bzzG2ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYXSE-000OTg-NF; Thu, 07 Oct 2021 17:45:14 +0000
Received: from lug-owl.de ([188.68.32.151])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYXSB-000OT1-RM
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 17:45:13 +0000
Received: by lug-owl.de (Postfix, from userid 1001)
 id AAEE041EF1; Thu,  7 Oct 2021 19:45:10 +0200 (CEST)
Date: Thu, 7 Oct 2021 19:45:10 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: PING: [PATCH] Don't overflow when writing a key
Message-ID: <20211007174510.tctkyrbvks7vjzjx@lug-owl.de>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
 <20211005144936.xnkzugjr3oygauei@lug-owl.de>
 <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
 <1970203009.45154.1633591205445.JavaMail.zimbra@nod.at>
 <20211007135401.4z3gcunwr2uq7fpx@lug-owl.de>
 <135911793.46658.1633616346904.JavaMail.zimbra@nod.at>
 <20211007142617.3hgjddbbvcowzgc3@lug-owl.de>
 <940617141.46853.1633620047008.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
In-Reply-To: <940617141.46853.1633620047008.JavaMail.zimbra@nod.at>
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
X-CRM114-CacheID: sfid-20211007_104512_064583_50C3D8B9 
X-CRM114-Status: GOOD (  13.25  )
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
Content-Type: multipart/mixed; boundary="===============3654319330455283937=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3654319330455283937==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlpp7ji2y4w6jnta"
Content-Disposition: inline


--qlpp7ji2y4w6jnta
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-10-07 17:20:47 +0200, Richard Weinberger <richard@nod.at> wrot=
e:
> > So ...  The code does _not_ overflow, that's good first of all. It's
> > just a bit confusing how the key bytes are written to the buffer. At
> > least I was easily distracted by the two different sizes.
>=20
> If you find a better way to write the function, I'm all open for a patch.
> But please make sure the generated code is sane.

That wouldn't be terribly complicated, but I have no way to actually
*test* that.  It's just an issue I found while doing mass-builds for
all of Linux's defconfigs.  If there's anybody around helping with
testing, I'd happily work on that.

Thanks,
  Jan-Benedict

--=20

--qlpp7ji2y4w6jnta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCYV8yJAAKCRAdvV51g5nh
u6KxAJwKmAOwbKKF4h3IT1O8jam77fUvjACeLLajNc+JTT9DkmHCLZMY/rXLdF8=
=czGA
-----END PGP SIGNATURE-----

--qlpp7ji2y4w6jnta--


--===============3654319330455283937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3654319330455283937==--

