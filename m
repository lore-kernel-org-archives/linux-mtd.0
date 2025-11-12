Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5B8CCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8VG6fqqYDVdylOI/fGVAo2Il1fDtG/AIPP0WiWdJAE=; b=Zk3ANknov70IZNktGU/Yh7SUqT
	vbWBkWFdxqwJOu2rPJk9VDLZxPTQ6BRi0WLCJkW9oPZKBtp12OTIl51Gw5acNVSz1+pvAxPO+ORzG
	k0D2KRvTTUh9Fpr+/PJRxMce6zMhCV3pkkU/MZQ7N+oN49SAI4TKkDrUV0McUXxU3CzjyrWqgRqt0
	Hysim/fDoJaEUARqrVxmek6BVKh04qNJAe6WOE/IcE0hXna+DtOrywXr6i2DYakvZGy1YGaUsKb6X
	Pee9C56f3XnxFGTOnbZ2Eu3+PZ+/VP7c1WS7GsoEDvf5VHez3XRx840YeBAecPMJopnO7emEsMV4F
	8SlVid+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAzX-00000008r0S-45Nw;
	Wed, 12 Nov 2025 13:34:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAzV-00000008qzL-2cxm
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 13:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BF1344571;
	Wed, 12 Nov 2025 13:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C48C2BC9E;
	Wed, 12 Nov 2025 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762954466;
	bh=ja9YXOVmyXlMo8gAt1oJeN4Ik/humKwGB2i5IT6pF7k=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=AzvYZUG6T8ljAlwx1rplNvgQ4lkJEDYHfStzRM+6DSuUNNnWBZuYQLQ7ZFxxq+KKA
	 C0DYGqACpBHEOACZbejmcB5WeVp/WaapOocY4aSxhskVK6HKvsyhlIsLX4BesEkYiO
	 dTAMwxhxS0rKzyB0kIl63pOjTc4wmZ15yZMIkoUvyXvk3gxx83k7QZjo3znDyhMsGa
	 M/UjJrG7l2NUkN8kR5V/jurO038WXBLmj5BuxfI6LERX4Alllwjx04LHVksvGeV4FC
	 fIArB8duY3Pj2mbBz01UrR8RZ0su3eUOiLssvYhjtT47jbF0Mytd6Wbwo/+qIqQxH3
	 /kRmkQd69OLMg==
Mime-Version: 1.0
Date: Wed, 12 Nov 2025 14:34:20 +0100
Message-Id: <DE6R76H9N8H0.NKHN0YUTE8LL@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <linux-mtd@lists.infradead.org>, "Richard
 Weinberger" <richard@nod.at>, <linux-kernel@vger.kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Sean Anderson"
 <sean.anderson@linux.dev>
X-Mailer: aerc 0.20.0
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
 <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
 <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
 <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
 <871pm3iegf.fsf@bootlin.com> <87v7jfgzfw.fsf@bootlin.com>
In-Reply-To: <87v7jfgzfw.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_053429_704395_AE1A0FEE 
X-CRM114-Status: GOOD (  10.54  )
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
Content-Type: multipart/mixed; boundary="===============8826686085983977671=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8826686085983977671==
Content-Type: multipart/signed;
 boundary=b3637e902dd604fe5ec42f6df36a18ffc2ee0a23019ae188bc6a3714ab41;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b3637e902dd604fe5ec42f6df36a18ffc2ee0a23019ae188bc6a3714ab41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 12, 2025 at 2:20 PM CET, Miquel Raynal wrote:
> I forgot to mention: I don't like this interface because it is not very
> user friendly, but this is uAPI, so set in stone. As part of my journey
> in the SPI NOR swp.c file, I wrote a debugfs interface to help
> visualizing what is actually locked. It is absolutely trivial to do and
> helps a lot. We might want to use that for writing some kind of testing
> procedure =E2=80=94 I will share it soon.

Yes please, that sounds very good. We might also want to just raw
dump the SR (and maybe CR/SR2 if we somehow can infer it's
existence).

-michael

--b3637e902dd604fe5ec42f6df36a18ffc2ee0a23019ae188bc6a3714ab41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRSM3RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gDAgF+Kz34DlIHnAjAN8Fa3lW/a4pKAyexadrS
oTrkVV2UCSiwsAWS4Rrmu138+YuX/MkQAYDnGzUABONiUOXmmah/J2PV6Bq2Xd85
WPMYdF8aVjXrfja0/0yRr0nM0hjPp4Q1HrY=
=Tl0m
-----END PGP SIGNATURE-----

--b3637e902dd604fe5ec42f6df36a18ffc2ee0a23019ae188bc6a3714ab41--


--===============8826686085983977671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8826686085983977671==--

