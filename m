Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E8EC4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Dec 2022 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHgFxxi5hR5BTKx40qgH4Kb7yTQbjLY7QelppDN9ijo=; b=UzSDd1Y3xSYGe5
	/JJsNEVe16Qk00YXg+4KNtm7oLK+pt6MApSD+TYZ35h8pqOOhx3TP3qSF3uUbKu9MYvmbEFbkWzwh
	xSOWigahBI56A3DF7MIW3OE/+QYVo7SR4Jj6DLpfVetbxRLvo2kc38t6IB7SgF/ARspIBHs0ej+NV
	BNHdi9wryUqDmMOXPgNBRAfGVwKZYGYnKqUaII6wlqck2lJohbyo0HfqIRvhJ7hEPsH+a5oRjgSUn
	ELbpM29Ke9ZdBXW+76t1mwh/unN85ZQcnJpR3cNetYw0muw3fzNYiMvpppqeG2hUpJk6lYDMekeYS
	ch7R5BK4skPfE5TuMjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oSb-007uPu-Kg; Sun, 04 Dec 2022 12:51:09 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oRb-007thb-5L; Sun, 04 Dec 2022 12:50:09 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 02F81852D9;
	Sun,  4 Dec 2022 13:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1670158203;
	bh=9958Kz0WUBI9KPlNJZhUoXLQZhLb+n3wPGuY1e4qLCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D2JVdSqCwuajzEHj24yafBggZ+ANz+iyIMLGZviIA7lQwnzcz4y5Nu22diAh+QpQq
	 uN+rhMEaZ3fDYsNk3roUiML/fm2jtL4tyakjrczk8YZdYJ1q5FH9F73icI5lwsoMJz
	 A6GsVR+h5GSQ4inn8xVJI6BVGy9ktK5kq8hN/r5SCbYRCFR6slnxJ7JDdveY2aYSWg
	 3x7K5KeTr0Roqlt8OYxtqxG9Z9tNQGHBjvCy9VwlsuUotCFms163bKqjOmQ0osLRLF
	 6SD64HQd252cRAofRZkiVVURHOdgVXBFJP2Q5TFLfcN8a8nIvCbgY2r8D97BPQw4r4
	 OCj8TTbnPTbHQ==
Message-ID: <cc497c19-050a-b3c2-d3e2-640c07338ff6@denx.de>
Date: Sun, 4 Dec 2022 13:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <f6417f32-cf30-2e01-701e-ed1634055c6a@leemhuis.info>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f6417f32-cf30-2e01-701e-ed1634055c6a@leemhuis.info>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_045007_471310_86E6BDA6 
X-CRM114-Status: GOOD (  18.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTIvMi8yMiAxNjo1NiwgVGhvcnN0ZW4gTGVlbWh1aXMgd3JvdGU6Cj4gT24gMDIuMTIuMjIg
MTU6MzEsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAxMi8yLzIyIDE1OjA1LCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+PiBbLi4uXQo+Pj4gMy4gVG8gZml4IHRoZSBjdXJyZW50IHNpdHVhdGlvbjoK
Pj4+ICDCoMKgwqAgSW1tZWRpYXRlbHkgcmV2ZXJ0IGNvbW1pdCAoYW5kIHByZXZlbnQgaXQgZnJv
bSBiZWluZyBiYWNrcG9ydGVkKToKPj4+ICDCoMKgwqAgNzUzMzk1ZWExZTQ1ICgiQVJNOiBkdHM6
IGlteDc6IEZpeCBOQU5EIGNvbnRyb2xsZXIgc2l6ZS1jZWxscyIpCj4+PiAgwqDCoMKgIFRoaXMg
d2F5IHlvdXIgb3duIGJvb3QgZmxvdyBpcyBmaXhlZCBpbiB0aGUgc2hvcnQgdGVybS4KPj4KPj4g
SGVyZSBJIGRpc2FncmVlLCB0aGUgZml4IGlzIGNvcnJlY3QgYW5kIEkgdGhpbmsgd2Ugc2hvdWxk
bid0IHByb2xpZmVyYXRlCj4+IGluY29ycmVjdCBEVHMgd2hpY2ggZG9uJ3QgbWF0Y2ggdGhlIGJp
bmRpbmcgZG9jdW1lbnQuIFJhdGhlciwgaWYgYQo+PiBib290bG9hZGVyIGdlbmVyYXRlcyBpbmNv
cnJlY3QgKG5ldykgRFQgZW50cmllcywgSSBiZWxpZXZlIHRoZSBkcml2ZXIKPj4gc2hvdWxkIGlt
cGxlbWVudCBhIGZpeHVwIGFuZCB3YXJuIHVzZXIgYWJvdXQgdGhpcy4gUEMgZG9lcyB0aGF0IGFz
IHdlbGwKPj4gd2l0aCBicm9rZW4gQUNQSSB0YWJsZXMgYXMgZmFyIGFzIEkgY2FuIHRlbGwuCj4g
Cj4gV2VsbCwgdGhhdCBtaWdodCBiZSB0aGUgcmlnaHQgc29sdXRpb24gaW4gdGhlIGxvbmcgcnVu
LCB0aGF0J3MgdXAgZm9yCj4gb3RoZXJzIHRvIGRlY2lkZSwgYnV0IHdlIG5lZWQgdG8gZml4IHRo
aXMgKnF1aWNrbHkqLiBGb3IgdHdvIHJlYXNvbnMKPiBhY3R1YWxseTogdGhlIDYuMSByZWxlYXNl
IGlzIG5lYXIgYW5kIHRoZSBjaGFuZ2Ugd2FzIGJhY2twb3J0ZWQgdG8KPiBzdGFibGUgYWxyZWFk
eS4KPiAKPiBGb3IgZGV0YWlscyB3cnQgdG8gdGhlICJxdWlja2x5Iiwgc2VlICJQcmlvcml0aXpl
IHdvcmsgb24gZml4aW5nCj4gcmVncmVzc2lvbnMiIGhlcmU6Cj4gaHR0cHM6Ly9kb2NzLmtlcm5l
bC5vcmcvcHJvY2Vzcy9oYW5kbGluZy1yZWdyZXNzaW9ucy5odG1sCj4gCj4gSU9XOiBJZGVhbGx5
IGl0IHNob3VsZCBiZSBmaXhlZCBieSBTdW5kYXkuCj4gCj4gSSdsbCBoZW5jZSBsaWtlbHkgc29v
biB3aWxsIHBvaW50IExpbnVzIHRvIHRoaXMgYW5kIHN1Z2dlc3QgdG8gcmV2ZXJ0Cj4gdGhpcywg
dW5sZXNzIHRoZXJlIGFyZSBzdHJvbmcgcmVhc29ucyBhZ2FpbnN0IHRoYXQgb3Igc29tZSBzb3J0
IG9mCj4gYWdyZWVtZW50IG9uIGEgYmV0dGVyIHNvbHV0aW9uLgoKWW91IG1pZ2h0IHdhbnQgdG8g
d2FpdCB1bnRpbCBldmVyeW9uZSBpcyBiYWNrIG9uIE1vbmRheSwgdGhlIGRpc2N1c3Npb24gCmlz
IHN0aWxsIG9uZ29pbmcsIGJ1dCBpdCBzZWVtcyB0byBiZSBnZXR0aW5nIHRvIGEgY29uY2x1c2lv
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
