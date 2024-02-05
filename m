Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866AEC48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWZlhtn4qSIFWdJ9AbnJP+mXd9Qrw/KBynupdgxIekI=; b=IVNi3/tGiw3TlB
	TPFa37YsRJHLgWpm6KSzcvFF4SbwVG7NAakgewk1TzoKS4/DkXR9wEU3We1ukwP5/dTnl5X8UfaNo
	6yKVuSZVtwxiMS8h54jPXxWl7g9ik0K8rC3S/dCXGTDWcJNoKPWhPSwsyjrBE60zuQmbIpHg1qumv
	YOoo9TD5djyxSKyQhPY1BXnAQ8EPqaRLQUGWQ8iONNf2bAPdkmVBwrI1YZZmodP0/nSZNuF60jL47
	0FKrfHHX5bfgMziDhi5VoYXayLg2WH0C2p1HC2owwbVaTN1rCKKcpk6BWzSX4omteK+3K0XWQXNIW
	uS2CLjhgivqOvP1ZBiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0jH-00000003kNy-1g97;
	Mon, 05 Feb 2024 15:17:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0jE-00000003kNO-1Une
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 15:17:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1425FF80A;
	Mon,  5 Feb 2024 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707146265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J5h136Z6o5MpC5NtPS2K7viSPN8N5yI9efnCDUsJ24c=;
	b=OqKMP23sJ9USNkvLnB89vcAw/4g9Gdwip5r7ovmTsI5T+DtcK/6Y6dpojmZXiqQ+xgRgVR
	xzRqfeqRW9Gtf28YycKhbuRFbApbvHgAHKNfprDL0Vte8aRZeodL5nLkuWz+d/NUFofC1h
	ggbeIiWBk3WzyViPQhfQkoOh7/MIrpW26ISw9GYLLZGiHFYAmbrYH27H6gOj6E0XBJuql5
	EgV7+HEoGQOCh0LBIGEZyN38huOE6C0PMqC5LhYk82Sz+Il8AFlZF1frq0bEJS5SNK/teq
	4NroVxu2s/ixdVIpx3RoRLADUNBrZRs6dM4pCcdUIldHfSIuTfUnART0nLgUbg==
Date: Mon, 5 Feb 2024 16:17:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Elad Nachman <enachman@marvell.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <vadym.kochan@plvision.eu>,
 <aviramd@marvell.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: fix layouts
Message-ID: <20240205161743.6c13af7b@xps-13>
In-Reply-To: <20240205134435.2769452-1-enachman@marvell.com>
References: <20240205134435.2769452-1-enachman@marvell.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_071748_550887_619DDBFB 
X-CRM114-Status: UNSURE (   9.23  )
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

SGkgRWxhZCwKCmVuYWNobWFuQG1hcnZlbGwuY29tIHdyb3RlIG9uIE1vbiwgNSBGZWIgMjAyNCAx
NTo0NDozNSArMDIwMDoKCj4gRnJvbTogRWxhZCBOYWNobWFuIDxlbmFjaG1hbkBtYXJ2ZWxsLmNv
bT4KPiAKPiBUaGUgY2hlY2sgaW4gbmFuZF9iYXNlLmMsIG5hbmRfc2Nhbl90YWlsKCkgOiBoYXMg
dGhlIGZvbGxvd2luZyBjb2RlOgo+IChlY2MtPnN0ZXBzICogZWNjLT5zaXplICE9IG10ZC0+d3Jp
dGVzaXplKSB3aGljaCBmYWlscyBmb3Igc29tZSBOQU5EIGNoaXBzLgo+IFJlbW92ZSBFQ0MgZW50
cmllcyBpbiB0aGlzIGRyaXZlciB3aGljaCBhcmUgbm90IGludGVncmFsIG11bHRpcGxpY2F0aW9u
cywKPiBhbmQgYWRqdXN0IHRoZSBudW1iZXIgb2YgY2h1bmtzIGZvciBlbnRyaWVzIHdoaWNoIGZh
aWxzIHRoZSBhYm92ZQo+IGNhbGN1bGF0aW9uIHNvIGl0IHdpbGwgY2FsY3VsYXRlIGNvcnJlY3Rs
eSAodGhpcyB3YXMgcHJldmlvdXNseSBkb25lCj4gYXV0b21hdGljYWxseSBiZWZvcmUgdGhlIGNo
ZWNrIGFuZCB3YXMgcmVtb3ZlZCBpbiBhIGxhdGVyIGNvbW1pdCkuCgpJIGRvbid0IGtub3cgd2h5
IGxpbnV4LW10ZCBkb2VzIG5vdCBjb2xsZWN0IHlvdXIgcGF0Y2hlcywgZm9yIHRoaXMgdGltZQpJ
IGFwcGxpZWQgaXQgbWFudWFsbHkgdG8gbXRkL2ZpeGVzLgoKU2VlLCBsaW51eC1tdGQgbG9yZSBs
aW5rIGlzIGJyb2tlbiwgYnV0IGxpbnV4LXN0YWJsZSBjb2xsZWN0ZWQKY29ycmVjdGx5OgpodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDAyMDUxMzQ0MzUuMjc2OTQ1Mi0xLWVu
YWNobWFuQG1hcnZlbGwuY29tLwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
