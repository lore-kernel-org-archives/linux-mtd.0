Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D935C3ABAA
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JRpU89QpARR/3Q/OBQwXzFf1zGkx0ik7kAZu0AreTpY=; b=Tj31OZC7Nx6YSG
	Vlf8UdwS1zVYuCjS4aA1DQcJ2xO9VgfSPgeIvV1xMoJ6rKZvIr+zQeDFNeCkcKznBz1MVkxXfFuct
	8pUP4b91nbDG6M3+KJa5rokGI1K6A2GCpzdfrTj8OV5J3D/O5xGl2T2OnL/kVwD+vz21A1J9CN9kG
	9I1xwB12DtHLLgobm73V13bjwAXOvXR1qmCKZ85+9uLTUoTFbxsAHxCYMSKdds7Mbh/MSNFSGCtXJ
	jWtHK3ToSfedksv1X6WoQsDM7fVKNe30NrWOWKo9ZWj4cWrV7fCjAlpN6d7x+leX9S1HmfNggmV4/
	1a0QDZfkrxV1c5VjjH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hCT-0000000979h-0BG7;
	Tue, 29 Apr 2025 09:24:25 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hCP-0000000978R-28B3
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:24:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F5481FCE7;
	Tue, 29 Apr 2025 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEZ0/TGAvSoNsUalpNLb8aLo8LMMcOANkTCZwKQ6Zkk=;
	b=lwQmXdwaoauJ6hEcJAvn5jgXfWSB3TfZJZ9U+eEaK7Veri0FeQAOuFpHyHe3NbnvI5r80G
	FCuKeZSaabwYzvgSsKSspZzQZ/Ly1PnLR53+yfA2zYaB8j4tWsGZFJ341nI+XcS96jSHmL
	Lju6igRcOH72VNzulesEfHI3r0exkCo+Whx0vTEX31FDAsJTbz/buG5uCViioezGPxFaLc
	xDWiZYGqzPNsWKlbxci8IP6bSUw+rJvr2Xdnv8Md16zoqfJ5OOo+dXQyyYlsMd/W5rC2J+
	j09uDMcXydNFRORaDYOu1Tw+mfMDxXo32FWlxN+Vd0kdsNLAArZoAH4czRkCuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250320-loongson1-nand-v14-0-2fef37c8607f@gmail.com>
References: <20250320-loongson1-nand-v14-0-2fef37c8607f@gmail.com>
Subject: Re: [PATCH v14 0/2] Add support for Loongson-1 NAND
Message-Id: <174591865038.993381.4352536787925323902.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:24:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieelgfehtdejteduhffhvdduueetfeettdejfeehkeetiefhgfevhfeuheffleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022421_724114_7472B549 
X-CRM114-Status: UNSURE (   8.57  )
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

T24gVGh1LCAyMCBNYXIgMjAyNSAxODozMTozNiArMDgwMCwgS2VndWFuZyBaaGFuZyB3cm90ZToK
PiBBZGQgdGhlIGRyaXZlciBhbmQgZHQtYmluZGluZyBkb2N1bWVudCBmb3IgTG9vbmdzb24tMSBO
QU5ELgo+IAo+IENoYW5nZXMgaW4gdjE0Ogo+IC0gQ2xlYW4gdXAgdW5uZWNlc3NhcnkgcHJpbnQg
bWVzc2FnZXMgaW4gdGhlIGRyaXZlci4KPiAtIFNvbWUgbWlub3IgcmVsYXRlZCBhZGp1c3RtZW50
cy4KPiAtIExpbmsgdG8gdjEzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMzA1LWxv
b25nc29uMS1uYW5kLXYxMy0wLWE1YmFjMjE2MzFjZEBnbWFpbC5jb20KPiAKPiBbLi4uXQoKQXBw
bGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzJdIGR0LWJpbmRpbmdzOiBtdGQ6IEFkZCBM
b29uZ3Nvbi0xIE5BTkQgQ29udHJvbGxlcgogICAgICBjb21taXQ6IGVmZjRlMDRjODkyNzc0YjFj
ZjdjZTQzYWZiYjE4NmZmMGJlODcwYzAKWzIvMl0gbXRkOiByYXduYW5kOiBBZGQgTG9vbmdzb24t
MSBOQU5EIENvbnRyb2xsZXIgRHJpdmVyCiAgICAgIGNvbW1pdDogZDJkMTBlZGUwNGIxNjcxZGM0
NzYyNDc5YTJkMDZmMTgzYWFhZmJiYQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24g
bXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0
aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
