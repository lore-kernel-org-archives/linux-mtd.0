Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2914606A321
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v5fkzsEa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PT9ovgBf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuYVflvR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TJy7/gxiyEgxfRaN4bryr7B9toU7ZRxo2XTybcI8WaM=; b=v5fkzsEancTScM9cMX8aQmqZfb
	dVa6l3Q3oqMRSJmGEtIx6N+Z9wXIf/vlorByILTDvHj/VNoZ6xxvaJ2jQW4l5CmjuSh0soLdmoN2w
	kStGLRfUhyJVxW6FkD2pwZX3Y0oIUpPi3OrS6wgMii/ellZFTcxTg7DZdZRuoBASB4rh4JPKYTivt
	WtzjxtCimtFBONcTxlqxeZTiuHGu885PcaYyxcQ/rjKjLl0vSUjQy88z2mRyEK2qt5JoPqa2yy2Wf
	YvI6K+dJc2eLA1HYozr/+d1eIjtWq9lJU3qGKTiPQKSyI7KMMiOj+1dPTTVErLXyjWn2P8jLh0m3T
	4yWGNTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt6N-0000000744g-0bHn;
	Tue, 24 Nov 2026 16:10:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt6F-0000000743i-1hn2
	for linux-mtd@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=; b=PT9ovgBfHwa8TlGwq4F3c4g4ox
	+bu1++kh4ob9YNyDKYywQC8KzM/7lbbjbZ12IZokNiBmHlcs4UtfXywlIjsolUEsloQN9RF/sYeK9
	Z9LaAWG1wViAAgA4pjm6zxZp+f5eTONDy/roJP9vKGeBMjFMW+xP8aFvcUPanh3vd2emzV8FRk8xS
	0qwLJRs9n3xXw4semL7mSxrzHnZhbdrziH95sxaFJ5/0HROFmwjOd8SZwhNx/REYkEI0PCC24oLXm
	NDnbLKPltT3cZVZrjwuIKTiUC7/AA6Tx20Iwx55gd25l5UUXDtcIbEZ5wbqUUxp62k03CQfHJjzEE
	jtzyLLZA==;
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt66-00000004K1G-20vF
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 16:10:26 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7d88baba78dso1139598137.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2026 08:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795536619; cv=none;
        d=google.com; s=arc-20260327;
        b=pVzSmxRSLXQlSfNBDJ9lXkxXqGrTFtKMSKcCyG4ZYbWRYY9Yj2nGCwz15seWVBsUc7
         a+BVNq6DzSRJD7m9CCnx6zdNFXJWiVDNHliXlWvQgAfOGzUA1OXXCdulePLwvqgn9/q5
         q+ODx66dFVc4CNQyu1e04fA9LC6PemzbKD8X1VVhWzUs03V035oppw7cm0r0Uiv8ptaN
         F6RKyVVY+VeBNBiuz6B9ge/hrESNYUENaDQh3ZOw67NTUq3myTGs+qjHXElw81W6Ahs8
         kP2z9iV8nMExCxhlshY6XIZNu5IfPW8pcHTWQO1osVSmKpi8YoVln44o3zKRGdtGXeWW
         b/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=;
        fh=5DSjEy4+1BKebHkjbPe3G4EF7cauvjnmWWi9o1q1QQY=;
        b=kHrwiRmD6d8g6mljiE4Xk8dBSCb9nB87w4YS5l54CoGLylRffuMsI5LzFfZZCJmKC2
         78CVFXlwphmrnEggy+PGU1oAsI6fSeQJSoQEuxZLuJnecMJNeRitH0p7dVOfzGsWoUan
         kM1Zz46a7gpspbJGUwItQJgEMPTN4t111eaB2fCRzFj84kMb/HBC9whliN2KHIfF9M+1
         fjC1q3utlLsPBvrv0eJvrOCb1XbBZQDo5ZvvobWP4GLsXemcbWJSZpBOBcIvoicl49nG
         DoR+x44ow0IdftCtEcBQpQWF+mpPnLwvAluIZeoW4NDmvOEuF2YHYjW8zcG4YMwrhIPU
         iy1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795536619; x=1796141419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=;
        b=MuYVflvRttiWJVs50Wdfk14q5bJXClEm4yeeBqzgu9i8FG51jpoC1CpCtW6+KY3b+m
         9lZboayC4m8wZ9jVlIQkNPvQHTnb5j4PUw7yAs8RYKkI81/qvdQVvAPeoeDAgplnsRND
         usvw1msDY5x6CVCxw4Pd4rqo1skbMyiPckhXQEIbhjMLcBsgJvuLqXAmhBNU+hEWliQB
         Q5MpcWuiDt5077Q1UdJku/xw7zprdmXsuXi4Qg2vYGEXKvTbwsudz7d1GV1KNxbtzjJI
         nSHXwigSGwzliQUgErUNH0tCz1KQ9xJJSZwh8iMo+eGMgJGHSD+y60DN6fHzZ1uxD6i0
         5iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536619; x=1796141419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJt4JMv5FVP1qu+wQIQwqnzbRKFhP11tEo/XVFuWAeE=;
        b=tw88EcwHRCiFZgNi86nwszpCeJMypayws1vPsPBiFulHslueGBtlT7BWEPcy+6qXih
         yEjyLSQ/t4npasALCCxo/qHJysQsXuia42FOk6FreVvmBe7IiPZBwth7E/vuxZ8I7l5n
         KgS6wQ9zWsyJIq56ofl496d7Er1MfJahi+dlHBxSDVDMLfCnJEVYaMP5qZ39Aftx/RxA
         8P0E9jkdrd6pdgKW42eKNlZ5/kDMV5BCunEaKZ/pHj7YNGN0gwdOlfosS3Dw2uZt7YBW
         YZjKUCvyomif1uZDS8lOC1IKZLWvhGpgdRIT+qL0xoBlK1rb0Zvxbd/hxNziHNSGdsqb
         FdfQ==
