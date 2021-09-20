Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 21:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD88603E5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 21:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACD88603E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hdQFin5jsf1oJ7Q7giLmpmZx6jpk0kUUFhEwibPTYfc=; b=zQvaAz5Eet+QIfn1sbyjX51Ux2
	TcwlB2M/+DEzls3CMv14av7B1zYRjCXJP76L7ghnEC4aogaGAWbCU2Fqz1/iK+WR/fgVq2X6SAfpX
	NOx9CfehcmfYZPi2rMnlt5A1+mZUqiD//OGs21p2YlqkrLc6hlQWqMffxBRAejwVIbl/9P4gzJTCC
	/FQhPyR78VmVSlLoYvUEZ0xyg302zlrQ3pEoNRcctcGGjzYwOXsKLPa79jZ7IPOVkvRUlT8/Drs9u
	47yNUExxmYuJHJlnkCyC1P3us0Ofm/9wcwZnXviL3JVLMBNuwT0Ly/aXPzSc4mQahIDhvrE7GFSiH
	WAyiRtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSRIU-003DBO-EC; Mon, 20 Sep 2021 21:57:58 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSRIR-003D9D-E0
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 21:57:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 769BC6169BCC;
 Mon, 20 Sep 2021 23:57:50 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0AvcPrvAVW6r; Mon, 20 Sep 2021 23:57:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EDA726169BC6;
 Mon, 20 Sep 2021 23:57:49 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DNIdiH7vl84a; Mon, 20 Sep 2021 23:57:49 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C555E6108471;
 Mon, 20 Sep 2021 23:57:49 +0200 (CEST)
Date: Mon, 20 Sep 2021 23:57:49 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: schaecsn@gmx.net
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <160773399.91203.1632175069460.JavaMail.zimbra@nod.at>
In-Reply-To: <20210920024824.9E053899858@corona.crabdance.com>
References: <20210907214034.11676-1-schaecsn@gmx.net>
 <20210920024824.9E053899858@corona.crabdance.com>
Subject: Re: [PATCH 0/1] ubifs: ubifs to export filesystem error counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: ubifs to export filesystem error counters
Thread-Index: NK3hz+wHsV+cRgdZv72uXipe7rZn/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_145755_689237_3AF4D865 
X-CRM114-Status: UNSURE (   6.21  )
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

SGkhCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiU3RlZmFuIFNjaGFl
Y2tlbGVyIiA8c2NoYWVjc25AZ214Lm5ldD4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5h
dD4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1r
ZXJuZWwiCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IE1vbnRh
ZywgMjAuIFNlcHRlbWJlciAyMDIxIDA0OjQ4OjI0Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCAwLzFd
IHViaWZzOiB1YmlmcyB0byBleHBvcnQgZmlsZXN5c3RlbSBlcnJvciBjb3VudGVycwoKPiBIZWxs
byBtdGQvdWJpZnMsCj4gCj4gSSBqdXN0IHdhbnQgdG8gY2hlY2sgYmFjayBvbiB3aGF0IHlvdSB0
aGluayBhYm91dCBoYXZpbmcgYSBzeXNmcyBmb3IgdWJpZnMgYW5kCj4gc3RhcnRpbmcgd2l0aCB0
aGVzZSB0aHJlZSBjYWxsYmFja3MKPiAKPiAvc3lzL2ZzL3ViaWZzL3ViaVhfWS9lcnJvcnNfbWFn
aWMKPiAvc3lzL2ZzL3ViaWZzL3ViaVhfWS9lcnJvcnNfbm9kZQo+IC9zeXMvZnMvdWJpZnMvdWJp
WF9ZL2Vycm9yc19jcmMKCkkgZGlkbid0IGhhdmUgYSBjaGFuY2UgdG8gcmV2aWV3IHlvdXIgY2hh
bmdlcyB0byBmYXIgYnV0IGluIGdlbmVyYWwgSSBsaWtlIHRoZSBpZGVhCmlmIGV4cG9zaW5nIHN1
Y2ggYW4gaW50ZXJmYWNlLgpTb3JyeSBmb3IgYmVpbmcgYSBzbG93IG1haW50YWluZXIuCgpUaGFu
a3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
