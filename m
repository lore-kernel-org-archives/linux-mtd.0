Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F7AC87FD2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZb7NUsaINQXGeetuQjOHJRTGmpOgL6Go8e35HM42dg=; b=fUVvENnd5M9ZD3
	GMEISHWcsMp25IwsxEAV/5xPmwacVUJJtOKrGgRUG62ApJlzPCcJr8RIFJnFZw/533iV9XaTcQiql
	BZ95EXvT2TZweRXIc46ygEd/qAoRNJgssLJrRM8fjbZdGPxldBkF0A81uqI6apntZvtwGihdlQiCm
	aUorpsmhsTpcSt1utIuqPIl48QXal7/BqS7v+ycLrpPs6pOdOyDDHzEwQVWoVlXbca2qUTh63wtHf
	6a27e8ASYNeGTyYWtSqz6io+Od1DBgHbJ9jYSh9EpFPbAplB+b6iHw0Vz4ZI+XM6lcf76uE85V/9e
	IqOH7szHa8o9X2hxh26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvT3-0000000HWR7-0bCy;
	Thu, 07 Aug 2025 07:55:17 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvST-0000000HWJM-43Km
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 07:54:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A525B43A2E;
	Thu,  7 Aug 2025 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754553279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yDmxvPaKvO37Q4y8VV8Ok02yCaO2ZekBLC2D6ZLqovQ=;
	b=azPK9rMIk4n6o+7Qf7kWoocNwZDbWAjw7Ar2zFK9KMScCejZ8Gmxp034nkJmHsbr2gaK+m
	QzvXY8rAoQ6mQ44V8CQnRLJv8scm0Cd9qsdBMWXTaec1DWu7sltyjUQ6Wt7O1RWyZxR5he
	t9nnZJs3QWNh6dgzErvxSwwVnZz99zPgOeOZ4GcW6GRieyFj0lzb1JV2CSFXytfxea9O03
	ZMLde9v7HXd0IwNEaCcNuWab7rdM5707SORFzHoB1/5G9Dn4y8d5YY7AkGnWbx1EDbAliv
	i5sq5Qm5AYNMRitWF9e9G8s0phE7z6+oZFqiXAGRz5M67ruoDk8/q2Q6zG3Cqw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nathan Chancellor <nathan@kernel.org>,  Arnd Bergmann
 <arnd@arndb.de>,  David Woodhouse <dwmw2@infradead.org>,  Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>,  Bill Wendling <morbo@google.com>,
  Justin Stitt <justinstitt@google.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: dc21285: fix bytewise memcpy()
In-Reply-To: <20250807072044.4146480-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Thu, 7 Aug 2025 09:20:34 +0200")
References: <20250807072044.4146480-1-arnd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 07 Aug 2025 09:54:38 +0200
Message-ID: <87o6srd0sh.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegufihmfidvsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepn
 hhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_005442_137551_4A468570 
X-CRM114-Status: UNSURE (   9.03  )
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

SGVsbG8gQXJuZCwKCk9uIDA3LzA4LzIwMjUgYXQgMDk6MjA6MzQgKzAyLCBBcm5kIEJlcmdtYW5u
IDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgo+Cj4gVGhlIGNvbW1pdCB0aGF0IHNwbGl0IHVwIHRoZSA4LzE2LzMyLWJpdCBvcGVy
YXRpb25zIGluIDIwMDQgc2VlbXMgdG8gaGF2ZQo+IGJyb2tlbiB0aGUgOC1iaXQgY2FzZSwgYXMg
Y2xhbmctMjEgbm93IHBvaW50cyBvdXQ6Cj4KPiBkcml2ZXJzL210ZC9tYXBzL2RjMjEyODUuYzox
Mjk6OTc6IGVycm9yOiBwYXJhbWV0ZXIgJ2xlbicgc2V0IGJ1dCBub3QgdXNlZCBbLVdlcnJvciwt
V3VudXNlZC1idXQtc2V0LXBhcmFtZXRlcl0KPiAgIDEyOSB8IHN0YXRpYyB2b2lkIGRjMjEyODVf
Y29weV90b184KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCB1bnNpZ25lZCBsb25nIHRvLCBjb25zdCB2
b2lkICpmcm9tLCBzc2l6ZV90IGxlbikKPgo+IFB1dCBiYWNrIHRoZSBsb29wIHRoYXQgd2FzIGlu
IGxpbnV4LTIuNi44IGFuZCBlYXJsaWVyIGZvciB0aGlzIGNhc2UuCj4KPiBGaXhlczogNjdkNDg3
OGU0ZTYxICgiTk9SIGZsYXNoIGRyaXZlcnMgdXBkYXRlIikKPiBDYzogRGF2aWQgV29vZGhvdXNl
IDxkd213MkBpbmZyYWRlYWQub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+CgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgSSdsbCB0YWtlIGl0LCBidXQgdGhh
dCBwcm9iYWJseSBtZWFucyBmZXcgdG8gbm8KcGVvcGxlIHN0aWxsIHVzZSBpdCwgaWYgYnJva2Vu
IGZvciBtb3JlIHRoYW4gMjAgeWVhcnMuLi4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
