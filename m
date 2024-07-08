Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D1FC3DA45
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 06:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBYQk3Eq0rVnZ0laY2JZywqQ1xOiX78A3qLCh1RiHqY=; b=S7mzu3LWVJuv0F
	xQOj7x5Q6Dxqtf6/2+0/gt9Vh/i/UAYm387rKbeAPslanv5Cbh9xvAG+FPLx9IXdq49vdvU677Dwa
	4mXhkmS8i9LMdEQPeOxTu5lVMq/C3XWwkkZwNwy7KvUAU74XMx7LwlnF7j4d5QmlCmvRpPMxMZe+G
	bpOZHWta0jLaZ8XsqFnPsLXTGXg74h7yvctBgXBdnC6bCb8P8mVBSOcKhREFGW6pImtk/UKgGUFaX
	4a/iZQoPV+PNcE/2rCVaK8Dj+UWf8e3y3GJXS0nMgDGrNcPEArGDkJrj/U24dp1Ui27q2iuXnjUUY
	2wjUdK2VaOwuaukM5rFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhvI-00000002tet-1yQa;
	Mon, 08 Jul 2024 06:32:28 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhv2-00000002taU-29TF;
	Mon, 08 Jul 2024 06:32:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2FCA240002;
	Mon,  8 Jul 2024 06:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720420329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zswb2gaNk97IllrUQU0TFGiZRh24Vb8Y3fvPz5plUKU=;
	b=fzG1gRqmIDEWc3fYATYksDzGI8ZrqUI/CfhwYuLiIopj8ghqO3wCtDZ8/imikhLkjXIKPs
	W1ITFue87n7DHbcqz3vN/DgUebRyjMCbCjUuacSWTzUa9tycPA51XtiNbr8mG9b1IMwBrr
	jACBN/4ZB8B8ft3woQFQGgpODB+DvdCeeAo2x/4SwoG+0WzTT9eafTX7J6NWCdPlUZSjew
	McPfkYaTTzZnY7HfxW97VqLGF8T88JivBP2KWitplNheLfKK3+QUu+3Evs76sq+/8i790u
	Ua3TZXSml0RTF20SvzP8zDvUccqmeJVPu6bHLiP7xCZGkFo6DxFC3N08HOnXQg==
Date: Mon, 8 Jul 2024 08:32:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 u-boot@lists.denx.de, linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWC?=
 =?UTF-8?B?IE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: nvmem: convert U-Boot env to a layout
Message-ID: <20240708083208.322f4418@xps-13>
In-Reply-To: <20240705225821.13196-1-zajec5@gmail.com>
References: <20240705225821.13196-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_233212_705719_88F95103 
X-CRM114-Status: GOOD (  16.32  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBTYXQsICA2IEp1bCAyMDI0IDAw
OjU4OjIxICswMjAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVS1Cb290IGVudmlyb25tZW50IHZhcmlhYmxlcyBjYW4gYmUgc3RvcmVkIGluIHZhcmlv
dXMgZGF0YSBzb3VyY2VzLiBNVEQKPiBpcyBqdXN0IG9uZSBvZiBhdmFpbGFibGUgb3B0aW9ucy4g
UmVmYWN0b3IgRFQgYmluZGluZyBpbnRvIGEgbGF5b3V0IHNvCj4gaXQgY2FuIGJlIHVzZWQgd2l0
aCBVQkkgdm9sdW1lcyBhbmQgb3RoZXIgTlZNRU0gZGV2aWNlcy4KPiAKPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzEyMjExNzM0MjEuMTM3MzctMS16YWplYzVAZ21haWwu
Y29tLwo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4K
PiAtLS0KPiBJJ20gc2VuZGluZyB0aGlzIFBBVENIIHdpdGhvdXQgTGludXggY2hhbmdlcyB0byBz
ZWUgaWYgdGhpcyBpcyB0aGUKPiByaWdodCBhcHByb2FjaCAtIGZvciBkZXZlbG9wZXJzIGFuZCAo
RFQpIG1haW50YWluZXJzIHRvIHJldmlldyBpdCBmaXJzdC4KPiAKPiBNeSBwcmV2aW91cyBhdHRl
bXB0IChzZWUgYWJvdmUgTGluaykgdHVybmVkIG91dCBpbiByZWZ1c2FsIHNvIEknbSBqdXN0Cj4g
dHJ5aW5nIHRvIHNhdmUgc29tZSB0aW1lIGluIGNhc2UgdGhpcyBvbmUgZ29lcyB3cm9uZyBhcyB3
ZWxsLgo+IAo+IEhvcGVmdWxseSB0aGUgaW5jbHVkZWQgZXhhbXBsZSAod2hpY2ggSSByZWFsbHkg
dGhpbmsgd2Ugc2hvdWxkIGFkZCkKPiBleHBsYWlucyB3ZWxsIGhvdyBJIHRoaW5rIHRoaXMgYmlu
ZGluZyBzaG91bGQgYmUgdXNlZCB3aXRoIGxheW91dHMuCj4gCj4gSWYgSSBnZXQgc29tZSBwb3Np
dGl2ZSBmZWVkYmFjayBJJ2xsIHdvcmsgb24gVjIgd2l0aCBhY3R1YWwgTGludXgKPiBjaGFuZ2Vz
Lgo+IAoKSSBhbSBzdGlsbCBpbiBmYXZvciBvZiB0aGlzIGNoYW5nZS4gSSBrbm93IGZyb20gYSBi
aW5kaW5nIHBlcnNwZWN0aXZlCml0IG1pZ2h0IGJlIHF1ZXN0aW9uYWJsZTsgYnV0IGZyb20gYW4g
T1MgcGVyc3BlY3RpdmUgaXQgbWFrZXMgdG90YWwKc2Vuc2UgdG8gZGVwcmVjYXRlZCB0aGUgb2xk
IFUtQm9vdCBlbnYgImRldmljZSIgZHJpdmVyIGluIGZhdm9yIG9mIHRoaXMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
