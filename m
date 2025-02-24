Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4213C021BC
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZZnsUdRXzHKFEllFqTPLhZUugYlbc5ivjEOdocq/6I=; b=VLP7b9KumQSR/c
	xXBpjujxPviMTafUmdFqNclmxpgVQa72fIrJq0Wur464DUMUyxsl3VWBLfroSKGyrm06VvvCm324n
	oOUR01vR4VTgF/89KcoR/qrE10Z0IXHx2QzSgHrr5jMFbbpr0cU9l+yIZjjEbhhpF9gxLg0jzeCcH
	M9eoBnoNZ9C9OKnb1y2r0fdab5ijHtlH2zASXXL2lxsn/jFsIM2xmvhNkxGiy81jLxOCNfV8I+xS4
	v+JC2v0G7VrP4OlPmMWqL+G5zi4qiYF9rWEEw9oZfa3XQhfrLmxAqElXkHBRx5vi8gpZShgwjUoxE
	eVU30YcvIKmcWfQZg0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaZ9-0000000EJeR-0HAQ;
	Mon, 24 Feb 2025 15:40:19 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaZ4-0000000EJbV-1c3z
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 15:40:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0CDC204D5;
	Mon, 24 Feb 2025 15:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740411613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z8zu6iriu9W66WPC/B3i8sY3npwf/ydX5BDm6X9HsP8=;
	b=bmOMknQ6vEly+DJPSbonfXz4HlbSXJgbG5Qwv2sjS/Lt8VdMFEyhbA8ulGft01h728f3hX
	qsg1sxgt4VnZcxFQ4VLhgxLGA0trQZ73oo54Z5GxU+Qj+sYgtqWJX/FgFKtoX6JDm+q1Ap
	IIEKitvfB1ApisNFHpWExYUiK6cdqVN7OuDLeBwp9KYdoEJU17r6qQ9Wr6jG+zabS6L0t0
	nr3bTwpf42JyXcfkB4UY1L7NJe9nPRn7EQJjBtdmABt6HWFH+7cKQF+dDH1I/AhGyDBK3T
	rJTi9F7lnG5IRmJMQLAP2gfMmWf0d+smVMKOivaWbZ9OvnCkDVJA1O74SbH+ew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>
In-Reply-To: <20250224070349.446739-1-linchengming884@gmail.com>
References: <20250224070349.446739-1-linchengming884@gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for read retry
Message-Id: <174041161185.1746756.367131710339342415.b4-ty@bootlin.com>
Date: Mon, 24 Feb 2025 16:40:11 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejledujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppedvudejrdduuddvrddukeelrddukedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddujedrudduvddrudekledrudekuddphhgvlhhopegludejvddrudelrdefrddvfedvngdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhgthhgvnhhgmhhinhhgkeekgeesghhmrghilhdrtghomhdprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegthhgvn
 hhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopegrlhhvihhniihhohhusehmgihitgdrtghomhdrthifpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrth
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_074014_676327_F10ECDD9 
X-CRM114-Status: UNSURE (   8.71  )
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

T24gTW9uLCAyNCBGZWIgMjAyNSAxNTowMzo0NyArMDgwMCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6
Cj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiAKPiBX
aGVuIHRoZSBob3N0IEVDQyBmYWlscyB0byBjb3JyZWN0IHRoZSBkYXRhIGVycm9yIG9mIE5BTkQg
ZGV2aWNlLAo+IHRoZXJlJ3MgYSBzcGVjaWFsIHJlYWQgZm9yIGRhdGEgcmVjb3ZlcnkgbWV0aG9k
IHdoaWNoIGNhbiBiZSBzZXR1cAo+IGJ5IHRoZSBob3N0IGZvciB0aGUgbmV4dCByZWFkLiBUaGVy
ZSBhcmUgc2V2ZXJhbCByZXRyeSBsZXZlbHMgdGhhdAo+IGNhbiBiZSBhdHRlbXB0ZWQgdW50aWwg
dGhlIGxvc3QgZGF0YSBpcyByZWNvdmVyZWQgb3IgZGVmaW5pdGVseQo+IGFzc3VtZWQgbG9zdC4K
PiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzJdIG10ZDogc3Bp
LW5hbmQ6IEFkZCByZWFkIHJldHJ5IHN1cHBvcnQKICAgICAgY29tbWl0OiBjMmM2NGUxNTE3MmEx
ZGVmOWNjZDEwNGUxZTdlM2Q0MWFjNWQ5ODUzClsyLzJdIG10ZDogc3BpLW5hbmQ6IG1hY3Jvbml4
OiBBZGQgc3VwcG9ydCBmb3IgcmVhZCByZXRyeQogICAgICBjb21taXQ6IGRhMzU1OGQ5NDBjNjg1
MDQ4MjQ1YzU4ZWE1MzZjYTZmODAwMjVjODcKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxl
IG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlk
ZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXD
qGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
