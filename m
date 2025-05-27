Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44271C54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsA+UQp3LS+uFPAOJHmlldgCg3hUhHZY7oWKV0EkhXU=; b=DKi/lhYjfal9P5
	De32PgB1CFNUuisfrlWdb5WIMSoQAT0iFpSzlXfDfYY1nlDsUmY2QQ4WL/zbe2q78vCQ0NhFoQH15
	d99tIUuZlNeAG4nehTsSj1x3W62qfnsjoYethC2juufD0zw2aacQKJZ0xGQHg132+IaYAU6JrTbf+
	hP+gKa4bMU8zgILn2Evtfc72BCeiBX/uRKAOmFHlX+Lkrv0zTXzHm3mQvw73lLmoyA9cdXJqMUSIK
	bR3C/YVk3XgrBeGF333AcjDB8cjn5bCzRvduqYFvuZPmhJDCLUjLcvkLNTglZG/TDE2+sTi4bNOU2
	TMqBJ1oQmibs4G5IUEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpZ4-0000000AEZo-1rzw;
	Tue, 27 May 2025 08:21:38 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpZ1-0000000AEZL-0kLO
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 08:21:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13CF843156;
	Tue, 27 May 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748334089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dysyYLfPYphkOAK1cN4sx4C0SkU+51UKIFdizwGPpxA=;
	b=fF98yOuP/wBoLTWg/0OquSbUeLYIzZdBTGxPGdrZDU1MoE/tSLyHff3GCEUhfjUpV2EFud
	dvMy5qx7tQtMRZrbP1zXtL7cjecVbJugoSVxXOnbuYWTEFTXx+KhbKWPAd+iALpWOj0Pxg
	y0A8ndJpVOPQyqVWsM+CBnTV0pa+NE15Z57VOD279HJz0CaYqBCiyOfc9I4tPbAASQB5Fn
	ULt/M4tDkjX1+7TzYrZ7L/KsjFsRK8bAceKCd42PV4RrhbcikIOU/Wb1REj9/7Xv+NSNle
	CFTmFh0uGL2dlx1/Hy+rWmgUfGTdreDV3TTsgR2Vj/uuyHecS1HKc8wRV2LDtQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,  "git
 (AMD-Xilinx)" <git@amd.com>,  "amitrkcian2002@gmail.com"
 <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <IA0PR12MB76994AAD2E2D48932C2141C9DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Mon, 26 May 2025 15:01:47 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vsejke.fsf@bootlin.com>
	<IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87ecwb3i80.fsf@bootlin.com>
	<IA0PR12MB76996538D556ABC8E9C29624DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87msazv3ln.fsf@bootlin.com>
	<IA0PR12MB76994AAD2E2D48932C2141C9DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 27 May 2025 10:21:26 +0200
Message-ID: <87iklmv4zd.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleekleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohept
 ghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_012135_785553_0FD7F2AF 
X-CRM114-Status: UNSURE (   6.55  )
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

Cj4gSW4gdGhpcyBhcHByb2FjaCwgbGF0ZV9pbml0Y2FsbCgpIGhhcyBiZWVuIHJlbW92ZWQuIElu
c3RlYWQsIHdlIGV4cGxpY2l0bHkKPiBjYWxsIHRoZSBBUEkgYXQgWzFdIHRvIGNyZWF0ZSB0aGUg
Y29uY2F0IGRldmljZSwgYXMgYnkgdGhpcyBzdGFnZSBhbGwKPiBwYXJ0aXRpb25zIGhhdmUgYmVl
biBwYXJzZWQsIGluZGl2aWR1YWwgTVREIGRldmljZXMgcmVnaXN0ZXJlZCwgYW5kIHRoZQo+IG5l
Y2Vzc2FyeSBpbmZvcm1hdGlvbiBmb3IgY3JlYXRpbmcgdGhlIGNvbmNhdCBkZXZpY2UgaGFzIGJl
ZW4KPiBnYXRoZXJlZC4KCkkgYmVsaWV2ZSBJIG1hZGUgY29tbWVudHMgYWJvdXQgdGhlIG5ldyBh
cHByb2FjaCBidXQgcGxlYXNlIHJlc2VuZCBpZgp5b3UgdGhpbmsgSSdtIHdyb25nLCBJIHdpbGwg
aGF2ZSBhIHNlY29uZCBsb29rLgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
