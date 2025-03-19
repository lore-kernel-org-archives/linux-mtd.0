Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3419C36000
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 17:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJH+rIeEYaKaJDHYTO6/vOuodLLNBKcUpn8Zi8VlynA=; b=CpG8XlCx8lRHTg2RNG6hS82IhV
	/CPWV1UXvsDmiLYvTkYsZXadWIv7UCWaGhNxjue2fG3dhCou/Ei/7v7v8usAXFxYXCSgD0er5ZxkV
	hcqB4GGDT1movVHKDj+1KqPCzmKKscYZ7C6HGCBZidXMyzSRCtJK4/Ku0e80hyGq56VpaKo9hIZc9
	rQqrvWLu21nQ+O6hpz8vKA5F3sWWBDUSsV++XQeLIsQaM/I7AiKelVuTUgO6+lZbolbEnDSRLeXoK
	zkzkSL/sQY0HWRdm3tR/6DGTarA2RBrnpebVQmEk7UGb7cgpKcNzlOM09BEiLHwxgShq+9C805fhj
	IlauZqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxRc-00000009k2G-3D9O;
	Wed, 19 Mar 2025 17:43:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxOW-00000009jbq-0uiO
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 17:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4040B5C44A9;
	Wed, 19 Mar 2025 17:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1315EC4CEE9;
	Wed, 19 Mar 2025 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742405994;
	bh=ATtb4qo49WDSA7/9SbN+QaUMp8KcTd08wF+80oGjOGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhg3cpZphGgqxWQMAObxSs9e4mKFEIziGS0zX16idm86/eN9rNZyY6lqEAN1+U/Gi
	 vyjth8vJJdl3KH0hH8ymxhOBl+MPG/jTyoSXcM1mMfrZvmseIgO+H0JNbc4fyUKVJ4
	 eQcYEnM1+oLxlNkI6CGSvwaVfLBvxP9J6ov9FHD2AkVCAubJGVOrROrx9Ymuf3z63h
	 39pf1WVgY7w7+OsSxhCr2KCiKoAYfF4RNlS2ul3bLY90zJsAye0Ee7vmGK2I9cHUdP
	 p1b4nmbYID+4KP4fedp7NLMdqzY632Se8lertWd3xhOngwBjMYfx4MfFv5PJDgaUAW
	 lWbwYFpLQaJRw==
Date: Wed, 19 Mar 2025 17:39:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-spi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] spi: spi-mem: Introduce a default ->exec_op() debug log
Message-ID: <a97f8ddc-c9b9-45a4-bef3-cbc01c3d07c6@sirena.org.uk>
References: <20250305201140.2513431-1-miquel.raynal@bootlin.com>
 <a073191e-afab-484e-9659-66b957301db1@linaro.org>
 <ce648080-2964-40d2-a2a7-cafcb6592cd1@sirena.org.uk>
 <87h63p2c3n.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87h63p2c3n.fsf@bootlin.com>
X-Cookie: Chairman of the Bored.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_103956_299825_91C4AB81 
X-CRM114-Status: GOOD (  13.35  )
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
Content-Type: multipart/mixed; boundary="===============5249195999700294903=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5249195999700294903==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KfAfdwkxEvI9I6uV"
Content-Disposition: inline


--KfAfdwkxEvI9I6uV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 19, 2025 at 05:56:28PM +0100, Miquel Raynal wrote:

> I'd say that for this particular purpose I do not thing that trace
> printks or events would really fit. As a developer, I'd definitely
> always change the function calls to some direct printk calls in this
> case. The verbose debug alternative seduced me though, so if that's okay
> for you, I'll switch to dev_vdgb() as suggested by Tudor, which honestly
> feels like a seducing alternative.

That's fine for me.  I do have to say that I tend to end up doing the
opposite of you and adding tracepoints to code I'm doing much with, they
work so much better so long as you can get the buffer off the device.
Low overhead, much bigger lookback and better tooling.

--KfAfdwkxEvI9I6uV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfbAWUACgkQJNaLcl1U
h9DIEAf9Hi762nmzhmBWUQtworyZN6E/a/AkS4Ok1OXrDlszXJiCiIPixQa1vcSO
HBrhN5l1J6DsdvH9Tc3Sj6geMyGRqGeXkoMUAZKrB3ovliKcBdBRaHFd6ceYeIyG
J6FHj86VV//WNSnVooleAEmeesTFbC867i22eFZvt3PxI1ZDOlZFjbCeHuY9+NCR
LEdIF8YoaByeXCApBESMGTK2XgikxKfi3TQJdvN7KU9PM5zAM/QB/t41B3EKe3cS
6K7n9+3uNgpOc/6tWsdiuXilnyMeVOv3WOpoGgodm7lqXYmeup1L3Es072MjRJEY
3MP2p1cjYYFAYgVEo2K+RoVaqDk0YQ==
=xu55
-----END PGP SIGNATURE-----

--KfAfdwkxEvI9I6uV--


--===============5249195999700294903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5249195999700294903==--

