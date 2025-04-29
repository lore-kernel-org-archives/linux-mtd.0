Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD725C369DC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUpSdvxUAp7A4jW5EaDwxOMNT4/Z9MFAqb+dVsQs9+I=; b=Mty11bqzoZzWo6
	Jp152QPMqois2YHPShbh0Jr5QNmUtusCIs2kMByOwv3TtLwa2FtFasS3EIN7QCWL8lrVeBNVtxO7t
	lfokvCcc7/GTc4ELEElwyi+G0hTO5/xIo9idTanlacoe4LMxjzNYyqIkLYH/FvkGyjBEC7Zib2G57
	Y1w23tVVFoggrR7M4I86OfZE1QYt2iKQSoLndky6+mzTKkm4zE7mpBtQsZG5OcL7hqFZDwVdyr+ae
	dW8mCQh3bayW+hX49TOBSXkn0V4PMXpOg+6UEoNniMlrqxJxk/uTz++NqLSKcgsQAJZRncB4dmdS0
	9pj/MBshcTWhJz4x6Mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hHm-000000098oL-3yzC;
	Tue, 29 Apr 2025 09:29:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hGZ-000000098b2-1ntm
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Apr 2025 09:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g4kTu2R5MakUDhndc1hgGYZijHuY+tlguYELTfdps9M=; b=oIdlZXudaD+fBJOoIKNNlndNvj
	PqfRRLGE8PTdWfkYyVXTQQcqCqvG0Xu8BWK2oXqM3caFTXaoSEyettkIV9tWa6ncsYu0Un/n8LVlQ
	d7Q8JMM8a5A0K+RJCZlmP/EJWXeFzkXzZSSGN3mObH3qUNz2gheu0xMhfb9BDM3Ivv4pftViXfgDj
	z7SyMdny0qQz9uUyE7jGdy38Ejfk5hH+Q4lvD04YfGyGIUGCNYU39U+uDNDeeiA/zZpylUkWjF9/0
	gnR/V/BIlCerLEwBTjjLJkQeM9tsz7YasjYrqAvOHl6YBQiP+Fb/pgquUjqEroMFUVrhpcZ7S79BB
	14bIhkLQ==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9hGW-0000000DFZe-1G20
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:28:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDB851FCE8;
	Tue, 29 Apr 2025 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g4kTu2R5MakUDhndc1hgGYZijHuY+tlguYELTfdps9M=;
	b=fgqNSJz+Fb7EfaULz+ZRr45/Zo+uofpKquNyLSMdLph65+f35SYob023GMz9HtQZ3/OI69
	CyrDeUAdOOhgwa4/OAdrzaP7P+CYVMiw8zgLb9KsrfHuyYOnZbus84InyFsz7LTFCAH9gV
	tYN90ac70V8L84ZiWaIkchC3ggn+7HJ8bD+5h0/cXIWkTbxqx47OzfMrzFxNSIGk5epadw
	mtA5U1xszQARp/SuKnMRuXcQtFHgMX7VpiuatnTUhasWIAYFwyTUb5lhDXegRg3Q8lgH5u
	OrEtwioS48njEj4UiJAm8ZQekDNGeBe89eAyiGzZQXGONglS61uEEfyYAQoxYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manivannan.sadhasivam@linaro.org,
	richard@nod.at,
	vigneshr@ti.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	agross@kernel.org,
	Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Enable QPIC BAM and QPIC NAND support for SDX75
Date: Tue, 29 Apr 2025 11:28:25 +0200
Message-ID: <174591886994.994230.13306860112856962284.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
References: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeutdevudejvdevtdetueehueehgfetkeehieeuhefhieekfeetlefhheffhefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghro
 hdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprghnuggvrhhsshhonheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_102836_457105_931F8AB1 
X-CRM114-Status: UNSURE (   7.97  )
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

T24gV2VkLCAyMyBBcHIgMjAyNSAxMjowMDo0OSArMDUzMCwgS2F1c2hhbCBLdW1hciB3cm90ZToK
PiBUaGlzIHNlcmllcyBhZGRzIGFuZCBlbmFibGVzIGRldmljZXRyZWUgbm9kZXMgZm9yIFFQSUMg
QkFNIGFuZCBRUElDIE5BTkQKPiBmb3IgUXVhbGNvbW0gU0RYNzUgcGxhdGZvcm0uCj4gCj4gVGhp
cyBwYXRjaCBzZXJpZXMgZGVwZW5kcyBvbiB0aGUgYmVsb3cgcGF0Y2hlczoKPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1zcGkvMjAyNTA0MTAxMDAwMTkuMjg3MjI3MS0xLXF1aWNfbWRh
bGFtQHF1aWNpbmMuY29tLwo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzVd
IGR0LWJpbmRpbmdzOiBtdGQ6IHFjb20sbmFuZGM6IERvY3VtZW50IHRoZSBTRFg3NSBOQU5EIGNv
bnRyb2xsZXIKICAgICAgY29tbWl0OiAyY2Y0YmMwNmY3MDA4ZmUzZWFiNGIyN2Q3YzBiYTliYTA4
ZjVkYzVkCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFu
ZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29t
cGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
