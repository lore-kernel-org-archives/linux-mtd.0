Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B1EC001DC
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 23:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVf2YRGbAKNz5N0vfYEBhB1qwZ3VPaWh+yvOtCDwt9I=; b=qIy3cXCXpD0H5g
	UQu6lbaqc8U2tBfWcDAcCp/e8EpT6wlclMxnCW7xg/HTa75KYIJUwh2aBFRjfLWvJmORKPQ6x6bcw
	SQbFZX95LlLF4Xpnb/NwPPKiQcWwb/NeeKjBCpPoOY9ABzENGhCC5JUckQHSTIU6bT9t0EByWuV4v
	Ut5mxzoPgbr9wh4IhDeqWzzpSwjo3H9qjqyJkPhmhb/9RN8JtOLuqynJ0MUF0eN0YxjDAwlY0wt2n
	n0gL3QArfoPi34Z4fIhRYOzy5lBz4wLnJEeSx30Onb/D7YLYgrgry5W8epKbrhaS7eruWYMvkEJwW
	hJb21IAVLAHcY7dXKAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNM2q-00HU40-24;
	Sat, 22 Jul 2023 23:29:52 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNM2j-00HU2p-1I
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 23:29:48 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8B0275C00A6;
	Sat, 22 Jul 2023 19:29:38 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
  by compute5.internal (MEProxy); Sat, 22 Jul 2023 19:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1690068578; x=1690154978; bh=292ISRBXqjU3dICOmMLZ7irFI
	50HhQ7VePIGL7frBFg=; b=anfinDLQ2HB5FyrtO9ZigqSLm3eJn/miFGC8TsdFM
	xMU5zTu27G/aBhT+GtLyzdR50xS4SBIm/GJlBrBX5sWgqg2QvFATDBaL9R7MInC8
	1XA4ThJUlrfrUt73cpUC3H/VkwjEKEisnLdiB7mXYzxSjoAD9MiszDkc8aWyWWVC
	xRjBEp0qqgQNWtdXyBVFd39FCdcNOHtLh9Vj4eaHNKmjE+kyavTmE6dN6yokUvWi
	0luUVPpE4z7jvT5OSwEB3s9pmtyvZDjiB7gqynttjCmOAR6rQX9UXi++4yvoT/nK
	LO+KJqJa25hZyPn+hPGBx1qyXrcR6y7/OYvfUUNbGOKkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1690068578; x=1690154978; bh=292ISRBXqjU3dICOmMLZ7irFI50HhQ7VePI
	GL7frBFg=; b=RTMDfoPstpQ59khop2S0q1KFbCgUjx90//ikrlC0F+H4imjvnE/
	/YteJgSHEaHqfwjPgX5SEbr+P+R/MWjOU0DEQDjIgknBkg1YK/lq4/gPP8Ha4Noj
	kgQsTi+ehInnrR11j52gLqObgeFVih1YBD1Tbr5LSEv1t6PIp9U23tTYl1omuV5b
	3SUnRwGYRfhe0J0ccj2QFr5/ldFODr/hK3baEu2leHtA2/qFjjui/dAHYQeRqWx0
	7x6JAlX1texVnoG+dmYASRVQcKPSIUT2BNIKzXkcSno5RAUYrLUxidyTcwnXp3N6
	n7oauMh9/aKfrddLF1VsHAC9QSuo/xGAyog==
X-ME-Sender: <xms:YWa8ZHHxB6pq9ngCvRvIQU9Ad3QUzh90U3budkTUrOFClxruqgcJMA>
    <xme:YWa8ZEVvb2JnwVm4isQYSySD6wWw61fb7gQI6Yf7PWWhKtBqlfUE-KZHioisfNL8s
    tSmNq_siBj1uh38XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheehgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfho
    hhhnucfvhhhomhhsohhnfdcuoehlihhsthhssehjohhhnhhthhhomhhsohhnrdhfrghsth
    hmrghilhdrtghomhdrrghuqeenucggtffrrghtthgvrhhnpeevhedvgefhffdtgedukedv
    hfdvudeiueehteeiveegudekhffhieegheehgfevfeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlihhsthhssehjohhhnhhthhhomhhsohhn
    rdhfrghsthhmrghilhdrtghomhdrrghu
