Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8C0C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+ucBqeASYLQpd1exs5xS3+m5qsD6VFobF+gxyJclKA=; b=W71BQZ2SIiFYqn7921nW9Tu7DA
	2Z5ToH4QesQL1dwaVN6nKXWqKMUGYmxeVXggEZ7dh1Z2JEu2KMPTdLIckiaBTUEHMwmd7dTw/JqHB
	6H8izbXaOBMB5ofEjoSFSU7NC/TmGg8MPvCg8+63UYqJy/hDbtgg/H9C2/yv81JY3GDtU2cJ855VC
	TIjiAN/3CRgCAF261R0kJoRMvkip4Z/0qu9XHsXcIEDrpKG6F7gS+mKTeUMikpXs3rQurRN2v3sLG
	4xAAjZ0rMUpB9aC4hTn3H3GfKNKhcNK/XyV1XopQKadypb+xE7imRB86g6dIbKJTEBqGYhbnI5ij9
	eJdyoZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racdK-0000000GXTF-0Izp;
	Thu, 15 Feb 2024 14:22:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racdH-0000000GXSg-0hB8
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 14:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC0D961DC0;
	Thu, 15 Feb 2024 14:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DAFC433C7;
	Thu, 15 Feb 2024 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708006954;
	bh=I3PqLIUTAqJB6Y7FtjSDQxRujjCC+9S7whKOrCfAIKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QGOsKXZQKcTaGLN+G8awa42ygsqJi28biVwvObmNYWygcOlqEeyI9WTsBaFfmH0lK
	 Jyfbr35PPHRMcKql6Dnsb5zpuq/9UbqTfknJAvNosODAJHfWyfZ0bxzXgnT8j8RuZd
	 LeCgqMx6iaeuIzo08YhV4HdTBYnw8Urnmpxnjm2jea+KyQAnhoRF2pHoLeboVBgo4U
	 lWie0cqlxbXTLdkIHUEigle0vo8BL4PZKOsNfJUCCsO8PsUU8UuvwoBA5oZ4y2+E0o
	 09D0XyiGN5iWDFqqp+u2vFWLt0R42OBomSTdVakYtq40grzRmaVcrNItzvi8dCdJ1j
	 ABnaUu47ZHNOg==
Date: Thu, 15 Feb 2024 14:22:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 1/5] spi: dt-bindings: add binding doc for spi-qpic-snand
Message-ID: <ab55fcde-f3ee-426c-ae24-2e76ffb20a2b@sirena.org.uk>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240215134856.1313239-2-quic_mdalam@quicinc.com>
X-Cookie: Pass with care.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_062235_265358_1AC52961 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: multipart/mixed; boundary="===============3294525211170085631=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3294525211170085631==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2csQjU5l3LaA5RPk"
Content-Disposition: inline


--2csQjU5l3LaA5RPk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 15, 2024 at 07:18:52PM +0530, Md Sadre Alam wrote:

> +  clocks:
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3

The driver requests the clocks by name but this does not document the
expected set of names.  The driver also unconditionally requests all
three clocks so won't work with only two clocks.

--2csQjU5l3LaA5RPk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXOHiMACgkQJNaLcl1U
h9Bs8gf5AeVDl5A5NLKeeCU9eg710unicAjbLogdVKMnVejjdUC0v4uk4sfxSLer
X8VBBJAl9HfbmBfbXLHsRmyM6keu3hPFl4GJyAWo0yK4sMmPeGRl138cdPZLYW5k
cWaWnByMVUmJhRS+vzx/+NvZsr28LnnvhNhTwK7VEgd7/vDj6j8Iz/6bzMBaA3Mq
whPUldObYURrMzojCoUYM/hdnos2MXRqauACX6GRivbRYP15eowVxAiGcQpBbuRP
IhUiku9ujdwyU39SeSFrrpghK7UiFft1/rSqyXmZUOyUS8xOZGXUDACUJztKfQ6G
20MK0dUD0t2Z8IFIJ7wQLl7qn/dk8w==
=pWun
-----END PGP SIGNATURE-----

--2csQjU5l3LaA5RPk--


--===============3294525211170085631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3294525211170085631==--

