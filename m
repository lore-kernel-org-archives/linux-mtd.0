Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED78BC021B8
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZBktxETqMCsB08Op9saQCDz7xJUqMwYdQcriqmGtmM=; b=4ddYORq7z0zso0
	Y7Y3WuKg4hsb4VIyRwhaHtnoJqFwoG4JNlAJexlQgHJraafWTjHUV+UJK70fA/7TKy3wcScXfGZSj
	XnpvcyEEYtTUo68jb4tyfI6MJkLvXy4rEQ3sNUjW9K1iUiL184UqtLJW3QvJ55NJ8uQDjU93B+eT4
	Poma3ro+mzzERNAaLm4fBRIadZqRCWUTqI0B1c5hNw6XKkI8xR0PZ7/3Sf1bPSzxHH+QP8fRnrNY8
	WWyrp1/Vb/RtUwGg3GEsemDSUQcy7EP1BrvlKv3kXr3PHETp7iBIxm67C9wkdCmwmLViERUs9kMSW
	fwcp5ZpEakuDn7XQ6c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUQW-00000005GR6-3PwE;
	Tue, 04 Mar 2025 15:43:24 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTtK-000000058P5-3t6E
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 15:09:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D166D43D79;
	Tue,  4 Mar 2025 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741100944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DG/AM3etG1nE9vfZIfc0a6ublPwhvIwD2A9YRgWbjkw=;
	b=kc0XItSDzTYBLeiVj8NChyMYyQnpRRvxMFdALbWvrST2T4NKDBJpgwBbhyPhjtSeE9Te2j
	u9wWrrxSltQPZxpqeYPJw4uzoWInpg86JLUsVaP1Dzg7QeiRajC/4yW8cnVWVYviMehZi+
	R2hpFmNWmS7/iwaeOoMSdpWFEVXP/VibGlYOQG6XD/sAOSpQYI0wM4t8dLcOR9Ltv4bXd4
	0Ec7YTezS1dlhe1QQWlcMMnscqds/y9bDnq5okPWDIW4p7Zylx4mhpnS99d7C3QI5ho8EM
	N+e2pdeehuulTYWxI6KSVJerJ68luqbFAZ7I3QsLI8ADTCcqjN2PhCVeN2sPAg==
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
Date: Tue, 04 Mar 2025 16:09:03 +0100
Message-ID: <87zfi0ygs0.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopeforghrkhhushdrgfhlfhhrihhnghesfigvsgdruggvpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepuggvvheslhihnhigvgihvgdru
 ggvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070907_247655_8A471914 
X-CRM114-Status: UNSURE (   5.72  )
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

U29ycnkgZm9yIG5vdCBiZWluZyBjbGVhci4KCk9uIDAzLzAzLzIwMjUgYXQgMTI6MTU6MjUgKzAx
LCBNYXJrdXMgRWxmcmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPiB3cm90ZToKCj4+PiBZb3Ug
d291bGQgZXZlbnR1YWxseSBsaWtlIHRvIGV4cHJlc3MgdGhhdCBhIG1heGltdW0gc2hvdWxkIGJl
IGRldGVybWluZWQKPj4+IGZyb20gdGhyZWUgKG9yIGV2ZW4gZm91cj8pIHZhbHVlcy4KPj4KPj4g
SWYgdGhlcmUgd2FzIGEgbWF4NCgpLCB3aHkgbm90LCBidXQgaW4gdGhpcyBjYXNlIEkgZG9uJ3Qg
c2VlIHRoZSBwb2ludC4KPiBEbyB5b3UgbWlzcyBzdWNoIGEgcHJvZ3JhbW1pbmcgaW50ZXJmYWNl
IHNvIGZhcj8KCk5vLgoKPiBXb3VsZCB5b3UgYmUgbG9va2luZyBmb3IgY29ycmVzcG9uZGluZyBz
b2Z0d2FyZSBhZGp1c3RtZW50cz8KCk5vLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
