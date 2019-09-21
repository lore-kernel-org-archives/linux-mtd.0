Return-Path: <SRS0=szY+=XQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB0C4360D
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 15:37:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD6B20820
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Sep 2019 15:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eam+w7V7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD6B20820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXBwa5GsMwLxuVN5aWTunMcH4MOZVnziLdVL3qcEXIY=; b=eam+w7V7T6WXE9
	d0DDI1UiWuAOLCIVEX76I0fNBLWmcK3Xnt1wV755DOHtV4LOjc8tcLQ4tTTO5n7dRZv8kS/L/8nKc
	gOtGzps4l2395QKffmmW8Nv4+eqAwJlfx90Q9aMOk+yI7BZqlAOwYauUWBgD+Bf3CGY+wBpr0lcik
	NmYnH4I4WlRadibdMZ0alhMzZ66pJVwaGglRaQeBvfIZM/IuiM96bGslAhPgSGHlc06/5Iny9iJ4G
	YmKhwOoq7pD9sJ8dyz+fdNFDfPRKCuusbYVjKECUDwPRGt3I4OZ2zfVPtGq0u5o8BPJN2VFY91aoM
	6W9jerxv3+MqprwghyYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBhSC-0001ew-HT; Sat, 21 Sep 2019 15:37:44 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBhS6-0001eZ-Qz
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2019 15:37:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0E94B608310C;
 Sat, 21 Sep 2019 17:37:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8SXr9EMJTOpX; Sat, 21 Sep 2019 17:37:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 55133613E499;
 Sat, 21 Sep 2019 17:37:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bXykVNXxa5Ah; Sat, 21 Sep 2019 17:37:36 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1042D608310C;
 Sat, 21 Sep 2019 17:37:36 +0200 (CEST)
Date: Sat, 21 Sep 2019 17:37:35 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Message-ID: <1837147225.3667.1569080255850.JavaMail.zimbra@nod.at>
In-Reply-To: <b2425bd2-38e9-cb9b-4151-94891f3a71d1@huawei.com>
References: <1568962478-126260-1-git-send-email-nixiaoming@huawei.com>
 <20190920114336.GM1131@ZenIV.linux.org.uk>
 <206f8d57-dad9-26c3-6bf6-1d000f5698d4@huawei.com>
 <20190920124532.GN1131@ZenIV.linux.org.uk>
 <20190920125442.GA20754@ZenIV.linux.org.uk>
 <eb679ad2-4020-951c-e4d1-60cb059a5ca8@huawei.com>
 <CAFLxGvzeLTVfA17DMEi5tSkzkUgJncjX5oHWe207x7bfUtugtw@mail.gmail.com>
 <b2425bd2-38e9-cb9b-4151-94891f3a71d1@huawei.com>
Subject: Re: [PATCH] jffs2:freely allocate memory when parameters are invalid
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2:freely allocate memory when parameters are invalid
Thread-Index: jsGu5gCQ4Vd/48D/3p31+ncM705uWQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_083739_025769_7831C27F 
X-CRM114-Status: UNSURE (   5.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 daniel santos <daniel.santos@pobox.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Al Viro <viro@zeniv.linux.org.uk>,
 dilinger@queued.net, Xiaoming Ni <nixiaoming@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGFvLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkhvdSBUYW8iIDxo
b3V0YW8xQGh1YXdlaS5jb20+Cj4gSW4gSHVhd2VpIHdlIHVzZSBqZmZzMiBicm9hZGx5IGluIG91
ciBwcm9kdWN0cyB0byBzdXBwb3J0IGZpbGVzeXN0ZW0gb24gcmF3Cj4gTk9SIGZsYXNoIGFuZCBO
QU5EIGZsYXNoLCBzbyBmaXhpbmcgdGhlIGJ1Z3MgaW4gamZmczIgbWVhbnMgYSBsb3QgdG8gdXMu
Cj4gCj4gQWx0aG91Z2ggSSBoYXZlIG5vdCByZWFkIGFsbCBvZiBqZmZzMiBjb2RlIHRob3JvdWdo
bHksIEkgaGFkIGZpbmQgYW5kICJmaXhlZCIKPiBzb21lIGJ1Z3MgaW4gamZmczIgYW5kIEkgYW0g
d2lsbGluZyB0byBkbyBhbnkgaGVscCBpbiB0aGUgamZmczIgY29tbXVuaXR5LiBNYXliZQo+IHdl
IGNhbiBzdGFydCBieSB0ZXN0aW5nIGFuZCByZXZpZXdpbmcgdGhlIHBlbmRpbmcgcGF0Y2hlcyBp
biBwYXRjaCB3b3JrID8KCnllcywgdGhpcyBpcyBhIGdvb2QgaWRlYS4KSW4gTVREJ3MgcGF0Y2h3
b3JrIHRoZSBqZmZzMiBxdWV1ZSBpcyBpbiBiYWQgc2hhcGUuIEkgdHJpZWQgdG8gY2F0Y2ggdXAK
YnV0IGZhaWxlZCB0byBmaW5kIGVub3VnaCB0aW1lLiBTbyB3aXRoIG1vcmUgZXllYmFsbHMgSSB0
aGluayB3ZSBjYW4gYnJpbmcgaXQKaW4gc2hhcGUgYWdhaW4uCkJhc2ljYWxseSB3ZSBuZWVkIHRv
IGNsYXNzaWZ5IHdoaWNoIHBhdGNoZXMgZml4IGltcG9ydGFudCBzdHVmZiBhbmQgd2hpY2ggZG8g
bm90LgoKU29tZSB0aW1lIGFnbyBJIG1ha2UgeGZzdGVzdHMgd29yayB3aXRoIGpmZnMyLCBJIGNh
biBzaGFyZSAoYW5kIHVwc3RyZWFtKSB0aGVzZQpwYXRjaGVzIHRvby4KT25lIG9mIG15IGdvYWxz
IGlzIG1ha2luZyBzdXJlIHRoYXQgd2UgZG9uJ3QgYnJlYWsgamZmczIuIHhmc3Rlc3RzIGNhbiBo
ZWxwLgoKQXJlIHlvdSBvbiB0aGUgT0ZUQyBJUkMgbmV0d29yaz8gT24gI210ZCB5b3UgY2FuIGZp
bmQgdXMgTVREIGd1eXMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
