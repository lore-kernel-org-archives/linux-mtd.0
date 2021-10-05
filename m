Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A339C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 14:50:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D2A61354
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 14:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33D2A61354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lug-owl.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upawJvWV8kVSYb1fgS3XEXUpieSCUnCCtyvw35OdoSY=; b=PURJ2Umy6ha88J0uPfDQrgxxav
	Kv8aHkVe9ilihOZ1nRZaT+DznyoQIAyZYpFCOxadjyO3yNkH1QHGg4l4uMIsk566TfxZkL1qryL5p
	iVpYlDvIZTVCrYMVmuyvycT5zfAKpHgVnUl9oAXzNOJxts9vsoWPadzOLZuofYkJaV8ZncF38dW1l
	Q0CDC6G2gSnCethNM2iyYJ41B9VmiNAdavqAwAaTisdByQELQLrnG6d95f2IncZWXYi9Dle/RXq3S
	SjNxmxsNqAAjCINBI+RupVqnbF2zKLPB3XtTzhtA8Wn/GP6koBgoY4FKAc0CDLAy6u9X0Z8ow2ywB
	RHZYlRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXllI-00Aumw-VI; Tue, 05 Oct 2021 14:49:45 +0000
Received: from lug-owl.de ([188.68.32.151])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXllF-00Aulx-KK
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 14:49:43 +0000
Received: by lug-owl.de (Postfix, from userid 1001)
 id EC7BB41F17; Tue,  5 Oct 2021 16:49:36 +0200 (CEST)
Date: Tue, 5 Oct 2021 16:49:36 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Richard Weinberger <richard@nod.at>
Subject: PING: [PATCH] Don't overflow when writing a key
Message-ID: <20211005144936.xnkzugjr3oygauei@lug-owl.de>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
MIME-Version: 1.0
In-Reply-To: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
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
X-CRM114-CacheID: sfid-20211005_074941_870787_437C70B0 
X-CRM114-Status: GOOD (  12.86  )
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
Content-Type: multipart/mixed; boundary="===============1166799548827550844=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1166799548827550844==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nwg3aata3mb523pg"
Content-Disposition: inline


--nwg3aata3mb523pg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 2021-10-01 21:28:36 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.de> wr=
ote:
> diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
> index 8142d9d6fe5d..40edcca7ba62 100644
> --- a/fs/ubifs/key.h
> +++ b/fs/ubifs/key.h
> @@ -436,7 +436,7 @@ static inline void key_write(const struct ubifs_info =
*c,
> =20
>  	t->j32[0] =3D cpu_to_le32(from->u32[0]);
>  	t->j32[1] =3D cpu_to_le32(from->u32[1]);
> -	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
> +	memset(to + 8, 0, UBIFS_SK_LEN - 8);
>  }
> =20
>  /**

I wanted to give this little patch a ping since there wasn't a reply
until now and I think it might fix an overflow.

Please keep me Cc'ed since I'm not on this list!

Thanks,
  Jan-Benedict

--=20

--nwg3aata3mb523pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCYVxmAAAKCRAdvV51g5nh
u6IHAJ4oLwbJhGAYpfU9b06qglwROBmLKgCgj98mCmFEIqpqXx26Cd9bFppqNDk=
=uBgt
-----END PGP SIGNATURE-----

--nwg3aata3mb523pg--


--===============1166799548827550844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1166799548827550844==--

