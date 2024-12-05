Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5BDE7716C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYntey1S7g8pMqUEmEyT7ZKo9XPk6faUF7444GqQgbk=; b=NMqiWXH9oAL2cj
	rEK7XugkF8GdGELs4ttvmB1hS9178nu9+vGxoP7KvPA+fiweDTGIPH3YUSAO7BHZlryhNBMXyktjX
	aNTj2paXMsU9+kbybJphFqjLK0nit4F4Julk5G8SWUhUryhLLmBuSr/ZqBi1aGhtx+LAERH+PQhTu
	s2J2Kr14hoin5LYggEdYZC1YXqvNiLsKXzje6VhhZdDHUojQbeqUX9n8KTWEYeggogcHXuoxneBwK
	LuLe+H8lSkYlTYYxxnK9bmJ6E4Cztt5Gq7nY8YyMrLSLtfA9rY+atjx3Tm7JuKavisc7A9+WT8tlD
	r49Q5dOSENugPhQRh15g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ95s-0000000FW4W-24E3;
	Thu, 05 Dec 2024 10:28:24 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ948-0000000FVct-2iMF;
	Thu, 05 Dec 2024 10:26:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED33E1C000C;
	Thu,  5 Dec 2024 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733394393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aqjkju8oywA4XQ9GAWJQ38Rocfc/Zbwx/1Z53fTbedU=;
	b=M2I1dusuYQ98J+fp7HT1Dh/OuY0f5pd2K8Ztma2vrV6iDGsO2cetLW41VHrwoxxDhd6lMS
	XOmdPXWB61W1PG5FG+y15sC00q+yWJOxgyWRq2VT+0sgJY2Use9001fuXYQQfPk1wZHDlI
	9cE8FQRUHiTJalsqwzj/q/1qyD0FD7KdVvv/GYTZKeTN+WoZfdvWUV9KQefWrQAI5XGIGJ
	it4Ns0/F4tsDVEQz/nKMPNeyJqhfaonCsk1+nUg0wHD8RhWr4EjtUd2+iMCyj3YrBPx6sf
	ZNvseaTcmf1oydvh+k6VBqpieK6FdxCE3Gm2Yrj9ND1y66M/Jaa17FgJyCJ5AQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  nikita.shubin@maquefel.me,  arnd@arndb.de,
  vkoul@kernel.org,  esben@geanix.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/2] Add support for nuvoton ma35 nand controller
In-Reply-To: <20241204025129.150525-1-hpchen0nvt@gmail.com> (Hui-Ping Chen's
	message of "Wed, 4 Dec 2024 02:51:27 +0000")
References: <20241204025129.150525-1-hpchen0nvt@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 11:26:30 +0100
Message-ID: <878qsuwhm1.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_022636_947740_66395683 
X-CRM114-Status: UNSURE (   7.21  )
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

