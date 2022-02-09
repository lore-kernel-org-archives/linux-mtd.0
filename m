Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879C2C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgzvYgKNII2bAuSK4BD/8JO2W4vyfQ29odvCaFOKjjk=; b=Fs0GTEac+H/TaI
	3oXztRJCzx5ad6mLPylaFngTryXf1D0J8dZxutdJmrFLBGFLSlnsbF1x0TWmUvPwFs4RYtHZTROY/
	D5QQVzhCyw+i8Fjz+ivfBXetScszLZ20Qi+lTApjP9uWnU+x+M+WZ/3mIpx3hSFylhSWpVObfTMVg
	9olMZfoSW/qGO7MEp8bpMQxZIQcebZykiMhEgnb+VlbUVf9JZ7JW4dM8NZ+c275KdwXbgggOLVxST
	vgco9chHoUoftNhnx1u+ZEBe5/KOiyCzbH93jZOfHCF6/DyjXUXtN2IBRfZoqVicf3olRlCW1zV+5
	Y5zghkyNgYXx33ReUQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHncq-000J6A-NA; Wed, 09 Feb 2022 14:07:16 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnck-000J3J-Sr
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 14:07:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1887B40009;
 Wed,  9 Feb 2022 14:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644415628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFd4Jm9GVCcXp1h6wfnUeSFs7Eqix0iSEKe+49FbexI=;
 b=jSJWS74p5j5+xT+MwPPEQpw2fPh9PNeUGUBSEnd2pe12T6yAtOFLrJ13olpNbfDAuE/eR1
 HSr+f0PoYvtQ5Z3tCpbRlm42B3jIBnvvvN11aXyEhyaOjVIkocFdjammvOD76OEKxtB35J
 CSNfMjn2nVFbPWUKbYHZGvPnAFoJddZyMMUVJT8iOJi06jL/p95vbzKiETQpJ4sIKwzG0c
 CyvuPZ1pMfupxorlbMzOJdecv0FYFl9hCjCjee8G3F5WeI51Sad+RwNyNI8/xyTFmAqSHK
 LoIsJsTRq1RMHBY863GhWbRg0MppttvvuECLrtGBouW1UgiRk4fS6QKqNOku0g==
Date: Wed, 9 Feb 2022 15:07:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nishanth Menon <nm@ti.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, <broonie@kernel.org>, <mhocko@suse.cz>,
 <sfr@canb.auug.org.au>, <linux-next@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <mm-commits@vger.kernel.org>, Roger Quadros
 <rogerq@kernel.org>, <linux-mtd@lists.infradead.org>, Uwe =?UTF-8?B?S2xl?=
 =?UTF-8?B?aW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Krzysztof
 Kozlowski <krzysztof.kozlowski@canonical.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Subject: Re: mmotm 2022-02-08-15-31 uploaded (drivers/mtd/nand/raw/Kconfig)
Message-ID: <20220209150703.253b16bd@xps13>
In-Reply-To: <20220209135439.qcyge32xinvazn43@chewer>
References: <20220208233156.E2CA6C004E1@smtp.kernel.org>
 <b18fc937-9cc2-bb7b-fb58-3ba2555371c7@infradead.org>
 <20220209090300.43241711@xps13>
 <20220209135439.qcyge32xinvazn43@chewer>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_060711_292741_35380FE1 
X-CRM114-Status: GOOD (  23.03  )
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

