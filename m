Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51731C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTTVQGyykEDU9U7C+sdXSGmTxJkKS2ToXzdq2AQ7DLc=; b=si8pZXtz3OIf7tLTJcLmUMf7Kx
	cUtl68uC3e9Npk8G186KvCCx7id3urTuwAOGPTOOXrC4ldbhuF+TCsUrLQAITEJhxoYIwvrH20OrW
	6HcSNi/p1EzPjyw+bhIp9gVwdPf8NDRgeatMEZxXou/umAhiYTT4oxMrVqb28HKZ+HmoklDKUhMDy
	GIZHIjnU0CNu7P4dNJPzpkL3Tx3wpNIgc4zYJgBumVchNB9qWJKts5PnpQwnCnnCepi5GZsHT6s1x
	Vs/fk5YEMyq5kBfuuoFo6+nYc2qAuZdINWAwY98zXr3vdiLtNQJWBi/riGPBQOpF0u3RoQs9zZk+B
	7bX9ypGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4oQR-00CSvF-9j; Tue, 04 Jan 2022 18:20:47 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4oQE-00CSsA-IP; Tue, 04 Jan 2022 18:20:36 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6F60B58047C;
 Tue,  4 Jan 2022 13:20:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Jan 2022 13:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=nzizLnHIDJLE77dWtL0gicrfFax
 qw30Dc5elZuFF93g=; b=NaBkrqt8rYn8R2HOjWvwZ8OGokiJNs/NYZ021cHzQhG
 MM4BVbxMYaYSGv8FiTSQF1FZkWenPDu/Wi6nYywU/gGqxppZZ5Ps7w8R5JDfwLsb
 oFkEZ0JutReD+E3byu180IYKBvU2N5wGlHsUNStxWGyfliIXTCC2rEum4ThGOntn
 D3gb/hXHhkzaFmMqncOajpS9tdGCB5d8NxsvmaROrj6Seci04C8vhw2QrWuc5sB+
 CbjO7r1BTXVhOxDDJpzbpSZ52nF70ClOWgO1HziZt1gUzN6yj7/+pvzm41HKY8Dv
 h1B0WZlutBicN0XEEOsWqO9zyFQHU+Ry1hTP9OcmjEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nzizLn
 HIDJLE77dWtL0gicrfFaxqw30Dc5elZuFF93g=; b=UUeHByumxn11Uyq3tcYTjY
 Zk85hhI2yLQNfcA/jemzA86Tzm8+/9HM4r0oGWW1pIEeJ/lfU1XHWVqQTf/VTa2V
 rM1Iir5vPaPZHtii8CFp2wk+mZEz8YiAjK/I8jzGBMcZw/38WvoyRTnMf2ofDetD
 aYxdZILKOEoVt1YsdpTXdzUnCVR7A/Y2LHDxOghmLNQsZqgBf26AaY3c6EHORqlw
 6cxLlZ77JlWoQ8T6tNVmaiZrBVrmva40XwH5bFdTXOfLb5WRozc5y5XLaTefc9te
 HQKFi6xblrvuOwbXVhlKytgYuAti0yUMEdpNP7SmCNRNQ71YZ7Q6UFxVLgXypB5Q
 ==
X-ME-Sender: <xms:7I_UYWPTGicfJBrgBuUE5KatgN7FneeVFff9X8kGX8anVy9qC6ABcw>
 <xme:7I_UYU8PkcEq2P7LcZEgUxWqmjVcgKq6Qigb3N7gX23NU7yst4faBEuXD1hyUsEgw
 PgiVtmOQhJEb0DriAQ>
X-ME-Received: <xmr:7I_UYdTWuFSqmiEKM-g890Yza5eV6LLXk5rcUzT629xXvxvnHPRdsGw_XBRBU-GpbIXEvenDxRafnRwJ99-BqMD1DfHijFCh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:7I_UYWtcCUxr6Rg9eBgI27F--NtmK5mFo5r-N58dBGYL3y1ZhNDPTQ>
 <xmx:7I_UYec_7AE0uQ5JLn6Olif6n4puANVYORghsoDMJ8QbTk_PktQTfw>
 <xmx:7I_UYa1b287Do9_COaaGDYmP2d-bVXwI3UXkMNIxl6w-OOdE16FpSA>
 <xmx:7Y_UYa2zY-VTYlp8-KRmTy48BwDe8Abh4hHUWjVxiLU4euFpwwC2Xg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 13:20:27 -0500 (EST)
