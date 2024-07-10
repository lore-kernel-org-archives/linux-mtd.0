Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BFDC3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SR4AddezdCpKRkrluAtuBe6y54UaN7VejN6ywSVeO/A=; b=B0sLgvvWZS1mc2
	e9Aq97PYDKglkJXpjvkV3q+FjUuqHFCbiLWLFPrl8T/EOpzenY/huxblfD2L30y3Rv4pZNn255fRl
	NzrUnAYLU1OWo4CV2gNIaEWLRRJjiLY8HygZRc9a3rv1hn1o4gGM0z/aFypQR7lbdvVh1iSIyy/3N
	jr6kIcud1qISC873xta7GcZpddoSTUWHq+Eycjc7FuIcVLPECEKTAr0VrUAFLISpntygMrXXaGf8C
	5lze8YPguXvwnnlyKrE/fMKTr4uhmwFlhv0Fen02xzXcUCHsSTBZmZrADcjI7rtbO9NiIdBF6f5fm
	v5tCVsnxuQRpqnbDF3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWUW-0000000AUrY-2hkT;
	Wed, 10 Jul 2024 12:32:12 +0000
Received: from flow1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWUS-0000000AUqq-24hd;
	Wed, 10 Jul 2024 12:32:10 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id A4406200314;
	Wed, 10 Jul 2024 08:32:06 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 08:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720614726; x=1720621926; bh=C2Se+H9RzY
	HkM+IvsyadLBKj3T9ynrUDq9Xcr2QdKUs=; b=cOl7Zcvkzf0wDdLrzY4XZ4nqyK
	Q0n/RJfmgELZTtTqod2qQXQqjWvo6hLyv8ZupwoPZleV74KB7CrYe8SjUf4ceunh
	CCahWbr44J1SkI4rlgeI03TRPOLSw5VTaOaCk8uarlYDXmbvY5gg6XFdGRnBLRmT
	VFLQKnpwzfM4POIfXCcKIBRg/+pkVOQlBJ0GH3BxqYageTKlELXoNlTt4mw+Q4Aj
	k2Im0F4pgLhehsHgB2bzs6UKs606OMlnCduj2/iYMXP59CpYQjVYC2vfu4cHRoAf
	cyc43gZGXwtKhum8Bm+sgJK4LC6XjiAJWyjbEM9FItPgj+N5bQP6BT/4uDQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720614726; x=1720621926; bh=C2Se+H9RzYHkM+IvsyadLBKj3T9y
	nrUDq9Xcr2QdKUs=; b=LpLxRYuWKtNXiN+vMol//S9HJvuDNvoMySy3IEcvEnBP
	u9nXxRywgLMUEzBCTM0mYX9ux3yyTeKxg3a3Qgn4q/3Io5xtp/Vv1mphh8pcf9E6
	vhNbLB9DALQvdlqA+SoPJLiJF9I1J2l9vi9JhSpyNJ/U2kN1jkcNAhlPjGeBJNuf
	dq24Q8irGyqaVcPnhFTsXs+y9AUvU7g3iwOe2EAup6fP+ru5f+A7TeI4ed07Fl+D
	8S+3VmfI4gOVzGcHNSOk1DfOPIUoqSrnh5pt7UgSz6xINcZRaJfz0qVD/8QFgZDt
	zBwpgYQWHBL/Ev+vGiiYevpXhAYme5o7Y0QxcBEGaw==
X-ME-Sender: <xms:Q3-OZurnKRkHBlEZMjc2PijwVnii3Ft7oAVSuLA0qFmezC5Y5EJm9Q>
    <xme:Q3-OZsoW4lzanijF6DQpYWPbUfD-CFYt0QhuAlF3F1xQAlxGDVndb8vyQkcKdK_mG
    3wR-2RmoSV2vmVg9Xc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Q3-OZjOIVdJEtnz-150-q7qjX0LUXM6RkvkquzoxolFuI1CETJjJiw>
    <xmx:Q3-OZt47sHQWBMp4Sm_h9D_Itaa2UR7xRR6oz4VfTFgZl4xOrpRMow>
    <xmx:Q3-OZt61vvUylUkBQV7eSWZtpYz_EP3x6iU3PqX4vtnbW2NiXElrdg>
    <xmx:Q3-OZth_J6crv8zLOcicEfQqH5MMDIkvJ1IgWC5x8R0svP4D8xWqkw>
    <xmx:Rn-OZgIBVQ1boHKoWWrW7KFkxPc4r84muU_5CzmiqF-M7CrvG824ufJd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 09148B6008D; Wed, 10 Jul 2024 08:32:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <8f45a3d9-429c-441e-a17c-33a163eb86c2@app.fastmail.com>
In-Reply-To: <663b1749afeb5cec281149fdb445ed36fdcbc68e.camel@maquefel.me>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
 <CAHp75VfSC9gAD9ipeWRPdQOxUp4FXqYYei-cJTs38nbz0cHpkg@mail.gmail.com>
 <48c242838c77034485a9e667dc0e867207c5beed.camel@maquefel.me>
 <241a4cf9830b0118f01e8fcf2853c62527636049.camel@maquefel.me>
 <jyvlqfvqn5bp3jmvxvwyrcqmihjohuq3o757mfph7x37kbwvtq@gtgyh4fca4fq>
 <663b1749afeb5cec281149fdb445ed36fdcbc68e.camel@maquefel.me>
Date: Wed, 10 Jul 2024 14:31:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nikita Shubin" <nikita.shubin@maquefel.me>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Hartley Sweeten" <hsweeten@visionengravers.com>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Lukasz Majewski" <lukma@denx.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Mark Brown" <broonie@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Sergey Shtylyov" <s.shtylyov@omp.ru>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Ralf Baechle" <ralf@linux-mips.org>, "Aaron Wu" <Aaron.Wu@analog.com>,
 "Lee Jones" <lee@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 "Niklas Cassel" <cassel@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Vinod Koul" <vkoul@kernel.org>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_053208_802303_46E888D0 
X-CRM114-Status: GOOD (  11.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 8, 2024, at 09:34, Nikita Shubin wrote:
> Arnd, 
>
> Are we continuing this patch series ?
>
> You are silent since last version submit, which makes me a bit worried.
>
> If you suddenly changed your mind please let us know, cause anyway we
> have no possibility to merge these series without you.

Hi Nikita,

I definitely still want to merge your work, I was just not paying
attention while there were others commenting on it, and I don't
know what the current state is. If you are ready to have some
or all of the patches included in the next merge window, can
you send either the set of patches that were reviewed to
soc@kernel.org for me to pick up, or prepare a pull request
to that address?

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
