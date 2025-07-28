Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DEEC87FC9
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cykNwp5aNL2lWhB/BVhEalNvXU38GHmu6/rrMa+q2ak=; b=nt9o5pigkJv339
	vVINtv1ZNjnQ+uTuKnuQXyQTnxhrOFHDuwELZutD5AzP2jM5oa85sRKBFKskDyuijfpARCDD4C5Mr
	F2Yw6H+fiy6vVZlSCGVrzg92MlKQHQP8bUcE9lCzqQFchCwb5vstQGnnwuTzOHdNY5pL9cxrFvHsH
	LJ6ZFNpxllJUbVVc/Zv/UQCIs7y2S8/HZzoraFdGR0ndxeCtc2mTJh4Bj25vXSJxWnaNLkml56zoX
	q3pSOvQ4q3NxnKeLwfitR2Qdh7HRr2SFUpM2bZZXqKkGs/RepZs/t9VFWGJLT+teiAxBdBOOSnq4Q
	/P09/GkTtGtn7Sl1eg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKxQ-0000000ECuN-1QjH;
	Mon, 28 Jul 2025 10:19:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKux-0000000ECXL-1eRy
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Jul 2025 10:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZPJVXb/5d0Ebwv+JnWMIP1emP4lNCvm9KUIgiwqhWUU=; b=fpnrZUhW1rYigbu9m8pOSkdzCx
	XLBTXSHGjxCZ3XIzS/W1FkmtUPyqQ73K762g3IYoVTPOnlc/dHAvDNPBdzQK2IEp6/wXDNl7t9+IY
	mI9v77aPmUzT6Cmzdr4F0fgMgzyD+BktVew3kFnSo1/92OMOX+YY1MrYOFKAMQEvIsp5sNONsfHja
	HgPcDd5p/6C54b8gFfEca8whXiB5MZQFqBE5x+zNP2nO7L2S1Pvo16aiO0Jz7CdPOUd6q9aQjO4CC
	mG6ETLNHt+q+RoOFU+N+7j7mPYLkZQ4ABuGzEDvQ0007AXuC1MBfz3KBxATDzLaDmSQREqB83KIvn
	0vbN4jPQ==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKuq-0000000CQx4-1M1I
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:17:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D85A443212;
	Mon, 28 Jul 2025 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPJVXb/5d0Ebwv+JnWMIP1emP4lNCvm9KUIgiwqhWUU=;
	b=NQGOEF3WNChBSDjqr0SE9gRtUhivDHNrlPycFw2Oz08reaUOOwrvYZ0ttqT1o+Augy+K/N
	Cu/huwUQV5ywozTtc0Eo0sbMEhtR0MwF7t0UPgsmsxlBy6fSIeWKomeOWl26Nd3NiickKn
	oqNiJ4XtGKKBTMtvp9lOOyPZkZrDt/2WVAbib1ApoBANVfnijFs/KOWUrkplOwezq/ouIO
	jO18S9LHmpDTDsqFcZOTtE0oikQbxqWN2+nq1c9HuOQ5UI4ET8S8BC4ZmOytrT/awEOvNO
	k0HpfxP2TAq/Xsn/o8gRpuLAbrZqnGi35f4IX3jBcSVWCxZR5C6z2wJc3eVQKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250702080110.46839-2-fourier.thomas@gmail.com>
References: <20250702080110.46839-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: renesas: Add missing check after DMA
 map
Message-Id: <175369782376.102528.13884729975771855369.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtt
 hhopehfohhurhhivghrrdhthhhomhgrshesghhmrghilhdrtghomhdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111710_166710_1B77705E 
X-CRM114-Status: UNSURE (   5.18  )
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

T24gV2VkLCAwMiBKdWwgMjAyNSAxMDowMTowNiArMDIwMCwgVGhvbWFzIEZvdXJpZXIgd3JvdGU6
Cj4gVGhlIERNQSBtYXAgZnVuY3Rpb25zIGNhbiBmYWlsIGFuZCBzaG91bGQgYmUgdGVzdGVkIGZv
ciBlcnJvcnMuCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRk
OiByYXduYW5kOiByZW5lc2FzOiBBZGQgbWlzc2luZyBjaGVjayBhZnRlciBETUEgbWFwCiAgICAg
IGNvbW1pdDogMTI1N2U3NWU2MmMzNjNmZjRlODU3YTQ5ZmQ1YzRiMWNhMmIyYjE2NgoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
