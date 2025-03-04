Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B84AC282D6
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVN98hJqLrxybwA0Da0nQSEi4I379dtupasutdts20o=; b=GWZ2Jp7dWlJjTM
	6/x6SasAMjq3PoCOWMvVp3KUo6Kft2OkL+bJcIKfRtHvU6qrdcZfgq0yXRdd00zaaiEql5OcRkewy
	bOuuNVDPuYQXFf7spSCWedKfNdvbFKJXuXWPtD+n8Y1nEvtMMC9+77Kvs1PROv/L1YDBazn67ig+j
	D9pf1zGcexOI4w4D/IhHizepbdRiH1JmqqDNU7uM1ALgfBeaz2RHQbgwGO59BXedgOQ4FfdE7OqkA
	WSmexdnqYCt9kxh9GX2MvbCIbjo5oFkW894fUrZ6zG4jDMzyrjMySOyRYoljNnuxhtP39l8BzoVos
	DZDow7UWtde1BuLEb76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSj2-00000004rGn-2ZsJ;
	Tue, 04 Mar 2025 13:54:24 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSj0-00000004rFG-1Bh5
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 13:54:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4A2544101;
	Tue,  4 Mar 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741096458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TObtvY7/gKkyt5KkpCi1wkB6r3sm/pKoiZfVLKx69/M=;
	b=FPI8EgiJz7w004v88Mflb2Uo0KRInmgOV7sSUFQ7tK03s1IGyTDgxORxzV1WtUhvvQj8yu
	tXXvZ0qiuaij6FbYmM4UXMkfZKLkTg9fvOwm8qSdM3fpOIF/Ftz4Fhui2cptnpY4+CUQHm
	GigIVTSGw9ESOSfVa3+1IE/dLF84m05N3EowyHCjPNay0LolLV/kquMvuoJCzSKhy1GXx1
	0vRXU2TogQoU3BFJLNJXLfamqet2RivDQTfxq1h7099BqR3Kzl0mLVFzV9Ajt+QBxyCJ50
	7Ovsn21UU1kHmsCXamqk7nswShCnOQqs3wd8MIyTo78r8GHuOSNJRTkpJ4UiNA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <michael@walle.cc>,  <linux-mtd@lists.infradead.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Cheng Ming Lin
 <linchengming884@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Improve spinand_info macros style
In-Reply-To: <mafs0a5a1j7om.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	04 Mar 2025 12:34:33 +0000")
References: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
	<mafs0a5a1j7om.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Mar 2025 14:54:17 +0100
Message-ID: <871pvc296e.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhts
 hdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_055422_464845_5AB9CE3C 
X-CRM114-Status: UNSURE (   7.58  )
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

SGkgUHJhdHl1c2gsCgpPbiAwNC8wMy8yMDI1IGF0IDEyOjM0OjMzIEdNVCwgUHJhdHl1c2ggWWFk
YXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUdWUsIE1hciAwNCAyMDI1LCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+Cj4+IExldCdzIGFzc3VtZSBhbGwgdGhlc2UgbWFjcm9zIHNo
b3VsZCBub3QgaGF2ZSBhIHRyYWlsaW5nIGNvbWEsIHRoaXMgd2F5Cj4KPiBzL2NvbWEvY29tbWEK
CkkgdGhpbmsgSSBuZXZlciBzcGVsbGVkIGl0IGNvcnJlY3RseSwgYnV0IGFzIHRoZSB3b3JkICdj
b21hJyBhbHNvIGV4aXN0cwoodGhlIG1lZGljYWwgdGVybSkgaXQgbmV2ZXIgZ290IHVuZGVybGlu
ZWQgYnkgc3BlbGxlcnMuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gSSdsbCBzZWUgbWF5YmUg
SSdsbCBmaXggaXQgd2hpbGUgYXBwbHlpbmcuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
