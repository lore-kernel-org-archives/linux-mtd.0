Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970D0CD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G13d+CZPpFr4gqbNEzx6Wh4TSoLw1kvAAM+aQxDiMTo=; b=lWYgahoJa0gW3G72wdihm+7lxS
	LsyIIvUW6UmDW7z89GtY1/Gp+nFuXINtRTFG/kOWvSdOec7IHV9lC9/JYm+HJDHWfpwvorW6Dtoo2
	xsETqGacL+DEyzA3ABbwhg/bm9Ow1XzJU9becC3clSIKYZmavnOSSMYwLo8pzSf3MlAdpp/wsFaaj
	mzTwunbQXac0RNiquFQYxYQXY1QaGJemzRbxNL/cGz/e+jjhgZOPVFxd1AjEJnzPkNSSkB6KJJ7LF
	2kMdQTz/5KmwCSbdp9JL3qc6uBeTpSCi2w48ZIqrFfLlwzOnh2E/DbEB0lngZ0/HNJI3aOgRREVyv
	sg5WBACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVXM-00000005JDz-1SHw;
	Thu, 28 May 2026 07:52:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVXJ-00000005JDb-06xy
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 07:52:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 8316040589;
	Thu, 28 May 2026 07:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E265F1F00A3A;
	Thu, 28 May 2026 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779954732;
	bh=2GMkjPxX2bdw46i4uwyD0Ly6pBU0GmTzAqTMf4hdkRI=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=kmGPG3q+QT6ER7LA5P38moW3cF68TRwJfA/25p9dCUS681urOmZikYpa3cXzLHpXI
	 6P6zA9g78QE2BIS+xXG365jtFUENZSM0aWpXrkjohntXrSgDNbP3VeWuUVmbS9Ebwa
	 zrX9CcXyONX6+H8tU1lUfaE7pqYwpFo/Dxdsli1VBYEI6My0gaJI9SO0C36EUDNOBh
	 apVBl5uNNpqWkMSWk8SgAcstMXo7FdYq57bt9uP7T/HC7HZXvGrpz0LKp96otJ1vcS
	 ITF+Bwc8U7MfBg6sL/0OTAyN1u6sCbq4SxtzRIqycbEZN8XrzwZuDGkQMN0Xjszd5D
	 tUHrEgo7HFG5A==
Mime-Version: 1.0
Date: Thu, 28 May 2026 09:52:08 +0200
Message-Id: <DIU5AHNXBPN2.27JOC8D5COWAM@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Cheng Ming Lin"
 <linchengming884@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and
 MX25L12845G
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <alvinzhou@mxic.com.tw>, "Cheng Ming Lin"
 <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260528051751.1648246-1-linchengming884@gmail.com>
 <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org>
 <CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
 <87eciwhtf8.fsf@bootlin.com>
In-Reply-To: <87eciwhtf8.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_005213_117597_28529051 
X-CRM114-Status: GOOD (  18.07  )
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
Content-Type: multipart/mixed; boundary="===============6915161059078174304=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6915161059078174304==
Content-Type: multipart/signed;
 boundary=925f76c6de4a818e9399224f463366c077bdf0fc82b27f5e98e940a62e31;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--925f76c6de4a818e9399224f463366c077bdf0fc82b27f5e98e940a62e31
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu May 28, 2026 at 9:42 AM CEST, Miquel Raynal wrote:
> Hi Cheng Ming,
>
>>> It looks like you're getting bitten by the ID reuse. You can't just
>>> unconditionally add the quad PP because as far as I can see the
>>> MX25L12805D [1] is just a standard single bit i/o flash and doesn't
>>> support the 4PP.
>>
>> You are absolutely right. Thanks for catching this.
>>
>> The MX25L12805D is indeed a much older product (released around 2009).
>> Since the initial JESD216 SFDP standard wasn't published until 2011,
>> I double-checked with our internal PM and confirmed that the MX25L12805D
>> does not support SFDP at all.
>>
>> Since the newer flashes (MX25L12833F and MX25L12845G) do support SFDP,
>> we could use this as a differentiator to distinguish them from the legac=
y
>> MX25L12805D.
>>
>> What if we try to read the SFDP signature (RDSFDP) in the fixup hook?
>> If a valid SFDP signature is detected, we can safely identify it as the
>> newer flash and apply the SNOR_HWCAPS_PP_1_4_4 capability. If there is
>> no SFDP signature, we leave it as is for the legacy MX25L12805D.
>>
>> Do you think this approach is feasible and acceptable? If so, I will
>> implement this logic and submit a v2 patch.
>
> The ->post_sfdp() fixup hook is documented as "not called for SPI NORs
> that do not support SFDP". Alternatively, I believe an earlier hook,
> like ->post_bfpt() could also work since it does not seem to run on
> non SFDP compatible flashes.

Moreover:

 *    spi_nor_post_sfdp_fixups() is called after the SFDP tables are parsed=
.
 *    It is used to tweak various flash parameters when information provide=
d
 *    by the SFDP tables are wrong.

And it looks like that is the case for these flashes. Also, please
provide a comment on the fixup describing that the flash misses that
property. Basically, what you've written in the commit message.

-michael

--925f76c6de4a818e9399224f463366c077bdf0fc82b27f5e98e940a62e31
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCahf0KBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hD6gF9EgLZdXSAupg/3ipw2fvtR9bRXS5g/Pvx
X8fTvB0ix0lcfAVEkuVUAjtOJTxr/9yuAX9aFnjlczgHvO2Wg4aaRy7Af6up486X
/WhadFLeFZAUdcjw6Uy4iGdYLtn/aYT5lhw=
=/t2e
-----END PGP SIGNATURE-----

--925f76c6de4a818e9399224f463366c077bdf0fc82b27f5e98e940a62e31--


--===============6915161059078174304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6915161059078174304==--

