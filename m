Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D56F36BA9
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 05:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EY1zeo3Ccv0bu+RFHRKU6Nw34cEVHZuJTivBASc5CoM=; b=Ug1yqxogPSjL3ljHAxpOPc6l4q
	5FtTfyZPx7eT3ND9dBg50gS+ziJX3PY+UnzeELqzoy3+TYtWw4/+GMalbc71u+trYQxru9V0MFQgY
	/WLAgQLxaHg0rjmNK66fQfGAO+LhtjlJ1S9OLTbd0aB5yQtSeBLNnrdFMczW8QLfeQeFYS9P+3m+B
	7cg/MVVediAyBYIQmgO9X0YXlxMoG3gPtbXWOCEualti/fe4MtUXrZAn4kJLOpvAcOdQbypKSqlHm
	AgxTeEtsF+2BLgPupne8vijSh/9xm6FVinmpI22teDYDuvCp6jqZOZv89of0IC6MeK/xwtZaIfqcR
	FGJ0fC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4sK-0000000BeTL-42fi;
	Fri, 10 Apr 2026 05:57:52 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4sH-0000000BeSO-1k2u
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 05:57:51 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CF5BA298599;
	Fri, 10 Apr 2026 07:57:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mkI-zZTGsW03; Fri, 10 Apr 2026 07:57:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A33D229859E;
	Fri, 10 Apr 2026 07:57:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nxvVRf2y1HbB; Fri, 10 Apr 2026 07:57:34 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 7DB8A298599;
	Fri, 10 Apr 2026 07:57:34 +0200 (CEST)
Date: Fri, 10 Apr 2026 07:57:34 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>, Dmitry Antipov <dmantipov@yandex.ru>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <2056092139.32098.1775800654235.JavaMail.zimbra@nod.at>
In-Reply-To: <a8d991e7-7c66-2049-41e1-0a3f07114333@huawei.com>
References: <5deffdfa-6a99-8205-1f71-ff1f07ce28d1@huawei.com> <20260409045629.527019-1-dmantipov@yandex.ru> <20260409045629.527019-2-dmantipov@yandex.ru> <a8d991e7-7c66-2049-41e1-0a3f07114333@huawei.com>
Subject: Re: [PATCH v4 2/2] ubifs: use strscpy() and kmemdup_nul() where
 appropriate
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: use strscpy() and kmemdup_nul() where appropriate
Thread-Index: s7gVgcTU0IFrkoVKcOKRVCdAJKTqdA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_225749_593228_46BD0057 
X-CRM114-Status: UNSURE (   2.94  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiRG1pdHJ5IEFudGlwb3YiIDxkbWFudGlwb3ZA
eWFuZGV4LnJ1Pgo+IENDOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgImxpbnV4LW10ZCIg
PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+IEdlc2VuZGV0OiBGcmVpdGFnLCAxMC4g
QXByaWwgMjAyNiAwMzowNjozOQo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjQgMi8yXSB1Ymlmczog
dXNlIHN0cnNjcHkoKSBhbmQga21lbWR1cF9udWwoKSB3aGVyZSBhcHByb3ByaWF0ZQoKPiDlnKgg
MjAyNi80LzkgMTI6NTYsIERtaXRyeSBBbnRpcG92IOWGmemBkzoKPj4gR28gY2xvc2VyIHRvIHRo
ZSBtb2Rlcm4ga2VybmVsIEFQSSBhbmQgdXNlICdzdHJzY3B5KCknIGFuZCAna21lbWR1cF9udWwo
KScKPj4gb3ZlciBhbiBhZC1ob2MgZW5zdXJlLXRvLWhhdmUtJ1wwJyBxdWlya3Mgd2hlcmUgYXBw
cm9wcmlhdGUuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQW50aXBvdiA8ZG1hbnRpcG92
QHlhbmRleC5ydT4KCkRtaXRyeSwgaG93IGFyZSB5b3UgdGVzdGluZyB0aGVzZSBjaGFuZ2VzPwoK
VGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
