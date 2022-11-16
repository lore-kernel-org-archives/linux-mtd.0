Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC95C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Nov 2022 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Message-Id:Date
	:MIME-Version:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wf/cqXBV5XwU8/JCKx+xQxw+Mj0KfMzpmRSl+6YVuso=; b=MT2A0KrdtQEOuP4qC6emI7bS20
	UpWRzY2vmIRRShMiG/lr+cHfCB8TZbvz1uWnCDxZ376wJNlv08NaYVL5BCS7j4H6/cv3ik0Xqdd/E
	nQrofY/x3O+QcdVtUq2MSjQqUd0hadg11dYIOMEUvvu0TtN22QKbx1vkSwW6QuuBb7pfJWO9NStbr
	NCbNL3NxVoEt5Vw9FYCOmg+Ar+3EEjv8K0ZcRLSgBV0IqVFtT4M4xB5Kf2SzvU7HffVxO6X/dfzcx
	FAuLGuQdX8qheaD5VnsPT8KnQLruklvU54lEcuLeCnxLbcSiypmEnDgRUJ1siRDzIOLWpuh+34GAa
	MB/61VTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovJsY-004sQe-Cm; Wed, 16 Nov 2022 14:59:06 +0000
Received: from forward103p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:106])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovJsU-004sNU-2D
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2022 14:59:04 +0000
Received: from iva7-79032ba5307a.qloud-c.yandex.net (iva7-79032ba5307a.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:320d:0:640:7903:2ba5])
	by forward103p.mail.yandex.net (Yandex) with ESMTP id D825A5A26B8
	for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2022 17:58:55 +0300 (MSK)
Received: from mail.yandex.ru (mail.yandex.ru [94.228.252.55])
	by iva7-79032ba5307a.qloud-c.yandex.net (mxback/Yandex) with HTTP id owhSIf0VeeA1-wtVaA1C2;
	Wed, 16 Nov 2022 17:58:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1668610735;
	bh=uu17CJ5Graq9W2FF8u5F5d0TvTQmW72oDwkpTa2gt+E=;
	h=Message-Id:Date:Subject:To:From;
	b=we3XZCcHU431bNEAdx3ZQHCYlLsH+ZoIzVa++/hVXl2Wd59uUYr6m3YByY+Lt82Yc
	 9XhHYn2yIJAkdxnhPgVIR/Y+4dxlaW3knYwfvbpXLMCJ+r4UQd5m+h50A4whtN8XJ7
	 nm7w35dwKBS0qFQTlFK9coZ8IE/sm7AI/SU3XseQ=
Authentication-Results: iva7-79032ba5307a.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
Received: by 2y2i6g6snfcuakol.iva.yp-c.yandex.net with HTTP;
	Wed, 16 Nov 2022 17:58:55 +0300
From: =?utf-8?B?0JrQvtGA0L7QsdGH0LXQvdC60L4g0JDQvdC00YDQtdC5?= <korrav@yandex.ru>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS: failed to read inode, error -2
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 16 Nov 2022 17:58:55 +0300
Message-Id: <1857121668610527@mail.yandex.ru>
Content-Type: multipart/mixed;
	boundary="----==--bound.445953.2y2i6g6snfcuakol.iva.yp-c.yandex.net"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_065902_628467_851DCDCD 
X-CRM114-Status: UNSURE (   7.77  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


------==--bound.445953.2y2i6g6snfcuakol.iva.yp-c.yandex.net
Content-Disposition: attachment;
	filename="question.txt"
Content-Transfer-Encoding: base64
Content-Type: text/plain;
	name="question.txt"

U3ViamVjdDogVUJJRlM6IGZhaWxlZCB0byByZWFkIGlub2RlLCBlcnJvciAtMgoKSGVsbG8uCkkg
ZW5jb3VudGVyZWQgYW4gZXJyb3Igd2hpbGUgd29ya2luZyB3aXRoIFVCSUZTIG9uIFRvc2hpYmEK
VEg1OE5WRzNTMEhCQUk0IE5BTkQgY2hpcCwgdGhlIGtlcm5lbCB2ZXJzaW9uIGlzIDQuMTkuNzgu
ClRoZSBmb2xsb3dpbmcgZXJyb3JzIGFwcGVhciB3aGVuIHRyeWluZyB0byBhY2Nlc3MgZmlsZSBu
YW1lZAoiU0NORCI6CiAKdWJpZnNfbG9va3VwX2xldmVsMDogVUJJRlMgREJHIHRuYyAocGlkIDkw
Nik6CnNlYXJjaCBrZXkgKDg1OTMsIGlub2RlKQp1Ymlmc19sb29rdXBfbGV2ZWwwOiBVQklGUyBE
QkcgdG5jIChwaWQgOTA2KToKZm91bmQgMCwgbHZsIDAsIG4gMwpVQklGUyBlcnJvciAodWJpMDo0
IHBpZCA5MDYpOiAweGMwMWZiN2I5OgpmYWlsZWQgdG8gcmVhZCBpbm9kZSA4NTkzLCBlcnJvciAt
Mgp1Ymlmc19ldmljdF9pbm9kZTogVUJJRlMgREJHIGdlbiAocGlkIDkwNik6Cmlub2RlIDg1OTMs
IG1vZGUgMHg4MDAwClVCSUZTIGVycm9yICh1YmkwOjQgcGlkIDkwNik6CjB4YzAxZjg4MTk6IGRl
YWQgZGlyZWN0b3J5IGVudHJ5ICdTQ05EJywgZXJyb3IgLTIKVUJJRlMgd2FybmluZyAodWJpMDo0
IHBpZCA5MDYpOgoweGMwMWZlMzliOiBzd2l0Y2hlZCB0byByZWFkLW9ubHkgbW9kZSwgZXJyb3Ig
LTIKIApUaGUgZmlsZSAiU0NORCIgd2FzIHByZXN1bWFibHkgYnJva2VuIGJlY2F1c2Ugb2YgdGhl
IHBvd2VyLWN1dApkdXJpbmcgd3JpdGluZy4gQXMgYSByZXN1bHQsIHRoZSBmaWxlIHN5c3RlbSBi
ZWNhbWUgcmVhZC1vbmx5LgpJJ20gc2V0dGluZyB0aGUgZmlsZSBzeXN0ZW0gdG8gcmVhZC13cml0
ZSBtb2RlLiBJJ20gdHJ5aW5nIHRvCmVyYXNlIHRoZSBjb3JydXB0ZWQgZmlsZS4gQnV0IHRoaXMg
KGxpa2UgYW55IGFjdGlvbiB3aXRoIHRoaXMgZmlsZSkKbGVhZHMgdG8gdGhlIGZhY3QgdGhhdCB0
aGUgc3lzdGVtIGJlY29tZXMgcmVhZC1vbmx5IGFnYWluLgogClNvIG15IHF1ZXN0aW9ucyBhcmU6
CjEpSXMgdGhlcmUgYSB3YXkgdG8gcmVwYWlyIFVCSSBmaWxlc3lzdGVtPyBQZXJoYXBzLCBzb21l
IHNvcnQgb2YgZnNjawp1dGlsIGZvciBVQklGUz8KMilJcyB0aGVyZSBhIHdheSB0byByZW1vdmUg
YSBicm9rZW4gaW5vZGU/CiAKClRoYW5rcywKCkFuZHJleSBLb3JvYmNoZW5rby4gCg==
------==--bound.445953.2y2i6g6snfcuakol.iva.yp-c.yandex.net
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

------==--bound.445953.2y2i6g6snfcuakol.iva.yp-c.yandex.net--

