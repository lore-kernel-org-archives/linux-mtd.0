Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D369C54ED1
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tk66vFVZV4IXT9AxXOlywG3JghNhlJ/4aEDwIA548z4=; b=VNBwR6UA9jBzX8
	OUeEbOfp5I1gpsggpwKl4XPwzXL3EFSWcUy/GbniguiXlPZoNALFZBMOR72i/UwYU4wBlx/+mIPEn
	G6d2pdlXBu3z3AJksVuT9gFtLw71YcAbmFrImo+25r6Jvnk5dL/QpH8jQ79LrGQNUia9rPauhOqC7
	UV2yvXUXXta/1/wSmcRMsNhMO2acT35BxzGFNmMZ/q9OxQS8fTKK38Hlr6yyXJ3yyJC95OrCtoAvo
	QgEyCedaIsphbPbv4nufOxH9wVm3mjPAHrUKB9iddSvP5QMCBvmD6HX7FmrrQKAWSSaZQZm+RSSWn
	+MgkhlW5fFCeg2W7zYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU1p-00000004CF1-1tQP;
	Fri, 23 May 2025 15:09:45 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITb0-000000045a9-3Wo9
	for linux-mtd@lists.infradead.org;
	Fri, 23 May 2025 14:42:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BF6143E93;
	Fri, 23 May 2025 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748011320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSFnLqPW+tl6sHrtOhCJPYLdIIPpPKykLbxeoUP2BcA=;
	b=bnzEE4vT5y16PkwydBazGFiX9oeF8E8gnnWYCjcpjdqfsmhja1TWueJ24ZBC21l0esGzTH
	Nj8xhsCQhDWPyvE1zv5jp/hm0V+d12CS7HedfiohMvSiHuuVbrou7rxUSNAHyu/yecWej/
	O3kMvX5liYzvmaHVWsCCtb1We5KxRTzjWHELoJcRhE/w2mW3LNLfc6/6xLy55/rlEKBoUH
	73x1/sikXgai8TkUz1znjpV7oKmKWWJkEw9yK/jW+Gkez2tWnaqZJCv8HnvwtMbm5Guqcv
	/l3DGtVzRDWEB94Gb5BDJ9bmhaVJRQL+/p83WWVKRI8Vil4K4HY4WQTw5ij77w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org,  dregan@broadcom.com,
  bcm-kernel-feedback-list@broadcom.com,  florian.fainelli@broadcom.com,
  rafal@milecki.pl,  computersforpeace@gmail.com,  kamal.dasu@broadcom.com,
  dan.beygelman@broadcom.com,  william.zhang@broadcom.com,
  frieder.schrempf@kontron.de,  linux-kernel@vger.kernel.org,
  vigneshr@ti.com,  richard@nod.at,  bbrezillon@kernel.org,
  kdasu.kdev@gmail.com,  jaimeliao.tw@gmail.com,  kilobyte@angband.pl,
  jonas.gorski@gmail.com,  dgcbueu@gmail.com
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
In-Reply-To: <20250521080325.581366-1-noltari@gmail.com> (=?utf-8?Q?=22?=
 =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez?=
	Rojas"'s message of "Wed, 21 May 2025 10:03:25 +0200")
References: <20250521080325.581366-1-noltari@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 23 May 2025 16:41:58 +0200
Message-ID: <87wma74ceh.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeluddvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdelkedrtddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepnhholhhtrghrihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepughrvghgrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhor
 ggutghomhdrtghomhdprhgtphhtthhopehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopegtohhmphhuthgvrhhsfhhorhhpvggrtggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhgrmhgrlhdruggrshhusegsrhhorggutghomhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_074203_031616_F5F3A511 
X-CRM114-Status: GOOD (  16.72  )
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

T24gMjEvMDUvMjAyNSBhdCAxMDowMzoyNSArMDIsIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8
bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlOgoKPiBDb21taXQgM2M4MjYwY2U3NjYzICgibXRkOiBy
YXduYW5kOiBicmNtbmFuZDogZXhlY19vcCBpbXBsZW1lbnRhdGlvbiIpCj4gcmVtb3ZlZCBsZWdh
Y3kgaW50ZXJmYWNlIGZ1bmN0aW9ucywgYnJlYWtpbmcgPCB2NS4wIGNvbnRyb2xsZXJzIHN1cHBv
cnQuCj4gSW4gb3JkZXIgdG8gZml4IG9sZGVyIGNvbnRyb2xsZXJzIHdlIG5lZWQgdG8gYWRkIGFu
IGFsdGVybmF0aXZlIGV4ZWNfb3AKPiBpbXBsZW1lbnRhdGlvbiB3aGljaCBkb2Vzbid0IHJlbHkg
b24gbG93IGxldmVsIHJlZ2lzdGVycy4KPgo+IEZpeGVzOiAzYzgyNjBjZTc2NjMgKCJtdGQ6IHJh
d25hbmQ6IGJyY21uYW5kOiBleGVjX29wIGltcGxlbWVudGF0aW9uIikKPiBTaWduZWQtb2ZmLWJ5
OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+IFJldmlld2Vk
LWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDIyMiArKysrKysrKysrKysrKysrKysr
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjE1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4KPiAgdjU6IGFkZCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBNaXF1w6hsIFJheW5hbDoKPiAgIC0g
TWVudGlvbiBhbmQgZXhwbGFpbiBsZWdhY3kgaW4gbmF0aXZlX2NtZF9jb252Lgo+ICAgLSBFT1BO
T1RTVVBQIGluc3RlYWQgb2YgRUlOVkFMIGZvciBpbnN0ci0+dHlwZSBlbHNlLgo+ICAgLSBJbXBs
ZW1lbnQgbWlzc2luZyBjaGVja19vbmx5IGZ1bmN0aW9uYWxpdHkuCj4KPiAgdjQ6IGFkZCBjaGFu
Z2VzIHJlcXVlc3RlZCBieSBKb25hcyBHb3Jza2k6Cj4gICAtIEFkZCBtaXNzaW5nIGJyZWFrcyBp
biBicmNtbmFuZF9leGVjX2luc3RydWN0aW9uc19sZWdhY3kuCj4gICAtIFJlc3RvcmUgbWlzc2lu
ZyByZXQgYXNzaWdubWVudCBpbiBicmNtbmFuZF9leGVjX29wLgo+Cj4gIHYzOiBhZGQgY2hhbmdl
cyByZXF1ZXN0ZWQgYnkgRmxvcmlhbiBhbmQgb3RoZXIgaW1wcm92ZW1lbnRzOgo+ICAgLSBBZGQg
YXNzb2NpYXRpdmUgYXJyYXkgZm9yIG5hdGl2ZSBjb21tYW5kIGNvbnZlcnNpb24uCj4gICAtIEFk
ZCBmdW5jdGlvbiBwb2ludGVyIHRvIGJyY21uYW5kX2NvbnRyb2xsZXIgZm9yIGV4ZWNfaW5zdHIK
PiAgICAgZnVuY3Rpb25hbGl0eS4KPiAgIC0gRml4IENNRF9CTE9DS19FUkFTRSBhZGRyZXNzLgo+
ICAgLSBEcm9wIE5BTkRfQ01EX1JFQURPT0Igc3VwcG9ydC4KPgo+ICB2MjogbXVsdGlwbGUgaW1w
cm92ZW1lbnRzOgo+ICAgLSBVc2UgcHJvcGVyIG5hdGl2ZSBjb21tYW5kcyBmb3IgY2hlY2tzLgo+
ICAgLSBGaXggTkFORF9DTURfUEFSQU0vTkFORF9DTURfUk5ET1VUIGFkZHIgY2FsY3VsYXRpb24u
Cj4gICAtIFJlbW92ZSBob3N0LT5sYXN0X2FkZHIgdXNhZ2UuCj4gICAtIFJlbW92ZSBzZWN0b3Jf
c2l6ZV8xayBzaW5jZSBpdCBvbmx5IGFwcGxpZXMgdG8gdjUuMCsgY29udHJvbGxlcnMuCj4gICAt
IFJlbW92ZSBicmNtbmFuZF93cCBzaW5jZSBpdCBkb2Vzbid0IGV4aXN0IGZvciA8IHY1LjAgY29u
dHJvbGxlcnMuCj4gICAtIFVzZSBqIGluc3RlYWQgb2YgaSBmb3IgZmxhc2hfY2FjaGUgbG9vcC4K
PgoKLi4uCgo+ICtzdGF0aWMgaW50IGJyY21uYW5kX2NoZWNrX2luc3RydWN0aW9uc19sZWdhY3ko
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiArCQkJCQkgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9v
cGVyYXRpb24gKm9wKQo+ICt7Cj4gKwljb25zdCBzdHJ1Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHI7
Cj4gKwl1bnNpZ25lZCBpbnQgaTsKPiArCXU4IGNtZDsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwg
b3AtPm5pbnN0cnM7IGkrKykgewo+ICsJCWluc3RyID0gJm9wLT5pbnN0cnNbaV07Cj4gKwo+ICsJ
CXN3aXRjaCAoaW5zdHItPnR5cGUpIHsKPiArCQljYXNlIE5BTkRfT1BfQ01EX0lOU1RSOgo+ICsJ
CQljbWQgPSBuYXRpdmVfY21kX2NvbnZbaW5zdHItPmN0eC5jbWQub3Bjb2RlXTsKPiArCQkJaWYg
KGNtZCA9PSBDTURfTk9UX1NVUFBPUlRFRCkKPiArCQkJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAr
CQkJYnJlYWs7Cj4gKwkJY2FzZSBOQU5EX09QX0FERFJfSU5TVFI6Cj4gKwkJY2FzZSBOQU5EX09Q
X0RBVEFfSU5fSU5TVFI6CgpObyBOQU5EX09QX0RBVEFfT1VUX0lOU1RSPwoKPiArCQljYXNlIE5B
TkRfT1BfV0FJVFJEWV9JTlNUUjoKPiArCQkJYnJlYWs7Cj4gKwkJZGVmYXVsdDoKPiArCQkJcmV0
dXJuIC1FT1BOT1RTVVBQOwo+ICsJCX0KPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKUmVz
dCBsZ3RtLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
