Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3605D32D96
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJRl5gzLduoHPYSbMThtBU3Ql/XGSM425tQqwNvMlTw=; b=2vgP1sjSx6L7jj
	U2a2PudOQ1EiTXfoByj9g6WbkRTNpUzNReMdSuCKzDoNCwm6NPCeGMiDY1wux3L/Rj5nl9cEVRiVl
	PARldFMfinxrrKVQ+H1+28Tk+4az8XBCo2Qz6gsaFTpDWnl0E7P2fQZpHmtjcKriF8oEX/UN3PhtW
	E+kilgU4ntShl17LES+xUWJKPS5IIpeXl6XJrx20UWIB4YTReFgEpxRiazsMLWyz0mXhXuS0/+s/k
	LWK2uGbTeQl1tYRP6bmDS2yd/ix6r10/xGP1o2h6nBvzeJhCjdkcAOLiQLXyQSRbLcrxNSEiA2KSX
	eoCsAhVlD/Bv8xqq0K+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApLz-00000003HA1-1oYH;
	Tue, 12 Nov 2024 11:46:39 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoS2-000000036rb-0GnM
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 10:48:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C7DDE0003;
	Tue, 12 Nov 2024 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731408527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlVwLQCWy24Cb/sNaSGUN5XV3+kGewbUdR+Bx7uYdlM=;
	b=KcfKcMXbPi2VOK8LbaLSQSLr+CG5JNTDTqmQ1mXvmbswz/W4GicAOjOtUczHOJbBUw6r/6
	wAFCz6HjglSKRY+ZVhUoC5eWV5kLq4vsHXCNv+hwMl2yF8T9KBKN+CWtoVsssGdPScFZeW
	mnW9omVWNkwP1vTovuljDEQMSsJ4/O+2H/jDTsVOqQnPYExHLBmN+A7mdpI3WcWHqO2SLN
	VcrwVprYlOXOlcakn/rYOHFvvJ0iJuuwX8sLt8kKbGQLt+2nfvp2PjvBwVsGoipiCx+eZ3
	iE0fHHhOX2ZCdqeO2l6C0hGepKntAcahlF4dpm2n6iWEdGOzsqTS5YAd/c+zLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: SkyLake Huang (=?utf-8?B?6buD5ZWf5r6k?=) <SkyLake.Huang@mediatek.com>
Cc: "dev@kicherer.org" <dev@kicherer.org>,  "d-gole@ti.com" <d-gole@ti.com>,
  "vigneshr@ti.com" <vigneshr@ti.com>,  "gch981213@gmail.com"
 <gch981213@gmail.com>,  "mmkurbanov@salutedevices.com"
 <mmkurbanov@salutedevices.com>,  "richard@nod.at" <richard@nod.at>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "kernel@sberdevices.ru" <kernel@sberdevices.ru>