Date: Tue, 4 Jan 2022 12:20:26 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Joel Stanley <joel@jms.id.au>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Andrew Jeffery <andrew@aj.id.au>,
 Potin Lai <potin.lai@quantatw.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <YdSP6tKyQ2ZRUC+2@heinlein>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
 <Yc3Qav+ULNdF5zRT@heinlein>
 <20211231102623.izaqlzjvracbbgmp@ti.com>
 <20220103171721.46c8e697@xps13>
MIME-Version: 1.0
In-Reply-To: <20220103171721.46c8e697@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_102034_819462_70724B84 
X-CRM114-Status: GOOD (  24.94  )
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
Content-Type: multipart/mixed; boundary="===============5699569607151195039=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5699569607151195039==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4uGk4mNj2n7MOyWq"
Content-Disposition: inline


--4uGk4mNj2n7MOyWq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Miquel,

On Mon, Jan 03, 2022 at 05:17:21PM +0100, Miquel Raynal wrote:

> > I am fine with taking in bug fixes but no longer want to take in any ne=
w=20
> > features. My main intention was to nudge you to convert it to SPI MEM=
=20
> > regardless of whether this is a bug fix or a new feature, because=20
> > eventually we want to get rid of drivers/mtd/spi-nor/controllers/ and=
=20
> > the API that comes along with it.
>=20
> I totally agree with Pratyush here, we no longer want to support the
> spi-nor controller API so if, as you say, there are boards failing
> in the field, it means there are still users and these users must be
> warned that at some point we might discontinue the support of these
> drivers if it becomes too painful.
>

Your response here makes it seem like you don't realize the scope of this
driver.  There are probably, by my estimates, on the order of 10s of millio=
ns of
deployed systems using this driver in the world.  The vast majority of serv=
ers
in the world use an AST2400, AST2500, or AST2600 chip, which needs this dri=
ver
in order access its own flash storage device.  Both OpenBMC and most of the
proprietary alternatives use this driver.

The company I work for has a LOT of systems using this code.  After I made =
this
fix, for a new design being developed, it was pointed out to me that our OD=
M ran
into this problem a few years ago and we've been really bad about upstreami=
ng
those fixes.  For this new system I'm trying to keep us on top of all
upstreaming efforts.

To me the inability to access your own storage, resulting in a kernel panic=
, is
a pretty serious issue.  Bug or feature I guess is always in the eye of the
beholder though.  I think this is pretty valuable to get in, from an impact
standpoint, and pretty minimal in terms of maintenance efforts on the
maintainers part.

I had an offline discussion with someone who knew more history on this driv=
er.
My understanding is that the linux-aspeed team is aware of this being depre=
cated
but that there was some missing support for interface training that nobody =
has
gotten around to write?  If that is the case this really isn't even a "simp=
le"
port to a new API at this point.

--=20
Patrick Williams

--4uGk4mNj2n7MOyWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHUj+gACgkQqwNHzC0A
wRkIcBAAkolp24FJ1nPPX2egEXt6f48Kvsbrft91uSjMBg4RfefxO0fmpFDGNZFr
edf5GnNtwVGM5sXAUKN5MixoKpb/fPN4ivCyBS7GixnoNxwc76pgOfhnGsSKCkrO
SoRrdNWyOswuGzi5yBeGSUdcHRaVsTSSl5YdssCLfDvza1KrtVnKXnHJUaI4EB3o
JB/zEh2p5C+TnOdR0ADhw6DuvFRb5mGq/XV2AfK4OGBDU/EoWE3m15zWCE5Wdu5d
RjE6KooRKsGFR6NDw3yg8B3LZVEjLx/ehe9FZSJLn3jHQEeIXGbiulsrGQAIe7rN
K3v04ZK+41Vx2NcavLKH8cCr4mtJ6jQbtQ0ups/EPuY8TLctc8sW27KGol/OJ4WU
t6tAba0EfkGxa4GOy73fBZDzfax+Yr86G86xL1q1wiqnLiO2yGyyrrwJNj2KmkO8
uCzI+oStA4EE8lpUgZYHNVmeyc1cU6G1+bnG+0ekVeKcHZqixCGyBfHGNHpmMpkO
p7YxULRCnX8GQwry+Ws1Iskk8e0MMVIRKLH7LAT7okT+TWVHsplnGL9binqqLpQ8
KLWR7QAEQBdNXi3XAwv8W6mfeeJ2sdG2WGZLUrabY3be9VwrbMLkCkT+smISoTtb
Y0ALpgxI9OZzHfwpXWpkW3ecNdVf9AIARnceoSukBWZdrgmwDBU=
=lc+5
-----END PGP SIGNATURE-----

--4uGk4mNj2n7MOyWq--


--===============5699569607151195039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5699569607151195039==--

