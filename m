Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8997C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 12:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC66461166
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 12:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC66461166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HO0kg9GqrsKE4KC0Ax+1rJUHS/2tF26qBwE3egWizI=; b=gHvzNtE/XdPqM9VZaCCJLe50CP
	5zoQVX0SnnAGD1+v3k7J42q6AwQtePT3jgl+7CYsBDPRkfCqrl+P4H2KvOt21WmILJbyAcQT/ymUU
	laAaG/buX/CyOwc8FAG5iYgb1TnuZUZSmMmIYI1pvY9zWbV9biDU+kIRGkiqr8x71D5N8br4Zg+8D
	Yu9tpwOgJSTDpvNB4j51msyy6xgPpf2DJDWjo1F1RbnGZDGLntjxCPrtImdIq2/fERzs1UQCtfn1s
	9JXWx2mUrwufJttvMnG/D3bvIvT3STQlfbzS42mw8Fo1OYjYIhmbtXbk8le7IQxpQvA6brA8IhFDj
	ToHGfQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3HCY-00AJJi-Fw; Tue, 13 Jul 2021 12:07:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3HCL-00AJI1-EB; Tue, 13 Jul 2021 12:07:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8038610C7;
 Tue, 13 Jul 2021 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626178056;
 bh=veIKrgu4aKMMb8Pa4igOFFjco3WGvRXm9loSYXLs+Lk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2Re8vWU1x1K/uW6MuMZnM8fGH+4B6y0hotREznO2jb8/W+nK1rCVDkVuHoXJBJeq
 3oAqxB8Rx9TKkPMjHAy5dQ2AuLan2c4D3Z8qmd0xvQ0caK+XdS+6ftPNxszQg70ebv
 k9QCnDGMwM2vWwqvIVVXy1ug98AhmiJRZFwMZdOBZsjKt/XYgTXtQ+bbXjP8yUdKTr
 OBiuHL5TxLorQw/+x5oXbo0t8uhOLf/WMkThLUho3lWCiPBUs9dohkTvTOwx2Fx2eA
 L1KSg6XnsxmDO6szZYrZgcFFtyL4yMQABdizxsCy+LNK12IOEWxNlfRM9UB2KWlqNG
 FmCYCq8WZOvVg==
Date: Tue, 13 Jul 2021 13:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 jbx6244@gmail.com, hjc@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com,
 macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org,
 linux-clk@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v12 01/10] dt-bindings: rockchip-sfc: Bindings for
 Rockchip serial flash controller
Message-ID: <20210713120700.GA4098@sirena.org.uk>
References: <20210713094456.23288-1-jon.lin@rock-chips.com>
 <20210713094456.23288-2-jon.lin@rock-chips.com>
MIME-Version: 1.0
In-Reply-To: <20210713094456.23288-2-jon.lin@rock-chips.com>
X-Cookie: Keep away from fire or flame.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_050737_531344_3B3145DE 
X-CRM114-Status: UNSURE (   7.75  )
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
Content-Type: multipart/mixed; boundary="===============0544917264323424337=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0544917264323424337==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 13, 2021 at 05:44:47PM +0800, Jon Lin wrote:

> +properties:
> +  compatible:
> +    const: rockchip,sfc

Rob has repeatedly queried how generic this compatible is - can you
please respond to this?

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDtgeQACgkQJNaLcl1U
h9Aj+Qf9HQEP3TDGE1oQIqNLlImhDQnaT3hnM3Iy5CN5AFSzz3RoFWud4t5AfnMI
qKTI9Fs2uk6PR+G/6eC1l0tqcK3K1tCguZG+q6QX7hfqknaA5OTiSGKA+SkflOV+
FLkrz0jfnx3PsZDPIFo8mom9zKoBu/J9Tx170c2LFu9UV4wAta5ciZYjvi2Qk4Bp
F4LZ6PMrJEIJia4OeAdJDjezUlaCNQUOMrKdhYLNaxezLSPAqKZ1GFE7SL5/r9mM
xuD7k3FykkG+XyeAPgClbLM6201FvsM2Jg+lP5mjHYkFudHZ6C6BRC6SMuyxuXNn
hRrqvW5E2j49VH3K459GsKOmZb5yFw==
=eWOC
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--


--===============0544917264323424337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0544917264323424337==--

