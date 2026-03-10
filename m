Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5436FD2D70
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 12:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c8pTNO02k1xdJ/5Z4uTx6NLXvgOmX5/4JrvIAD9JbI=; b=hF7A6amegiYBltMOsF3kBNj9we
	/FhykY1kHESki1VGvEWwu8I6HIYJOD9+9WbUVTLM0jVyw8IpmSjCBUi2eWqBGRKm0J6Sf2WL+22dP
	RWb8JQo5ynv5aBISCF/BNSnQRdvncQ/yJUXz0f6+vHBX/Oi+wUHVSCx03t/aMP+U8rIvhpvcWJ/xS
	VRbBb4HEyBCp0ZDPUqtDootoA9ANqBnoAiDEzxyb43nDb0QMFmG1BaM0kesVSf9wi74pXhzjSold8
	6a1tLWq59cl16B3rF36nH0vZIzzGdx3esGajdKQM3pSSdfjvksyjQVA2ibJPhQnBzDDVE96UhMKLE
	K3Lz8FtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwCT-00000009U65-3XWp;
	Tue, 10 Mar 2026 12:28:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwCR-00000009U50-1c7T;
	Tue, 10 Mar 2026 12:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 337BD43449;
	Tue, 10 Mar 2026 12:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8179C19423;
	Tue, 10 Mar 2026 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773145714;
	bh=NZ5oTCN6VGzePwnu776uK+3unhTqb8pwokxv1IJtK7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOutLnoL/seeB/icY17T5kE23weT+c8OWPxsN1CuLtbqZf1qO8twCXpCHPEW4zEb5
	 uM5pcZxBh8XK3wQOjz6gQLnb8DbNMsJ6SwgjqzPaDdyeQRMdzDiadj+7d8CVSVSbbp
	 WbSnGZkMbwo0cpPlViR1A0oh5e53oFE0sYAJxulW9oCNKaXKAhhACMzXx6XsRo3Hlx
	 /XgKdmLcz/EtWl6VZEOUGY5PBqGn3Xb4X+aqLL+l2HoSL3wZMd6NhcSGeVt+ZFpBkn
	 8s7ZymgPrZjLjSz7/xRlCoCIsHrVCduE0eaA6Z9IamuK4ZW4bnyThB9ZhLWcSUucoJ
	 BJsDSXl6ZXWkQ==
Date: Tue, 10 Mar 2026 12:28:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 18/61] sound: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <19aa26fc-8570-492e-8e17-23d6950676f0@sirena.org.uk>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-18-bd63b656022d@avm.de>
MIME-Version: 1.0
In-Reply-To: <20260310-b4-is_err_or_null-v1-18-bd63b656022d@avm.de>
X-Cookie: A fool and his honey are soon parted.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_052835_485639_D08C759E 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Type: multipart/mixed; boundary="===============7251482437802106180=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7251482437802106180==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7JjDB+7CEHk89uTh"
Content-Disposition: inline


--7JjDB+7CEHk89uTh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 12:48:44PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.

I can't tell what the dependency story is here, it looks like there's
none?  If that's the case you shouldn't send things as a single series,
send separate patches to the various subsystems.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--7JjDB+7CEHk89uTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwDmMACgkQJNaLcl1U
h9D4VAf/VCpoXjivQsq8mL1i6sHdID6byBqwG7egrwiRCrsZav80JlvY/F+1fWQl
Fe3Ct+yRv1pWeNy67wSCZD3mtHtNH0JpwRTNxS1XQrnXc7CLjzKunCldDfzTbfom
+QmXWHQB3Qo9ie1ugoAGet9gx/vkV0z+cv9sVHg1o1R7/AKqfgov7xnuP9Hlv9Uk
p1pkMya/NhbXBsrh+BFbktLgp+7sAOMjWgtGZ3NfHzwju9n4Jdbl1JcPxgDl0SHp
6z8kP2+oskOspesqLWw62mZF+bN32Ycjt1N7/EFjtPBdJKIcQJLICoACzxyQBZYg
+i50s/oSRL1HiP4US2lxoy8BqxaqrQ==
=U6jW
-----END PGP SIGNATURE-----

--7JjDB+7CEHk89uTh--


--===============7251482437802106180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7251482437802106180==--