SGksCgpPbiAwNC8xMi8yMDI0IGF0IDAyOjUxOjI3IEdNVCwgSHVpLVBpbmcgQ2hlbiA8aHBjaGVu
MG52dEBnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHRoZSBtdGQg
bmFuZCBkcml2ZXIgZm9yIHRoZSBudXZvdG9uIG1hMzUgQVJNdjggU29DLgo+IEl0IGluY2x1ZGVz
IERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBhbmQgdGhlIG1hMzUgbXRkIG5hbmQgZHJpdmVyLgo+
Cj4gdjEwOgo+ICAgLSBVcGRhdGUgbWEzNWQxIG10ZCBuYW5kIGRyaXZlcgo+ICAgICAtIEFkZCB1
bnN1cHBvcnRlZCB3cml0ZSBwYWdlIGhhbmRsaW5nLgoKSSB3YXMgYWJvdXQgdG8gYXBwbHkgaXQg
YnV0Li4uCgogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiAxMTc6IFdBUk5JTkc6IHBsZWFz
ZSB3cml0ZSBhIGhlbHAgcGFyYWdyYXBoIHRoYXQgZnVsbHkgZGVzY3JpYmVzIHRoZSBjb25maWcg
c3ltYm9sCiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDE0MTogV0FSTklORzogYWRkZWQs
IG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5n
PwogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiAzNDg6IENIRUNLOiBzcGFjZXMgcHJlZmVy
cmVkIGFyb3VuZCB0aGF0ICcrJyAoY3R4OlZ4VikKICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5w
bDogMzUyOiBDSEVDSzogc3BhY2VzIHByZWZlcnJlZCBhcm91bmQgdGhhdCAnKycgKGN0eDpWeFYp
CiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDM1MjogQ0hFQ0s6IHNwYWNlcyBwcmVmZXJy
ZWQgYXJvdW5kIHRoYXQgJysnIChjdHg6VnhWKQogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBs
OiA0Mjk6IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKICAg
IFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogNDY1OiBDSEVDSzogc3BhY2VzIHByZWZlcnJlZCBh
cm91bmQgdGhhdCAnKicgKGN0eDpWeFYpCiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDQ2
NTogQ0hFQ0s6IHNwYWNlcyBwcmVmZXJyZWQgYXJvdW5kIHRoYXQgJysnIChjdHg6VnhWKQogICAg
WzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA0NjY6IENIRUNLOiBzcGFjZXMgcHJlZmVycmVkIGFy
b3VuZCB0aGF0ICcqJyAoY3R4OlZ4VikKICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogNDY2
OiBDSEVDSzogc3BhY2VzIHByZWZlcnJlZCBhcm91bmQgdGhhdCAnKycgKGN0eDpWeFYpCiAgICBb
MzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDQ2NzogQ0hFQ0s6IHNwYWNlcyBwcmVmZXJyZWQgYXJv
dW5kIHRoYXQgJyonIChjdHg6VnhWKQogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA0Njc6
IENIRUNLOiBzcGFjZXMgcHJlZmVycmVkIGFyb3VuZCB0aGF0ICcrJyAoY3R4OlZ4VikKICAgIFsz
MW3il49bMG0gY2hlY2twYXRjaC5wbDogNDY4OiBDSEVDSzogc3BhY2VzIHByZWZlcnJlZCBhcm91
bmQgdGhhdCAnKicgKGN0eDpWeFYpCiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDQ2ODog
Q0hFQ0s6IHNwYWNlcyBwcmVmZXJyZWQgYXJvdW5kIHRoYXQgJysnIChjdHg6VnhWKQogICAgWzMx
beKXj1swbSBjaGVja3BhdGNoLnBsOiA0Nzk6IENIRUNLOiBzcGFjZXMgcHJlZmVycmVkIGFyb3Vu
ZCB0aGF0ICcqJyAoY3R4OlZ4VikKICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogNDc5OiBD
SEVDSzogc3BhY2VzIHByZWZlcnJlZCBhcm91bmQgdGhhdCAnKycgKGN0eDpWeFYpCiAgICBbMzFt
4pePWzBtIGNoZWNrcGF0Y2gucGw6IDQ4MTogQ0hFQ0s6IHNwYWNlcyBwcmVmZXJyZWQgYXJvdW5k
IHRoYXQgJyonIChjdHg6VnhWKQogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA0ODE6IENI
RUNLOiBzcGFjZXMgcHJlZmVycmVkIGFyb3VuZCB0aGF0ICcrJyAoY3R4OlZ4VikKICAgIFszMW3i
l49bMG0gY2hlY2twYXRjaC5wbDogNTE0OiBDSEVDSzogVW5iYWxhbmNlZCBicmFjZXMgYXJvdW5k
IGVsc2Ugc3RhdGVtZW50CiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDYxMTogQ0hFQ0s6
IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcwogICAgWzMxbeKXj1swbSBj
aGVja3BhdGNoLnBsOiA2NTA6IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFy
ZW50aGVzaXMKICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogNjY1OiBDSEVDSzogQWxpZ25t
ZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzCiAgICBbMzFt4pePWzBtIGNoZWNrcGF0
Y2gucGw6IDY3NTogQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNp
cwogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA2ODk6IENIRUNLOiBBbGlnbm1lbnQgc2hv
dWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDog
Njk5OiBDSEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzCiAgICBb
MzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDcxNTogQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0
Y2ggb3BlbiBwYXJlbnRoZXNpcwogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiA3NTY6IENI
RUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKICAgIFszMW3il49b
MG0gY2hlY2twYXRjaC5wbDogODA1OiBDSEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVu
IHBhcmVudGhlc2lzCiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDkzNTogQ0hFQ0s6IEFs
aWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcwogICAgWzMxbeKXj1swbSBjaGVj
a3BhdGNoLnBsOiA5NTA6IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50
aGVzaXMKICAgIFszMW3il49bMG0gY2hlY2twYXRjaC5wbDogOTUzOiBDSEVDSzogQWxpZ25tZW50
IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzCiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gu
cGw6IDk3NTogQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcwog
ICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiAxMDAxOiBDSEVDSzogQWxpZ25tZW50IHNob3Vs
ZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzCiAgICBbMzFt4pePWzBtIGNoZWNrcGF0Y2gucGw6IDEw
MTg6IENIRUNLOiBBbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4gcGFyZW50aGVzaXMKICAgIFsz
MW3il49bMG0gY2hlY2twYXRjaC5wbDogMTEzMTogQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0
Y2ggb3BlbiBwYXJlbnRoZXNpcwogICAgWzMxbeKXj1swbSBjaGVja3BhdGNoLnBsOiAxMTU5OiBX
QVJOSU5HOiBEVCBjb21wYXRpYmxlIHN0cmluZyAibnV2b3RvbixtYTM1ZDEtbmFuZCIgYXBwZWFy
cyB1bi1kb2N1bWVudGVkIC0tIGNoZWNrIC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzLwoKUGxlYXNlIGZpeCB0aGVzZSB3YXJuaW5ncyBhbmQgY2hlY2tzLgoKWW91IG1pZ2h0IHdh
bnQgdG8gdXNlIC0tc3RyaWN0IGJ5IGRlZmF1bHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
