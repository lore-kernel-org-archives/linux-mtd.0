Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C98C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 07:17:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DE560E54
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 07:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33DE560E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U/M8QAOOj26lrTdtRIHp27neoVdZIuaDH3KzHU8+MAA=; b=hsnlRib6Kne8RdMBgIb+PoAULy
	O8Mpta6rQeNPafe+jJa5zYaU1aAaraRAN7DJ3V5/bb3pWXpPMDQSQIKdfmjDTj2qQvlCCcF48408R
	biZ7F/vifd4qc2KiTVPjdE9sX31y4MmXOgbhABOG8y4IXd9tbK0xJKjLnjPgNd/IO9Vul86Ge8inH
	+EMlZcfwd7oiAlWk0+32CURbjC9LaugrsE8VR4/IHxxzByjAnenCIxO1Pz+jmyANm6NIzRCtr5oJp
	Jo0ZlE2NkGOLfGRYLNdpV91FbcHvSpGHZWWIO5TcLp6xhYaRkxChxhZJ+fGhULQk6AmsZU/pmKyWn
	YRFiRncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfzeG-0075Jk-HZ; Thu, 28 Oct 2021 07:16:28 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfzeD-0075Il-WE
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 07:16:27 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 21E8261EAE61;
 Thu, 28 Oct 2021 09:16:17 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JFCI-lQ7V8jh; Thu, 28 Oct 2021 09:16:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AEB6760F6B63;
 Thu, 28 Oct 2021 09:16:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EdzS24WRludn; Thu, 28 Oct 2021 09:16:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8900E61EAE61;
 Thu, 28 Oct 2021 09:16:16 +0200 (CEST)
Date: Thu, 28 Oct 2021 09:16:16 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: schaecsn <schaecsn@gmx.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Stefan Schaeckeler <sschaeck@cisco.com>
Message-ID: <791707806.43634.1635405376333.JavaMail.zimbra@nod.at>
In-Reply-To: <20211028062124.12539-1-schaecsn@gmx.net>
References: <20211028062124.12539-1-schaecsn@gmx.net>
Subject: Re: [PATCH v3] ubifs: ubifs to export filesystem error counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: ubifs to export filesystem error counters
Thread-Index: GOJMgSWITBfEasKolYQiwLcyBXA7+Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_001626_228665_0525AD20 
X-CRM114-Status: UNSURE (   6.30  )
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

U3RlZmFuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInNjaGFlY3Nu
IiA8c2NoYWVjc25AZ214Lm5ldD4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJs
aW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwi
Cj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gQ0M6ICJTdGVmYW4gU2NoYWVja2Vs
ZXIiIDxzc2NoYWVja0BjaXNjby5jb20+Cj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDI4LiBPa3Rv
YmVyIDIwMjEgMDg6MjE6MjQKPiBCZXRyZWZmOiBbUEFUQ0ggdjNdIHViaWZzOiB1YmlmcyB0byBl
eHBvcnQgZmlsZXN5c3RlbSBlcnJvciBjb3VudGVycwoKPiBGcm9tOiBTdGVmYW4gU2NoYWVja2Vs
ZXIgPHNzY2hhZWNrQGNpc2NvLmNvbT4KPiAKPiBOb3QgYWxsIHViaWZzIGZpbGVzeXN0ZW0gZXJy
b3JzIGFyZSBwcm9wYWdhdGVkIHRvIHVzZXJzcGFjZS4KPiAKPiBFeHBvcnQgYmFkIG1hZ2ljLCBi
YWQgbm9kZSBhbmQgY3JjIGVycm9ycyB2aWEgc3lzZnMuIFRoaXMgYWxsb3dzIHVzZXJzcGFjZQo+
IHRvIG5vdGljZSBmaWxlc3lzdGVtIGVycm9yczoKPiAKPiAvc3lzL2ZzL3ViaWZzL3ViaVhfWS9l
cnJvcnNfbWFnaWMKPiAvc3lzL2ZzL3ViaWZzL3ViaVhfWS9lcnJvcnNfbm9kZQo+IC9zeXMvZnMv
dWJpZnMvdWJpWF9ZL2Vycm9yc19jcmMKPiAKPiBUaGUgY291bnRlcnMgYXJlIHJlc2V0IHRvIDAg
d2l0aCBhIHJlbW91bnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIFNjaGFlY2tlbGVyIDxz
c2NoYWVja0BjaXNjby5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAgLSBBZGRlZCBEb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLXViaWZzCj4gIC0gQWRkZWQgRG9jdW1lbnRh
dGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy11YmlmcyB0byBNQUlOVEFJTkVSUwoKSSBhc2tlZCBm
b3IganVzdCB0aGUgRG9jdW1lbnRhdGlvbi4gdjIgb2YgeW91ciBwYXRjaCBpcyBhbHJlYWR5IGlu
IGxpbnV4LW5leHQuIDotKQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
