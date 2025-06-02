Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0190C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 14:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB4Y/GUvjWsXvQ7OzaLjrslh2uZrneN9CfLmnRCwNcw=; b=2bDzKj5v1exP+0
	diASuawXCJ3+6jB6VZCrPOT12MfLjsdotx17VZrGF6ZaJ9TiPPqLSdPwyBVsnMkNEUwZV3YFQIMUO
	Zu+cGf8+TNpdKaSuzT7dHgytQo9I36nYq8vB8Dn6UzeheSHeIJ0dE6NWCKbuRzilr/r52mCONKalZ
	tT1/HsryjBOWU3cDKntB9GsO2tdZAdip7Nx25DLVQtujXPjn6cx/etTjNc8NHL5z0+0RYSQLi0fvz
	XjxDdDYlE1/3TLBND4B6UhJF/n/ih8LeNyMYDmNqnlseY5fcjNhXHLs8T4wNsm9R8qnGlhM3gnwEz
	kf7SSOjdJMQwTJe99JuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM60t-00000007c23-3HYY;
	Mon, 02 Jun 2025 14:19:43 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM60r-00000007c0i-17WY
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 14:19:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B1143917;
	Mon,  2 Jun 2025 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748873977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev6iNL22PFHIL/H7k7mv5eeLl0WdLTXXN8qyBlvf9KQ=;
	b=Yhcjc4DxVpktZG2sfeGOKAu/dtCMwVl5FNgFFfgFjN3slTiJUtJJF+ikpi/fX3QH+OYtKA
	9KL9rvadfV5+7ugK0PxfdB8Zj8yPYzfxIQ3WbjmPn8JeJCRXuvq0c5Ret7yYt95QYsuny3
	0uemBmiFPhwloDZrclMZfGRm5HEvxyzHIiFB2rp4ltO2HWaSMYUuPvPLdh6FXpDq3EQf/u
	UCT/Ywvwgng4Z8SP13e8Qf98i9yx7h8bvtyu9NOV3ZGqviB/DVS4Ez7+7SeuOf1LqJmpaE
	sHxb7/R1CrfVnwTbNR7+YL/TftLazYh+CdIOLXUQ3sEcjmSiK02soKfLrKvkfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  bcm-kernel-feedback-list@broadcom.com,  william.zhang@broadcom.com,
  anand.gore@broadcom.com,  florian.fainelli@broadcom.com,
  kamal.dasu@broadcom.com,  dan.beygelman@broadcom.com,  =?utf-8?Q?=C3=81l?=
 =?utf-8?Q?varo_Fern=C3=A1ndez?=
 Rojas <noltari@gmail.com>,  rafal@milecki.pl,
  computersforpeace@gmail.com,  frieder.schrempf@kontron.de,
  vigneshr@ti.com,  richard@nod.at,  bbrezillon@kernel.org,
  kdasu.kdev@gmail.com,  jaimeliao.tw@gmail.com,  kilobyte@angband.pl,
  jonas.gorski@gmail.com,  dgcbueu@gmail.com,  dregan@mail.com
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
In-Reply-To: <20250530034713.4165309-1-dregan@broadcom.com> (David Regan's
	message of "Thu, 29 May 2025 20:46:59 -0700")
References: <20250530034713.4165309-1-dregan@broadcom.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Jun 2025 16:19:35 +0200
Message-ID: <87ecw2ns3s.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeeltdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepughrvghgrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsr
 hhorggutghomhdrtghomhdprhgtphhtthhopeifihhllhhirghmrdiihhgrnhhgsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegrnhgrnhgurdhgohhrvgessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_071941_621685_A7F35A23 
X-CRM114-Status: UNSURE (   6.16  )
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

T24gMjkvMDUvMjAyNSBhdCAyMDo0Njo1OSAtMDcsIERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRj
b20uY29tPiB3cm90ZToKCj4gQ3VycmVudGx5IHdlIGF0dGVtcHQgdG8gZ2V0IHRoZSBhbW91bnQg
b2YgZmxpcHBlZCBiaXRzIGZyb20gYSBoYXJkd2FyZQo+IGxvY2F0aW9uIHdoaWNoIGlzIHJlc2V0
IG9uIGV2ZXJ5IHN1YnBhZ2UuIEluc3RlYWQgb2J0YWluIHRvdGFsIGZsaXBwZWQKPiBiaXRzIHN0
YXQgZnJvbSBoYXJkd2FyZSBhY2N1bXVsYXRvci4gSW4gYWRkaXRpb24gaWRlbnRpZnkgdGhlIGNv
cnJlY3QKPiBtYXhpbXVtIHN1YnBhZ2UgY29ycmVjdGVkIGJpdHMuCgpUaGlzIGNoYW5nZSBkb2Vz
IG5vdCBmZWVsIGNvcnJlY3QuIFdlIGdhdGhlciB0d28gc3RhdGlzdGljczoKLSB0aGUgbWF4aW11
bSBudW1iZXIgb2YgYml0ZmxpcHMgY29ycmVjdGVkIGluIGEgc2luZ2xlIEVDQyBjaHVuawotIHRo
ZSB0b3RhbCBudW1iZXIgb2YgYml0ZmxpcHMgYW1vbmcgdGhlIHdob2xlIHBhZ2UKClRoZSBtb3N0
IGltcG9ydGFudCBvbmUgaXMgdGhlIGZvcm1lciwgYmVjYXVzZSBpdCBtYXkgdHJpZ2dlciB3ZWFy
CmxldmVsbGluZyBmcm9tIHRoZSB0b3AgbGF5ZXIgKFVCSSwgdXN1YWxseSkuIEl0IGZlZWxzIGxp
a2UgeW91IGFyZQpicmVha2luZyB0aGlzLCBhbSBJIHdyb25nPyBXb3VsZCB5b3UgbWluZCB0byBi
ZSBtb3JlIGV4cGxpY2l0IG90aGVyd2lzZT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
