Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C06C4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:07:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1EC2070B
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 12:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z9LVEyeG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1EC2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9MkZJj3fmE8NCqFqb8BiY0SyGqRGFiSCvHTxzjjOcw=; b=Z9LVEyeGdT715B
	MJ19kJGT5bSbM0KOWFX8zln0l2+v6X4Gq3+0AusmdvJbst24VWJReOkki5tZHmKkpkH3L9gNxpuQl
	gRqxWUUcgCQ8h8CPHy5mVdxcJCtqn4ogr8mIVEyoIT+0r+p+bytLEvGDwNlfJxVMZQ04Qrak+nzLt
	mqLqnIET4trYSBdQpkB+WFfKfXLJCJe5cOiVYIVB//+fb1uuFaQpYVKWs8Yjfd2ktKRXERewqiPjh
	02Sw0Bt4s1ipdb2h2E96PvJdpqHYsr9xcMLoYSiCI3yYXwMQGHjBh/jXLota8mxvftRiXpPpOZATa
	t7CfmroNUQhghnQygirg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGMMS-0004rT-9D; Fri, 04 Oct 2019 12:07:04 +0000
Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGMIO-00005A-Oc
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 12:02:54 +0000
Received: from player792.ha.ovh.net (unknown [10.109.160.87])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 18EB9251A38
 for <linux-mtd@lists.infradead.org>; Fri,  4 Oct 2019 14:02:50 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 830B8AA662A3;
 Fri,  4 Oct 2019 12:02:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 11/16] dt-bindings: mtd: aspeed-smc: Add new comptatible for
 AST2600
Date: Fri,  4 Oct 2019 13:59:14 +0200
Message-Id: <20191004115919.20788-12-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3812860034892991411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrhedugdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_050253_003302_91347C6B 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlIFNNQyBjb250cm9sbGVycyBvbiB0aGUgQVNUMjYwMCBTb0MgYXJlIHZlcnkgc2ltaWxhciB0
byB0aGUgdGhlCkFTVDI1MDAuIFRoZSBTb0MgaGFzIG9uZSBGaXJtd2FyZSBNZW1vcnkgQ29udHJv
bGxlciBhbmQgdHdvIFNQSSBmbGFzaAptZW1vcnkgY29udHJvbGxlcnMuCgpDYzogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnClNpZ25l
ZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hc3BlZWQtc21jLnR4dCB8IDIgKysKIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2FzcGVlZC1zbWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hc3BlZWQtc21jLnR4dAppbmRleCA0OWY2NTI4ZWY1NDcuLmMy
MzczZDljZmQ5MCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9hc3BlZWQtc21jLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2FzcGVlZC1zbWMudHh0CkBAIC0xNCw2ICsxNCw4IEBAIFJlcXVpcmVkIHByb3BlcnRp
ZXM6CiAJImFzcGVlZCxhc3QyNDAwLXNwaSIgZm9yIHRoZSBBU1QyNDAwIFNQSSBGbGFzaCBtZW1v
cnkgQ29udHJvbGxlcgogCSJhc3BlZWQsYXN0MjUwMC1mbWMiIGZvciB0aGUgQVNUMjUwMCBGaXJt
d2FyZSBNZW1vcnkgQ29udHJvbGxlcgogCSJhc3BlZWQsYXN0MjUwMC1zcGkiIGZvciB0aGUgQVNU
MjUwMCBTUEkgZmxhc2ggbWVtb3J5IGNvbnRyb2xsZXJzCisJImFzcGVlZCxhc3QyNjAwLWZtYyIg
Zm9yIHRoZSBBU1QyNjAwIEZpcm13YXJlIE1lbW9yeSBDb250cm9sbGVyCisJImFzcGVlZCxhc3Qy
NjAwLXNwaSIgZm9yIHRoZSBBU1QyNjAwIFNQSSBmbGFzaCBtZW1vcnkgY29udHJvbGxlcnMKIAog
ICAtIHJlZyA6IHRoZSBmaXJzdCBjb250YWlucyB0aGUgY29udHJvbCByZWdpc3RlciBsb2NhdGlv
biBhbmQgbGVuZ3RoLAogICAgICAgICAgIHRoZSBzZWNvbmQgY29udGFpbnMgdGhlIG1lbW9yeSB3
aW5kb3cgbWFwcGluZyBhZGRyZXNzIGFuZCBsZW5ndGgKLS0gCjIuMjEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
