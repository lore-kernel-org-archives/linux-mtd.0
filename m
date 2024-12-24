Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BB1E7718E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ms77ua0mGcHjWhHTn58BQknQb4688XEPzeh1guzSrAI=; b=ppuNRMd/u0FCgs
	npJNojp9XqruB3+OeCdY/8wWa4cdKYu5y3lqpCUcgv621sR15JatgS8T06CDZzX6kmHtkONZASC6l
	1kOTKzG54UyMS+SmUOQTwdbT+MWU1NYz+szBuiJu5pzr8o4pJ5i5BdbhNRaPsM7Fmm7HrtKGXBmi9
	rPPXmYyS9NAq1JdTYeFdQfNE/dqIqcO6VncLUFREImDp3Hilh2cb5QtaM1Kwjf3q1qqGkKCLuw59p
	cIjVw+KwRxXcl8j5w2HAJtOdBc6x+Okxuw7BTgFdmM5VdL43Yn+VPbc26z+g29Kn35GzpeMM4xhj8
	I6kkXNRZnP/s/o3TvmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4JO-0000000BzBj-40VB;
	Tue, 24 Dec 2024 12:46:58 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4IB-0000000Byv0-2Q5x
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 12:45:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D87361BF206;
	Tue, 24 Dec 2024 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735044342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9oHSSdzUgNNGO3HtvGsdVLx1zrHCaDWiTDtWXZrgxc=;
	b=nltQDPYVjooQOS7kOo8HIq5we9+uWO2/rZZipR0SSVEMpzr1yOfZvJNWbMYYk1QaDYcwle
	6HuZGkDXHMyCk5pklTB4g4q0S+8OFvE77j4IMQv2G37W+WMW75KiaP2unkiiooZ/ovZwAp
	MgceXaUxdM+n284Z+xlEzWQy0wQFMnu3YiA0rdw/dJClTqGL3XUGwKmUaAGkyvJGfGY6Gl
	r4mnO+vNv/QfdcdlN1mqUlQ3G0s+pXN1ijt3ZACr1UMvbOCbyS8OCERx81hzo7Tmx1gjmq
	DzTsB8OhOeHElBbKEaSAxsQCv/IOJ5GWm3gnH6J15J7/SboW95JMuAWYNnz9UA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: devicetree@vger.kernel.org,
	niravkumar.l.rabara@intel.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v4] dt-bindings: mtd: cadence: convert cadence-nand-controller.txt to yaml
Date: Tue, 24 Dec 2024 13:41:00 +0100
Message-ID: <173504401427.1625053.3257683304271546231.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209081826.1242214-1-niravkumar.l.rabara@intel.com>
References: <20241209081826.1242214-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_044543_757551_D0B26AEA 
X-CRM114-Status: UNSURE (   4.86  )
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

T24gTW9uLCAwOSBEZWMgMjAyNCAxNjoxODoyNiArMDgwMCwgbmlyYXZrdW1hci5sLnJhYmFyYUBp
bnRlbC5jb20gd3JvdGU6Cj4gQ29udmVydCBjYWRlbmNlLW5hbmQtY29udHJvbGxlci50eHQgdG8g
eWFtbCBmb3JtYXQuCj4gVXBkYXRlIGNhZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4dCB0byBjZG5z
LGhwLW5mYy55YW1sIGluIE1BSU5UQUlORVIgZmlsZS4KPiAKPiAKCkFwcGxpZWQgdG8gbmFuZC9u
ZXh0LCB0aGFua3MhCgpbMS8xXSBkdC1iaW5kaW5nczogbXRkOiBjYWRlbmNlOiBjb252ZXJ0IGNh
ZGVuY2UtbmFuZC1jb250cm9sbGVyLnR4dCB0byB5YW1sCiAgICAgIGNvbW1pdDogMWYwNWY4MjNh
MTZjZTBjMzEwYTFhNTBiZmMyOTI0YTMzMGVhODdmYwoKUGF0Y2hlKHMpIHdpbGwgYmUgYXZhaWxh
YmxlIHdpdGhpbiBob3VycyBvbjoKbXRkL2xpbnV4LmdpdAoKS2luZCByZWdhcmRzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
