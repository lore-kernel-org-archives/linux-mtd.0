Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9263C7115B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+cPWGqxJzFtJoQ+i7QkG79A3YJAeKd3fubiAOl6iDg=; b=fYWBp20fgrzvwW
	EiEaCxJDiBGxECDUITEAEFSXwLvEtJvyShe888N3ohl+4y1G1Kgc2NiZuMfqOUFMrGyKF5d3TUh2B
	uUJKDKENr6aMtEN/erEt+a//sL9agLGrL6OgN5d0eSaByZMUfX4e6Z9i3OiBYrBgISiKmstGqSogw
	AooD1XittkVnnfYsNPj7NzVLX461OYhFvfLXymJUlpGXeLVL9QRIxK65nx1Mn5d3hkGs8eEqoIZ1X
	yEggfLYWwD6ZKJ9HVNdlMxUzq9yXJCGuAFiPeadpECOhHB5Qvo0gQLGi/BpIdUOVSwKLgPcFpkCVk
	Zf6MLi6Rf7IGCNY5aIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKD0-0000000DzpC-2dU6;
	Thu, 19 Jun 2025 18:41:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIqs-0000000DkVn-35Hv
	for linux-mtd@bombadil.infradead.org;
	Thu, 19 Jun 2025 17:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z26vtRZXZ0iUY80hTCSWSFa/6H7qzHjCbBvSXzt6qFk=; b=WMX+DNx24tGNQnGR72BYgFX2AN
	hcbxCoT6ITTRjhljPuDiWMIDQcrmr4BVzw+tcGoCX80iNvgd67bB0QZLr3c+XUHulhRxBPlD8/I95
	381/sef1v8wBrPiJmk/9HKb86UKWLdoLWijJGSyVTS108J5/NTCCYnJBd7I9DbFfoFpane8gWAm+x
	jkh6aETYtZC6kU0Flk7kozAWfQyutDuGLWQUs/Qfpo/zzZR+51cK2lkvf9Ub82A0Erg/co45nh5x/
	qP6d/yus9xLRej4fj23H1J6PBq9AwwNJNWrQWeGHSAZoYDRWP3CPaZi24Tvrz5QNzK7lXSXnjZ9Qj
	h+umb1hg==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIqm-00000004Ucs-1QPK
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 17:15:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 797EB444F8;
	Thu, 19 Jun 2025 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750353293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z26vtRZXZ0iUY80hTCSWSFa/6H7qzHjCbBvSXzt6qFk=;
	b=BL56VD7MsFg3AVIJnYbDfvhqfDtUOk/FWYOf7V94nZ4wNrjLrTCDK2X7y9nBNp9bX89CpK
	1oNBUQqI2WjZKkTS/Cjf4B/mJFXTK/3Can7llnLWJ15cRDhx3nhMqphWSpNd/FEUyHBFsA
	XPafdvq7hMg0cV7DmJTNj3eUGItFjfJem+lG8541D9uel3SxgWYLa9RxbB9CA6F417s+02
	wCPXduEFvt+hqnhO1J/2736+7wsKHjwwYNg6RCkZbvMwBI19M9YZLYxyNrvELK8B13B2y9
	vVSCMw3iVFdgiobK+qopJ6Fuj6vbft3mMQ0PRIqVVx/iI6HF3UwiWZ2Kp9471w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ivan Stepchenko <sid@itb.spb.ru>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250619145313.5823-1-sid@itb.spb.ru>
References: <20250619145313.5823-1-sid@itb.spb.ru>
Subject: Re: [PATCH] mtd: fix possible integer overflow in erase_xfer()
Message-Id: <175035329221.438255.2990702769206013816.b4-ty@bootlin.com>
Date: Thu, 19 Jun 2025 19:14:52 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhiugesihhtsgdrshhpsgdrrhhupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpt
 hhtoheplhhvtgdqphhrohhjvggttheslhhinhhugihtvghsthhinhhgrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_181456_531685_9C2CF54B 
X-CRM114-Status: UNSURE (   7.55  )
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

T24gVGh1LCAxOSBKdW4gMjAyNSAxNzo1MzoxMyArMDMwMCwgSXZhbiBTdGVwY2hlbmtvIHdyb3Rl
Ogo+IFRoZSBleHByZXNzaW9uICcxIDw8IEVyYXNlVW5pdFNpemUnIGlzIGV2YWx1YXRlZCBpbiBp
bnQsIHdoaWNoIGNhdXNlcwo+IGEgbmVnYXRpdmUgcmVzdWx0IHdoZW4gc2hpZnRpbmcgYnkgMzEg
LSB0aGUgdXBwZXIgYm91bmQgb2YgdGhlIHZhbGlkCj4gcmFuZ2UgWzEwLCAzMV0sIGVuZm9yY2Vk
IGJ5IHNjYW5faGVhZGVyKCkuIFRoaXMgbGVhZHMgdG8gaW5jb3JyZWN0Cj4gZXh0ZW5zaW9uIHdo
ZW4gc3RvcmluZyB0aGUgcmVzdWx0IGluICdlcmFzZS0+bGVuJyAodWludDY0X3QpLCBwcm9kdWNp
bmcKPiBhIGxhcmdlIHVuZXhwZWN0ZWQgdmFsdWUuCj4gCj4gRm91bmQgYnkgTGludXggVmVyaWZp
Y2F0aW9uIENlbnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTdmFjZS4KPiAKPiBbLi4uXQoK
QXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBmaXggcG9zc2libGUgaW50
ZWdlciBvdmVyZmxvdyBpbiBlcmFzZV94ZmVyKCkKICAgICAgY29tbWl0OiA5MzU4YmRiOWY5ZjU0
ZDk0Y2VhZmM2NTBkZWZmZWZkNzM3ZDE5ZmRkCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
