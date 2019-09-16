Return-Path: <SRS0=la4X=XL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0DAC49ED7
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 13:40:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BE7216C8
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 13:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5Y+Dc/f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="L3h6qJyE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50BE7216C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SAlmnMejMHjH9JHCqUtNFhbIMIPet0dtTW2gYkXIgKU=; b=i5Y
	+Dc/f5vXVJ3/VpAD0FEF4wsBNWGqT5jbGQUs8kB6QxMux3T72Q2Bx2Zh9DKGuUmPOCbbfyMk0ulAd
	9GiXFjRra72vPHe2d+UCBCmcMG7W35GzX/HYUBEZeI75heA8ZGPaRfKIDK5J0vhOFy7BdrepYg0Mj
	jzepNPJRXknac5aornWZvyvljRrMPzc63Q29pIF4gnsUteEGP0BjyeOjvgDGJvE8jE7ei+9pPnOCD
	y4aT5T8BT6LAFmGCp2QkFqJ6458RRpEDY2s5glHCsqkD6xiZB8JBZQ1PUGcE6wDC3baC/JbdC6UD/
	ThGMbTgEB9qJ6Sq/fvEf7HrKGq/TvRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9rFD-00084L-RW; Mon, 16 Sep 2019 13:40:43 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9rFA-00083u-2j
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2019 13:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w3bobEKmdltUYp3wdYywVRw65l/zXxvDNG8WKRQOF04=; b=L3h6qJyEkF7Z4Q+eevCqRrGLj
 +p1+xrRJoB0E/NxBqrZjB8JC8uvC05p9FzBOnoTdjIm/1MIMpCbLzBcuvAF7Z8c+W5DDEZAZN/7b0
 YbHO5liyYQAGum8+A6zBMyXIyu3xGimJTa4xWJgZOmie8US5dM7wE/O/TqzZrKVVYJTdA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9rF0-0004b0-56; Mon, 16 Sep 2019 13:40:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 91B992741A0D; Mon, 16 Sep 2019 14:40:29 +0100 (BST)
Date: Mon, 16 Sep 2019 14:40:29 +0100
From: Mark Brown <broonie@kernel.org>
To: David Howells <dhowells@redhat.com>, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Al Viro <viro@ZenIV.linux.org.uk>, Wenwen Wang <wenwen@cs.uga.edu>
Subject: linux-next: manual merge of the vfs tree with the ubifs tree
Message-ID: <20190916134029.GF4352@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_064040_496870_F81882E9 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1990355560998297594=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1990355560998297594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rMHhSL690X5+a0Qo"
Content-Disposition: inline


--rMHhSL690X5+a0Qo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/ubifs/super.c

between commit:

  9163e0184bd7d5f ("ubifs: Fix memory leak bug in alloc_ubifs_info() error =
path")

=66rom the ubifs tree and commit:

  50d7aad57710e2b ("vfs: Convert ubifs to use the new mount API")

=66rom the vfs tree.

I fixed it up dropping the ubifs change and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

diff --cc fs/ubifs/super.c
index 7d4547e5202de,a5fa725e7cf16..0000000000000
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c

--rMHhSL690X5+a0Qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/kMwACgkQJNaLcl1U
h9DXgwf/QZnfXeiu+WYdJ0NjI/wa5d6J1ojcLsWvDBM/TIPEO8EMwBqvqgF03u0k
SGg0TMTUDuQtR5s9dFlefWdbYWz1FPiOPED7mqkPXBUGUyGopHxM5Y5eRgoeVz64
2jk0e87um3mPWW5X1+dhPBnjjlCeEp7R+t05VG440MI60hExp5NTKlQgDeM9TzaM
Tz6FZlzMYJV2DJAEvBImpI9omlrfzyo2d6S4ZxGx45M/p1o5pfq25kl3R+1DYSYz
Zn3xTdQoUi+YYyPwi4wYk/bt4Zu2rBArVr/nZrDDTZHDjHCkyinjyvGqaR3usr+h
jn2/CH9wfVKTkZHsbyXRvK6XLZ+7oA==
=RVjy
-----END PGP SIGNATURE-----

--rMHhSL690X5+a0Qo--


--===============1990355560998297594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1990355560998297594==--

