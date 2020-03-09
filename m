Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D919FC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 09:58:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56C6D20674
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 09:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TsL25Fhn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="rhP8IqmZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MalW71/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56C6D20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A6L0W5Iq1f4I7lqIV35EtXiILt1tcFyPg1tc9ZqBR4k=; b=TsL25FhnuOHktakYC5ZRlyev4
	RNbS1d5RBcrn6MezDPAL5kQD+gIuQ9xixPZEyktviIuMlD4ug8PUjGpgjxHmucD1/SsOtL/q3LKBX
	PSzyafuC8Um0VtKjETjzRvt4SQdWhCrKW/UiFJKUxqdnT/aN9V2iwmHZocCGX6EtMPAE9+ICjw1xl
	ymln3JpIqNxIwPB0AqHC+ukcSOBHb6LOPVJopXsceK2xmde6gBFkhku2dTHh50GTz/z3dow9Dmgkq
	Gvzsn7u/rxvyClmxhiP3CA/nnMLWqPeovWvoHkHaHBzJjovvgfCiSb9opCSCL9zHNxCkJTD/sK92f
	YQZVPLbBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBFBB-0002ML-BM; Mon, 09 Mar 2020 09:58:33 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBFB2-0002EO-04; Mon, 09 Mar 2020 09:58:25 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BA7F52616;
 Mon,  9 Mar 2020 05:58:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 05:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=x843TymkohDL0CNnlBbHCXKt7Ii
 gsbMrdZT6H6SSLmM=; b=rhP8IqmZ+jnmVnsMHlCOIX+LbZ63kU8RwEc3J0svGNY
 6l8keSJodZj1KEAzWpHFBUVsnNW/4Hoc5BNgfSJx1dlqwpUOnP6llj1JLVytgp8n
 G1VcpWl/HmiI62RepxfoKu4dquSqAHs+Yz2NPjR98pBIxB6DvTh0Oe7zzXa4V2io
 bzkne9Fd1SjR1ug31fLXuWQM62HVBP5MBI0uuZDcCSzNA9ForGP2B3w+r3lSMXGc
 Uaml2qVaTO/vYNR1e5lJAGzgiN6rewod4YdnLGuTyoNiwxk4k/H9Sd1Ox4uG0vX7
 8GALFXpaZxngop8xIjwSQ+ObinvCPW7UGMToYY+QvEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x843Ty
 mkohDL0CNnlBbHCXKt7IigsbMrdZT6H6SSLmM=; b=MalW71/b0+98hpXSkEDGTd
 vItpnoXZ67gxttvgn8L//69iT2ScZYAkAXmTTi686fLpmjy6KIfpyTygbxyjv2gu
 NHiCm6ALZHS2jrMN4UW0bUHTyOJB4wgSaiuosEQwG3fqjuFm8t6MeuFNiPQbtBov
 H28FF+AvM84P6KVV/DHjHXvXL300JIBQWkkTqg4qxh7Nv8b9Oqhc4qaygrsNWMBe
 Yjr7emvKu9pF2YVO/Cf1pnTTr/WCYh/BplhCbQIgkVvWzJWyws+sPlDOVkQ8mUD5
 zRvHUEB5Efx+n/zMaqbn+U2GTLEJMZDUFhMIZcC8TL+lDH+hKe/OC2IfF60iJJUg
 ==
X-ME-Sender: <xms:NRNmXpJ642poT0Dt5Kmbum1UY08WvQ2u-9noaK5LPgiEhXZ_Q_8JcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddukedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NRNmXvJKMpM5sDIjsIbInMlrLqbf8VAmWT6jQzFtiXrlhS7-654RDg>
 <xmx:NRNmXrxTqXFf5uSjuEE01s01PFt-cmZKHMZHD60E7njKY7Tmp-clFA>
 <xmx:NRNmXsJk5dlb4qXdDhwjsS0WwflSz1y6CIusJe9p-qL30nODKfJnfw>
 <xmx:NhNmXjlWHrL3bFOKqIfhkg4kI_jidnrmXT-SZ4RyTgi6r-VKZPseCg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A780328005D;
 Mon,  9 Mar 2020 05:58:12 -0400 (EDT)
Date: Mon, 9 Mar 2020 10:58:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 4/7] mtd: rawnand: sunxi: Use dma_request_chan() instead
 dma_request_slave_channel()
Message-ID: <20200309095811.hg4maq663eaj3opz@gilmour.lan>
References: <20200227123749.24064-1-peter.ujfalusi@ti.com>
 <20200227123749.24064-5-peter.ujfalusi@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200227123749.24064-5-peter.ujfalusi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_025824_180543_65F677E0 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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
Cc: vkoul@kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, wens@csie.org, linux-mtd@lists.infradead.org,
 mcoquelin.stm32@gmail.com, miquel.raynal@bootlin.com, han.xu@nxp.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Content-Type: multipart/mixed; boundary="===============2124591296686004221=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2124591296686004221==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ghgfzfwbprbf3thj"
Content-Disposition: inline


--ghgfzfwbprbf3thj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 27, 2020 at 02:37:46PM +0200, Peter Ujfalusi wrote:
> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
> eating up the error code.
>
> By using dma_request_chan() directly the driver can support deferred
> probing against DMA.
>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--ghgfzfwbprbf3thj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXmYTMwAKCRDj7w1vZxhR
xUqpAP9DxNAJ2AawCZ9Jr/Mw8AxjK5nNtLKe6A6jtOsi8iEfGAD/ScHhr9eJJULD
Ty0cjoA0+ExrVGQk6FoSzvrsIHJ3BwE=
=BoAI
-----END PGP SIGNATURE-----

--ghgfzfwbprbf3thj--


--===============2124591296686004221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2124591296686004221==--

