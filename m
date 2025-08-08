Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBE7C87FD3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVJAhSIGePgvno/zOf5KG69YppzxLJ2pw0X5RhpvHQg=; b=j4eV7YPFk4UgqO
	myAOLOVlVchRX6FpHk+vLVIXI03wMc8NLQlNT8EgzQEBtpU3I32jgvWhrZo5A59C1+J/9OdkXyIpF
	sHpFR63V0/E7efJI6If8iNjyAKznOMQyQK03HmhPz9sMSWWOFJD38Q4y1ebWiKkfgsWW28oaQ7/W3
	MqWs0X543WQB7R01rPWU4/RduLazhSO2mgezx1lzLd5s1RbSlh7+CFG4glvzIh+pNRFf6+QRydTQs
	6UdCK1Vs6fZZct04yMOu4/Ac1y5ot1ANQMfWwPh082u6W/NCmju029aae4inXargY7l9men+aOJqz
	MN+JJY9uXGKUurH75wkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukN2i-00000002uYa-2Hp8;
	Fri, 08 Aug 2025 13:21:56 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukN2g-00000002uY4-2bR3
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 13:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754659301; x=1755264101;
	i=markus.stockhausen@gmx.de;
	bh=OQJrM7jp8fKK3HA4MFBr7jEUz0sXvmJTRlJAF8IYaMk=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q2O8uHEnp+YqModWPw3t4sxINmUPd3zlLqsgODMIzMOwebAz1AoVQKz3LIDq+tyW
	 evYSU5WVIM+cctmXMpwLMMjW+kGv6rlOBaTurDrtFSg9v/mgiMbJSuPPtgnTwHkfx
	 x1OqFc06lt4THWlaJAlcFstKhNMYfiTDlfHKer4q+6tJ3aWbiWQ+EOiJuT1nMQvIx
	 anh6HqR/FOUTmRI/CTRFRQIvYg0Idn4DDj3u8cLx1xwFeqKYUwoT9z0wG0rdvIMGP
	 4As3dbuWhDtbHYOqac9LZeWYKeSTm8E7Xfg/5LBRgMI4NtIHfD4gofpXFLh4cA/12
	 jwkFLLxk3JJCZg7NIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1utxHM2glp-0010AP; Fri, 08
 Aug 2025 15:21:41 +0200
From: <markus.stockhausen@gmx.de>
To: "'Miquel Raynal'" <miquel.raynal@bootlin.com>
Cc: <vigneshr@ti.com>,
	<richard@nod.at>,
	<tudor.ambarus@linaro.org>,
	<linux-mtd@lists.infradead.org>,
	"'Chris Packham'" <Chris.Packham@alliedtelesis.co.nz>
References: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de>	<2537e2a1-f958-4e9c-b346-b4fac2152a47@alliedtelesis.co.nz>	<034f01dc07e1$8dd75dd0$a9861970$@gmx.de>	<a1794cf8-ed93-45db-8ac1-7e5d2ccd9fe9@alliedtelesis.co.nz>	<87pld6b3y8.fsf@bootlin.com> <052001dc085f$81e731c0$85b59540$@gmx.de> <87ikiy9e9n.fsf@bootlin.com>
In-Reply-To: <87ikiy9e9n.fsf@bootlin.com>
Subject: AW: AW: AW: NAND ECC errors
Date: Fri, 8 Aug 2025 15:21:40 +0200
Message-ID: <05e301dc0867$6195e760$24c1b620$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ9JeHYku6FmVG1oRkuWaRQXLF5+AF1njpmAjY3rtYCca3y5QKA3SNJAnOwz2oBq8WmbrKwkWJg
Content-Language: de
X-Provags-ID: V03:K1:kwco1f2JfnqTUTyWJ0MZ209t7IV5KkPkGT82DHT/rbWAqv+BU7T
 bH/ohkp5FQ7SILn5ud4hnYkIHU6T11Vf1nDzwfkm9bLHjKf+GP0dLgke3w4Ekhey/GUFFnN
 ctjbLL6tmzEUryw7/vLR4QyWBkFc7JIwM1/BldM0RXt5ACi/+r4597T+pGGWLulr3B1o6Qf
 ajYHKFnDFqTb4ryW7wpPQ==
UI-OutboundReport: notjunk:1;M01:P0:SON6p6JWUZM=;WDjMbQwyWXNM1pZf9u61WM9Kk1t
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_062154_958522_2E60D92C 
X-CRM114-Status: GOOD (  11.83  )
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

> Von: linux-mtd <linux-mtd-bounces@lists.infradead.org> Im Auftrag von Miquel Raynal
> Gesendet: Freitag, 8. August 2025 14:42
> 
> On 08/08/2025 at 14:25:18 +02, <markus.stockhausen@gmx.de> wrote:
> Just to fully understand, you are trying to replicate what the software
> BCH engine of your realtek SPI controller does?
>
> If so, why not just configuring the engine directly and use it? It will
> be much faster and easier to do.
>
> Otherwise, if you're trying to do in software what the hardware does,
> you must be prepared to more maths:
> https://bootlin.com/blog/supporting-a-misbehaving-nand-ecc-engine/

Idea was to start with something I have fully understood. Wantet to
leave Hardware for later as ECC is a total new area now (as it was with 
NAND the last week). Had a short look at the hardware engine GPL 
code. The most basic parts look straight forward with three functions

- Prepare to to encoded data
- Prepare to be decoded data
- Kick engine

ecc-mtk seems tightly integrated into the nand contoller while 
ecc-mxic seems to be some passthrough/pipeline integration.

What would be your advise for the most simple enhancement 
for our existing Realtek spi-mem controller?

Markus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
