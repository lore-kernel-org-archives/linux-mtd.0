Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F4C48BC1
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Feb 2024 11:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8kwG7IjFkBSKOUJUyhSP1byOP3seL6CYsfcx2saInoc=; b=bJ3
	SrsE6dtDGgGlXClq2/L4Fm28Lh839ke+yMrjiXnnj5/aoIs5wuo5xdtNKaCB4aBreVWgD8icQL0Lf
	PWyCec0p2IcdilG4QroSQb4cqKTpxaxdSIRVx98GCQpv9vYTDZ9BanEtPE9vCbC/q4b3sCeKWQlCL
	CADaIY+XjZ4cg5ui5q4S07y/J9lzBwPmqAaPq+2oT4LRnd7IVMJInYtwTonFD5VE6O8yo/odZIOuj
	h7y5/17mPljjmFCy9ci55W8YVY53UXKjVd4R8lszdjk85oezHFaj81/j6MJ/JMgHLkagLW/vmYNMb
	uhmq50i0OsR9vpdV1mT6z4o/Adxc/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raD6W-0000000CbrK-2EXq;
	Wed, 14 Feb 2024 11:07:04 +0000
Received: from mx1.emlix.com ([178.63.209.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raD6S-0000000Cbox-2W6V
	for linux-mtd@lists.infradead.org;
	Wed, 14 Feb 2024 11:07:02 +0000
Received: from mailer.emlix.com (cr-emlix.sta.goetel.net [81.20.112.87])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id BBF175F8AA
	for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2024 12:06:51 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: linux-mtd@lists.infradead.org
Subject: Wrong "ar" is used when crosscompiling since 2.1.6
Date: Wed, 14 Feb 2024 12:06:51 +0100
Message-ID: <12380359.O9o76ZdvQC@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_030700_817275_275BF061 
X-CRM114-Status: UNSURE (   7.89  )
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
Content-Type: multipart/mixed; boundary="===============2411363589434093164=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2411363589434093164==
Content-Type: multipart/signed; boundary="nextPart5754743.DvuYhMxLoT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5754743.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: linux-mtd@lists.infradead.org
Subject: Wrong "ar" is used when crosscompiling since 2.1.6
Date: Wed, 14 Feb 2024 12:06:51 +0100
Message-ID: <12380359.O9o76ZdvQC@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

Hi everyone,

since version 2.1.6 building will always use plain "ar" when creating stati=
c=20
libraries. Before it used the one matching the target triplet when=20
crosscompiling. I can circumvent this by passing "AR=3Dfoo-bar-ar" to make =
for=20
the moment. I suspect it is a side effect of the libtool removal.

Regards

Eike
=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=F6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=F6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner
--nextPart5754743.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZcyeywAKCRCr5FH7Xu2t
/JRSA/4ojUgY9paqY/gOVvTqkH4N74ZKEui0KTpRvuyEjAS6/d2mZiLLxrGaajAh
/uombcN9C292DCdJKxHeu3Wg6EHLo/dIISXENX89W719+KZmzllVGgUjMPFrhCOf
eGzf8RzmnnloVqmPb15J2LDSUVYPZoFj9xEieNFeV2bnDcu3yg==
=aSNj
-----END PGP SIGNATURE-----

--nextPart5754743.DvuYhMxLoT--





--===============2411363589434093164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2411363589434093164==--




