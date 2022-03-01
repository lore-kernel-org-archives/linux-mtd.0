Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79EFC433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JoUkys5KE2KhA6eCzaPK48cvZFtebkFJj/hsARfi4Xc=; b=N5NPV0pIJUsB3n
	pjygv0HDo0qVaRMax+UOh6AwNoPEIrXrcxh60D3gNaLucrPd/svgrL2fRRBYF5ew5AOPh9fRz7d3j
	BP1FcFoJU/fXnPKucWCTCpfQmehSq5MdCWbN+cN9rAPXDVO6//42y3VKGyGPZL6Y/9TO1itqTTuFf
	cLzpFsj9Y1t3oSvgRSczE5zS/raRt2XpLJvRaPV3qRmgeBUy7DqFXoA4TYSDnwesDhUD4JUY8Z6eN
	tq+4Rsb+o4MHFRr5gajh+ZnQrj2GdEDz9/ISawJW3Uv7RO+PI79+HEN8/U+W/czOKdZJXoySx6RJD
	cpH7dOo4/shikd4Er8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzUK-00G2sy-Js; Tue, 01 Mar 2022 10:12:12 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzUH-00G2ng-3h
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 10:12:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D7119609B3C0;
 Tue,  1 Mar 2022 11:11:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id uHtvGrDw6G89; Tue,  1 Mar 2022 11:11:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 77E61609B3F0;
 Tue,  1 Mar 2022 11:11:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id V9Nv3lnaehro; Tue,  1 Mar 2022 11:11:57 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 47DDE609B3C0;
 Tue,  1 Mar 2022 11:11:57 +0100 (CET)
Date: Tue, 1 Mar 2022 11:11:57 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: wuchi.zero@gmail.com
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, jack@suse.cz, 
 tj@kernel.org, mszeredi@redhat.com, sedat.dilek@gmail.com, 
 axboe@fb.com, akpm@linux-foundation.org, 
 torvalds@linux-foundation.org, linux-mm <linux-mm@kvack.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <2104629126.100059.1646129517209.JavaMail.zimbra@nod.at>
Subject: Different writeback timing since v5.14
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Index: 5JNzjBL9+smBCCGCkEapAfbWm9hEtw==
Thread-Topic: Different writeback timing since v5.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_021209_353548_3CA49731 
X-CRM114-Status: UNSURE (   2.03  )
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

SGkhCgpSYWZhxYIgYW5kIEkgZGlzY292ZXJlZCB0aGF0IHBhZ2Ugd3JpdGViYWNrIG9uIFVCSUZT
IGJlaGF2ZXMgZGlmZmVyZW50IHNpbmNlIHY1LjE0LgpXaGVuIGEgc2ltcGxlIHdyaXRlLCBzdWNo
IGFzICJlY2hvIGZvbyA+IC9tbnQvdWJpYmZzL2Jhci50eHQiLCBoYXBwZW5zIGl0IHRha2VzCmEg
ZmV3IHNlY29uZHMgdW50aWwgd3JpdGViYWNrIGNhbGxzIHViaWZzX3dyaXRlcGFnZSgpLgoKQmVm
b3JlIGNvbW1pdCBhYjE5OTM5YTZhNTAgKCJtbS9wYWdlLXdyaXRlYmFjazogRml4IHBlcmZvcm1h
bmNlIHdoZW4gQkRJJ3Mgc2hhcmUgb2YgcmF0aW8gaXMgMC4iKQppdCB3YXMgMzAgc2Vjb25kcyAo
dm0uZGlydHlfZXhwaXJlX2NlbnRpc2VjcyksIGFmdGVyIHRoaXMgY2hhbmdlIGl0IGhhcHBlbnMg
YWZ0ZXIgNSBzZWNvbmRzCih2bS5kaXJ0eV93cml0ZWJhY2tfY2VudGlzZWNzKS4KCklzIHRoaXMg
ZXhwZWN0ZWQ/Ckp1c3Qgd2FudCB0byBtYWtlIHN1cmUgdGhhdCB0aGUgc2FpZCBjb21taXQgZGlk
bid0IHVuY292ZXIgYW4gVUJJRlMgaXNzdWUuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
