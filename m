Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A77FC5475B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tAO5cNPwzufHFsEGRMuiMwZzi4p8Znc9RPp6yqDr3g=; b=oQQm7Lwc7MwuRxdxvCaB96zD8+
	fSQ+vwlxBYoHcG/YK51caYCrQV6NXlOLEVCUlU8K/ptZZCAWp352yupKZjh3+cgh8nKPGNW7sBs+N
	ujldzFleNgNQ3ob5I++5XwfXAEuBx4DDA9Xd+T3uxb7LpK2P7pfFpH/KNG7R5t6ZwfbZOi8DTFUSI
	ZBEk9msnuwnmFQ1nDOI8Y72ryof5emS+RuWQEgTG2Bw5NWae07MJRffVkAhNtcB67CmafqGrPtaJJ
	HOhZ3cOkGcFKJ37R2CJew0m2iKQBXgk8weRpAEPr2RufdAAHV9Bq44ER1Qnfy21qUcR/Zykit6Y38
	XAKAl2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgZF-00000001mtV-17Kw;
	Mon, 11 Mar 2024 14:23:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjgZB-00000001mrh-3Y5z
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 14:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B5F060E93;
	Mon, 11 Mar 2024 14:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6E0C43390;
	Mon, 11 Mar 2024 14:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710167028;
	bh=QDQ3mgpPUgCapF3eUZvCYBDqcxaMhh1YdjLllS/UtnM=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=noDyMGWRaNHlX2SAIRkaJPRQXdmZ3q54z4Dt4h/hb92+JGu7LJA5i5eR329JzWY3P
	 AogOEnkGerfjVRiPoFW+yloqO8cR3tJ1yAzSFGb6oOzCYuqPPXHs6aR1QHEmBTfnzP
	 C49en5V7LFadI9xRgod9b3CNHHIRjR0TpalnmkoHetxWeC4REHqOJ0jfp7T0C/PpgM
	 7CduF2bqc57KHihthWWYbhsKdWLc1qIp/uhDtAvwflF4P1mA9sPzGQomzK69Vk5+IJ
	 c9BaiqNo0eTASff7z7epzeRed3Y9Yz3jon2GS0VhDMmt5BLxJbTEh9vUmj/kss4w7F
	 ojdtyGHl1O4uQ==
Date: Mon, 11 Mar 2024 15:23:39 +0100
Message-Id: <CZQZM2NMDNGU.1O7L4KJFYGA18@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Aapo Vienamo" <aapo.vienamo@linux.intel.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: core: Report error if first mtd_otp_size()
 call fails in mtd_otp_nvmem_add()
Cc: "Mika Westerberg" <mika.westerberg@linux.intel.com>
X-Mailer: aerc 0.16.0
References: <20240307130418.3131898-1-aapo.vienamo@linux.intel.com>
 <20240307130418.3131898-2-aapo.vienamo@linux.intel.com>
In-Reply-To: <20240307130418.3131898-2-aapo.vienamo@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_072349_948784_63F31CB2 
X-CRM114-Status: UNSURE (   7.11  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5642874453953552261=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5642874453953552261==
Content-Type: multipart/signed;
 boundary=29380c7dbc2480426013ef519e8e75fca3b8b1943dcb785ea5fe898a2fd1;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--29380c7dbc2480426013ef519e8e75fca3b8b1943dcb785ea5fe898a2fd1
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Mar 7, 2024 at 2:04 PM CET, Aapo Vienamo wrote:
> Jump to the error reporting code in mtd_otp_nvmem_add() if the
> mtd_otp_size() call fails. Without this fix, the error is not logged.
>
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")

Not sure this qualifies as a Fixes patch, I'll leave that to the MTD
mainterainer.

Anyways,
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--29380c7dbc2480426013ef519e8e75fca3b8b1943dcb785ea5fe898a2fd1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZe8T6xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvsSDQD+LmhRjiSOY5riC0MuNIx9H6dvoiMun43b
7fxJYqB2/v8A/1b5xgKNYvveX26fDM80P7xrRKdT4Ev62AIjvgmCtFMP
=wkxZ
-----END PGP SIGNATURE-----

--29380c7dbc2480426013ef519e8e75fca3b8b1943dcb785ea5fe898a2fd1--


--===============5642874453953552261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5642874453953552261==--

