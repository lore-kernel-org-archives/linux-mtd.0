Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0384C4451C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZRqdSZrO85y2oarCpPQBXAD7gVPuB/NZm1QnCWTxU8=; b=YcQ90FUI+NJwpL
	Ly5k5TM2TiwHkGyWZYbVriQNARy7KwD/EayEZM18+ZqX0ffKROZF157kvoCLg3MxB99uzLnGsODYB
	oKHxMJoCChIqjtwlmIWtigGRpC5c6ekNmRaa0YB+Pl+GwX788BnceJaQVMBixGfKYROK9U11dyxA4
	nIpDAVqHOJEXVwLSjADEfb3DAzj9MGV9MuxAnr/WMQ7+Ujz+t5Ga7Ae+A8v1Yg0Z+zgv1JTjWqqKu
	A5MykDkaJYZMofH65cZ3FNzNJCCfQlWy6tseXH5s+oo9kda0VcHJD3OwuYkLt7W6J9O5EJrtd3Cuu
	9zj6E4ypYkou7QRoiegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ed-00000008ggd-35xx;
	Tue, 21 Jul 2026 07:49:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ec-00000008gfn-1xXZ
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jul 2026 07:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1642844EA7
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 07:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE91E1F0155F
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620189;
	bh=YUdc1ajS9G7+JyBN4Vd0qdQ7XA8eh/Dl4R2Vtt/aRyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fCIxwdakKOHlbIEvrOkZaMzRZ+jNwc3O70PBDHYMq6ssKGwaPrBT3QGuXYAjaR6cq
	 95qNW/QFvDgx6QCD/H9UstQsPwKmvruxK9GMzuk0sldFva3Kb2TD2oM6y8H2Zzy3yj
	 ItD1kOHL/PbiXiSt7z4NfRWT/jU0k0Dbti8JVVL/YONR6r+9hxS1htZ3PQZWaPdaV5
	 rtqpUBPybZucQqN4XbYP+kyH6vd5xw7L7D5w7XwyvhOQrrEWJqC8jEz3kG8+vi4qGw
	 oZHXUBq/g6Ze1oi3HwN/gUcrhrSzfSPhYTcU9/jSt0hCjcb8Tdz4c+WFwl9qP3/+NR
	 2itJC+U4AfXIQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so788927e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 00:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rood4JcUp5B85N0ADkWLfFgdyRb1tApF71EH2AomczGJTnt48YG+uaLraIbJ5CGWY+VwvUBvsdhs70=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSGd/U02agVXbZnyY3IvWc75P5ut9A0i0qI60IlxqvGft+i7NL
	AmT9fRXuq5ICpPdppogdng3POqi1mXdIKL8+/+ZvNpggJPXnDv3BmIXlC9yguFjeLMYHNJOK9F4
	X6chDpZSA/LTbc32OvkpXsRgx+I6QHnc=
X-Received: by 2002:a05:6512:33d0:b0:5ae:d80f:c77c with SMTP id
 2adb3069b0e04-5b28f998d30mr4171034e87.30.1784620188475; Tue, 21 Jul 2026
 00:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260721052859.171341-1-manikandan.m@microchip.com> <20260721052859.171341-7-manikandan.m@microchip.com>
In-Reply-To: <20260721052859.171341-7-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:49:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLnvCaUaEm0m9w3CWcuahgt1VwpYC=JLTLp=O6J-y8wgZA@mail.gmail.com>
X-Gm-Features: AUfX_myUpn3DxB2dpHt182zW3JGQBje1oWK611TyiUzfnfgPlR68CEulMNYYBjE
Message-ID: <CAD++jLnvCaUaEm0m9w3CWcuahgt1VwpYC=JLTLp=O6J-y8wgZA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ARM: dts: microchip: sama5d27_wlsom1: read MAC
 address from QSPI SFDP
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgNzozMOKAr0FNIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFu
CjxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4gd3JvdGU6Cgo+IERlc2NyaWJlIHRoZSBRU1BJ
IGZsYXNoIFNGRFAgYXMgYW4gTlZNRU0gcHJvdmlkZXIgd2l0aCB0aGUKPiBtaWNyb2NoaXAsc3N0
MjZ2Zi1zZmRwLWV1aSBsYXlvdXQsIHdoaWNoIGV4cG9zZXMgdGhlIGZhY3RvcnktcHJvZ3JhbW1l
ZAo+IEVVSS00OCBhcyBhICJtYWMtYWRkcmVzcyIgY2VsbCwgYW5kIHBvaW50IG1hY2IwIGF0IGl0
IHRocm91Z2gKPiBudm1lbS1jZWxscy4gVGhpcyB5aWVsZHMgYSBzdGFibGUgTUFDIGFkZHJlc3Mg
b24gYm9hcmRzIHdoZXJlIFUtQm9vdCBkb2VzCj4gbm90IHByb2dyYW0gb25lLCBpbnN0ZWFkIG9m
IGZhbGxpbmcgYmFjayB0byBhIHJhbmRvbSBhZGRyZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFu
aWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPgoKUmV2aWV3
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
