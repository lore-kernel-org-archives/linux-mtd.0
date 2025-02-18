Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3643AC02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHZfvDsTQASPjVJWzT6gVUrNQnShjuhTW+10BeBjttc=; b=soDvFsJvOMT45G
	APqMo1lztVBSMtEMHSEgiTrsN5T6tHRKbh4YqJT87BPRKR578n0FL1v0ua/vFvJQGoJAJM7Lrtw/E
	Cnue9aX5K6YweNFO1bgdmnn9PoLF2AClwPBm8Z53XBF7YM20npup2JrE+6rge+sdH4+LQDK+sEIL6
	M643vCa7X9OLqUe88IJzDsyV/cRqISl2RyUw50vIXu0eKgIDwqu2e8qB7KR+MP+DQssbijTPzIVEy
	jq6dufGAQ4bc5+Ys6LsktQo0hHb19hgEHvrf4XWommZXKnTmMQq9eYkDqN1OtLkPE0IdLKdmKp6YT
	1P3fq/YE6XdeA16FxRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkO7M-00000008PE0-0494;
	Tue, 18 Feb 2025 13:58:32 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkO6v-00000008P8p-00pR
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 13:58:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06CFA44433;
	Tue, 18 Feb 2025 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739887080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8xlBvlT1ncNuT1sCXGrTRplOr5KkFj1epDesmlYbJOQ=;
	b=REM1HypRKk4WKtQ4dKkZZ088MQh01odk+WoUWHcTP3hn/DTdUYCg+jzXGMIUglgrZ6MldV
	2ZuEkjWXuuX6HzjCgQs2FFChVIDaekrzqm2uaiB65FKMtKCqRbCCzZCTheq+IMan+gIWSs
	jNT7IXeUF2xiTQ/SF3ov88eli51ZRx12BSPIfBRmXNo2zeXCC99Fl3X6dXhd1OVPcYacgS
	dVTXneD/bqdtQmS4vDnpZ1HtWRT/QwUqnjwL1aUIBhMpHznrlJ8OpBRGTn4qlfNt+2A9Yz
	jCvLwdIV6/uZWHCScuc6oW37UA4j2ac3L82vV+6EU6trtbeXciiYddSu5npLyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Terence Eden <terence.eden@shkspr.mobi>
Cc: maximlevitsky@gmail.com,  richard@nod.at,  vigneshr@ti.com,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fixed a spelling error in the comments
In-Reply-To: <CAPFVDHokn+kfyk9AxTHuBJjRKMNJjZy8w=e-qzvXaA8Vfcq6Dg@mail.gmail.com>
	(Terence Eden's message of "Tue, 18 Feb 2025 13:21:42 +0000")
References: <CAPFVDHokn+kfyk9AxTHuBJjRKMNJjZy8w=e-qzvXaA8Vfcq6Dg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Feb 2025 14:57:59 +0100
Message-ID: <87o6yzs6c8.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeegfedtfeelvdeigedvjeelgfelgeejhffgueelvefgtdejheduffehvdehgeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthgvrhgvnhgtvgdrvgguvghnsehshhhkshhprhdrmhhosghipdhrtghpthhtohepmhgrgihimhhlvghvihhtshhkhiesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_055805_665264_5F681517 
X-CRM114-Status: UNSURE (   3.48  )
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

SGVsbG8sCgpPbiAxOC8wMi8yMDI1IGF0IDEzOjIxOjQyIEdNVCwgVGVyZW5jZSBFZGVuIDx0ZXJl
bmNlLmVkZW5Ac2hrc3ByLm1vYmk+IHdyb3RlOgoKPiBDb250aW51aW5nIHRoZSB3b3JrIG9mIENv
bW1pdCAjOGFiMWI1MSAvCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjQw
OTIzMDY1NjQ5LjExOTY2LTEtc2hlbmxpY2h1YW5Adml2by5jb20vCgpXaGlsZSB0aGUgZGlmZiBp
cyBvYnZpb3VzbHkgZmluZSwgSSdkIHByZWZlciBpZiB5b3UgY291bGQgd3JpdGUgYSBwcm9wZXIK
Y29tbWl0IGxvZy4KCkFsc28gdGhlIHRpdGxlIHNob3VsZCBiZSBwcmVmaXhlZCAibXRkOiByYXdu
YW5kOiByODUyOiAiCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
