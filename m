Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83002C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnWJ8MoVH79oXADh7Nd87HVdN3XRVhtD9nrcPjsQkuY=; b=4+l+FibysqNGaP
	X31OZU3qwuxLcvtNFqaoB4O1hJ6WCmiqZ0w9QcYz+V4nWR5MNAQ5+n18uN3AoIxSTyiHaUCyvhSwJ
	19wHyZLG/PyiMs6ps1GBRIthdyZ/3mVF4A2KIksOQrZzXfIIV8gA5C8qAJJAsrKk+W1gZKvD1q2It
	kFl7866JHq1s6werg2/5TkurEaPSi5PvzO2H7yqIOQKtHQO3FbcoHoRjRajGYcbS5MZHafh4zLKL4
	P2v78c6Bx0U+0AnGqkIOXZrdb0H0viomIM6aTknfFIG4veJ3XbW/V6Px/hBGZmgiJtFs9J/ZBq36Y
	WQE/ci+EJZw31SnHL0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKbSA-009FkE-23; Thu, 17 Feb 2022 07:43:50 +0000
Received: from 6.mo576.mail-out.ovh.net ([46.105.50.107])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKbS6-009Fj5-BR
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 07:43:48 +0000
Received: from player157.ha.ovh.net (unknown [10.108.4.136])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 1E8A321C02
 for <linux-mtd@lists.infradead.org>; Thu, 17 Feb 2022 07:43:37 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl
 [194.187.74.233]) (Authenticated sender: rafal@milecki.pl)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id B93F9278408AA;
 Thu, 17 Feb 2022 07:43:24 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0043059cd4e-4bc9-4526-8836-aad3687309fe,
 6571130906B249472519E689D0E5D89D5D0951FF) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <3be13bc2-f8b1-193b-9a36-92d4336d9d28@milecki.pl>
Date: Thu, 17 Feb 2022 08:43:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] dt-bindings: mtd: partitions: convert Broadcom's TRX to
 the json-schema
To: Rob Herring <robh@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>
References: <20220216104126.31284-1-zajec5@gmail.com>
 <1645070363.930966.2266015.nullmailer@robh.at.kernel.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <1645070363.930966.2266015.nullmailer@robh.at.kernel.org>
X-Ovh-Tracer-Id: 18205520019237874606
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeetledugeejtdevheetieduhefgtedvgefftddvfedvieevjeegleffleegtdeunecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_234346_736951_11C7F7FE 
X-CRM114-Status: GOOD (  13.22  )
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

