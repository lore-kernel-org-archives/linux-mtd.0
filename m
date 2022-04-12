Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813CCC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB9mZrI6vZ6x0/A7JpgYQWpVv3A2iRI2p0l5LMv+hEQ=; b=RrW2kJCekEH6ukEmCPbUMs9YKu
	hHCOcmzeQFpj7gm3dNlwU8rFxihbIinM2Fc18uqKOvcnj2Pv26LzWX8gZxSdHcPESiqugmni7fjld
	gfmRRRNDhsJGRH/tl2t6n6H70hId4N4yVrlgq/GrEIY9oErt5HqPR/VMx/3F+6/CK9Piq5CiQIzRF
	Cc9PXdN8NxmhPQDXYPTn3cSzEQNAiFn7qi8WnhdV0z82I6PWJQsuUlVcETv63CpwpanMpYsO0W5Yw
	6LZLU6Ei8UddnGy+/9KMrUiJczlWpw6AfeAuQ3t6HaaqxDyO6N9f9rNMn83Vn+OAOqgCSBjN+U26y
	FSsyc5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDaj-00DEE9-Ck; Tue, 12 Apr 2022 10:17:45 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDag-00DED5-B5
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 10:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=lvq+dp4SVUtTyznMC+oj6omSMZVw
 vOhhf9wU8J4aQDE=; b=A6Lw9TJ9/QI4XkB6TOnlYq7CIB/RLS+HWw/twpb9Zw+v
 FzkUG2HK4vfHcvgX1smi8GNEoR7gTXJTLpPlBaZzZV5hicYgPeDaJX0nfByEbyqY
 peYG2jDxm/N4AJT5+RJddfXMkzENJGbChSi3wic7NVKLEue0Y7bbV7/XtPLgXRc=
Received: (qmail 995989 invoked from network); 12 Apr 2022 12:17:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 12 Apr 2022 12:17:39 +0200
X-UD-Smtp-Session: l3s3148p1@TKDcXnLczOcgAQnoAGZ4AFi7qjeMIP6q
Date: Tue, 12 Apr 2022 12:17:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] memory: renesas-rpc-if: Simplify single/double data
 register access
Message-ID: <YlVRw4ypp3+0Miz3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
 <YlVJc3z1xXT2emIc@ninjato>
 <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
 <YlVLEnRaARVmWZnZ@ninjato>
 <CAMuHMdWAQ08K6NCdBGrY+-vBrsTQHi6UHaER4eCON1t9JEG1RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWAQ08K6NCdBGrY+-vBrsTQHi6UHaER4eCON1t9JEG1RA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_031742_699975_06B26503 
X-CRM114-Status: UNSURE (   8.15  )
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
Content-Type: multipart/mixed; boundary="===============3464226951814932393=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3464226951814932393==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+PJSAI9U9iARmGKo"
Content-Disposition: inline


--+PJSAI9U9iARmGKo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> But that's not what happened. I even compared the assembler output of
> various solutions.

I am sure you did. I just said "it looks like..." to state a reason why
I don't think it looks prettier. But this turns to bike-shedding for me,
just keep it if everyone else is happy.


--+PJSAI9U9iARmGKo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJVUb8ACgkQFA3kzBSg
KbYFtxAAnMVfoYwfPBsJgmeGyalXpEG+cLcE1gOTw7oMGiHPxT6foxFB9GZBW7m0
ZnqughRm+tMhzFvb/sHwI/W9m1dP1g4+U7OZQYiVFCGo5Dqgl2QADwU1kVZAgTl4
tXz3W4VdX80rOI4bhLPopQ72Z/GmTlxedu6HpjPz57LF2YRDioL7DO9j9V1O9QSz
knPl1Jz9+rPxBXtJ+CW5/WfJ7hL6U8LA4D6BCFHfEI+xH9AjWEOCIFRSHiV2QDHY
mV9AuEDbto6Fw3iSSebi4SgkzYE3h0/jNTbHE8jYuZiZ03U5f+d9q5ixldnC5Ljq
ec9MVbB8VAoPAjN8XV1pP5c+n07xMQjNRchEzKem4b1jNkSWAZnMpUuaJCJnxk1e
MkZgFSDM6EuGlYGuV+A9JrkidHzdUzwsq8o4JwjEN3st+Tj5yOFL1M+iiFjxCzMo
hngWeRHxhI2gJf6RrLJYIudbN6koKPH9QzNikyaIYkz3hAdGHgPDHiUw1tTfFovO
0wWCJbBLVJ5Z1RWiPdRDwl/KPWr9/pWrlNQngPX8NHLCAwUzCicCt4ChJduPDcMt
YLd0v6VG/5TBRfHSuSfjOk0b3ItOZ4QjleYBhbQQ5VAAyEKHuZzXUqFGYCVhPT5M
DT67uH1tS9STOUFxUT6af4DGGzz5oTRI+mvXFqIOtzdDR2+azj8=
=ALuo
-----END PGP SIGNATURE-----

--+PJSAI9U9iARmGKo--


--===============3464226951814932393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3464226951814932393==--

