Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B14C021B1
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIctXILSiqbkenHo8+tZ3SJvSABL88IND/FToc6bYdM=; b=KBNLkUrt7/76qK
	U+he7mjuNPLDfalYJb0Pzdfu5JQJfcPY1J4oWzONGkzk//mVhIoC92Efb5fcGTYm2yI0i+74FotcJ
	0tVyILR3BjMzY0DpFXfgDuy3GzZWOqiot/uQ1c5axnmRY/vS+i9JIKvCid5muyKjEViW3TP+P80kS
	f1w3KJpa73KyqHaiD2qQ7KU0Opy8cuiCWdcDA6rDibCNs1ByEsAHQyQ1mdiNjm8nRbJJI0mLx/6vW
	Fq4GhkQ8XOr8DA0Xzssb4eLUMEQTS1dJvN+vTew/tVPB+c63EpS01AmwM+VRGQeBLFqAQKpbcInIH
	F6y/WXFxY0WYKpNAQS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfoP-0000000BejR-19LE;
	Wed, 19 Feb 2025 08:52:09 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfZR-0000000BZWa-2z4h
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 08:36:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EA8244340;
	Wed, 19 Feb 2025 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739954199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXFsWhl638wEt2WdRXJGFWD7cfvkLuyTrUtgYE7Ngxs=;
	b=l++9H2hQn/u+qIStQwH+1g2AA05EkXihmbppaCB50w/4E3wzZ+DRpmt5pPqOpvTFO0d2SK
	lksQ12wkhaE3L5QYRXvgFT65A8lOVd0ZpggZYyL5wjcfLf+V95q8ghjUdBmU0t8zsfJF1i
	Wrr43E3j7b9wAPgzMstJDi0gj1nIQXmUGbT3IKRQpKIw4F55+3A+WOdcBe1JAUnXZ5gyx9
	6UtozZyYqj25MyIojkEyWDPX39XgupTlFt0RB/dRFxWVw0Q19RIM4hxHkcMIAVn5IgQtZn
	VC4cle9xOjdMXPIqysebj2B8a1zSC+/pO/RycD0/h/oORDC6sUClmOMV4hM6DA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,  richard@nod.at,
  vigneshr@ti.com,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  git@amd.com,  amitrkcian2002@gmail.com
Subject: Re: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
In-Reply-To: <20250218213903.GA1203860-robh@kernel.org> (Rob Herring's message
	of "Tue, 18 Feb 2025 15:39:03 -0600")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
	<20250211212928.GA1188800-robh@kernel.org>
	<87r043r2lq.fsf@bootlin.com>
	<20250212160659.GA3883406-robh@kernel.org>
	<874j0zqgps.fsf@bootlin.com>
	<20250218213903.GA1203860-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Feb 2025 09:36:37 +0100
Message-ID: <87ldu2qqju.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeifeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_003641_904306_24897D7A 
X-CRM114-Status: UNSURE (   9.81  )
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

SGkgUm9iLAoKPj4gSSdtIHRhbGtpbmcgYWJvdXQgc3RvcmluZyBpbiBhIGNlbnRyYWwgcGxhY2Ug
YWxsIHRoZSBjb25jYXRlbmF0ZWQKPj4gcGFydGl0aW9ucy4gWW91ciBwcm9wb3NhbCB3aXRoICJu
ZXh0LXBhcnRpdGlvbiIgd29ya3MgZmluZSBpZiB3ZSBsb2NhdGUKPj4gaXQgaW5zaWRlIHRoZSAn
cGFydGl0aW9ucycgbm9kZSwgYnV0IEkgZmVlbCBsaWtlIHRoZSAncGFydC1jb25jYXQnCj4+IGlu
c3RlYWQgd2FzIG5vdCBmaXR0aW5nIHZlcnkgd2VsbCB0aGVyZS4gU28gSSB3YXMgd29uZGVyaW5n
IGluIHRoaXMgY2FzZQo+PiBpZiBtb3ZpbmcgdGhlIGNvbmNhdGVuYXRpb24gb2YgdGhlIHBhcnRp
dGlvbnMgd291bGQgYmUgZWxpZ2libGUgdG8gdGhlCj4+IGNob3NlbiBub2RlLCBvciBpZiB0aGF0
J3MgcmVzZXJ2ZWQgdG8gKnZlcnkqIGZldyBwcm9wZXJ0aWVzIChhbmQgc2hvdWxkCj4+IHJlbWFp
biBsaWtlIHRoYXQpLgo+Cj4gWW91IHdvdWxkIGhhdmUgdG8gc29sdmUgdGhlIHNhbWUgcHJvYmxl
bSBhcyB0aGlzIHBhdGNoc2V0IHdoaWNoIGlzIGhvdyAKPiB0byBzdXBwb3J0IE4gc2V0cyBvZiBj
b25jYXRlbmF0ZWQgcGFydGl0aW9ucy4KPgo+IEluIGdlbmVyYWwgdGhvdWdoLCB3ZSBhZGQgbmV3
IHRoaW5ncyB0byAvY2hvc2VuIHZlcnkgY2FyZWZ1bGx5LiBJdCdzIAo+IHVzdWFsbHkgInRoaW5n
cyB0aGUgYm9vdGxvYWRlciBjb25maWd1cmVkL2VuYWJsZWQiIHdoaWNoIEkgZG9uJ3QgdGhpbmsg
Cj4gdGhpcyBxdWFsaWZpZXMgYXMuCgpJbnRlcmVzdGluZywgSSBkaWRuJ3QgaGF2ZSB0aGlzICJ0
aGluZ3MgdGhlIGJvb3Rsb2FkZXIgZGlkIiBleHBsaWNpdApjYXNlIGluIG1pbmQuCgpUaGFua3Mh
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
