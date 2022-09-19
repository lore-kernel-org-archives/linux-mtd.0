Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F27C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI1ZJvEIwdFFoc8zW37eA0A22xODDsKMfdt19Awz1L8=; b=opcBkZw4+OxcmA
	fPSORnfkYx0YRoQI+C0XF6lnzSautu27fKXaNlq1L9xMwrzEwt2VA7WcQdaVHs+j/qztPGUwAGEm4
	UDXqUidWAOkqt8RdJRqZ37EDemrokTQUvg44C2SpZbxEsajjUZEiZp0Ml9OD/bGuEhA2VP9SHfu89
	B5LoEANaX2Oytfy/WbnBX4bt4yFZ3cKgSQcRWH0hqkhdtiem6ThFUR024S4UblgtuOfZcliL+bPgT
	NrEwtEYf/jfpQdMzIRX7E9kuJa3Uxh83rZbOWrl1UoVijRCtNY8gISrWMWSPveRWwrR77j+Gu8M0y
	aJHOCbHsw/BvXfMqE1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJVZ-00CqR9-FW; Mon, 19 Sep 2022 16:20:33 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJVW-00CqPG-On
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:20:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 675E71BF210;
	Mon, 19 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663604428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/WWVqeJupWT2ywLPBm04EuaC91yQX/e14a2dYD83AM=;
	b=JyMF9ETN18pv+gUBpIQ0cTScLnJuH80XNggbluA8S3MRgyoxfRL7H8MPMXdTY3nSkkc+oG
	iGiY9hw7zhg4aosG+NKI+0LkTh+goR+1Dtn/zhrTWz74rxKEenuN1MIsJKOE+YwQv9/xRT
	r9j1jEK4h0KTLNG9Q6pyQ9qKUfltu/Y+5QBEcGu88Si7PKTzb7mwiKzZEBe3hrut5SFiSe
	3olqte9b8I6tpENmRKfWyBuJ16KXbzEue4n2qx/pFD6KD+UNpVeRS6ZVqBovDWbABCmBjH
	0pu9YTxuoYKiF0GbwPNo0Ngpn1j37yju4G9k0K9k80slAwybql7ML9svF66g4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] mtd: parsers: add Broadcom's U-Boot parser
Date: Mon, 19 Sep 2022 18:20:25 +0200
Message-Id: <20220919162025.226628-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711153041.6036-2-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'002181f5b150e60c77f21de7ad4dd10e4614cd91'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_092030_970640_BC1F1671 
X-CRM114-Status: UNSURE (   6.89  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIyLTA3LTExIGF0IDE1OjMwOjQxIFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IEJyb2FkY29tIHN0b3JlcyBlbnZpcm9ubWVudCB2YXJpYWJsZXMgYmxvY2tzIGlu
c2lkZSBVLUJvb3QgcGFydGl0aW9uCj4gaXRzZWxmLiBUaGlzIGRyaXZlciBmaW5kcyAmIHJlZ2lz
dGVycyB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWls
ZWNraS5wbD4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
