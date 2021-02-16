Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB324C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:56:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253AA64DC3
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253AA64DC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DntWIyVbMy/PlaQbWRqGRk/3jLW1+vIBuCOPBsBpHt4=; b=ibcVdDshHvnfJXfNFipP3KfPN
	klvWuWBLPhiANJXHdyY4g02haQWq2j7+P1UgpQRJ2mbfytglv6ngtAcdqDvFHqc4+QUZTiwFEiZDg
	AatAm8/CXN8ldr0HcmN2dwZABpY0OaLB0nkpoRx8LDxTT9XePsgQY+4uZqjNhm6y70nkc27iPXdHD
	TnmqC277Zla4q3Ke8Fs8raIeBsRPHnwgyCUwbGduWFPho+S6X/8hWe4KfaRKh2RsLPqlsZW7GZ3fF
	3tRyCWU3BIRIcxxpEq4orw0T0qUWBM1+iCwat+zEcdePtpoKfBuvQh6OZcQTVdg/Etmjx8ftDnXen
	GsAh9xJRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBx4Q-0004l9-1G; Tue, 16 Feb 2021 09:55:02 +0000
Received: from ozlabs.org ([203.11.71.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBx4M-0004kG-8T
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 09:54:59 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DfxCb1VDbz9sVF;
 Tue, 16 Feb 2021 20:54:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1613469294;
 bh=HYvXuZb0knOPlmLWaF+c88CkwNdfH+UjhMJy6nY83yM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cSM0tWu6SScpILWe7jYBWYC5KL09z8s/aYofNbdDYSJn5dOStu2l91K0YDo2erpdz
 AoaobN63qCW/tJS52EehjlUmqJSbPzeuUMc62Duq0JCi/KseSgS818TXxSoC8b2FOh
 e/h4nRoQ5Ux15AJwg/5RhBdUqhzSwTECJbOhTqhMQMCC0zk+O5C63mxxf6JhfFZiLX
 gc0+S2uEL1uQK4QidvSqGegey3eSrwQ+v2gH/ZM56OreiQLSe3DFNCa0DdDiam4qfb
 3YR+CFNmT+49TALz4sWjb0Lh2ErDzhwDSqOYx6Qim1Ab2e+Ggut4aslCnD0Eo7XLvX
 aI9TIpb168/KQ==
Date: Tue, 16 Feb 2021 20:54:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] fs: ubifs: set s_uuid in super block to support
 ima/evm uuid options
Message-ID: <20210216205450.50883f70@canb.auug.org.au>
In-Reply-To: <CAHp75VftQ6y58w+D6=nSwx3DRcLH3iwfx3RT8yv6rgS8O6OWHw@mail.gmail.com>
References: <20210216072334.7575-1-jbe@pengutronix.de>
 <20210216072334.7575-2-jbe@pengutronix.de>
 <CAHp75Vcha++UUE6hw0n_pBnA24q_uJQekABSSktmjCoinfpSoA@mail.gmail.com>
 <CAHp75VftQ6y58w+D6=nSwx3DRcLH3iwfx3RT8yv6rgS8O6OWHw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_045458_838238_63EB2C3B 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Juergen Borleis <jbe@pengutronix.de>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: multipart/mixed; boundary="===============7077023147159932983=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7077023147159932983==
Content-Type: multipart/signed; boundary="Sig_/qWYkc+vcu08yJpPLKWMWqLZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qWYkc+vcu08yJpPLKWMWqLZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, 16 Feb 2021 11:11:08 +0200 Andy Shevchenko <andy.shevchenko@gmail.c=
om> wrote:
>
> Stephen, do you have a check in Linux Next to catch the problem that
> Co-developed-by is not being accompanied by a corresponding SoB?

No, but I will see about adding one.  Thanks fo rthe heads up.

--=20
Cheers,
Stephen Rothwell

--Sig_/qWYkc+vcu08yJpPLKWMWqLZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmArlmoACgkQAVBC80lX
0Gyk9gf/cFLJBzqkelOcDcdg5i1eeRR+JHjg9FI5JWGHEWeLOksx5PD3/ZQGfkP4
2u4fkkaD+ukCwxE7CfUOxzADMZI5anlQtjaiZfwi0uMfDZdXa1RBYbs6yGAcJ6Bf
3uAaMUGhr4YUgsJ1WkfUe1KUmZeQQ/MAfRVHquYWIm/cqRLME6qFr0covEZ8PPt9
8YMuV72cn0w2+b293YNTRqVQ5NUtwPBvNGcnZebTyHupuFAH5Af22tYaQl514VZk
YJ1QuGrqbl8GvkeY3nzTC83+G2ghN/F1GZIQy88oaSf2N9l6UcvUMyQFWVrNL8oy
gcqSu9z46WumC3RP41TP+GYDwX92aA==
=319X
-----END PGP SIGNATURE-----

--Sig_/qWYkc+vcu08yJpPLKWMWqLZ--


--===============7077023147159932983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7077023147159932983==--