SGkgTmlzaGFudGgsCgpubUB0aS5jb20gd3JvdGUgb24gV2VkLCA5IEZlYiAyMDIyIDA3OjU0OjM5
IC0wNjAwOgoKPiBPbiAwOTowMy0yMDIyMDIwOSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhp
IFJhbmR5LAo+ID4gCj4gPiByZHVubGFwQGluZnJhZGVhZC5vcmcgd3JvdGUgb24gVHVlLCA4IEZl
YiAyMDIyIDIyOjMwOjIzIC0wODAwOgo+ID4gICAKPiA+ID4gT24gMi84LzIyIDE1OjMxLCBBbmRy
ZXcgTW9ydG9uIHdyb3RlOiAgCj4gPiA+ID4gVGhlIG1tLW9mLXRoZS1tb21lbnQgc25hcHNob3Qg
MjAyMi0wMi0wOC0xNS0zMSBoYXMgYmVlbiB1cGxvYWRlZCB0bwo+ID4gPiA+IAo+ID4gPiA+ICAg
IGh0dHBzOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vbW1vdG0vCj4gPiA+ID4gCj4gPiA+ID4gbW1v
dG0tcmVhZG1lLnR4dCBzYXlzCj4gPiA+ID4gCj4gPiA+ID4gUkVBRE1FIGZvciBtbS1vZi10aGUt
bW9tZW50Ogo+ID4gPiA+IAo+ID4gPiA+IGh0dHBzOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vbW1v
dG0vCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBpcyBhIHNuYXBzaG90IG9mIG15IC1tbSBwYXRjaCBx
dWV1ZS4gIFVwbG9hZGVkIGF0IHJhbmRvbSBob3BlZnVsbHkKPiA+ID4gPiBtb3JlIHRoYW4gb25j
ZSBhIHdlZWsuCj4gPiA+ID4gCj4gPiA+ID4gWW91IHdpbGwgbmVlZCBxdWlsdCB0byBhcHBseSB0
aGVzZSBwYXRjaGVzIHRvIHRoZSBsYXRlc3QgTGludXMgcmVsZWFzZSAoNS54Cj4gPiA+ID4gb3Ig
NS54LXJjWSkuICBUaGUgc2VyaWVzIGZpbGUgaXMgaW4gYnJva2VuLW91dC50YXIuZ3ogYW5kIGlz
IGR1cGxpY2F0ZWQgaW4KPiA+ID4gPiBodHRwczovL296bGFicy5vcmcvfmFrcG0vbW1vdG0vc2Vy
aWVzCj4gPiA+ID4gCj4gPiA+ID4gVGhlIGZpbGUgYnJva2VuLW91dC50YXIuZ3ogY29udGFpbnMg
dHdvIGRhdGVzdGFtcCBmaWxlczogLkRBVEUgYW5kCj4gPiA+ID4gLkRBVEUteXl5eS1tbS1kZC1o
aC1tbS1zcy4gIEJvdGggY29udGFpbiB0aGUgc3RyaW5nIHl5eXktbW0tZGQtaGgtbW0tc3MsCj4g
PiA+ID4gZm9sbG93ZWQgYnkgdGhlIGJhc2Uga2VybmVsIHZlcnNpb24gYWdhaW5zdCB3aGljaCB0
aGlzIHBhdGNoIHNlcmllcyBpcyB0bwo+ID4gPiA+IGJlIGFwcGxpZWQuICAgIAo+ID4gPiAKPiA+
ID4gb24gaTM4NjoKPiA+ID4gCj4gPiA+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNp
ZXMgZGV0ZWN0ZWQgZm9yIE9NQVBfR1BNQwo+ID4gPiAgIERlcGVuZHMgb24gW25dOiBNRU1PUlkg
Wz15XSAmJiBPRl9BRERSRVNTIFs9bl0KPiA+ID4gICBTZWxlY3RlZCBieSBbeV06Cj4gPiA+ICAg
LSBNVERfTkFORF9PTUFQMiBbPXldICYmIE1URCBbPXldICYmIE1URF9SQVdfTkFORCBbPXldICYm
IChBUkNIX09NQVAyUExVUyB8fCBBUkNIX0tFWVNUT05FIHx8IEFSQ0hfSzMgfHwgQ09NUElMRV9U
RVNUIFs9eV0pICYmIEhBU19JT01FTSBbPXldCj4gPiA+IAo+ID4gPiAKPiA+ID4gRnVsbCByYW5k
Y29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuICAKPiA+IAo+ID4gKyBVd2UsICsgSzMgcGVvcGxlICsg
S3J6eXN6dG9mICAKPiAKPiBUaGFua3MgZm9yIGxvb3BpbmcgbWUgaW4uCj4gCj4gPiAKPiA+IFV3
ZSBhbHJlYWR5IHJhaXNlZCB0aGUgaXNzdWUsIGFuZCB0aGlzIHdhcyBwcm9wb3NlZDoKPiA+IAo+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjIwMTI3MTA1NjUyLjEwNjM2
MjQtMS1taXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tL1QvICAKPiAKPiBJIHdpbGwgcmVzcG9uZCB0
byB0aGUgcGF0Y2guCj4gCj4gPiAKPiA+IE1heWJlIHdlIHNob3VsZCBoYXZlIGFkZGVkIEszIHBl
b3BsZSBpbiBDYyBidXQgdGhlaXIgTUFJTlRBSU5FUlMgZW50cnkKPiA+IGlzIGluY29tcGxldGUg
c28gZ2V0X21haW50YWluZXJzLnBsIGRpZCBub3QgaW1tZWRpYXRlbHkgZm91bmQgdGhlbS4gIAo+
IAo+IFdoYXQgYXJlIHdlIG1pc3NpbmcgdGhlcmU/CgpBY3R1YWxseSBub3RoaW5nIGlzIG1pc3Np
bmcsIEkgb3Zlcmxvb2tlZCB0aGUgZmlsZSBuYW1lLiBJIHRvdWNoZWQKYXJjaC9hcm02NC9LY29u
ZmlnLnBsYXRmb3JtcyBpbiBteSBwYXRjaCBhbmQgb2YgY291cnNlCmdldF9tYWludGFpbmVycy5w
bCBkaWRuJ3QgbG9vayBhdCB0aGUgc3ltYm9sIG93bmVycy4gSSBzaG91bGQgaGF2ZQpjaGVja2Vk
IHRoYXQgbXlzZWxmIG1hbnVhbGx5IGluIHRoZSBmaXJzdCBwbGFjZS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