X-ME-Proxy: <xmx:YWa8ZJK2Zmi8Z3SHns-CQT17ZbV6qOk88k0Cw5vgDummC0-vBvYDUg>
    <xmx:YWa8ZFFUPusJ5YvPBe67s_uO1RWo-F6HwiWFPVVVkqFs-6ri9hk1DA>
    <xmx:YWa8ZNVwOl7lz83FANcdwQiQZO6gEcAsxut63zUYH1kwE7Dw3MX9DA>
    <xmx:Yma8ZAToOMeCvBTfcid2W6itmKwQb6ZjY8LLfqkMbxKfUT5_JNw64A>
Feedback-ID: ia7894244:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 936DA2A20085; Sat, 22 Jul 2023 19:29:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <34fb7d0e-d2a2-4617-9c88-3e33203c37fb@app.fastmail.com>
In-Reply-To: <20230718134927.10047-1-zajec5@gmail.com>
References: <20230718134927.10047-1-zajec5@gmail.com>
Date: Sat, 22 Jul 2023 23:28:56 +0000
From: "John Thomson" <lists@johnthomson.fastmail.com.au>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: mtdpart: check for subpartitions parsing result
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_162945_966801_7C2C73A0 
X-CRM114-Status: GOOD (  15.05  )
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

SGkgUmFmYcWCLAoKT24gVHVlLCAxOCBKdWwgMjAyMywgYXQgMTM6NDksIFJhZmHFgiBNacWCZWNr
aSB3cm90ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4KPiBw
YXJzZV9tdGRfcGFydGl0aW9ucygpIG1heSByZXR1cm4gYW4gZXJyb3Igc28gaXQgc2hvdWxkIGJl
IGNoZWNrZWQgYW5kCj4gb3B0aW9uYWxseSBwYXNzZWQgdXAKPgo+IFNpZ25lZC1vZmYtYnk6IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbXRk
cGFydC5jIHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYyBiL2RyaXZl
cnMvbXRkL210ZHBhcnQuYwo+IGluZGV4IDIzNDgzZGI4ZjMwYy4uZjQzYjUzNDI5OTJhIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBhcnQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBh
cnQuYwo+IEBAIC00MjYsNyArNDI2LDExIEBAIGludCBhZGRfbXRkX3BhcnRpdGlvbnMoc3RydWN0
IG10ZF9pbmZvICpwYXJlbnQsCj4gIAkJbXRkX2FkZF9wYXJ0aXRpb25fYXR0cnMoY2hpbGQpOwo+
IAo+ICAJCS8qIExvb2sgZm9yIHN1YnBhcnRpdGlvbnMgKi8KPiAtCQlwYXJzZV9tdGRfcGFydGl0
aW9ucyhjaGlsZCwgcGFydHNbaV0udHlwZXMsIE5VTEwpOwo+ICsJCXJldCA9IHBhcnNlX210ZF9w
YXJ0aXRpb25zKGNoaWxkLCBwYXJ0c1tpXS50eXBlcywgTlVMTCk7Cj4gKwkJaWYgKHJldCkgewoK
VGhhbmtzIGZvciBmaW5kaW5nIHRoaXMuIEkgYmVsaWV2ZSB3ZSBuZWVkIHRvIGNoZWNrIHRoYXQg
dGhlIHJldHVybiB2YWx1ZSBpcyBuZWdhdGl2ZS4KICsJCWlmIChyZXQgPCAwKSB7CgovKioKICog
cGFyc2VfbXRkX3BhcnRpdGlvbnMgLSBwYXJzZSBhbmQgcmVnaXN0ZXIgTVREIHBhcnRpdGlvbnMK
4oCmCiAqIFRoaXMgZnVuY3Rpb24gbWF5IHJldHVybjoKICogbyBhIG5lZ2F0aXZlIGVycm9yIGNv
ZGUgaW4gY2FzZSBvZiBmYWlsdXJlCiAqIG8gbnVtYmVyIG9mIGZvdW5kIHBhcnRpdGlvbnMgb3Ro
ZXJ3aXNlCiAqLwoKPiArCQkJcHJfZXJyKCJGYWlsZWQgdG8gcGFyc2Ugc3VicGFydGl0aW9uczog
JWRcbiIsIHJldCk7Cj4gKwkJCWdvdG8gZXJyX2RlbF9wYXJ0aXRpb25zOwo+ICsJCX0KPiAKPiAg
CQljdXJfb2Zmc2V0ID0gY2hpbGQtPnBhcnQub2Zmc2V0ICsgY2hpbGQtPnBhcnQuc2l6ZTsKPiAg
CX0KPiAtLSAKPiAyLjM1LjMKCgpDaGVlcnMsCi0tIAogIEpvaG4gVGhvbXNvbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
