Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AA5C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:26:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4514364F13
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 23:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4514364F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZKOzhGwV2zIx54ee8d+gxJvLvfZK615aLedsRZKZvA=; b=StrDx2nk0Gk/Rv
	Bi7E4+x0BjGgwKy6mT3r0c3FlXV1uvgdjjgjtUKUU5iYCOUmXbIt1ZRLjqvd5MxjRdHHAzFlvzStZ
	L3r+fSe//SOTa2Cd6dHtm5x0QfX8HuwP75mO1aw7zkxdFzUE5HZYsSEXwuH6QiBj05dTpRFw0omWr
	GCGua/hq+Zp5gHokhw6zvXnC1eFioKmdW8fV1mZ1hj0h9BXOhj+Y+k4wvpxFWrxZiY9sXax52qroy
	TJq3yVbvS1mPZhmwiitipT79151Uz/Ah0rAQOiMCC0veXGMLEnhU1zR4OkyyJa1APYaRktI2+vkH6
	UsTxzBnePOO1UXkF3tdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHarv-006wp6-MQ; Wed, 03 Mar 2021 23:25:28 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHURn-005cgv-9M
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 16:34:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6F9BA6083275;
 Wed,  3 Mar 2021 17:34:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XkqzEhlnOBsv; Wed,  3 Mar 2021 17:34:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 214DD6083244;
 Wed,  3 Mar 2021 17:34:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 55hyWb7TB4oV; Wed,  3 Mar 2021 17:34:02 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id EEA2A608A38A;
 Wed,  3 Mar 2021 17:34:01 +0100 (CET)
Date: Wed, 3 Mar 2021 17:34:01 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <675291050.42876.1614789241828.JavaMail.zimbra@nod.at>
In-Reply-To: <040cf2058fe4cf5e63dbff534582881a@walle.cc>
References: <20210303155735.25887-1-michael@walle.cc>
 <YD+0mAPTMN8AwNBx@kroah.com>
 <689194005.42755.1614788236355.JavaMail.zimbra@nod.at>
 <040cf2058fe4cf5e63dbff534582881a@walle.cc>
Subject: Re: [PATCH] mtd: require write permissions for locking and badblock
 ioctls
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: require write permissions for locking and badblock ioctls
Thread-Index: xINH3Mpwe4blEkzF/YfzWKJ0Ni21Ug==
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+Pj4gVGhhbmtzIGZvciBhdWRpdGluZyB0
aGUgcmVzdCBvZiB0aGVzZSBmcm9tIG15IG9yaWdpbmFsIHBhdGNoLiAgSWYgdGhpcwo+Pj4gaXMg
b2sgd2l0aCB1c2Vyc3BhY2UgdG9vbHMsIGl0J3MgZmluZSB3aXRoIG1lLCBidXQgSSBkb24ndCBl
dmVuIGhhdmUKPj4+IHRoaXMgaGFyZHdhcmUgdG8gdGVzdCB3aXRoIDopCj4+IAo+PiBUaGF0J3Mg
bXkgZmVhci4gTWljaGFlbCwgZGlkIHlvdSB2ZXJpZnk/Cj4gCj4gSSBkb24ndCBrbm93IGFueSB0
b29scyBleGNlcHQgdGhlIG10ZC11dGlscy4gU28gbm8uCgpvcGVud3J0IGZvbGtzIGhhdmUgdGhl
aXIgb3duIHRvb2xpbmcsIEFucmRvaWQgdG9vLgogCj4+IEluIGdlbmVyYWwgeW91IG5lZWQgdG8g
YmUgcm9vdCB0byBvcGVuIHRoZXNlIGRldmljZSBmaWxlcy4KPj4gU28sIEkgZG9uJ3Qgc2VlIGEg
c2VjdXJpdHkgcHJvYmxlbSBoZXJlLgo+IAo+IFRoZW4gdGhpcyBiZWdzIHRoZSBxdWVzdGlvbiwg
d2h5IGlzIHRoaXMgY2hlY2sgdGhlcmUgaW4KPiB0aGUgZmlyc3QgcGxhY2U/CgpJIGZlYXIgaGlz
dG9yaWNhbCByZWFzb25zLgpBcyBzb29uIHlvdSBjYW4gb3BlbiB0aGUgZGV2aWNlIG5vZGUgeW91
IGNhbiBkbyBldmlsIHRoaW5ncy4KCj4gVGhpcyBjb21lIHVwIGJlY2F1c2UgSSB3YXMgYWRkaW5n
IGEgT1RQRVJBU0Ugd2hpY2gKPiB3YXMgc3VnZ2VzdGVkIHRoYXQgaXMgd2FzIGEgImRhbmdlcm91
cyIgY29tbWFuZC4gU28gSQo+IHdhcyBwdXp6bGVkIHdoeSB0aGUgb25lcyBhYm92ZSBhcmUgY29u
c2lkZXJlZCAic2FmZSIgOykKCjotKQoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