SGkgUm9iLAoKT24gMTcuMDIuMjAyMiAwNDo1OSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gV2Vk
LCAxNiBGZWIgMjAyMiAxMTo0MToyNiArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+PiBG
cm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Cj4+IFRoaXMgaGVscHMg
dmFsaWRhdGluZyBEVFMgZmlsZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNr
aSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2JyY20sdHJ4LnR4dCAgICAgIHwgNDIgLS0tLS0tLS0tLS0tLS0tCj4+ICAgLi4uL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL2JyY20sdHJ4LnlhbWwgICAgIHwgNTEgKysrKysrKysrKysrKysr
KysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25z
KC0pCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLHRyeC50eHQKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sdHJ4
LnlhbWwKPj4KPiAKPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgRFRfQ0hFQ0tF
Ul9GTEFHUz0tbSBkdF9iaW5kaW5nX2NoZWNrJwo+IG9uIHlvdXIgcGF0Y2ggKERUX0NIRUNLRVJf
RkxBR1MgaXMgbmV3IGluIHY1LjEzKToKPiAKPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4g
Cj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPiAvYnVpbGRzL3JvYmhlcnJpbmcvbGlu
dXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9saW5rc3lzLG5zLXBhcnRpdGlvbnMuZXhhbXBsZS5kdC55YW1sOiBwYXJ0aXRpb25AMjAw
MDAwOiBjb21wYXRpYmxlOjA6ICdicmNtLHRyeCcgd2FzIGV4cGVjdGVkCj4gCUZyb20gc2NoZW1h
OiAvYnVpbGRzL3JvYmhlcnJpbmcvbGludXgtZHQtcmV2aWV3L0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLHRyeC55YW1sCj4gL2J1aWxkcy9yb2Jo
ZXJyaW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvbGlua3N5cyxucy1wYXJ0aXRpb25zLmV4YW1wbGUuZHQueWFtbDogcGFy
dGl0aW9uQDIwMDAwMDogY29tcGF0aWJsZTogWydsaW5rc3lzLG5zLWZpcm13YXJlJywgJ2JyY20s
dHJ4J10gaXMgdG9vIGxvbmcKPiAJRnJvbSBzY2hlbWE6IC9idWlsZHMvcm9iaGVycmluZy9saW51
eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2JyY20sdHJ4LnlhbWwKCmNvdWxkIHlvdSBhZHZpc2UgdGhlIGJlc3Qgd2F5IHRvIHNvbHZl
IHRoYXQ/CgoKMS4gY29tcGF0aWJsZSA9ICJicmNtLHRyeCI7CgpNb3N0IEJyb2FkY29tIDQ3eHgg
ZGV2aWNlcyBoYXZlIG9uZSBmaXJtd2FyZSBwYXJ0aXRpb24gdXNpbmcgVFJYIGZvcm1hdC4KU28g
d2Ugd2FudCBzb21ldGhpbmcgbGlrZToKCnBhcnRpdGlvbkAyMDAwMDAgewogICAgICAgICBjb21w
YXRpYmxlID0gImJyY20sdHJ4IjsKICAgICAgICAgbGFiZWwgPSAiZmlybXdhcmUiOwogICAgICAg
ICByZWcgPSA8MHgyMDAwMDAgMHhmMDAwMDA+Owp9OwoKCjIuIGNvbXBhdGlibGUgPSAibGlua3N5
cyxucy1maXJtd2FyZSIsICJicmNtLHRyeCI7CgpMaW5rc3lzIGhhcyB0d28gZmlybXdhcmUgcGFy
dGl0aW9ucyBhbmQgb3BlcmF0aW5nIHN5c3RlbSBoYXMgdG8gY2hvb3NlCnRoZSByaWdodCBvbmUg
dG8gcHJvY2VlZCB3aXRoICh0byBwYXJzZSBmb3Iga2VybmVsICYgcm9vdGZzKS4gVGhleSBzdGls
bAp1c2UgVFJYIGZvcm1hdCB0aG91Z2guIFNvIHdlIHdhbnQgc29tZXRoaW5nIGxpa2U6CgpwYXJ0
aXRpb25AMjAwMDAwIHsKICAgICAgICAgY29tcGF0aWJsZSA9ICJsaW5rc3lzLG5zLWZpcm13YXJl
IiwgImJyY20sdHJ4IjsKICAgICAgICAgcmVnID0gPDB4MjAwMDAwIDB4ZjAwMDAwPjsKfTsKCnBh
cnRpdGlvbkAxMTAwMDAwIHsKICAgICAgICAgY29tcGF0aWJsZSA9ICJsaW5rc3lzLG5zLWZpcm13
YXJlIiwgImJyY20sdHJ4IjsKICAgICAgICAgcmVnID0gPDB4MTEwMDAwMCAweGYwMDAwMD47Cn07
CgoKSSB0aG91Z2h0IG9mIG1vdmluZyAibGlua3N5cyxucy1maXJtd2FyZSIgZG9jdW1lbnRhdGlv
biB0byB0aGUKYnJjbSx0cngueWFtbCBidXQgaXRzIHBhcnQgb2YgdGhlIGNvbXBhdGlibGUgPSAi
bGlua3N5cyxucy1wYXJ0aXRpb25zIjsKKHBhcmVudCBub2RlKSBzbyBpdCBkb2Vzbid0IGZpdCB0
aGVyZSB3ZWxsLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
