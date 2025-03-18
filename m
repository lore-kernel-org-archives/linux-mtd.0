Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A45C35FF8
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyDQVcCtFzlJXXU1lFFEsWFi+MiKI+Nf99jpAmkThK0=; b=d16RLviJUZn0AI
	02o01DgMLKhZoVnZxwLuXlluostkYFKNnsTG394F53zcq/EcbfT8Kn3BK25XqBwEetjWP495ZryN2
	59hi6Iu2xo+bz7sZnKFPsswGn1EaqzahsCICqCQBliUW9OiHBzAlLUs8c2bayFNtuRy/FBf/K4jnn
	R8wFl53tzN0ml4jU7vQ9Afoz3eBl4ksmDOj+hUSWu0lkxkDwO+JIn4MOmAd3DhyvkyZIMapfxuaRM
	LGfREKETsNLNVXtwuZodUCnay+jF15+PAj1M5cnvyFPgctEe5WjHpAzPaxhhV0MaAoyTE1ee8E6L0
	eMNpVtIAMRswAnme3+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUEu-00000005WA7-2nA4;
	Tue, 18 Mar 2025 10:32:04 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU9z-00000005VFw-07Gk
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 10:27:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C7C7432BB;
	Tue, 18 Mar 2025 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742293613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhf2yFdvIdkY0ES4ZMw6oAyokhaSIllpoSKNDnt86Ig=;
	b=T1EftWyoVjXgeLianlFmLfDtluRNEmcDGeGL3vyDI0F43X+fsDh2QFvgrqMHqFkUfyoOIG
	KC7yRHopGDGNJysHPfKOImMqYdWoQO7b3d4L8/LzxOv8r+Jpo3suCYM64AO8Bz94VopMim
	BlRwcr1RBMXwoSDry2U/nTRDVBwxbFoWZUrps5//lXMDp+ZnbwQiQW1pK0h7GcI0DckOwC
	+6sr4srtwAGGlp0pJyqAxHDi8U8l+4LFsUJCX9vPcCeGdgJFCc5yMMudvrvK6tVbRUZMRF
	idDa3yIvviCCJikq0xWc9pkA4Vj4ivNC6h5rtkd6B2hTxaQosZmzJ6OraaWynw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org,  linux-mtd@lists.infradead.org,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  cocci@inria.fr,  LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] mtd: cfi_cmdset_0001: Fix exception handling in
 cfi_intelext_setup()
In-Reply-To: <d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de> (Markus Elfring's
	message of "Tue, 4 Mar 2025 20:21:53 +0100")
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
	<3675f707-bff0-3caf-29a2-b99e5b9c6554@web.de>
	<d7b2c8ac-e052-4b93-964b-4cc58a459ba0@web.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Mar 2025 11:26:52 +0100
Message-ID: <87o6xyab2r.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmp
 dhrtghpthhtoheptghotggtihesihhnrhhirgdrfhhrpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032659_200655_B5BE7DC5 
X-CRM114-Status: UNSURE (   7.79  )
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

SGksCgpPbiAwNC8wMy8yMDI1IGF0IDIwOjIxOjUzICswMSwgTWFya3VzIEVsZnJpbmcgPE1hcmt1
cy5FbGZyaW5nQHdlYi5kZT4gd3JvdGU6Cgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5n
QHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KPiBEYXRlOiBUdWUsIDIxIE1hciAyMDIzIDIwOjEzOjUx
ICswMTAwCj4KPiBUaGUgbGFiZWwg4oCcc2V0dXBfZXJy4oCdIHdhcyB1c2VkIHRvIGp1bXAgdG8g
YW5vdGhlciBwb2ludGVyIGNoZWNrIGRlc3BpdGUgb2YKPiB0aGUgZGV0YWlsIGluIHRoZSBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24g4oCcY2ZpX2ludGVsZXh0X3NldHVw4oCdCj4gdGhh
dCBpdCB3YXMgZGV0ZXJtaW5lZCBhbHJlYWR5IHRoYXQgYSBjb3JyZXNwb25kaW5nIHZhcmlhYmxl
IGNvbnRhaW5lZAo+IGEgbnVsbCBwb2ludGVyIGJlY2F1c2Ugb2YgYSBmYWlsZWQgbWVtb3J5IGFs
bG9jYXRpb24uCgpDYW4geW91IHBsZWFzZSByZXBocmFzZSB0aGUgY29tbWl0IGxvZz8gSXQgaXMg
c3VwZXIgaGFyZCB0byB1bmRlcnN0YW5kLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
