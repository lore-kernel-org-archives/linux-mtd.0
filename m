Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3240C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 07:53:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270B52220B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 07:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270B52220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s1XHvWYEU217mroKoz2g4EVaMezAj4Xq9CC5sXkt/bw=; b=Je8mJTYcOAv63qKuL9sFzB5Oe
	oiXR3KOqYAT8osTtSAzC8Oa3q6+UGYdgB+Pm4KSZjq89y3oqJ5kNOZBDmu9kdaHJ4VRDHGBfZ+/Pq
	FxBHV4EBIz102+Kmd2OdI4LQyw65NiQC2cv7a0T3zBC4Ieq2WW+St1FLPpZViUtyqMdntpRcLvfh6
	hK6ev0WtWg7Q4IuspA6aVltW5xDL9+gA3eMM+OvoUReuhCy/JMrqP6BhNhgaFPb5ctTOhFBGzdbYa
	FZJbMbLI/hbJsHWRQgmdRM2MIt+BBdILiFGLoaESGeKHZGC/hWuwhexdabInaLijVKBQS+Vo5lRn+
	FSEgcxAyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmBKN-0007ID-1X; Mon, 07 Dec 2020 07:52:59 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmBKL-0007HT-37
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 07:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1607327573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jw0hmNVD3o/YIEzBj3Wlqbm+6DzSZmM6Avc5truSmuI=;
 b=j/pKRLvxISdrk+CuUzj2CMzXMTSulhLUbic7V7QoMo2LVC2SyVb/S2LyI8nSfWi/VAkESe
 DWYa9iWfnrkqYhNczvs+Ge02GcyoDrTlxkfB3tZHGMdAXpMe8fhaJ0h02F0U36981TJghb
 5zE15ZHSPVUGhO2amAJF8hd3zc/Bf64=
From: Sven Eckelmann <sven@narfation.org>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
Date: Mon, 07 Dec 2020 08:52:50 +0100
Message-ID: <2560223.mvXUDI8C0e@ripper>
In-Reply-To: <CAP6exYJ7QR+Y7Vsumecx_3rUC4cNY4xJj4e6759S8US6FX7ADg@mail.gmail.com>
References: <20200429165347.48909-1-rminnich@google.com>
 <2124367.HovnAMPojK@sven-edge>
 <CAP6exYJ7QR+Y7Vsumecx_3rUC4cNY4xJj4e6759S8US6FX7ADg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_025257_404247_39AB1A60 
X-CRM114-Status: UNSURE (   8.17  )
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
Cc: Sasha Levin <sashal@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="===============3993788983540633078=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3993788983540633078==
Content-Type: multipart/signed; boundary="nextPart11652155.O9o76ZdvQC"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart11652155.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ron minnich <rminnich@gmail.com>
Cc: linux-mtd@lists.infradead.org, John Audia <graysky@archlinux.us>, Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>, Ron Minnich <rminnich@google.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or more colons
Date: Mon, 07 Dec 2020 08:52:50 +0100
Message-ID: <2560223.mvXUDI8C0e@ripper>
In-Reply-To: <CAP6exYJ7QR+Y7Vsumecx_3rUC4cNY4xJj4e6759S8US6FX7ADg@mail.gmail.com>
References: <20200429165347.48909-1-rminnich@google.com> <2124367.HovnAMPojK@sven-edge> <CAP6exYJ7QR+Y7Vsumecx_3rUC4cNY4xJj4e6759S8US6FX7ADg@mail.gmail.com>

On Friday, 27 November 2020 19:54:30 CET ron minnich wrote:
> Thanks, Sven, for your patience, I will indeed try to test this next week.

Any test results?

Kind regards,
	Sven
--nextPart11652155.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl/N31IACgkQXYcKB8Em
e0a2tRAAgxxINqPYhc87CiLq1z8QpLubdnCWBYkNk2KCnD2ynM+mXDZDTq/YIwYf
0BEworh5+po4ruUOQhfMFWidN5VakghJEbOUU8hbPg8qC5KQpYu3UIZPHqyxW2/E
Yygl5wqramKD+OArdBkiRr0l5dc7vcW9UFPCUU3VR0RKsXUoONQsVFcRkmnadFUU
lQ2XiQizmjdJIyEszdLvddOoH9gvlpClwirDl7qPeMBCR0SfSTgcqFrGV4Rr2hg2
IdKihxKupQzHKtzgD/ExncQyUYafKEAsu5nf7DN5lDSskY5d+PEj2dXeCZBXNPSM
W6/tL92fOnuqoGWYAuKmDfh51PtH1Gs3mHyXoRZ+uM6kwCMul+gDRGGXek0z9Arg
bmcQUplWaQ6Wn5wGW8hzc6bSTuPyHBsCAds3ZZxQxxMpR60yUXVQ10UwhUFN+vjd
YdbL7Qf2oI4QgLdsi4zVZaxzvp+hjZZJODdXxcaNTb9fcZVSJIWwSUsvxh28MFl1
RoM8HSTXUFKKdM2shN6YDuPt/JCF1HNlJDu1l2jbeU5omtgPMM0XM5AIj5t+fzb7
YyJBrhB+PAMnKAc+55brT61JamUMSHAR3jPYyQhxVu3dOzCcXKl7QnTjTmFQz5B9
LMU8nlyxqJqhbMIXCXoC0b1dhBE94hT7WxHCDyyrjnFm9Mpm3w8=
=wEB5
-----END PGP SIGNATURE-----

--nextPart11652155.O9o76ZdvQC--





--===============3993788983540633078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3993788983540633078==--




