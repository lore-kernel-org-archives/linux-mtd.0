Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B41AC021A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 08:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwJdZtgWYWUVqo3Nvf3DrmaSrZ4DNM4tXvIwnqc+ACc=; b=LsDA3cRnBSEZm/
	iS2kqDgSyLePMhqMXe11pqx4OrmNUtdBg/1F/5jREY/Az5hVqBPGoF+qpiSC8g5VxIbZ1IaX0CdMl
	2jSUJ1xARtt60f7LSymdTXYQFj4YVO6uA3xAa97mDu0iNUWbhP4q1aqnvMXDVXu63a5fWeD8g157G
	HbC7e37KaPVAbLwldgLfNjQ15zMAYcuHSyaOPmvqrhvf8sgJAQfEM7VkqfrZiZSbuwKjiB+PQoO+l
	BXYuPkGZR3ierjy2/cJYar2Or2ibcxjMaC1lnHfGjcUXln5VXq7pN4EhsxPsJeMxJplIGsoUx1rfQ
	UnOwGlGEe38Z8s+SfSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8A4-00000006dVn-0hTR;
	Wed, 12 Feb 2025 08:32:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti84D-00000006cAx-0ELy
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 08:25:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C0E943201;
	Wed, 12 Feb 2025 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739348754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5noWuekGcO4TRN2XISrfPnAA/81AD4EC5oVcCNbEiI=;
	b=HfC5z0HQ2GOPil858ShZzgc2qF7Z/QimMkB0RVsbUAedBhzcU7Ac55BCUvrnHLgFR0PWkF
	t8WeE7GCJ4Df3HBC+3em9OIILTUIszJARx6+BuvZCgpaGRPlN5fCWeBUGsjOc4hWkvLPvX
	atm+E9mzhg3cyAJAS9QvV68HQbjJk0/EnvBrsZScMeFustb615ExWREzOFV6qTzmyWlrMr
	uZBAxN1UCRWXfKJOZVqrDbmJ9Mwi9GaTC5gX3ztM1BRBpsCTL5Gbua26UgF5o8rH36YLc0
	2f4RdvR6nhBLXlX8kMDGLodAyNWvOJNiwGPPbqov+dTKWgcY623VztIfdFZjYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,  richard@nod.at,
  vigneshr@ti.com,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  git@amd.com,  amitrkcian2002@gmail.com
Subject: Re: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
In-Reply-To: <20250211212928.GA1188800-robh@kernel.org> (Rob Herring's message
	of "Tue, 11 Feb 2025 15:29:28 -0600")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
	<20250211212928.GA1188800-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 12 Feb 2025 09:25:53 +0100
Message-ID: <87r043r2lq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_002557_260244_269D6444 
X-CRM114-Status: UNSURE (   8.79  )
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

SGksCgo+PiBUaGUgcGFydGl0aW9ucyB0aGF0IGdldHMgY3JlYXRlZCBhcmUKPj4gcGFydDBfMAo+
PiBwYXJ0MV8xCj4+IHBhcnQwXzEtcGFydDFfMC1jb25jYXQKPgo+ICdwYXJ0LWNvbmNhdCcgZG9l
c24ndCB3b3JrIGlmIHlvdSBoYXZlIG11bHRpcGxlIHNldHMgb2YgcGFydGl0aW9ucyB5b3UgCj4g
d2FudCB0byBjb25jYXRlbmF0ZS4KPgo+IEkgdGhpbmsgeW91IG5lZWQgc29tZXRoaW5nIGxpa2Ug
J3ByZXYtcGFydGl0aW9uJyBvciAnbmV4dC1wYXJ0aXRpb24nIGluIAo+IHRoZSBwYXJ0aXRpb24g
bm9kZXMgdG8gY3JlYXRlIGEgbGlua2VkIGxpc3Qgb2YgcGFydGl0aW9ucy4gSG9wZWZ1bGx5LCAK
PiB5b3UgZG9uJ3QgbmVlZCBib3RoIHByb3BlcnRpZXMsIGJ1dCB5b3UgZG8gaGF2ZSB0byBzY2Fu
IGV2ZXJ5dGhpbmcgdG8gCj4gZmlndXJlIG91dCB3aGljaCBvbmVzIGFyZSBjb25jYXRlbmF0ZWQg
b3Igbm90LiBGb3IgZXhhbXBsZSwgbm8gcHJvcGVydHkgCj4gY2FuIG1lYW4gbm90IGNvbmNhdGVu
YXRlZCBvciBsYXN0IHBhcnRpdGlvbiBpZiB5b3UgdXNlICduZXh0LXBhcnRpdGlvbicuIAoKT3V0
IG9mIGN1cmlvc2l0eSwgd291bGQgdGhlIGNob3NlbiBub2RlIGJlIGVsaWdpYmxlIGFzIGEgY2Vu
dHJhbCBwbGFjZQp3aGVyZSB0byBsb29rIGF0PwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