X-Forwarded-Encrypted: i=1; AL+hErGNygeKKWyB38csk5RwDTTool7B+V3k3tF8KVfd6VSQOT93gJHPsG1SnBsrmh3lTx433GZADhO0twI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8ctivwB/j27zi6CJ4OCBNdVHoK0+mbY8cWJTlxJekjQ512XSdV
	2QPlPqiYZ2ZZtBF6zIM44s0kkBAS657lAjBkvotego8LA6wZDZc83D1t/ej7qG6I+zHyFwiD3FY
	fJjoA6Vgj8oCopllD9KeKP3DqwAIoxL4=
X-Gm-Gg: AZFdTZc3bbEFpiGVcxNXjzgbKnaycquUP7ZjCaC999phVuSM9HY/waCEAXlYOqRdawM
	cRmrNrtkDFh2UkbqPxZBfPjF75sk7JehyabzSW8AwmgSB9OOq5olbVoAuNUGKQY6eQQkjqLwhkL
	RsZhrgwqek/4weQFf1sCt3N4rw/pqajFNSlnMgEvAjZdZTUJhYGj3+AUmwlMQ91ZAoLVpr6/6QV
	hETiAyHcO6GBDQYhBJrlNzi4HzbV2WTlXX4/t1uPu4+Zo4SxDTUy1bGP5Pv/z3TU3A5X2Vg3LLQ
	W/qNiENCqDQLU6Wl5PlDVzZfRE+80iaTuptmBqQYyU9OnUybnYgsALwVzA0aiguyNHlZScxQDy5
	O8YUV4Ap06V+pBpwtlE9bWOb32+4eFt75G/CefIn7txQNiOu65/dgiEIiGnC62VNta+ANLSESTd
	642yjOHawQeNRNbKtk9HnNmikOmktrw02cY1af3KkKMGMkvjo1828++TiF9xU+Vw7fbfWaCw8U3
	XJDr/Kvggjafz0Ah26vlf4tbH4bz2ArjlL+FO7v6IONX/Zy2co=
X-Received: by 2002:a05:6102:442a:b0:7d0:5688:f4f3 with SMTP id
 ada2fe7eead31-7d72b368b6amr6483489137.1.1795536619304; Tue, 24 Nov 2026
 08:10:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
 <20261122-submit-rawnand-operation-locking-v1-v2-1-030bc867f0c7@gmail.com> <87a4mys2ia.fsf@bootlin.com>
In-Reply-To: <87a4mys2ia.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Nov 2026 09:10:06 -0700
X-Gm-Features: Aa3M54pmQwhIMEHjbM07Pzq4IWONoMnEjbuJLtRAcRbDWaiND34wvm_s5GYEEOU
Message-ID: <CADvTj4q79XR9ymtzBHr7TUc+TnuoB2R-sUa+BWOCS1u7UTEUkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Boris Brezillon <bbrezillon@kernel.org>, 
	Kyle Roeschley <kyle.roeschley@ni.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_161024_137294_4CBDE957 