Subject: Re: [PATCH v2] mtd: spinand: add support for FORESEE F35SQA002G
In-Reply-To: <dbdb45ed1135e73b4eebd76e6f61b96d48aaedc6.camel@mediatek.com>
	("SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCkiJ3M=?= message of "Tue, 12 Nov
 2024 10:08:31
	+0000")
References: <20241108163455.885-1-SkyLake.Huang@mediatek.com>
	<20241108163455.885-4-SkyLake.Huang@mediatek.com>
	<dbdb45ed1135e73b4eebd76e6f61b96d48aaedc6.camel@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Tue, 12 Nov 2024 11:48:45 +0100
Message-ID: <87ikssu3qq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_024850_275258_81D57A59 
X-CRM114-Status: GOOD (  13.17  )
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

SGkgU2t5LAoKT24gMTIvMTEvMjAyNCBhdCAxMDowODozMSBHTVQsIFNreUxha2UgSHVhbmcgKOm7
g+WVn+a+pCkgPFNreUxha2UuSHVhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToKCj4gSGkgTWlxdWVs
L01hcnRpbiwKPiBBYm91dCB0aGlzIGRyaXZlciwgaW5jbHVkaW5nIEYzNVNRQTAwMUcvRjM1U1FB
MDAyRyBwYXJ0cywgSSdtIGNvbmNlcm5lZAo+IHRoYXQgdGhlIGRyaXZlciB3aWxsIGFsd2F5cyB1
c2UgMzJIIGZvciB1cGRhdGVfY2FjaGUgb3BlcmF0aW9ucywgd2hpY2gKPiBtZWFucyBpdCdzIG5v
dCBjb21waXRhYmxlIHdpdGggdGhvc2UgU1BJIGNvbnRyb2xsZXIgd2hvIGNhbid0IHRyYW5zbWl0
Cj4gMjA0OCBieXRlcyAobW9zdCBzbWFsbC1kZW5zaXR5IFNQSS1OQU5EJ3MgcGFnZSBzaXplIG5v
d2FkYXlzKSBhdCBvbmUKPiB0aW1lLgo+Cj4gVGhlIGZvbGxvd2luZyBjb250cm9sbGVyJ3MgZHJp
dmVyIHNlZW1zIHRoYXQgdGhleSBjYW4ndCB0cmFuc21pdCAyMDQ4Cj4gYnl0ZXMgaW4gb25lIHRy
YW5zbWlzc2lvbjoKPiAtIHNwaS1hbWQuYzogNjQgYnl0ZXMgKEFNRF9TUElfTUFYX0RBVEEpCj4g
LSBzcGktYW1sb2dpYy1zcGlmYy1hMS5jOiA1MTIgYnl0ZXMgKFNQSUZDX0ExX0JVRkZFUl9TSVpF
KQo+IC0gc3BpLWZzbC1xc3BpLmM6IDFLQgo+IC0gc3BpLWhpc2ktc2ZjLXYzeHguYzogNjQqNiBi
eXRlcwo+IC0gc3BpLWludGVsLmM6IDY0IGJ5dGVzIChJTlRFTF9TUElfRklGT19TWikKPiAtIHNw
aS1taWNyb2NoaXAtY29yZS1xc3BpLmM6IDI1NiBieXRlc2MgKE1BWF9EQVRBX0NNRF9MRU4pCj4g
LSBzcGktbnhwLWZzcGkuYzogVFg6MUtCLCBSWDogNTEyQiBpbiBGSUZPIG1vZGUKPiAtIHNwaS13
cGNtLWZpdS5jOiA0QgoKSSBiZWxpZXZlIG1vc3Qgb2YgdGhlc2UgZHJpdmVycyBhcmUgc3RpbGwg
YWJsZSB0byBzZW5kIG9uZSBwYWdlIG9mIGRhdGEKd2l0aG91dCB0b2dnbGluZyB0aGUgQ1MgKHdo
aWNoIGlzIHdoYXQgYWN0dWFsbHkgbWF0dGVycywgSSBiZWxpZXZlKS4gSWYKdGhleSB3ZXJlIGJy
b2tlbiwgdGhleSB3b3VsZCBiZSBicm9rZW4gd2l0aCBhbGwgc3BpIG1lbW9yeSBkZXZpY2VzLCBu
b3QKb25seSBGb3Jlc2VlJ3MuCgo+IEkgZ3Vlc3Mgd2UgbmVlZCB0byBhZGQgc29tZSBjaGVjayB0
byBtYWtlIHN1cmUgdGhhdCBGMzVTUUEgc2VyaWVzIHdvcmsKPiBvbmx5IHdpdGggdGhvc2UgU1BJ
IGNvbnRyb2xsZXJzIHdobyBjYW4gdHJhbnNtaXQgbW9yZSB0aGFuIDIwNDgKPiBieXRlcyhOQU5E
IHBhZ2Ugc2l6ZSkgYXQgb25lIHRpbWU/CgpUaGVyZSBpcyBhbHJlYWR5IGEgc3VwcG9ydHNfb3Ao
KSBob29rIGZvciB0aGF0LCBJIGJlbGlldmUgd2UgYXJlCmZpbmUuIElmIGhvd2V2ZXIgeW91IGV4
cGVyaWVuY2UgZXJyb3JzLCBwbGVhc2UgcmVwb3J0IHRoZW0gYW5kIHdlJ2xsCmxvb2sgZm9yIGEg
c29sdXRpb24uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
