Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8ABC982CC
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 06:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GV6GpvxSNFPXcHCV51wTEyny62T6XAQIlvrUgEWYNfk=; b=aF+tTmrgHb90UA
	Fp4WYIE/+QsobMuMo7HbmsWxWJ6keky740P3olsSQb1wFRkFQ8Wd/X0ZzKzlz1Qy1a4eFyfUa7Cz8
	26dMs2VARJXXplN+P8ekP8c3O4mvWFE1rbQ4X2ElE4/MTdZ4ZrjYO2AMxGmg8dfmBvvmvoWcI4aqk
	6WJ18Qb70O/6vLqC8XgUegJxcYuUI1yKq+Scbm5RPK78kWllqWP6dGPT0JT1W1qaPKjxeU3X98sKE
	WsK/EJs+od00JNB5ZWu2bjY5QvoVgx44IenLldujeWnVnia+Tjgv3TMf8BKi75bpK3rdg6YWv1T1i
	+l7poCaE4fiwadSBTYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7p12-0000000G1cN-1Q2T;
	Sat, 19 Sep 2026 06:57:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7p0y-0000000G1aY-3ewS
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 06:57:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 977DB4E408AC
	for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2026 06:57:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 517E8606CA;
	Sat, 19 Sep 2026 06:57:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1C3210329092;
	Sat, 19 Sep 2026 08:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789801050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CdeviTjdjJCDYUPWwlGwsQKUwhdt2EagNQy0dLTAloI=;
	b=Gu/79k1CM/jlJf/3eEFcnxyV3wOYMPi51uVGJ0Bx4UemLtGfII7F2Sy/mykC2cen0Zz3vy
	GQsuFV0wvEQuIwHuZpc7Vor1rHTAzh6FxHvV8ipHcvRfuhqOiM89KvTnXGwdQuTeu16WFs
	vs0aP2THFr/ugloX4/JdJ3xF94eZOKyg9jbxuIuGx3EHG9+QgiwCkCV0fACRiF85u2fB/P
	pKZXVeqy7SqA0baN+iFYvsJUZlM5q3dVybLWyF6eYWGJNpxREZrVHS+jqFeXt8x8wTsnKw
	Fjdcpl0c1gL9PRkvnc2GrEzA8We8oOZQaCwvuEOTbjJzX1X01nai4ymRY7AtTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ruslan Vagner <rusya92266@gmail.com>
Cc: linux-mtd@lists.infradead.org,  richard@nod.at
Subject: Re: [PATCH] mtd: fix comment typos in UBI and NAND headers
In-Reply-To: <CAF9RqJ45HPa1HpJdZp3=G6QAxyNSFo4D1cpkPQhN5YmHbSdmSQ@mail.gmail.com>
	(Ruslan Vagner's message of "Tue, 15 Sep 2026 05:55:58 -0700")
References: <CAF9RqJ45HPa1HpJdZp3=G6QAxyNSFo4D1cpkPQhN5YmHbSdmSQ@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sat, 19 Sep 2026 08:57:28 +0200
Message-ID: <87a4pdg23r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_235737_066810_596FE2ED 
X-CRM114-Status: UNSURE (   8.39  )
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

SGkgUmljaGFyZCwKCj4gRml4IHRoZSBzcGVsbGluZyBpbiBjb21tZW50cy4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNsYW4gVmFnbmVyIDxydXN5YTkyMjY2QGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvdWJpL3dsLmMgICAgICAgICB8IDIgKy0KPiAg
aW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICB8IDIgKy0KPiAgaW5jbHVkZS9saW51eC9tdGQv
c2hfZmxjdGwuaCB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpTaGFsbCBSdXNsYW4gc3BsaXQgdGhpcyBpbnRvIHR3byBwYXRjaGVzLCBv
ciBjYW4gSSB0YWtlIGl0IHRocm91Z2ggdGhlCm10ZCB0cmVlPwoKVGhhbmtzIQpNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
