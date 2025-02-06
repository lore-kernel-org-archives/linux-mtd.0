Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90695C02194
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2025 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEr4ADxxxHjmJ84U4EFMqv8WPW74zHu8aIu8lFERJe8=; b=h/jtBhT4ugHWiB
	UfHt16L8ol/W0EABPX1ytkL40E/Rrf939uAkYV/989mPZ9Qoz/EJ1tCBvV6XI9GNlZN0iAAQVRHTf
	3WaeYs1Wnlf5dTD1Bz066FK1MfOqqpsnHRCH0BdrnEaIE5+BSarO3o24tRsMhgdf1yeTbr3fjh5EJ
	sJOq3FTAOsB3N6XTbTllTjNAkWvRdJg6I5vbHd0r3JlFaLccp/QoZP2V6H6iz0fZutjH5wvykdnRF
	M45heXfIyWlm3/9jnP7z6euM5FUeE2Q6lwWuhB3aI4XTmR2y+Mv3PTYLnsgsjDEdQak3e57j09JIZ
	dKtsbPZaS81eSkA1RYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5VA-00000006y33-24sL;
	Thu, 06 Feb 2025 17:17:20 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5V7-00000006y2Z-3tQ8
	for linux-mtd@lists.infradead.org;
	Thu, 06 Feb 2025 17:17:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1984434D;
	Thu,  6 Feb 2025 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738862236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPqgb82RV5Eh4di0p99++tt4PTXyauGdKJYgPKVgVkw=;
	b=bMRNtHrTdtXyip9IgAG/87kFux8hrvKvIyVVkK4rTjddnJCgjV7/VvqodbfSOmbeFgDN7r
	gOR4J9InWsRbIAibyYjrCTbWpH02z8hR6/0O/7aGeg2C7oBd1vrVVGAMJxKdUj6IuEB9m1
	kO5ZmvQzDG3y1/yw4Au0LnpvzqYIkPqtn89hLSfh0rmujsPEDHF+vp5ufVvC+11qmUfNvE
	BIRBcjZb/UyXd2GlBfiajECikuzA58XBzf1kg7jiJm4dqYMBgEtwnIZcbGhjPK8+rOuCOf
	wn8ZG3a7iRFdJba2ws9HyH6GEE9sRc8e1RJLRLn/TPPQbrlrgZ5vSLlGpQx9ug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  keguang.zhang@gmail.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-media@vger.kernel.org
Subject: Re: [PATCH v12 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <20250121-loongson1-nand-v12-2-53507999de39@gmail.com> (Keguang
	Zhang via's message of "Tue, 21 Jan 2025 18:27:34 +0800")
References: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
	<20250121-loongson1-nand-v12-2-53507999de39@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 18:17:15 +0100
Message-ID: <87tt972dt0.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuggvvhhnuhhllhdokhgvghhurghnghdriihhrghnghdrghhmrghilhdrtghomheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_091718_099189_BC55FC80 
X-CRM114-Status: GOOD (  10.46  )
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

SGVsbG8sCgo+ICtzdGF0aWMgaW5saW5lIGludCBsczF4X25hbmRfY2hlY2tfb3Aoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCwgY29uc3QKPiAgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCkKCk5vIGlu
bGluZSBmdW5jdGlvbiBpbiBhIGMgZmlsZS4KCj4gK3sKPiArCXN0cnVjdCBsczF4X25hbmRfaG9z
dCAqaG9zdCA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsKPiArCWNvbnN0IHN0cnVj
dCBuYW5kX29wX2luc3RyICppbnN0cjEgPSBOVUxMLCAqaW5zdHIyID0gTlVMTDsKPiArCWludCBv
cF9pZDsKPiArCj4gKwlmb3IgKG9wX2lkID0gMDsgb3BfaWQgPCBvcC0+bmluc3Ryczsgb3BfaWQr
Kykgewo+ICsJCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciA9ICZvcC0+aW5zdHJz
W29wX2lkXTsKPiArCj4gKwkJaWYgKGluc3RyLT50eXBlID09IE5BTkRfT1BfQ01EX0lOU1RSKSB7
Cj4gKwkJCWlmICghaW5zdHIxKQo+ICsJCQkJaW5zdHIxID0gaW5zdHI7Cj4gKwkJCWVsc2UgaWYg
KCFpbnN0cjIpCj4gKwkJCQlpbnN0cjIgPSBpbnN0cjsKPiArCQkJZWxzZQo+ICsJCQkJYnJlYWs7
Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWlmICghaW5zdHIxIHx8ICFpbnN0cjIpCj4gKwkJcmV0dXJu
IDA7CgpJcyB0aGlzIGV4cGVjdGVkPwoKPiArCj4gKwlpZiAoaW5zdHIxLT5jdHguY21kLm9wY29k
ZSA9PSBOQU5EX0NNRF9STkRPVVQgJiYKPiArCSAgICBpbnN0cjItPmN0eC5jbWQub3Bjb2RlID09
IE5BTkRfQ01EX1JORE9VVFNUQVJUKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWlmIChpbnN0cjEt
PmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1JFQUQwICYmCj4gKwkgICAgaW5zdHIyLT5jdHgu
Y21kLm9wY29kZSA9PSBOQU5EX0NNRF9SRUFEU1RBUlQpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJ
aWYgKGluc3RyMS0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfRVJBU0UxICYmCj4gKwkgICAg
aW5zdHIyLT5jdHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9FUkFTRTIpCj4gKwkJcmV0dXJuIDA7
Cj4gKwo+ICsJaWYgKGluc3RyMS0+Y3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfU0VRSU4gJiYK
PiArCSAgICBpbnN0cjItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1BBR0VQUk9HKQo+ICsJ
CXJldHVybiAwOwo+ICsKPiArCWRldl9lcnIoaG9zdC0+ZGV2LCAidW5zdXBwb3J0ZWQgb3Bjb2Rl
IHNlcXVlbmNlOiAleCAleCIsCj4gKwkJaW5zdHIxLT5jdHguY21kLm9wY29kZSwgaW5zdHIyLT5j
dHguY21kLm9wY29kZSk7Cj4gKwo+ICsJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgaW50IGxzMXhfbmFuZF9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gKwkJ
CSAgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCwKPiArCQkJICAgICBib29sIGNo
ZWNrX29ubHkpCj4gK3sKPiArCWludCByZXQ7Cj4gKwoKICAgICAgICBpZiAoY2hlY2tfb25seSkg
PwoKPiArCXJldCA9IGxzMXhfbmFuZF9jaGVja19vcChjaGlwLCBvcCk7Cj4gKwlpZiAocmV0KQo+
ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJcmV0dXJuIG5hbmRfb3BfcGFyc2VyX2V4ZWNfb3AoY2hp
cCwgJmxzMXhfbmFuZF9vcF9wYXJzZXIsIG9wLCBjaGVja19vbmx5KTsKPiArfQo+ICsKPiArc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBuYW5kX2VjY19hbGdvc1tdID0gewo+ICsJW05BTkRfRUND
X0FMR09fVU5LTk9XTl0gPSAibm9uZSIsCj4gKwlbTkFORF9FQ0NfQUxHT19IQU1NSU5HXSA9ICJo
YW1taW5nIiwKPiArCVtOQU5EX0VDQ19BTEdPX0JDSF0gPSAiYmNoIiwKPiArfTsKCk5vIHdheSB5
b3UgbmVlZCB0aGlzIGluIHlvdXIgZHJpdmVyIDotKQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