X-CRM114-Status: GOOD (  26.37  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgNzo1NeKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4KPiA+IE9UUCBJL08gY2FuIGFsc28gcnVuIHdo
aWxlIHRoZSBjaGlwIGlzIHN1c3BlbmRlZC4KPgo+IFJlYWxseT8gV2hlcmUgZG9lcyB0aGF0IGNv
bWUgZnJvbT8KCkkgd2FzIHJlZmVycmluZyB0byBjaGlwLT5zdXNwZW5kZWQgaW4gbmFuZF9iYXNl
LmMuIG5hbmRfc3VzcGVuZCgpIHNldHMKdGhhdCBmbGFnIGV2ZW4gd2hlbiB0aGUgY2hpcCBoYXMg
bm8gc3VzcGVuZCBob29rLiBOb3JtYWwgTkFORCBJL08gd2FpdHMKZm9yIHJlc3VtZSBpbiBuYW5k
X2dldF9kZXZpY2UoKSwgYnV0IE1URCBjYWxscyB0aGUgTWFjcm9uaXggdXNlci1PVFAKcmVhZCBh
bmQgd3JpdGUgY2FsbGJhY2tzIGRpcmVjdGx5LCBieXBhc3NpbmcgdGhhdCBjaGVjay4KCkkgaGF2
ZW4ndCBvYnNlcnZlZCBPVFAgSS9PIGR1cmluZyBzeXN0ZW0gc3VzcGVuZC4gVXNlcnNwYWNlIGlz
IG5vcm1hbGx5CmZyb3plbiBiZWZvcmUgZGV2aWNlIHN1c3BlbmQsIGFuZCB0aGUgTWFjcm9uaXgg
ZHJpdmVyIGRvZXNuJ3QgaW5zdGFsbAppdHMgZGVlcC1wb3dlci1kb3duIGhvb2sgb24gdGhlIE1Y
MzBMRnhHMThBQyBwYXJ0cy4KCj4KPiBbLi4uXQo+Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2Jhc2UuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMKPiA+IEBAIC0yMDcsNyArMjA3LDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwobmFuZF9kZXNlbGVj
dF90YXJnZXQpOwo+ID4gICAqCj4gPiAgICogUmVsZWFzZSBjaGlwIGxvY2sgYW5kIHdha2UgdXAg
YW55b25lIHdhaXRpbmcgb24gdGhlIGRldmljZS4KPiA+ICAgKi8KPiA+IC1zdGF0aWMgdm9pZCBu
YW5kX3JlbGVhc2VfZGV2aWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiArdm9pZCBuYW5k
X3JlbGVhc2VfZGV2aWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4KPiBZb3UgZXhwb3J0IGEg
Y29yZSBoZWxwZXIuLi4KPgo+ID4gIHsKPiA+ICAgICAgIC8qIFJlbGVhc2UgdGhlIGNvbnRyb2xs
ZXIgYW5kIHRoZSBjaGlwICovCj4gPiAgICAgICBtdXRleF91bmxvY2soJmNoaXAtPmNvbnRyb2xs
ZXItPmxvY2spOwo+ID4gQEAgLTMzNiw3ICszMzYsNyBAQCBzdGF0aWMgaW50IG5hbmRfaXNiYWRf
YmJtKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGxvZmZfdCBvZnMpCj4gPiAgICoKPiA+ICAgKiBM
b2NrIHRoZSBkZXZpY2UgYW5kIGl0cyBjb250cm9sbGVyIGZvciBleGNsdXNpdmUgYWNjZXNzCj4g
PiAgICovCj4gPiAtc3RhdGljIHZvaWQgbmFuZF9nZXRfZGV2aWNlKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXApCj4gPiArdm9pZCBuYW5kX2dldF9kZXZpY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkK
PiA+ICB7Cj4gPiAgICAgICAvKiBXYWl0IHVudGlsIHRoZSBkZXZpY2UgaXMgcmVzdW1lZC4gKi8K
PiA+ICAgICAgIHdoaWxlICgxKSB7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5j
Cj4gPiBpbmRleCAxNjg0N2YyOGIxOWQuLmQ3ZjVhOWU3YzI0MCAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+ID4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9tYWNyb25peC5jCj4gPiBAQCAtMzgwLDYgKzM4MCw3IEBAIHN0YXRpYyBp
bnQgX19tYWNyb25peF8zMGxmeGcxOGFjX3J3X290cChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiA+
ICAgICAgIGludCByZXQsIGNsZWFudXBfcmV0Owo+ID4KPiA+ICAgICAgIG5hbmQgPSBtdGRfdG9f
bmFuZChtdGQpOwo+ID4gKyAgICAgbmFuZF9nZXRfZGV2aWNlKG5hbmQpOwo+Cj4gLi4uYW5kIHlv
dSB1c2UgaXQgYWNyb3NzIHRoZSBlbnRpcmUgT1RQIG9wZXJhdGlvbi4uLgoKVGhlIHJhY2UgZG9l
c24ndCByZXF1aXJlIHN1c3BlbmQ6IGFuIG9yZGluYXJ5IHBhZ2UgcmVhZCBvbiB0aGUgc2FtZQpj
aGlwIGNhbiBpc3N1ZSBpdHMgY29tbWFuZCBhZnRlciB0aGUgT1RQIGNhbGxiYWNrIGhhcyBlbmFi
bGVkIE9UUCBtb2RlCmFuZCBiZWZvcmUgaXQgcmVzdG9yZXMgbm9ybWFsIG1vZGUuIExvY2tpbmcg
ZWFjaCBjb21tYW5kIHNlcGFyYXRlbHkKd291bGQgc3RpbGwgbGVhdmUgdGhhdCB3aW5kb3cgb3Bl
bi4KCj4KPiA+ICAgICAgIG5hbmRfc2VsZWN0X3RhcmdldChuYW5kLCAwKTsKPiA+Cj4gPiAgICAg
ICByZXQgPSBtYWNyb25peF8zMGxmeGcxOGFjX290cF9lbmFibGUobmFuZCk7Cj4gPiBAQCAtNDI2
LDYgKzQyNyw3IEBAIHN0YXRpYyBpbnQgX19tYWNyb25peF8zMGxmeGcxOGFjX3J3X290cChzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICB3cml0ZSA/ICJ3cml0
ZSIgOiAicmVhZCIpOwo+ID4KPiA+ICAgICAgIG5hbmRfZGVzZWxlY3RfdGFyZ2V0KG5hbmQpOwo+
ID4gKyAgICAgbmFuZF9yZWxlYXNlX2RldmljZShuYW5kKTsKPiA+Cj4gPiAgICAgICByZXR1cm4g
cmV0ID8gcmV0IDogY2xlYW51cF9yZXQ7Cj4gPiAgfQo+Cj4gLi4uYW5kIGluIHRoZSBjb21taXQg
bG9nIHlvdSBtZW50aW9uOgo+Cj4gPiBNYWtlIHRoZSBleGlzdGluZyBOQU5EIHNlcmlhbGl6YXRp
b24gaGVscGVycyBhdmFpbGFibGUgd2l0aGluIHRoZSByYXcKPiA+IE5BTkQgY29yZSBhbmQgaG9s
ZCB0aGVtIGFjcm9zcyB0aGUgZW50aXJlIE9UUCB0cmFuc2FjdGlvbgo+Cj4gV2h5IGFyZSB5b3Ug
ZG9pbmcgdGhlIHNlcmlhbGl6YXRpb24gaW4gb25lIHZlbmRvciBkcml2ZXIgdGhlbj8gQXJlbid0
Cj4gYWxsIHRoZSB2ZW5kb3JzIGFmZmVjdGVkIGJ5IHRoZSBleGFjdCBzYW1lIGlzc3VlPyBXaHkg
aXNuJ3QgdGFraW5nIHRoZQo+IGxvY2sgb25jZSBmb3IgYWxsIGluIHRoZSBjb3JlIGEgYmV0dGVy
IGlkZWE/CgpNYWNyb25peCBpcyB0aGUgb25seSBpbi10cmVlIHJhdyBOQU5EIG1hbnVmYWN0dXJl
ciB0aGF0IGluc3RhbGxzIE1URAp1c2VyLU9UUCByZWFkIGFuZCB3cml0ZSBjYWxsYmFja3MuIEJv
dGggdXNlIHRoZSBzYW1lIGhlbHBlciwgc28gdGFraW5nCnRoZSBsb2NrcyB0aGVyZSBjb3ZlcnMg
Ym90aCBwYXRocyB3aXRob3V0IGNoYW5naW5nIHRoZSBpbnRlcmZhY2UuCgpBIGNvcmUgd3JhcHBl
ciBjb3VsZCB0YWtlIHRoZSBjaGlwIGFuZCBjb250cm9sbGVyIGxvY2tzIGFyb3VuZCBhCm1hbnVm
YWN0dXJlcidzIE9UUCBjYWxsYmFjaywgbXVjaCBhcyBuYW5kX2xvY2soKSBkb2VzIGZvcgpjaGlw
LT5vcHMubG9ja19hcmVhLiBUaGF0IHdvdWxkIGdpdmUgZnV0dXJlIGltcGxlbWVudGF0aW9ucyB0
aGUgc2FtZQpsb2NraW5nLCBidXQgaXQgd291bGQgbWVhbiBhZGRpbmcgcmF3IE5BTkQgT1RQIGhv
b2tzIHdoZXJlIE1URCBjdXJyZW50bHkKY2FsbHMgdGhlIG9uZSBpbXBsZW1lbnRhdGlvbiBkaXJl
Y3RseS4gSXMgdGhhdCB0aGUgYXBwcm9hY2ggeW91IGhhZCBpbgptaW5kPwoKPgo+IE1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
