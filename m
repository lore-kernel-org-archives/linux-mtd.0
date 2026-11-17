Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F7A606A89E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tMpY4EL4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=p0sD7NoG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CVKciN4HTLHtNcTtkla9V9AZCc13BO5VvlH+1v1xTEw=; b=tMpY4EL4Gp9pq8Tes7f8zuu2fa
	MV8KJcth2rvAwNfUDoCo7umPcQYvnj1S8lLf6h/4u6IK2Q35W2jDIX7MU60Bw1owIKHt7cU+h+13m
	s0fq8ov7SbkhkAjKskxJkdcjJPJRAlJrGyI4ejGiux4pHfJq9c/u+IaWT1ok3RHGxSPETlsC2ZG73
	PblWSAmpXuCQCYhwG37zl0h5Qecl7k00wtvUGCb3/YTzcVN1zZHzuyoSxLngJOkLubdWZeGNgvQwi
	Sq2v3nvxijYYcO+9l32ulJ/B9YiC5TcQ4PwNmalStflohXB9A77loXHwzi20hukHCqtoRmq0Hdt/a
	CqCI7uew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5j-000000066gj-46WY;
	Tue, 17 Nov 2026 14:23:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5f-000000066as-03iT
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D0211A167E;
	Tue, 17 Nov 2026 14:23:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6349C5FD6A;
	Tue, 17 Nov 2026 14:23:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E617211BC0041;
	Tue, 17 Nov 2026 15:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=viHK9iF57V7j82GCnAJohyxrrXvsf4uMUlYjZ09Vx9A=;
	b=p0sD7NoG3+N+m+rHm4OmSbfjAeNL8g9dq2xD755iIi5d2nT8+UR0tox+ItlUnJYAG3jN5S
	1/dxGU0tUoOheTAphw5op7Xfb8yi6k6SDHDcySMGRQCg+ap1T/aSBwn3FiJGrI2/gGNxn2
	SMMnngpJtq8IBFxvrIkSZ7908RdhCHlrq3PFSu1h0F5JdqkC1BtKRtTfFdqXRMrCSyb013
	aY0htAm9WUXtGNSmPxP7rMFNgxd2OWAWzx+pbFx3mRyqCCy66PhomSVhv1EKv+UGuG4iKJ
	gcRmlxPAgfhjolU6j7IKrKbDWiW6w7fDo4lqUrwgcngWDk8vzddP3FvivYbIBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Yige Jiang <yigejiang86@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
In-Reply-To: <rc-review-20261029-ai12-12-5b57d6320701@gmail.com>
References: <rc-review-20261029-ai12-12-5b57d6320701@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: omap2: release the ELM device node
 reference
Message-Id: <179492539586.2259780.1383274942721957151.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062319_197421_297F2CB7 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyOSBPY3QgMjAyNiAyMDowMzo0NyArMDgwMCwgWWlnZSBKaWFuZyB3cm90ZToKPiBv
bWFwX2dldF9kdF9pbmZvKCkgYWNxdWlyZXMgYW4gRUxNIG5vZGUgcmVmZXJlbmNlIHRocm91Z2gg
dGksZWxtLWlkCj4gb3IgdGhlIGxlZ2FjeSBlbG1faWQgcGhhbmRsZSwgYnV0IG5ldmVyIHJlbGVh
c2VzIGl0LiBUaGUgZXhpc3RpbmcKPiBwdXRfZGV2aWNlKGluZm8tPmVsbV9kZXYpIHJlbGVhc2Vz
IGEgc2VwYXJhdGUgZGV2aWNlIHJlZmVyZW5jZS4KPiAKPiBSZWdpc3RlciBhIG1hbmFnZWQgb2Zf
bm9kZV9wdXQoKSBhY3Rpb24gaW1tZWRpYXRlbHkgYWZ0ZXIgcGFyc2luZyB0aGUKPiBwaGFuZGxl
LiBUaGlzIHJlbGVhc2VzIHRoZSBub2RlIG9uIGxhdGVyIHBhcnNpbmcgYW5kIHByb2JlIGZhaWx1
cmVzCj4gYW5kIGFmdGVyIE5BTkQgY2xlYW51cCBvbiB1bmJpbmQuIElmIGFjdGlvbiByZWdpc3Ry
YXRpb24gZmFpbHMsCj4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgcmVsZWFzZXMgdGhlIHJl
ZmVyZW5jZSBpbW1lZGlhdGVseS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRo
YW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogb21hcDI6IHJlbGVhc2UgdGhlIEVMTSBkZXZpY2Ug
bm9kZSByZWZlcmVuY2UKICAgICAgY29tbWl0OiBjNDZiM2MxYzI4ZmIzNGI5ZWExYWJkNWU1ZmI0
MjE5Y2Q3OGFhZjM0CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXgu
Z2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9i
b3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
