Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660A6C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 01:33:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CFF064DB1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 01:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CFF064DB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GOPB8GnKvCeh0EHCwb69zI2sQE9NWoMxShBXjxgRFZQ=; b=MplAkBxzbQV/E7dBKZAAUgbyC
	fZk90VxKXz2vK9WZnWdg0pN2RgFt/v1J+Ed4sSh6Z4vlcYDIkS+/sBf9RA+VG36R/LUKAz9IFKOTk
	7qTQxYuLRiszD/iZ2cjPJhYKx7UOhwtXAdSOR4haw7VyMDTF686vADk/hh53T/LACgy8rXdHy1ma5
	sFqBUHTDk8GMJFJ654ksD3DkRuTKBKwvro6+GN4OsquhCkWU7b62JrcrMGI/bAGTPlXYQFA7DdJni
	iB6gh88Kwpz/jIlifjV0ZXiJ7mF/MB7Nz24QLMdWZZxwUEfJattV4d1gQJ8a3OIth5tvSPihhw4R0
	G8w6DGSIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEMZa-0001ES-0T; Tue, 23 Feb 2021 01:33:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEMZT-0001DA-Tx; Tue, 23 Feb 2021 01:33:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D55B960233;
 Tue, 23 Feb 2021 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614043983;
 bh=SidThf39RHR584VvQ2PFUpvKbaI6ZS/1pOYS/H0qYgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kv5Rpg55CfBeqg69qrft4n/IYgjL4QVqpK7mb6WIgQDcaM0sTLPTOVfK5qxSzy70S
 SGd/KiYm+SpyMohMIRc8d8ZHCWbIgEFhiI40yzd9TWIqqnVk0E86B0/eDFc/L0bwTs
 5Seqoyxxmc0pp6tJVWCNuWpjhjpR5NFHrUsPY5rQ1PMcM4vvG7q+cGfjCeroXRf/gP
 3XGGePnqCmqAvISX2PRCzIt+OJ7EuA8VxHIOag8ozHLIBZF5J3K7OytEh43cB5OIZw
 PdVpClLlcKCSR8Y5YDfADTKacEd98t/cBj7k0ZYbpY5HEhJfNS2aeZDbUNjBYZXOC7
 8Bzh19ZQDOkBg==
Received: by earth.universe (Postfix, from userid 1000)
 id 9E1313C0C96; Tue, 23 Feb 2021 02:33:00 +0100 (CET)
Date: Tue, 23 Feb 2021 02:33:00 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCHv1 5/6] dt-bindings: mtd: jedec,spi-nor: add sst25vf032b
Message-ID: <20210223013300.ouwilfkk5hyyhzdi@earth.universe>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-6-sebastian.reichel@collabora.com>
 <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_203304_055209_28DC7F07 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Collabora Kernel ML <kernel@collabora.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============2136741674330638033=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2136741674330638033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peq7earpm2cetdte"
Content-Disposition: inline


--peq7earpm2cetdte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 22, 2021 at 06:15:11PM -0600, Rob Herring wrote:
> On Mon, Feb 22, 2021 at 11:13 AM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > The binding is already used by the driver. Update documentation
> > accordingly.
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> This is now DT schema format. Landed in Linus' tree today.

Indeed and it already contains sst,sst25vf032b.
This patch can be ignored.

Thanks,

-- Sebastian

--peq7earpm2cetdte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmA0W0wACgkQ2O7X88g7
+ppMiBAAnBRRR4ntus9a9JePpyG2+61admQniYXmvTJtKohNBG1463YJj+URPhBv
4EMUHj4Mkmo5SPrSyEcIpal00Hb0+LOP/KwTCvHNrbGRp4myzc15+l1fErFNh/ya
81RWoUagWwhPeQZhkumO/69Hb+j/wj9iSQfl72VwzmQaQeJ0X/xh24ONlIL5M7xP
Yk7P3j+YULsFM8ZZnpyAfxSnYS/okRrvOr70nrHGLrtfBd9mHV/JtOMXHWepInAc
4Ar852HZQI2lbtz6dXZnIFsq5VfEw+pczi7YtnduHbz95idImndViMk982jx9zFz
GkTx3MSxzM/xOZxzrJq8iPHdLIguV0DW5Q7p5hygjcox79ACQw+iTMHrbzf/rZPa
QXAMRnb/Gr1Q48LOqgSmT9Qk/ALFg2Y3QjOlJYlC9/9f6S5S53FY/4XUatqmvz5/
LbsgFHWceif6LL6m7KMoKgHvPiKcY3MP2LDkXSni8gxQLqNF6hWav70jJ9fXcEsZ
3hgHuGBii0pX6MXl7jxu7qCD8OQ7cUCITJSD/gx6Jgr+CflDEYZWRDgu1x0RyqFI
QQc2F1EcQ1EBmeC7JZfQAx3gf++BFVVW1WkaI9pHZwzKigBW8+UdEY9kEtJH3Fvt
JIM7+72d80QDfWZvJpa81fltQfRwHWLDwkmaFZfEF4sWrqkOmq8=
=+yJ9
-----END PGP SIGNATURE-----

--peq7earpm2cetdte--


--===============2136741674330638033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2136741674330638033==--

