Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DFAC88CB9
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hS+pRbw6DCxBKg/SJLnWucqJi7kJZgaCTyGI3cDXjow=; b=cPwz/aSDTZNruuC3M8uOBhSUPM
	FM9RFx0MQsFBTi1tdS/ThrEqUr4loRTOm1YrX+jcLPDiY2h2qJkle8wgoYJntQDj85/cYVPjZ3etu
	1vq+mNsythcI96OAOEhBXbbIk/ba0ebIaCwCVdoGmn8S7gDtqlRlCybvGT18+tKbkCWCbc/Ng849f
	b7uiSfWLJJ1STq7In2IrOuP72uBkcUETwnlyYmZ+Za0R5Ak7ZOt2PrudaKGmluHYfRtVPeAeHlC+r
	FFJglbrf6z9K7Yo630sw1afcN+83czBqgXG+6QCA40VynAK7frbhfUuwGg64VcJigeJv1hr7ugblC
	HklqSDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQ3B-00000007O1l-1iQ9;
	Mon, 11 Aug 2025 10:46:45 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPnj-00000007K7P-3WVd
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 10:30:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F0F282CFCA2;
	Mon, 11 Aug 2025 12:30:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 5BH2MNXWoEOq; Mon, 11 Aug 2025 12:30:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 10A3B2CFCA7;
	Mon, 11 Aug 2025 12:30:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id o6PhqYes8Ibu; Mon, 11 Aug 2025 12:30:35 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E04312CFCA2;
	Mon, 11 Aug 2025 12:30:35 +0200 (CEST)
Date: Mon, 11 Aug 2025 12:30:35 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1568241822.99082.1754908235674.JavaMail.zimbra@nod.at>
In-Reply-To: <20250811101529.436635-1-zhao.xichao@vivo.com>
References: <20250811101529.436635-1-zhao.xichao@vivo.com>
Subject: Re: [PATCH] ubifs: Simplify the code and remove unnecessary
 parameters.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Simplify the code and remove unnecessary parameters.
Thread-Index: cSlLst+Q8vbSL98lrl9oiwh3IrKzog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_033048_020337_56A6C947 
X-CRM114-Status: UNSURE (   3.65  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlhpY2hhbyBaaGFvIiA8emhh
by54aWNoYW9Adml2by5jb20+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6
ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJsaW51eC1tdGQiIDxs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwiCj4gPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAiWGljaGFvIFpoYW8iIDx6aGFvLnhpY2hhb0B2aXZvLmNv
bT4KPiBHZXNlbmRldDogTW9udGFnLCAxMS4gQXVndXN0IDIwMjUgMTI6MTU6MjkKPiBCZXRyZWZm
OiBbUEFUQ0hdIHViaWZzOiBTaW1wbGlmeSB0aGUgY29kZSBhbmQgcmVtb3ZlIHVubmVjZXNzYXJ5
IHBhcmFtZXRlcnMuCgo+IFJlbW92ZSB0aGUgcGFyYW1ldGVyICcqYycgZnJvbSB0aGUgdWJpZnNf
Y3JjX25vZGUgZnVuY3Rpb24sCgouLi5iZWNhdXNlIGMgaXMgbm90IHVzZWQ/Cgo+IGFuZCByZXBs
YWNlIHBhcnQgb2YgdGhlIGNvZGUgdXNpbmcgdWJpZnNfY3JjX25vZGUuCgpUaGlzIGFyZSB0d28g
dGhpbmdzLCBvbmUgbG9naWNhbCBjaGFuZ2UgcGVyIGNvbW1pdCwgcGxlYXNlLgoKVGhhbmtzLAov
L3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
