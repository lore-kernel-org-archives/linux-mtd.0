Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FD5C4363A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 01:11:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76BD02076B
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 01:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TAX0QxqF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Rx8RJtC6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76BD02076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:Date:Message-ID:
	From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sDkYcYYo5sq37cAG1asKqPHaHtDpeR61mRdkBVDy1C8=; b=TAX0QxqFa6S0K4i4nc/cz5pug
	ExVAGJndzrjLE/1B6CX5Q8Yb4KJ4y2dQudzErabOeEQYjVQQnQooEnrM7YBC6k37zxfOntV48r+/+
	9645jnZXWc5Ixn2+8B2BowcBlH+Drj6JVFZ8lsnP8ZmVb7iskxgGFRTYIxY7sPAz/pHTJMTQpNXJy
	4GRt3TK1po2WWYkqG49ECkycccrSzbMjqBjL3bLeGPqMszcCq8SIGm4U1Hx9Bia5pH6NgrxvWMsvB
	6Sm6yWYBsKVgKmLzmcTUXne/6cDKdFyOTopUv7IkKU/XATaZawIx8YY0LoeSSzS/esTABaJXP6afz
	MEG6h4OMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPbUr-0002x5-I1; Tue, 06 Oct 2020 01:10:29 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPbUn-0002uD-LQ; Tue, 06 Oct 2020 01:10:27 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20201006011017epoutp0296e01a9602596620fa94cb505b1f2ccc~7QfYIgmPy1813818138epoutp02j;
 Tue,  6 Oct 2020 01:10:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20201006011017epoutp0296e01a9602596620fa94cb505b1f2ccc~7QfYIgmPy1813818138epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601946617;
 bh=B4PawtUJM2t4wzU2pvIySnG7we9Bhgj1khiFTd9d9CE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Rx8RJtC6Yj3KjGbngnY3QrOD1xUh97k2CcjP1L4bTfTZIPheVmtqSJrA4EZdpPPOg
 trAwp0No0N/0erQYIZqHeGT1O8Y1jJ5bsPfmRbRjm0h8DI5JF5XlW5/vhGg3S/8m9/
 spUfOkBMrCNoisTG2YOcZI8q4vf8cCSD1/9SF9L8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201006011016epcas1p459c312e10a907b7832b22cd23eb9d8a4~7QfXew6HM1279312793epcas1p4Q;
 Tue,  6 Oct 2020 01:10:16 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.154]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4C4zsY6sg8zMqYks; Tue,  6 Oct
 2020 01:10:09 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 20.E2.09577.1F3CB7F5; Tue,  6 Oct 2020 10:10:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201006011008epcas1p300f9dc6918a008b4b0acf5870f438a2e~7QfP7yysc1939819398epcas1p3e;
 Tue,  6 Oct 2020 01:10:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201006011008epsmtrp151af87c3414c2b6b37057fcba7d215f2~7QfP5fMXI0584005840epsmtrp1N;
 Tue,  6 Oct 2020 01:10:08 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-24-5f7bc3f11c68
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 C1.AB.08604.0F3CB7F5; Tue,  6 Oct 2020 10:10:08 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201006011007epsmtip14dca797b06e6c0e4525f28d6ead67ad0~7QfO-JeoX3017730177epsmtip1d;
 Tue,  6 Oct 2020 01:10:07 +0000 (GMT)
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <0e155728-89b3-5f31-f008-dfd57b6c4f6b@samsung.com>
Date: Tue, 6 Oct 2020 10:23:28 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01UaVBTVxSe+/KWoFKfiOXCVIHYOtUqEhF66KB1lNpXdapVy1hnbIzwBhhD
 kknAqnQYQMCouFBcSkRgCC5sChGQTVBWaQtBUEQxrmhAFgUEXKA2EJzy7zvnfOd8850z9woF
 NiahgzBQHsyr5FKZiJ5CFlTOd13UVxkqcU0cXQxpN28zYDBWCCD/vZaBTONRGtIiA+DE43Ya
 kgZmQ6IhioTkqgYKMk+MUlCZ2oHg1uBLGvbpLtGQ+vJPCiLSmkl4FJlBgMGQw0BjwREK0uKT
 KTgQl8bAw8FqBEO3NAQcHzlPgP5pCwUZwycE0Bf7gILLySMI9nflI9CMvkZQU/iEgKSqXhLu
 9g9R0FycSEN+90UEsTn55nl6M6/qw1EEJZHnGKhPqqVh4HAVAqMxA0HBQBQNNZm3aPhHd5iB
 iL67DKSeixZA68UyBvJLrxFQlFhHwTn9CAGV+8souJR6nIS2iAs0dDbHCiBGOx2Mf1XT8L64
 hoH4om4EH0oLGWh/fISGC2/N2v+25JLwd0kwxNTUUCvWcNFN50kuKSuU6+7sJLm89LsEV6l5
 zXBFWiPDpehDuL6mNsSd1iRQnK60k+Ca60M4fcYBmgu/ZiC5+y2lNNfb0MBw6VlZ1AbHrTu9
 AnipH69y4uW+Cr9Auf8y0dpNklUSdw9X8SKxJ3wtcpJLg/hlIu91GxatDpSZjypy2iWVhZhT
 G6RqtWjxci+VIiSYdwpQqIOXiXiln0zpqXRRS4PUIXJ/F19F0DdiV9cl7mbi9p0ByRffEUo9
 uTun+yYVjuoFB5GVELNLcVfXfXQQTRHasIUIv0h5QlqCfoTr4zIoSzCEcElkA/mx5VR1FmMp
 XEW4sT9lgvUS4aL2B+Osmex2bBpqGxexZbfh2nsvxucK2DRbXN0WO16g2QW4vKOVHsPTWWd8
 +81TNIat2eX48tk3xBgm2c+x4W3r+NBZrA+uK4ia4MzAdQnt5rxQaMV64Lz0eWNpAWuH77Un
 ExbsiK/0JArGdDHbPBV3HHuGLBa8cd/pjokNzMQvavMYC3bAnUdjJnAoTq+roi3NGoTzyhsp
 S8ENl5+NJ8aEBex8fKl4sSXtjIven0EW4U9w72AsNUbBrDXWxNhYKHNx8yMjYcH2WLf/AH0M
 ibST3GgnWdBOsqD9XywFkRnoU16pDvLn1WKl++Rz69H4i1/gWYhO9bxyqUCEEFUgLBSIbK1d
 fHZLbKz9pHv28iqFRBUi49UVyN283ziBwyxfhfnLkAdLxO5L3NzcYKnYw10sFtlZP77nJLFh
 /aXB/E6eV/Kqj32E0MohnHC0Cr9uN/qLx0oUL2mqWLHQ3SDbfHL1g0SvGblX91k3eLY8jFtZ
 aveqKbs/bsuhz5yPcyafMvsuU3h7j1PY2sK2nxqmrTuUlOzhoBs2Zuderc5N7bmxRRs2tzg1
 TNMTuGezH/fFwqJ5I4p5Pnsdt//2+/36gNqN+iub1iR8f2rY7dcdmWr7Q93DP288Mnvrm/gz
 LlFLTaFZTL1uTuY227gn30WXZWWv831rMgavcpL/WCZ7fmdtxNMv7da3vtt1Q/dtzvU5lVKP
 P2a8HqgxmbxadPLn630Hs4fnS21brSN/uFBSVb4jgV7p/FXjM+81u+0ls+x8o1dPvbk3qCTs
 pKDj8p3erdPsMsNHRaQ6QCpeIFCppf8BncC7Z3oFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxiA851rgRCOBcIB41SGmBHBsTD2uhlisjkO0yWbm2RbdNiMBlBA
 RmFDWTJA5CaXOQWh0pZLASlYoFCkgIC0sMCklYsExDoRzEDuooCCshayhH9P3u95vvfPy8P5
 BsqJFxIeJYwMF4Q6U5ZEvdb5Hfd5bWzA+2MaR5D33qfBYGzHQb0qpqHCmEWBPCEYskfHKZAu
 7oB8QyIBMp2ehIrsNyRoiyYQDLyco+BCcRUFRXO5JMTL+wl4nKDAwGCopuFefSYJ8isyElIv
 y2n452UHgqWBFAyurpVhoBobJEGxnI3DQvojEmplawiSp9QIUt68QNDZ8AQDqW6WgOHnSyT0
 N+ZToJ5WIkivVpv+U5k83XoWgqaEUhp6pH9RsJihQ2A0KhDULyZS0FkxQMHd4gwa4heGaSgq
 vYjDkLKFBnVzGwaa/C4SSlVrGGiTW0ioKrpKwEj8DQom+9NxSBLbgLG7g4LVxk4armimEaw3
 N9AwPppJwY1Xpt1vB2sI+LspCpI6O8lDX3AX+8oITloZy01PThJcXfkwxmlTXtCcRmykuQJV
 NLfQN4K46yl5JFfcPIlx/T3RnEqRSnFxbQaCezjYTHGzej3NlVdWkl/t/MHyYKAwNOQXYeR+
 n1OWwTLlayxCRcRUT/eScagHT0MWPJbxYq91VNJm5jNNiJXmO2/OHdmc3g6TwzOxLavVitKQ
 pUmZQezsQvJGa8ucYv9dGtlw7JiTbMZzS7ODM0o7dqxRT24GasSup0k2FlCMG9s6MUSZ2YbZ
 zd5fGUNmtmZ82NqSFczMBOPCGl4NEWa2Z/xZjXwM23S2sV1544R5mQXjzdaVu5rHOLOXXZP2
 4ZvswD4Yl2GbvJO9NZOP/4FsxVtq8ZZEvCURb0kKEKFAjsIIUVhQmMgzwjNc+KuHSBAmig4P
 8vjpbJgKbdy823sN6JZi3qMdYTzUjlge7mxn7eEfE8C3DhScOy+MPBsQGR0qFLWj7TzC2cF6
 6OfCH/lMkCBKeEYojBBG/v+K8Syc4jCL2x+7enjndd+V7Tp/WP9g38D3kuNtCwUdvMRrOcQ9
 7yn+apJ0wD1G6dLm0i3ZI7F4NhZ3wr/s8Sxhm9r95aef+HgNn9Me8AtE/GFdpo9VwtShE3d6
 JaV43TbdrmLXiQ+qVlMnjX57vEvOnFzLfrKvde/DY+OF64Xhjwb+DP399NGYcu60+Gn3bnuh
 Plrqq3E1hF5qIattpkZHu5JKahwor5zrTPqz166tB46VyY+UH92vr/1opWbHN1a+ys7j2tIs
 q7J5z88Lb4a4bf+u6UO/b8uXvUSWt2fm7hysh9y3n03nGn0dpxoEgQFPL1WnXoiVHL7p9C64
 X7a30fymDsxaFjW2fO1MiIIFnm54pEjwH6+El7RiBAAA
X-CMS-MailID: 20201006011008epcas1p300f9dc6918a008b4b0acf5870f438a2e
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201005183933epcas1p36d2c9cc1f3ad9180421269ca74330d65
References: <20201005183830.486085-1-robh@kernel.org>
 <CGME20201005183933epcas1p36d2c9cc1f3ad9180421269ca74330d65@epcas1p3.samsung.com>
 <20201005183830.486085-5-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_211026_171816_B99FEBAA 
X-CRM114-Status: GOOD (  21.06  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-rtc@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-mips@vger.kernel.org, Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S.
 Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/6/20 3:38 AM, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
(snip)

>  Documentation/devicetree/bindings/extcon/wlf,arizona.yaml    | 2 ++
(snip)

For the extcon part,
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
