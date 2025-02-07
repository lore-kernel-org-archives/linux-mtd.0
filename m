Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD197C0219C
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRVmiKnNxVsOSbq5CGtn2KjFiH4CYM9+IvWQIVw6GlA=; b=k88xG/Gx3bWqdb
	qVqmScmIjyC8R0sPjS9UxPr9IBHP7HzfPDVp88tbdabUEIm4HkuFbY9IpUfb1obZOmFyQYE+sRSwV
	cH3nYqJbyCHIR9g+/Ev6VWjJ7VrYMG9LFywdK9NHujQ4OEdqZ6tCJh3oRngzQ6Trc22SJOB9h5cGP
	mG1FLeRhsaRJOj2B0L+oNrjPUqsXfgGVc/+Gya8tZbs1Cz4rByn9pRCMqJ7FclllAQ7BtUmeHrRny
	2Pjd4rQjQJjo1zGJ5pE3RkCdkuJLT3129dJ9xf6zMerryoCf+WXscrNoUXbR1aqZgLDKVM15i6XrX
	HD1i8fSY4lCnHGfJ8ZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPgX-00000009wvV-0fXX;
	Fri, 07 Feb 2025 14:50:25 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPck-00000009vaK-2cp5
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 14:46:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 930494441C;
	Fri,  7 Feb 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2IJtGFPULPpR5EW3kSBevdNRFYGACBrlSgd0kID7CBc=;
	b=BltvHSjv3EB+ep5vcpHgxweAeNNwN7i4oPyXf9Q5XXxC30PsEwjSpgezd+HiiM4sGTO3SE
	h1nBzz1aVLxgZa/6UtSIlDEngWjsADcCIUmVgXOHixEc2UiSLdY5H51U0rvjdk156ocrjy
	nxy13esdjP3BwewhD4WLGEYvVNQSNrsDtAd2CxLkuPgtdZvVMawJTfQYLVImP37cef+uQK
	93uQ0GYzjYwxkWgs0atYhpkoJj8F8PmRt3H5C9A9gIbDUyMZBJ8Mnh84YVMgOMI0bWlxyk
	nNioXfacgbERUePmdOeVM7NU/CQbOvcGKb7zzxfIIVJZELfrlVKdEFXolbdC6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 richard@nod.at, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
In-Reply-To: <tencent_78F778176466C7F364036D096B03A8E44F05@qq.com>
References: <87ikpn57sy.fsf@bootlin.com>
 <tencent_78F778176466C7F364036D096B03A8E44F05@qq.com>
Subject: Re: [PATCH V2] mtd: capture device name setting failure when
 adding mtd
Message-Id: <173893958654.2918383.13397786440999528769.b4-ty@bootlin.com>
Date: Fri, 07 Feb 2025 15:46:26 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshihiihkrghllhgvrhdqsghughhssehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepvggruggrvhhishesqhhqrdgtohhmpdhrt
 ghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_064630_841966_E238F34D 
X-CRM114-Status: UNSURE (   6.90  )
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

T24gRnJpLCAwNyBGZWIgMjAyNSAyMDoxMDozNSArMDgwMCwgRWR3YXJkIEFkYW0gRGF2aXMgd3Jv
dGU6Cj4gc3l6Ym90IHJlcG9ydGVkIGEgV0FSTklORyBpbiByZWxlYXNlX210ZF9wYXJ0aXRpb24u
IFsxXQo+IAo+IFRoZSByZXByb2R1Y2VyIHVzZXMgIi9wcm9jL3RocmVhZC1zZWxmL2ZhaWwtbnRo
IiB0byB0cmlnZ2VyIHRoZSBmYWlsdXJlCj4gb2YgbWVtb3J5IGFsbG9jYXRpb24gd2hlbiBleGVj
dXRpbmcgZGV2X3NldF9uYW1lKCkgaW4gYWRkX210ZF9kZXZpY2UoKSwKPiB3aGljaCBldmVudHVh
bGx5IGNhdXNlcyBkZXZpY2VfcmVnaXN0ZXIoKSB0byBmYWlsIGJlY2F1c2UgdGhlIGRldmljZSBu
YW1lCj4gaXMgbm90IHNldCwgYW5kIGZpbmFsbHkgdHJpZ2dlcnMgYSB3YXJuaW5nIGluIHB1dF9k
ZXZpY2UoKS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0g
bXRkOiBjYXB0dXJlIGRldmljZSBuYW1lIHNldHRpbmcgZmFpbHVyZSB3aGVuIGFkZGluZyBtdGQK
ICAgICAgY29tbWl0OiAzZjkzMGE1MmQ3MTUxYWRkZWZhNmQ1YmE5ZjdmMmMxN2RjNTJkYjFkCgpQ
YXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJl
CnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5
IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
