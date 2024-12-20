Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73174E77188
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2024 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPxgvOna+xc3ynK/DYJpa6feFmykCL2Cylp2AamithI=; b=lm31m9bsXr9hYCzVs22BhYr+4S
	hqaepLpMhWxvhqj3tUchcIenmFkRZ2z0CxrB3BE0OXQ02qgOn5kzfFV/6RNwNz92R1WJuzG2MLxVZ
	KMGH0JJjAhRKPnKbDS+oltzpnMUsNvlmW+aaMC/9BlTDCkOKdQWDhyps9CPa9CGcBrV8AyLT4vBCH
	uK8/uiDxTJ0BO7R5Gvc33yDq2gB9halxvNMknslRw0l4ZhAI7vR4wQeC+kIrbfNENzZS97w3wdTKH
	nZfMkoWD/jLL4YWBzA7MEGMgF0qBkq1zvRY1jQkZZdJJ/7cLfuZTJHaXIXM5DtKl6SKmOY5CcLQZY
	V/jRU5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYVN-00000004IbO-3E2h;
	Fri, 20 Dec 2024 08:37:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYVL-00000004Iaz-2fVT
	for linux-mtd@lists.infradead.org;
	Fri, 20 Dec 2024 08:37:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EAA75C6290;
	Fri, 20 Dec 2024 08:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95713C4CECD;
	Fri, 20 Dec 2024 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734683822;
	bh=BkX95TYDCyyX7sv338gZ7D8c9yqGQLujsjZfJ3LfLhU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Rec4aioG1lrjE1V03jcufHkmWsp/1cjwqHyxu7DM4FyzNWsp0xMaLdQ6hcUE68GtD
	 Y4D4MLywq65d78JuzCKDrEnM+LF2MuBYtgjZJQayqf+jJJTT5KbYujQ9lxomn4f+63
	 c7MpVm1+NYtUjkdHkU/f8IAkOBaYZxh2Va08xD5v23We60UV95HItZtzKCFi0N7OtS
	 kvtkzWAEsX/C3auALWlzvjLJyfmgvzV9w0Bh8mRvcGtaEsywFYvSJlT3OFsGJWx9QW
	 Ekq4yYbJwMVS7IIKLdqRHstD5Mt8LallUIs3657/uNJyqbjSTAAMYa+sgbuExey1Gl
	 SIFcfLKwgB5QA==
Date: Fri, 20 Dec 2024 09:36:57 +0100
Message-Id: <D6GE3CD5XK5F.35VL454SBGOID@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: extend description of size member of
 struct flash_info
Cc: "Renjun Wang" <renjunw0@foxmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.16.0
References: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org> <87r064c8r3.fsf@bootlin.com> <4660f0ea-b1d1-46c3-b5ea-efe549c9adf6@linaro.org> <871py3abt3.fsf@bootlin.com>
In-Reply-To: <871py3abt3.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_003703_765908_F650466D 
X-CRM114-Status: GOOD (  16.87  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0899632852567295307=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0899632852567295307==
Content-Type: multipart/signed;
 boundary=da44abc2be6c1d6e7d8f71c66994cb41bf94892202f579c1ba3c7c7fa137;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--da44abc2be6c1d6e7d8f71c66994cb41bf94892202f579c1ba3c7c7fa137
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Dec 19, 2024 at 5:15 PM CET, Miquel Raynal wrote:
> On 19/12/2024 at 10:01:41 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> w=
rote:
>
> > On 12/19/24 9:38 AM, Miquel Raynal wrote:
> >> On 19/12/2024 at 09:20:04 GMT, Tudor Ambarus <tudor.ambarus@linaro.org=
> wrote:
> >>=20
> >>> We use the size as an indicator whether to parse SFDP or not. We don'=
t
> >>> introduce a dedicated member for SFDP parsing because we'd like to ke=
ep
> >>> the struct size at a minimum, as it's used for every flash declaratio=
n.
> >>> Ideally we won't have flash entries at all, but there are still flash
> >>> parameters that aren't defined by SFDP, thus we need to statically
> >>> specify them.

Thanks!

Reviewed-by: Michael Walle <mwalle@kernel.org>

> >>=20
> >> TBH I'd be perfectly fine (and prefer) a dedicated member, because
> >> code clarity is IMO more important than memory footprint today.

But that would have meant more code churn, because the default
should be the new method. Thus we'd have to change all the old
entries.

> >> However for now I am totally agreeing with changes clarifying what we
> >> currently do, so:
> >>=20
> >> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>=20
> >> One minor nit below though:
> >>=20
> >>> + * @size:           the size of the flash in bytes. The flash size i=
s one
> >>> + *                  property parsed by the SFDP. We use it as an ind=
icator
> >>> + *                  whether we need SFDP parsing for a particular fl=
ash.
> >>> + *                  I.e. non-legacy flash entries in flash_info will=
 have
> >>> + *                  a size of zero iff SFDP should be used.
> >>=20
> >> typo, 'if'                            ^^^
> >>=20
> >
> > iff is a conjunction: if and only if.
> >
> > I think Michael used it to emphasize that we don't allow size > 0 when
> > we want SFDP parsing. Using if allows it.

Yep :)

> Ah, ok, I didn't know the abbreviation.

-michael

--da44abc2be6c1d6e7d8f71c66994cb41bf94892202f579c1ba3c7c7fa137
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ2UsqRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jsNgF/fNF094kMFQNJF/dJLiIArmtC158mXfOz
2aaeOhwlNLoT+OMqcVN7VBlGmZpETreKAX0Wc83W3EtoJWQMGKDfCvzXfhMEUwFS
DI8QgEyd+sgSu/xoCv0VVRFExdPMQQ6K7gw=
=nx6t
-----END PGP SIGNATURE-----

--da44abc2be6c1d6e7d8f71c66994cb41bf94892202f579c1ba3c7c7fa137--


--===============0899632852567295307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0899632852567295307==--

