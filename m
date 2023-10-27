Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3621CC25B47
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7jBswBMnIsLxb9lLt+6LFgM7JqD72YUO4D9ht49GH/w=; b=NwWAwk/50gPCjJEJ+VvKlgFLJP
	BLJd/4xR7mLGgfh2vo99TREPUuqgvsgqRpvEhmQK7T+eHJgpoc9kvVe+1v21aVC3LyIX2iYacBFHi
	KvpAW70utNLdrDU9Ys9Qq4vUC++huLYW39wePpX8zhZXLmO7bt83hWf9QJA6udFjb3UdscoMEZPwY
	TQD8CzLybKgptsMlK3N0oSVfIYEneUZDxz4h7BIFMlYXdeNREXgO1oQLPv6C0v0T0zETI+eYyBpbK
	OfrYnSRxYDbq7OA0Me+TH7C8/ANnX8VZb1vD2a/6dILO4Cygrf7E7NzDtNnV276pbR/PYPVUBFz79
	yBCY4/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwTTK-00HAvN-2L;
	Fri, 27 Oct 2023 20:30:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwTTH-00HAuj-11
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 20:30:21 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EBDE8608890D;
	Fri, 27 Oct 2023 22:30:12 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id G447C4Tn4azn; Fri, 27 Oct 2023 22:30:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2EF69622F591;
	Fri, 27 Oct 2023 22:30:12 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YQUC60C59djK; Fri, 27 Oct 2023 22:30:12 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C747B608890D;
	Fri, 27 Oct 2023 22:30:11 +0200 (CEST)
Date: Fri, 27 Oct 2023 22:30:10 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <174426702.13324.1698438610904.JavaMail.zimbra@nod.at>
In-Reply-To: <20231027194026.1bc32dfe@xps-13>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com> <20231027194026.1bc32dfe@xps-13>
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix gluebi NULL pointer dereference caused by ftl notifier
Thread-Index: 9idq5YltiezeBp0v4nFqPZqAKQMSSA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_133019_515047_A2664B88 
X-CRM114-Status: UNSURE (   6.14  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+PiBEZXRhaWxlZCByZXByb2R1Y3Rpb24gaW5mb3Jt
YXRpb24gYXZhaWxhYmxlIGF0IHRoZSBsaW5rWzFdLAo+PiAKPj4gVGhlIHNvbHV0aW9uIGZvciB0
aGUgZ2x1ZWJpIG1vZHVsZSBpcyB0byBydW4gamZmczIgb24gdGhlIFVCSQo+PiB2b2x1bWUgd2l0
aG91dCBjb25zaWRlcmluZyB3b3JraW5nIHdpdGggZnRsIG9yIG10ZGJsb2NrLlsyXS4KPiAKPiBJ
IGFtIHNvcnJ5IGJ1dCBmdGwsIGdsdWViaSwgbXRkYmxvY2ssIGpmZnMyIGFuZCB1YmkgaW4gdGhl
IHNhbWUgcmVwb3J0Cj4gc2VlbSBhIGxpdHRsZSBiaXQgZnV6enkuIEFyZSB5b3Ugc3VyZSBhYm91
dCB0aGlzIHNlbnRlbmNlPwoKWmhhb0xvbmcgV2FuZyBmb3VuZCBhbiBpbnRlcmVzdGluZyBidWcg
d2hpbGUgc3RhY2tpbmcgdmFyaW91cyBNVEQgY29tcG9uZW50cy4KSSBzdWdnZXN0ZWQgdG8ganVz
dCBkZW55IG10ZGJsb2NrIG9uIHRvcCBvZiBnbHVlYmkgdG8gYXZvaWQgdGhlIHdob2xlCnByb2Js
ZW0gY2xhc3MgaW5zdGVhZCBvZiBhZGRpbmcgbW9yZSBkdWN0IHRhcGUuCgpUaGFua3MsCi8vcmlj
aGFyZAoKVGhlIGlzc3VlIHJlbWluZHMgbWUgb2Ygb25lIG9mIG15IGZhdm9yaXRlIE1vbnR5IFB5
dGhvbiBza2V0Y2hlcywgaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1MRnJkcVFaOEZG
Ywo7LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
