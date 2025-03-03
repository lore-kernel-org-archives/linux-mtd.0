Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7716EC282C5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uHShDVFkU5liGYwN7ZvaZ00686JWOkTPJFNPElxQwY=; b=gOqEJzt42Gzfin
	WB8hkUFmXcPgRwAs/PZQs/onB7SwFfJLZB5YWBH1zILxWOTswOIM28RN89qhZoPA1AMsPMPky66eD
	Ddyt1flKr1AfOWptY6ZyqL2dZgF1AIRZ7NYIDB3CzIAj3q35q71uTr+PQ0BspJcA7MrvP+oqU+Ntd
	JJUgAynOygZf9DQvS2rUov5s2UfIRmFiSVFFMQpfYLTrMzeVMD2WQDJcaZz9Wa3gm+a4TmiZymEcl
	MkbMqlc5uv4Rc+SPxif9tJF/z9/lLjQkTFSvFYfgX3gN8SCF6uI1IYx+pmUHjYiZDICM8DSOrEEcB
	hPFhU2preVINdnBx3srg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4gN-00000000hvS-47iu;
	Mon, 03 Mar 2025 12:14:03 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3vU-00000000XpK-1VO8
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 11:25:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F1F54341A;
	Mon,  3 Mar 2025 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741001134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B40IpQiU2fM+pVK7wquDYMb2HsNMGEC55LxsvTQcN4s=;
	b=BkjwN4/tsxmaO4+R7FAMmi485T6901iwWzyz1XQv40fA/bnC1/8MfN0e/DtKEnYmbV0ZQx
	KTmsVFoZYp5BJfaliwDBG7BiQMIAQE5waOKMctsSOMnNTH2uVUlSbiw1yo/8ZKIGIAjLQx
	zeIwltgkKYWLfJxx+9yo363ujP5Q8P86Ay3D01CuyCz7yBe19ek8111LbZHSc20hFTnXbO
	VoyWopf8T38LsZw0kFjnFpnVUWgNeCdqFqigmaBt+qXT5gkWRhSIZ8Zo+AMheKoN4h6AZR
	ZGxSBCQJkP7TX2uzMASAIOf5LCcrdPEzxhv3Iz2FOSZOd59fB2p/3zg9xNuMBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-tegra@vger.kernel.org,  linux-mtd@lists.infradead.org,  Jonathan
 Hunter <jonathanh@nvidia.com>,  Lucas Stach <dev@lynxeye.de>,  Richard
 Weinberger <richard@nod.at>,  Stefan Agner <stefan@agner.ch>,  Thierry
 Reding <thierry.reding@gmail.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  LKML <linux-kernel@vger.kernel.org>,  kernel-janitors@vger.kernel.org,
  Qasim Ijaz <qasdev00@gmail.com>,  Natalie Vock <natalie.vock@gmx.de>
Subject: Re: mtd: rawnand: tegra: Simplify maximum determination in
 tegra_nand_setup_timing()
In-Reply-To: <10afda2a-4c52-47a8-bdfd-4bfd7bd9cb34@web.de> (Markus Elfring's
	message of "Mon, 3 Mar 2025 12:15:25 +0100")
References: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
	<87pliy9yyv.fsf@bootlin.com>
	<0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de>
	<87h64a9y04.fsf@bootlin.com>
	<10afda2a-4c52-47a8-bdfd-4bfd7bd9cb34@web.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Mar 2025 12:25:33 +0100
Message-ID: <878qpm9x02.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelledtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopeguvghvsehlhihngigvhigvrdguv
 gdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehsthgvfhgrnhesrghgnhgvrhdrtghhpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_032536_860644_C60485EE 
X-CRM114-Status: UNSURE (   5.53  )
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

T24gMDMvMDMvMjAyNSBhdCAxMjoxNToyNSArMDEsIE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxm
cmluZ0B3ZWIuZGU+IHdyb3RlOgoKPj4+IFlvdSB3b3VsZCBldmVudHVhbGx5IGxpa2UgdG8gZXhw
cmVzcyB0aGF0IGEgbWF4aW11bSBzaG91bGQgYmUgZGV0ZXJtaW5lZAo+Pj4gZnJvbSB0aHJlZSAo
b3IgZXZlbiBmb3VyPykgdmFsdWVzLgo+Pgo+PiBJZiB0aGVyZSB3YXMgYSBtYXg0KCksIHdoeSBu
b3QsIGJ1dCBpbiB0aGlzIGNhc2UgSSBkb24ndCBzZWUgdGhlIHBvaW50Lgo+IERvIHlvdSBtaXNz
IHN1Y2ggYSBwcm9ncmFtbWluZyBpbnRlcmZhY2Ugc28gZmFyPwoKTm8gSSBkbyBub3QuCgo+IFdv
dWxkIHlvdSBiZSBsb29raW5nIGZvciBjb3JyZXNwb25kaW5nIHNvZnR3YXJlIGFkanVzdG1lbnRz
PwoKTm90IG5lY2Vzc2FyaWx5LCB1bmxlc3MgdGhlcmUgaXMgc29tZSBwZXJmb3JtYW5jZSBpbXBy
b3ZlbWVudC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
