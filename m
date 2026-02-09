Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D70E7E0C2
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ake/qiQL4zk7qi2kC0XbNitullZU2/qoe0KDAOG9ff8=; b=Bl3BZkjsVPD/RvjdgQ4wbDg5Tu
	SFVmncWKvbA4QtEUjPbHOQcIEzdgd+VRWqcby5R3GZfqdYhGZWsnKIyRRNzDX8KeMcq5zEykpMju9
	ZlyOELZeShXhSgErzPVQSspqJQ6a4NikYdQUI8Yp7oR/mp97jU+22DEbphS4BTskS/gxnEgwhBwD9
	QA674AWYSLk+aQBA1UU9Z4DpGIp5iTshao2mqDesxA/O2Kr0RyXuIhEN6lEDtt0pivisC5NAlxgEX
	oz1a8AOWjC6KcRdfQRtJrbRmSQ3wgxBF8iw0U+AH/Z9ZhfH8W8LnG0Z45oUFUGoADV0/u9evWuStW
	+P76PCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOcE-0000000FFEf-1FAV;
	Mon, 09 Feb 2026 10:35:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOcB-0000000FFEH-1tA5
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 10:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC974436AA;
	Mon,  9 Feb 2026 10:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CF5C19423;
	Mon,  9 Feb 2026 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770633334;
	bh=/bNOPCYBtU5g2VEtSzjHAvVvYEboead4Gup6Z+g/KcU=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=q/VARoXiNhqEtJtFZX03KE+w5iqC7Gqb3nfnGbLkTqliCyvJ7watodXxZe3xzcCYt
	 2hGFhFxe947De4bAYjkQo5croIVrpDQ5isnlFO+M2lxjzqhuxENwUKI3cbSykWATr+
	 a7B/Rnp8HCHgXjg+cKB8tqYNzfSfVhIOdjhXwAa2bcVeUohgXWYAasTY/6qH5z2gqL
	 SpPsUzL/gMiZc2iKPZ5Ixi5vxysGqzJCOiLd2LbLTYaeMjjW4O8X+XnnYxPc42ObtB
	 WCIrCcSeOzUy7cZu0tKYgga4XGIIKoRf1Sc646YikSPk0SVjTBS7Rm1HHulDd7jKiW
	 VjgAT2KSDsPuw==
Mime-Version: 1.0
Date: Mon, 09 Feb 2026 11:35:30 +0100
Message-Id: <DGAD4QNHS6Y6.3730026F5DQMR@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH v2 01/27] mtd: spi-nor: Drop duplicate Kconfig
 dependency
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com> <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-1-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-1-c462ef806130@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_023535_586527_BBAD70A8 
X-CRM114-Status: UNSURE (   7.86  )
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
Content-Type: multipart/mixed; boundary="===============6182768778031896852=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6182768778031896852==
Content-Type: multipart/signed;
 boundary=ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jan 8, 2026 at 5:57 PM CET, Miquel Raynal wrote:
> I do not think the MTD dependency is needed twice. This is likely a
> duplicate coming from a former rebase when the spi-nor core got cleaned
> up a while ago. Remove the extra line.
>
> Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYm4chIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hiRAGAj7ZLzvHoJDioJ45NYzayPCD24tVI2RHD
dgHTmnL3g0Uv+IsOnM90sfC2ebfOjBokAYCfjZAAjBQVkrqtdqnxppUdAtXvzWOE
BsgqyAxjtwAqLW5Uw9prI/J2Oy/jSugLRks=
=ebxr
-----END PGP SIGNATURE-----

--ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2--


--===============6182768778031896852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6182768778031896852==--

